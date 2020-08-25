Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2787C2512F1
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 09:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729245AbgHYHUj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 03:20:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:51812 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729209AbgHYHUj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 03:20:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id AB3DCB1AE;
        Tue, 25 Aug 2020 07:21:08 +0000 (UTC)
Date:   Tue, 25 Aug 2020 09:20:37 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] eeprom: at24: Tidy at24_read()
Message-ID: <20200825092037.7ded996d@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The elegant code in at24_read() has the drawback that we now need
to make a copy of all parameters to pass them to the post-processing
callback function if there is one. Rewrite the loop in such a way that
the parameters are not modified, so saving them is no longer needed.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
This has the drawback of creating an asymetry with at24_write(), so
I'm not 100% if we want to apply this. If anyone has a better idea,
please let me know.

Changes since v1:
 * Turn the "while" loop into a "for" loop to make the code neater.
   Suggested by Bartosz.

 drivers/misc/eeprom/at24.c |   14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

--- linux-5.7.orig/drivers/misc/eeprom/at24.c	2020-08-24 19:25:52.967519228 +0200
+++ linux-5.7/drivers/misc/eeprom/at24.c	2020-08-25 08:25:23.033990857 +0200
@@ -422,10 +422,7 @@ static int at24_read(void *priv, unsigne
 	struct at24_data *at24;
 	struct device *dev;
 	char *buf = val;
-	int ret;
-	unsigned int orig_off = off;
-	char *orig_buf = buf;
-	size_t orig_count = count;
+	int i, ret;
 
 	at24 = priv;
 	dev = at24_base_client_dev(at24);
@@ -448,16 +445,13 @@ static int at24_read(void *priv, unsigne
 	 */
 	mutex_lock(&at24->lock);
 
-	while (count) {
-		ret = at24_regmap_read(at24, buf, off, count);
+	for (i = 0; count; i += ret, count -= ret) {
+		ret = at24_regmap_read(at24, buf + i, off + i, count);
 		if (ret < 0) {
 			mutex_unlock(&at24->lock);
 			pm_runtime_put(dev);
 			return ret;
 		}
-		buf += ret;
-		off += ret;
-		count -= ret;
 	}
 
 	mutex_unlock(&at24->lock);
@@ -465,7 +459,7 @@ static int at24_read(void *priv, unsigne
 	pm_runtime_put(dev);
 
 	if (unlikely(at24->read_post))
-		at24->read_post(orig_off, orig_buf, orig_count);
+		at24->read_post(off, buf, i);
 
 	return 0;
 }


-- 
Jean Delvare
SUSE L3 Support
