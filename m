Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A92EFCB68D
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2019 10:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729226AbfJDIhh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Oct 2019 04:37:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:58140 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728920AbfJDIhh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Oct 2019 04:37:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 22D43AF25;
        Fri,  4 Oct 2019 08:37:36 +0000 (UTC)
Date:   Fri, 4 Oct 2019 10:37:48 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] eeprom: at24: Improve confusing log message
Message-ID: <20191004103748.12076669@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Currently when binding to an spd EEPROM, the at24 drivers logs the
following message:

256 byte spd EEPROM, read-only, 0 bytes/write

The last part is confusing, as by definition you don't write to a
read-only EEPROM, plus "0 bytes/write" makes no sense whatsoever.

I propose to have a different message for read-only EEPROMs, which
does not include this last part.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/misc/eeprom/at24.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

--- linux-5.3.orig/drivers/misc/eeprom/at24.c	2019-09-15 23:19:32.000000000 +0200
+++ linux-5.3/drivers/misc/eeprom/at24.c	2019-10-04 10:32:19.110834275 +0200
@@ -717,9 +717,12 @@ static int at24_probe(struct i2c_client
 		return -ENODEV;
 	}
 
-	dev_info(dev, "%u byte %s EEPROM, %s, %u bytes/write\n",
-		 byte_len, client->name,
-		 writable ? "writable" : "read-only", at24->write_max);
+	if (writable)
+		dev_info(dev, "%u byte %s EEPROM, writable, %u bytes/write\n",
+			 byte_len, client->name, at24->write_max);
+	else
+		dev_info(dev, "%u byte %s EEPROM, read-only\n",
+			 byte_len, client->name);
 
 	return 0;
 }


-- 
Jean Delvare
SUSE L3 Support
