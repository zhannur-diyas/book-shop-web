package kz.epam.zd.action;

import kz.epam.zd.exception.ActionException;
import kz.epam.zd.exception.ServiceException;
import kz.epam.zd.exception.ValidatorException;
import kz.epam.zd.model.user.User;
import kz.epam.zd.service.UserService;
import kz.epam.zd.util.ValidatorHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static kz.epam.zd.util.ConstantHolder.*;

/**
 * Updates user's personal info in the database.
 */
public class UpdatePersonalInfoAction implements Action {

    private static final String SHOW_PROFILE_PAGE = "/do/?action=show-profile-page";
    private static final String PERSONAL_INFO = "personalinfo";
    private static final Logger log = LoggerFactory.getLogger(UpdatePersonalInfoAction.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ActionException {
        UserService userService = new UserService();
        User user = (User) request.getSession().getAttribute(USER);

        //form validation
        try {
            if (ValidatorHelper.checkForm(request, PERSONAL_INFO))
                return REDIRECT_PREFIX + SHOW_PROFILE_PAGE;
        } catch (ValidatorException e) {
            throw new ActionException(e);
        }
        log.debug("Personal info form is valid");

        user.setFullName(request.getParameter(FULL_NAME));
        user.setEmail(request.getParameter(EMAIL));
        user.setAddress(request.getParameter(ADDRESS));
        user.setTelephoneNumber(request.getParameter(TELEPHONE_NUMBER));

        User updatedUser = user;
        try {
            updatedUser = userService.updatePersonalInfo(user);
        } catch (ServiceException e) {
            log.debug("Error in UpdatePersonalInfoAction.class occurred: {}", e.getMessage());
        }
        log.debug("Personal info updated. Username = {}", user.getUsername());
        request.getSession().setAttribute(USER, updatedUser);
        String referer = request.getHeader(REFERER);

        return REDIRECT_PREFIX + referer;
    }
}
