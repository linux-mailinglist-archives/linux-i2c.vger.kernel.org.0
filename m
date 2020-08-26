Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3DDF2531E2
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 16:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgHZOtg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 10:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbgHZOt2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Aug 2020 10:49:28 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E198C061574;
        Wed, 26 Aug 2020 07:49:28 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id i13so1000998pjv.0;
        Wed, 26 Aug 2020 07:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gei3eGyj/TCO0svrvjvzgxjgeg9dEgx8lLot5t+WCKQ=;
        b=OggeQFpN8Ur5khUHkwMA7O7SqErBYYpznV7etHRBSCqbcD8GFdhVN9/3xtrmF9i2N7
         IiyRysA8iehiPES/uOreenm+KFkuTDtEd+cpVjAuwfrKYeOZwwHtc44W0JTR/l4H7n9C
         Vpb0AUNIgaT/ujfTLH+vMrBGW7766ZEoLCTKOnCq48v3gWLF+IV0wuy20Mbl5oU00q/v
         xpU/D7NYv+inADKhd9U0sQr+C8ZC9dfG5XnT28iwqG7dg7WscTnY7YrN4YdxAq7AZou4
         hmgdYPI5GsVVhMUWake9uplUpA5mBbxkOAoXfu5Udd1HQHNULDPnBwsgYJWp4IoES2Xc
         Xevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gei3eGyj/TCO0svrvjvzgxjgeg9dEgx8lLot5t+WCKQ=;
        b=bAPLvPf12hN5lBtIPfMkzFq7GLMqPnTqweYLQT3dEOhcqNKUZ1GxdXjorn11kh78MN
         ubN+AQlejpKb0aWWSuBgQjwwDlJw1rowcnrpJo04EEbHlfvCF4kvJbtC2jcS8f/m+rI9
         cqt5ZSpHaLI5XBNFM4Q8jShTtmwQne1rBqBlOWJjCgidLvUZ1Lw/TrFhDdFTzsIRrYLY
         BAPI4UrNHW0j4lvNujMDbNkDhsu8F9nCplTd+sNejxPoVmpo9rV79eG1wdVOG0aKNz1k
         wl4io4vaN/dOD3uVmXux7TAnpQ1N6cTQGtveotRIJsY4O7093bEBvSzsD5kwWyoeg5ax
         tYqA==
X-Gm-Message-State: AOAM531xdTLXpZNSlbDZMfjHXrDac23Y/jTSSiBhpZKz6BJhctaTHzc7
        y3p01PFcDkSMwyIlkYLWMBowuuiyk+U=
X-Google-Smtp-Source: ABdhPJwP99rlLlcLD1eYGTg+i3JAy8A6E7AHdmdnVNzCUlHMSIoyL2hexawhLXhMLUqiUaweftLueQ==
X-Received: by 2002:a17:90b:4a07:: with SMTP id kk7mr6645313pjb.125.1598453367815;
        Wed, 26 Aug 2020 07:49:27 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id d13sm3343236pfq.118.2020.08.26.07.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 07:49:27 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [PATCH] i2c: do not acpi/of match device in i2c_device_probe()
Date:   Wed, 26 Aug 2020 23:49:20 +0900
Message-Id: <20200826144920.110605-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c, apparently, can match the same device twice - the first
time in ->match bus hook (i2c_device_match()), and the second
one in ->probe (i2c_device_probe()) bus hook.

To make things more complicated, the second matching does not
do exactly same checks as the first one. Namely, i2c_device_match()
calls acpi_driver_match_device() which considers devices that
provide of_match_table and performs of_compatible() matching for
such devices. One important thing to note here is that ACPI
of_compatible() matching (acpi_of_match_device()) is part of ACPI
and does not depend on CONFIG_OF.

i2c_device_probe(), on the other hand, calls acpi_match_device()
which does not perform of_compatible() matching, but instead
i2c_device_probe() relies on CONFIG_OF API to perform of_match_table
matching, IOW ->probe matching, unlike ->match matching, depends on
CONFIG_OF. This can break i2c device probing on !CONFIG_OF systems
if the device does not provide .id_table.

 i2c_device_probe()
 ...
   if (!driver->id_table &&
       !i2c_acpi_match_device(dev->driver->acpi_match_table, client) &&
       !i2c_of_match_device(dev->driver->of_match_table, client)) {
       status = -ENODEV;
       goto put_sync_adapter;
   }

i2c_of_match_device() on !CONFIG_OF systems is always false, so we never
perform of_match_table matching. i2c_acpi_match_device() does ACPI match
only, no of_compatible() matching takes place, even though the device
provides .of_match_table and ACPI is capable of matching such device.

It is not entirely clear why the device is matched again in bus
->probe after successful and proper matching in bus ->match. Let's
remove ->probe matching.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5ec082e2039d..77eea5c0bc71 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -475,17 +475,6 @@ static int i2c_device_probe(struct device *dev)
 
 	driver = to_i2c_driver(dev->driver);
 
-	/*
-	 * An I2C ID table is not mandatory, if and only if, a suitable OF
-	 * or ACPI ID table is supplied for the probing device.
-	 */
-	if (!driver->id_table &&
-	    !acpi_driver_match_device(dev, dev->driver) &&
-	    !i2c_of_match_device(dev->driver->of_match_table, client)) {
-		status = -ENODEV;
-		goto put_sync_adapter;
-	}
-
 	if (client->flags & I2C_CLIENT_WAKE) {
 		int wakeirq;
 
-- 
2.28.0

