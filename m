Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0855FFA54C
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2019 03:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729177AbfKMCWF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Nov 2019 21:22:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:43428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728618AbfKMBxg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Nov 2019 20:53:36 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DBA12222CD;
        Wed, 13 Nov 2019 01:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573610015;
        bh=8Gh9QFWIcV8gouhNwtcnLmaTG574i/mtCXf99Tt1wrU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=K4P6fxedszWsIDD8EyeS8KZy/1YujwT4JHV5+sWUMN9u5UQWaRgyvoU400Yg9AIu3
         Oda59DeRppznecPn1V3ye4HC4m3b8vqN0NgfkYBrDXmyxvQJk934VrAWOdHPt2Ofze
         C65lkAKLF86SPOz5+gKcPpNM3YE4SF699wFLjMlQ=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sasha Levin <sashal@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 119/209] i2c: zx2967: use core to detect 'no zero length' quirk
Date:   Tue, 12 Nov 2019 20:48:55 -0500
Message-Id: <20191113015025.9685-119-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015025.9685-1-sashal@kernel.org>
References: <20191113015025.9685-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

[ Upstream commit e2115ace4196bcd2126446fb874bcfc90cba79be ]

And don't reimplement in the driver.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-zx2967.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-zx2967.c b/drivers/i2c/busses/i2c-zx2967.c
index 48281c1b30c6d..b8f9e020d80e6 100644
--- a/drivers/i2c/busses/i2c-zx2967.c
+++ b/drivers/i2c/busses/i2c-zx2967.c
@@ -281,9 +281,6 @@ static int zx2967_i2c_xfer_msg(struct zx2967_i2c *i2c,
 	int ret;
 	int i;
 
-	if (msg->len == 0)
-		return -EINVAL;
-
 	zx2967_i2c_flush_fifos(i2c);
 
 	i2c->cur_trans = msg->buf;
@@ -498,6 +495,10 @@ static const struct i2c_algorithm zx2967_i2c_algo = {
 	.functionality = zx2967_i2c_func,
 };
 
+static const struct i2c_adapter_quirks zx2967_i2c_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN,
+};
+
 static const struct of_device_id zx2967_i2c_of_match[] = {
 	{ .compatible = "zte,zx296718-i2c", },
 	{ },
@@ -568,6 +569,7 @@ static int zx2967_i2c_probe(struct platform_device *pdev)
 	strlcpy(i2c->adap.name, "zx2967 i2c adapter",
 		sizeof(i2c->adap.name));
 	i2c->adap.algo = &zx2967_i2c_algo;
+	i2c->adap.quirks = &zx2967_i2c_quirks;
 	i2c->adap.nr = pdev->id;
 	i2c->adap.dev.parent = &pdev->dev;
 	i2c->adap.dev.of_node = pdev->dev.of_node;
-- 
2.20.1

