Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEDC60B19
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2019 19:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbfGERb7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Jul 2019 13:31:59 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.117]:52234 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727055AbfGERb7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 Jul 2019 13:31:59 -0400
Received: from [85.158.142.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-6.bemta.az-b.eu-central-1.aws.symcld.net id C0/A7-10235-B898F1D5; Fri, 05 Jul 2019 17:31:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRWlGSWpSXmKPExsUyo1hfQre7Uz7
  W4MpjKYu/k46xW3yZe4rFonnxejaLjr9fGB1YPH7/msTo8f5GK7vH/rlr2D0+b5ILYIlizcxL
  yq9IYM24O2E+c8EDroqJm96xNDBO5uxi5OIQEljDKHFlwUamLkYODjYBXYmuO6ZdjJwcIgLyE
  hMWtbKB1DALbACqubyCHSQhLOAlsfLIDHaQehYBFYkj04NAwrwCDhL7Pn5jBbElBOQkbp7rZI
  aIC0qcnPmEBcRmFpCQOPjiBTNIq5CArMTRS7EQ5QoSZ7dMZJzAyDMLSccsJB0LGJlWMVokFWW
  mZ5TkJmbm6BoaGOgaGhrrmumaGOklVukm6aWW6ian5pUUJQIl9RLLi/WKK3OTc1L08lJLNjEC
  gy+lkE1rB+PCWW/0DjFKcjApifKGpMrHCvEl5adUZiQWZ8QXleakFh9ilOHgUJLgfdsOlBMsS
  k1PrUjLzAFGAkxagoNHSYRXqgMozVtckJhbnJkOkTrFqCglznsQpE8AJJFRmgfXBou+S4yyUs
  K8jAwMDEI8BalFuZklqPKvGMU5GJWEeUtApvBk5pXATX8FtJgJaPHMFDmQxSWJCCmpBqa4hiT
  P6ULsC4PCNYv5zMSfPHD9cmD2jO4lIcst79xyqz9mt4XLTG2JwJJvwWuuu3PtyVjuLi2r1rvR
  KHir8udGpfsRPYqRL9U/67MJe9a+n7tJKvTwkoCJnx/zr+yQ6jZnfit8dzn3LWU9eaGdzKaik
  q6OnQKiG4tu8ydqKV+TeiJw/UxpUNKJmDy1218Xtvc+vnpH99fG3Ursj34LKFTx3Ztw976W0P
  Rv9QIsa4p9751lSY0NXCK36OLzpqVqvtOn3rllYn7kLs+7XUfkjSdnmXxSf/TMa5v5++dRkkv
  ecNaulfNnSd8+sf/qVIWDn9ZIW702KlS5lHKBK1Z1r1Ok/eQ33hU+Wx2XKoY/eq3EUpyRaKjF
  XFScCADueWXwOQMAAA==
X-Env-Sender: cst@phaseone.com
X-Msg-Ref: server-28.tower-238.messagelabs.com!1562347915!582328!1
X-Originating-IP: [152.115.47.24]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13423 invoked from network); 5 Jul 2019 17:31:55 -0000
Received: from unknown (HELO Exchange3.phaseone.com) (152.115.47.24)
  by server-28.tower-238.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 5 Jul 2019 17:31:55 -0000
Received: from cstu16.phaseone.com (172.16.2.207) by Exchange3.phaseone.com
 (172.16.1.184) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 5 Jul
 2019 19:31:53 +0200
From:   "Claus H. Stovgaard" <cst@phaseone.com>
To:     <linux-i2c@vger.kernel.org>
CC:     "Claus H. Stovgaard" <cst@phaseone.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [PATCH] eeprom: at24: Limit gpio calls to when wp_gpio is defined
Date:   Fri, 5 Jul 2019 19:24:19 +0200
Message-ID: <1562347885-58349-1-git-send-email-cst@phaseone.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.2.207]
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Calling gpiod_set_value_cansleep with no GPIO driver associated result in
the WARN_ON error from consumer.h. So change to only call
gpiod_set_value_cansleep when wp_gpio is defined.

Signed-off-by: Claus H. Stovgaard <cst@phaseone.com>
---
 drivers/misc/eeprom/at24.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 35bf247..d17e982 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -458,12 +458,14 @@ static int at24_write(void *priv, unsigned int off, void *val, size_t count)
 	 * from this host, but not from other I2C masters.
 	 */
 	mutex_lock(&at24->lock);
-	gpiod_set_value_cansleep(at24->wp_gpio, 0);
+	if (at24->wp_gpio)
+		gpiod_set_value_cansleep(at24->wp_gpio, 0);
 
 	while (count) {
 		ret = at24_regmap_write(at24, buf, off, count);
 		if (ret < 0) {
-			gpiod_set_value_cansleep(at24->wp_gpio, 1);
+			if (at24->wp_gpio)
+				gpiod_set_value_cansleep(at24->wp_gpio, 1);
 			mutex_unlock(&at24->lock);
 			pm_runtime_put(dev);
 			return ret;
@@ -473,7 +475,8 @@ static int at24_write(void *priv, unsigned int off, void *val, size_t count)
 		count -= ret;
 	}
 
-	gpiod_set_value_cansleep(at24->wp_gpio, 1);
+	if (at24->wp_gpio)
+		gpiod_set_value_cansleep(at24->wp_gpio, 1);
 	mutex_unlock(&at24->lock);
 
 	pm_runtime_put(dev);
-- 
2.7.4

