package com.bs.help;
import com.bs.help.FeedHelp;;
public class FeedRedirect {
public static String redirectToFindFeed(FeedHelp f){
	StringBuffer stringBuffer = new StringBuffer();
	stringBuffer.append("/FMS/feed_findFeedInformation?test=1");
	if (f != null) {
		System.out.println("feedHelp存在");
		if (f.getFeedId() != null) {
			stringBuffer.append("&feedId=" + f.getFeedId());
		}
		if (f.getFeedName() != null) {
			stringBuffer.append("&feedName=" + f.getFeedName());
		}
		if (f.getCategory() != null) {
			stringBuffer.append("&category=" + f.getCategory());
		}
		if (f.getSupplier() != null && f.getSupplier().length() > 0) {
			stringBuffer.append("&supplier=" + f.getSupplier());
		}
		if (f.getFindAllOrNot() != null && f.getFindAllOrNot().length() > 0) {
			stringBuffer.append("&findAllOrNot=" + f.getFindAllOrNot());
		}
	}
	System.out.println("url = " + stringBuffer.toString());
	return stringBuffer.toString();
}
}
