Return-Path: <linux-i2c+bounces-2942-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E28C8A5755
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 18:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F21EF1F23746
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 16:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D1D823B5;
	Mon, 15 Apr 2024 16:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOuNDrXd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A25C7F7FD;
	Mon, 15 Apr 2024 16:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713197573; cv=none; b=Pd0xYIUKZmNNF1mGJabxTUXBKcY+3FzXfmDKJfmzZ0CfGttHWHhc0sD/thb6fIQEyctSnqjaNkO5hE3pCxLgIS4WPVUku5XMtSusijO3Hqb9O7wBnoq8CBHckAqFAQOXgop/Aq7N4rIRftYVwet5CKBWPGuPvbqhL30RsSHuBfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713197573; c=relaxed/simple;
	bh=ckIqWQaa7X8cXyYbRZfse/Fab8ndSJiZlhFA4TKJR7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LMx9jyVdI+4SG5249Hw1KEfAOemIDQ9HojWCqN5KiTEMYRmR2q5apTRfOTSOx4KwK1EVdupd4VFRTlUx27aZf2SoBhkHGNG9yVuMXm/eXYgR0EZJ7+OIoYminV3HGidWa2JJTWvILrnbCpNscaB09I1MOOL5V6WbHuMpnEdBc5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOuNDrXd; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6ed9fc77bbfso2642002b3a.1;
        Mon, 15 Apr 2024 09:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713197571; x=1713802371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UYPFr5i+MGyu5LLht0A+u9WSU+na97LFH7XX96C6GMs=;
        b=aOuNDrXdgkchCqLfs5wEGtkgSCpUedfKAZPpvlRmlhW+683tLVOWvPK1qMza/vLhh5
         nnufWbOOj1Mq380guHFF2N80RU9X1WV87dBhuloW9B3jnHC+qjOLXYQ2IZL6B/Xq3sLJ
         hQOrYPENs0bBrgv4yzt+vFkISerLOeT/7jhMZa03d6o/Qi2HY/ZzBPr51vobihx5SnrY
         VPwFI4x7KeLZkNTN1Cb1IC8XPFNQnTVwpWlt1Z2vJ7dP0OOci5VHBWQAPUQKkqPoI326
         +nL7Vv+qOtCubpZYXh7EFnCHM9XLKslR9wPYkTI0R3Uts7tsl/BN38BXUID6qXuLztbh
         pQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713197571; x=1713802371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYPFr5i+MGyu5LLht0A+u9WSU+na97LFH7XX96C6GMs=;
        b=U+DQPsMyMV93quGSkVpeGFQTUcki6m5eui03P76lYYIdUN6wara3eZ4XJeZMEtiTih
         MwIfor310+FX16QZ+COxd8cmyE2M5tB4+cBm7yfn0fh0v1W7Nodbz0rWMUra8iBruOyD
         0ZWQSIQPw3g8XRi6dyKj9RUNztjGXIWAgrh/q8ms7BUpID+CpbXpfS4Rmhe7mMdvRYAL
         YWjx5zNalZB6pBKuMeev/FxzFdXWdlkuMtV/BPRrq7ctVX7MmNf3IOcwpcaQiyi+T0pG
         ZDlH5OcH19lB22fW8K5pxQCF7p2OH1N6qwTrqyFgQDoTbunkplhAb7cTUVqA1GX4j9+Q
         9rtA==
X-Forwarded-Encrypted: i=1; AJvYcCWN28m9GixNm6qB+m65yjXTwYmZT9Mi6ooB11mZPBRby5X/tgFL8A1kXDYRbi7AFXgZf7DPx4Mo082Sfo0zrgQ91oxq6CiMseSXks+RdDDOml3vYYngv5ceig4JIboSAIq1PTjCaAHe
X-Gm-Message-State: AOJu0Yz2Vab/iMu5KkbJ8PPzJI6q57eRLL84jtLqzslAQi57ihgJMHEi
	WozBJwa55axx2bAHRTwREJDvkaHdY/0iWnjY/rUfD8bz9bH9L7vD
X-Google-Smtp-Source: AGHT+IFkamaPCfrcCsagnOWxyhDz/VK6ZiJLRmV7zq2GI6heq81q0WzJ3e7FA8jpRZgU4NZCN8c0IA==
X-Received: by 2002:a05:6a00:1491:b0:6ed:6f25:f361 with SMTP id v17-20020a056a00149100b006ed6f25f361mr10998645pfu.29.1713197569874;
        Mon, 15 Apr 2024 09:12:49 -0700 (PDT)
Received: from dev0.. ([49.43.161.106])
        by smtp.gmail.com with ESMTPSA id x13-20020aa784cd000000b006ea81423c65sm612949pfn.148.2024.04.15.09.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 09:12:49 -0700 (PDT)
From: Abhinav Jain <jain.abhinav177@gmail.com>
To: chris.packham@alliedtelesis.co.nz,
	andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	javier.carrasco.cruz@gmail.com,
	Abhinav Jain <jain.abhinav177@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH] i2c: mpc: Removal of of_node_put with __free for auto cleanup
Date: Mon, 15 Apr 2024 16:12:20 +0000
Message-Id: <20240415161220.8347-1-jain.abhinav177@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove of_node_put from node_ctrl and node struct device_nodes.
Move the declaration to initialization for ensuring scope sanity.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Abhinav Jain <jain.abhinav177@gmail.com>
---
 drivers/i2c/busses/i2c-mpc.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 8d73c0f405ed..c4223556b3b8 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -304,13 +304,12 @@ static void mpc_i2c_setup_512x(struct device_node *node,
 					 struct mpc_i2c *i2c,
 					 u32 clock)
 {
-	struct device_node *node_ctrl;
 	void __iomem *ctrl;
 	u32 idx;
 
 	/* Enable I2C interrupts for mpc5121 */
-	node_ctrl = of_find_compatible_node(NULL, NULL,
-					    "fsl,mpc5121-i2c-ctrl");
+	struct device_node *node_ctrl __free(device_node) =
+		of_find_compatible_node(NULL, NULL, "fsl,mpc5121-i2c-ctrl");
 	if (node_ctrl) {
 		ctrl = of_iomap(node_ctrl, 0);
 		if (ctrl) {
@@ -321,7 +320,6 @@ static void mpc_i2c_setup_512x(struct device_node *node,
 			setbits32(ctrl, 1 << (24 + idx * 2));
 			iounmap(ctrl);
 		}
-		of_node_put(node_ctrl);
 	}
 
 	/* The clock setup for the 52xx works also fine for the 512x */
@@ -358,11 +356,11 @@ static const struct mpc_i2c_divider mpc_i2c_dividers_8xxx[] = {
 
 static u32 mpc_i2c_get_sec_cfg_8xxx(void)
 {
-	struct device_node *node;
 	u32 __iomem *reg;
 	u32 val = 0;
 
-	node = of_find_node_by_name(NULL, "global-utilities");
+	struct device_node *node __free(device_node) =
+		of_find_node_by_name(NULL, "global-utilities");
 	if (node) {
 		const u32 *prop = of_get_property(node, "reg", NULL);
 		if (prop) {
@@ -383,7 +381,6 @@ static u32 mpc_i2c_get_sec_cfg_8xxx(void)
 			iounmap(reg);
 		}
 	}
-	of_node_put(node);
 
 	return val;
 }
-- 
2.34.1


