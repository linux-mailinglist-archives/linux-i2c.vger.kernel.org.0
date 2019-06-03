Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E22B33C49
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 02:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbfFDAAV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 20:00:21 -0400
Received: from sed198n136.SEDSystems.ca ([198.169.180.136]:19230 "EHLO
        sed198n136.sedsystems.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbfFDAAU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jun 2019 20:00:20 -0400
X-Greylist: delayed 1587 seconds by postgrey-1.27 at vger.kernel.org; Mon, 03 Jun 2019 20:00:20 EDT
Received: from barney.sedsystems.ca (barney [198.169.180.121])
        by sed198n136.sedsystems.ca  with ESMTP id x53NXrWY007284
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 3 Jun 2019 17:33:53 -0600 (CST)
Received: from SED.RFC1918.192.168.sedsystems.ca (eng1n65.eng.sedsystems.ca [172.21.1.65])
        by barney.sedsystems.ca (8.14.7/8.14.4) with ESMTP id x53NXqUU029971
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 3 Jun 2019 17:33:52 -0600
From:   Robert Hancock <hancock@sedsystems.ca>
To:     linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com, Robert Hancock <hancock@sedsystems.ca>
Subject: [PATCH] i2c: xiic: Add max_read_len quirk
Date:   Mon,  3 Jun 2019 17:33:45 -0600
Message-Id: <1559604825-23517-1-git-send-email-hancock@sedsystems.ca>
X-Mailer: git-send-email 1.8.3.1
X-Scanned-By: MIMEDefang 2.64 on 198.169.180.136
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This driver does not support reading more than 255 bytes at once because
the register for storing the number of bytes to read is only 8 bits. Add
a max_read_len quirk to enforce this.

Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
---
 drivers/i2c/busses/i2c-xiic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 0fea7c5..37b3b93 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -709,11 +709,16 @@ static u32 xiic_func(struct i2c_adapter *adap)
 	.functionality = xiic_func,
 };
 
+static const struct i2c_adapter_quirks xiic_quirks = {
+	.max_read_len = 255,
+};
+
 static const struct i2c_adapter xiic_adapter = {
 	.owner = THIS_MODULE,
 	.name = DRIVER_NAME,
 	.class = I2C_CLASS_DEPRECATED,
 	.algo = &xiic_algorithm,
+	.quirks = &xiic_quirks,
 };
 
 
-- 
1.8.3.1

