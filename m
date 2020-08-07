Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BACC723EEEF
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 16:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgHGOTL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 10:19:11 -0400
Received: from mx2.suse.de ([195.135.220.15]:59002 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbgHGOTI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Aug 2020 10:19:08 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3979FB11F;
        Fri,  7 Aug 2020 14:19:25 +0000 (UTC)
Date:   Fri, 7 Aug 2020 16:19:06 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/2 RFC] eeprom: at24: Tidy at24_read()
Message-ID: <20200807161906.6d119d2e@endymion>
In-Reply-To: <20200807150005.48c8c89b@endymion>
References: <20200807150005.48c8c89b@endymion>
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

 drivers/misc/eeprom/at24.c |   13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

--- linux-5.7.orig/drivers/misc/eeprom/at24.c	2020-08-07 14:23:39.882191500 +0200
+++ linux-5.7/drivers/misc/eeprom/at24.c	2020-08-07 14:28:39.039360687 +0200
@@ -423,10 +423,7 @@ static int at24_read(void *priv, unsigne
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
@@ -449,15 +446,15 @@ static int at24_read(void *priv, unsigne
 	 */
 	mutex_lock(&at24->lock);
 
+	i = 0;
 	while (count) {
-		ret = at24_regmap_read(at24, buf, off, count);
+		ret = at24_regmap_read(at24, buf + i, off + i, count);
 		if (ret < 0) {
 			mutex_unlock(&at24->lock);
 			pm_runtime_put(dev);
 			return ret;
 		}
-		buf += ret;
-		off += ret;
+		i += ret;
 		count -= ret;
 	}
 
@@ -466,7 +463,7 @@ static int at24_read(void *priv, unsigne
 	pm_runtime_put(dev);
 
 	if (unlikely(at24->read_post))
-		at24->read_post(orig_off, orig_buf, orig_count);
+		at24->read_post(off, buf, i);
 
 	return 0;
 }

-- 
Jean Delvare
SUSE L3 Support
