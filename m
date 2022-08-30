Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3885A6BFA
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Aug 2022 20:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbiH3SUt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Aug 2022 14:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231338AbiH3SUq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Aug 2022 14:20:46 -0400
Received: from mail.inka.de (mail.inka.de [IPv6:2a04:c9c7:0:1073:217:a4ff:fe3b:e77c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C10A15826
        for <linux-i2c@vger.kernel.org>; Tue, 30 Aug 2022 11:20:42 -0700 (PDT)
Received: from mail3.berkhan-weisser.de ([2a03:4000:54:b9a::4])
        by mail.inka.de with esmtpsa 
        id 1oT5Zf-0065II-Rn; Tue, 30 Aug 2022 20:02:55 +0200
Received: from 127.0.0.1 (helo=localhost.localdomain)
        by mail3.berkhan-weisser.de with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <Enrik.Berkhan@inka.de>)
        id 1oT5Zg-009MqK-8w; Tue, 30 Aug 2022 20:02:55 +0200
From:   Enrik Berkhan <Enrik.Berkhan@inka.de>
To:     linux-i2c@vger.kernel.org
Cc:     linux-input@vger.kernel.or, Rishi Gupta <gupt21@gmail.com>,
        Enrik Berkhan <Enrik.Berkhan@inka.de>
Subject: [PATCH v1 2/4] HID: mcp2221: enable HID I/O during GPIO probe
Date:   Tue, 30 Aug 2022 20:02:13 +0200
Message-Id: <20220830180215.31099-3-Enrik.Berkhan@inka.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220830180215.31099-1-Enrik.Berkhan@inka.de>
References: <20220830180215.31099-1-Enrik.Berkhan@inka.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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

Signed-off-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
---
 drivers/hid/hid-mcp2221.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 0ca2a7b96825..5d8898f3f2e3 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -902,6 +902,9 @@ static int mcp2221_probe(struct hid_device *hdev,
 	mcp->gc->can_sleep = 1;
 	mcp->gc->parent = &hdev->dev;
 
+	/* Enable reception of HID reports during GPIO initialization */
+	hid_device_io_start(hdev);
+
 	ret = devm_gpiochip_add_data(&hdev->dev, mcp->gc, mcp);
 	if (ret)
 		goto err_gc;
-- 
2.34.1

