Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA57868D08E
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Feb 2023 08:25:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjBGHZU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Feb 2023 02:25:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjBGHZT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Feb 2023 02:25:19 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 284C22ED62;
        Mon,  6 Feb 2023 23:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675754718; x=1707290718;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wIhE4o9BjRTaPYx3WM+PdzIPTyiOBr12rvLi9TUQ5Xs=;
  b=GP2dV8ZQ4VL3hJpT9P1kDPN4siAZNOu5o2sUeNwQSrZvwx8YEGLwSusF
   iz+WXMEWu3fJFuTMlFeNCh85r0XZbazOu6wSDurK2KMqodYt8dYqoQN4j
   GOIv1xpLIr+Sq1Nxuk0m9vIF3LS8mpVgJIUbUKfJLcAK3u+0V1v7bcBde
   8mt4BFpyW/UZ3YaqJMUfi44lHxjPGRTbxBRlh3cXscHDZjjwDeSLL0lkv
   NNOgtHv/doL8e6I4/WScWpiPq+2hJheTyYCs6Y+wDElYXxaakG3uGQQ9P
   zVOzCnfalPsxmqMYTcIR6bYjobsSeDUMh3M3GbEEfFzWYAkbngFomntVh
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="309763433"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="309763433"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 23:25:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="809418436"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="809418436"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2023 23:25:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 294D61C5; Tue,  7 Feb 2023 09:25:40 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Raul E Rangel <rrangel@chromium.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [RFC] i2c: core: Do not enable wakeup by default
Date:   Tue,  7 Feb 2023 09:25:40 +0200
Message-Id: <20230207072540.27226-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

After commit b38f2d5d9615 ("i2c: acpi: Use ACPI wake capability bit to
set wake_irq") the I2C core has been setting I2C_CLIENT_WAKE for ACPI
devices if they announce to be wake capable in their device description.
However, on certain systems where audio codec has been connected through
I2C this causes system suspend to wake up immediately because power to
the codec is turned off which pulls the interrupt line "low" triggering
wake up.

Possible reason why the interrupt is marked as wake capable is that some
codecs apparently support "Wake on Voice" or similar functionality.

In any case, I don't think we should be enabling wakeup by default on
all I2C devices that are wake capable. According to device_init_wakeup()
documentation most devices should leave it disabled, with exceptions on
devices such as keyboards, power buttons etc. Userspace can enable
wakeup as needed by writing to device "power/wakeup" attribute.

Reported-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
Hi,

Sending this as RFC because I'm not too familiar with the usage of
I2C_CLIENT_WAKE and whether this is something that is expected behaviour
in users of I2C devices. On ACPI side I think this is the correct thing
to do at least.

 drivers/i2c/i2c-core-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 087e480b624c..7046549bdae7 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -527,7 +527,7 @@ static int i2c_device_probe(struct device *dev)
 			goto put_sync_adapter;
 		}
 
-		device_init_wakeup(&client->dev, true);
+		device_init_wakeup(&client->dev, false);
 
 		if (wakeirq > 0 && wakeirq != client->irq)
 			status = dev_pm_set_dedicated_wake_irq(dev, wakeirq);
-- 
2.39.1

