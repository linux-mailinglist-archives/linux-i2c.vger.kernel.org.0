Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2BDF618B6B
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Nov 2022 23:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbiKCW1c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Nov 2022 18:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231708AbiKCW13 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Nov 2022 18:27:29 -0400
Received: from mail.inka.de (mail.inka.de [IPv6:2a04:c9c7:0:1073:217:a4ff:fe3b:e77c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7453120358;
        Thu,  3 Nov 2022 15:27:28 -0700 (PDT)
Received: from mail3.berkhan-weisser.de ([2a03:4000:54:b9a::4])
        by mail.inka.de with esmtpsa 
        id 1oqigI-005aIq-38; Thu, 03 Nov 2022 23:27:26 +0100
Received: from 127.0.0.1 (helo=localhost.localdomain)
        by mail3.berkhan-weisser.de with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <Enrik.Berkhan@inka.de>)
        id 1oqigH-005Ggn-MS; Thu, 03 Nov 2022 23:27:25 +0100
From:   Enrik Berkhan <Enrik.Berkhan@inka.de>
To:     linux-input@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rishi Gupta <gupt21@gmail.com>,
        Enrik Berkhan <Enrik.Berkhan@inka.de>,
        Tobias Junghans <tobias.junghans@inhub.de>
Subject: [PATCH v2 2/3] HID: mcp2221: enable HID I/O during GPIO probe
Date:   Thu,  3 Nov 2022 23:27:13 +0100
Message-Id: <20221103222714.21566-3-Enrik.Berkhan@inka.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221103222714.21566-1-Enrik.Berkhan@inka.de>
References: <20220926202239.16379-1-Enrik.Berkhan@inka.de>
 <20221103222714.21566-1-Enrik.Berkhan@inka.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

As soon as the GPIO driver part will be enabled in mcp2221_probe(), the
first HID reports will be exchanged with the chip because the GPIO
driver immediately calls mcp_gpio_get_direction(). HID I/O has to be
enabled explicitly during mcp2221_probe() to receive response reports.

Otherwise, all four mcp_gpio_get_direction() calls will run into the
four second timeout of mcp_send_report(), which will block the driver
for about 16s during startup.

A very similar patch appeared some time ago in
https://lore.kernel.org/r/20210818152743.163929-1-tobias.junghans@inhub.de
which obviously got lost somehow.

CC: Tobias Junghans <tobias.junghans@inhub.de>

Signed-off-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
---
 drivers/hid/hid-mcp2221.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index e61dd039354b..0705526231ec 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -1178,6 +1178,9 @@ static int mcp2221_probe(struct hid_device *hdev,
 	mcp->gc->can_sleep = 1;
 	mcp->gc->parent = &hdev->dev;
 
+	/* Enable reception of HID reports during GPIO initialization */
+	hid_device_io_start(hdev);
+
 	ret = devm_gpiochip_add_data(&hdev->dev, mcp->gc, mcp);
 	if (ret)
 		return ret;
-- 
2.34.1

