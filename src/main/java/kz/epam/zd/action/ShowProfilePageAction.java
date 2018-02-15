package kz.epam.zd.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static kz.epam.zd.util.ConstantHolder.PROFILE_PAGE;

/**
 * Customer action to display Profile page
 */
public class ShowProfilePageAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        return PROFILE_PAGE;
    }
}
