Return-Path: <linux-i2c+bounces-585-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB1980222B
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 10:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B437E1C208C6
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 09:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3317465;
	Sun,  3 Dec 2023 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kY/LUims"
X-Original-To: linux-i2c@vger.kernel.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id D5CBEE8;
	Sun,  3 Dec 2023 01:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=QqMEvLiBf1UBTNAOni
	e2aym7rxGcq8Xw0sDLPFSesDo=; b=kY/LUimsBQFEQ73Ma94bDwwD6jy0q3DfhK
	vHMVIbPi7jCDS/ZFkXezMJ6rfrgEbLS+da4Cr0Ft1DoTIfWL+es0ppdEMJzISRqW
	dFfaduJ8dd0Xql/j7X+Xc/2RjzJuj/41G2wojzdkz+WUbkCIxqUIlH08WG3AHoG1
	0oKavwwoI=
Received: from localhost.localdomain (unknown [39.144.190.5])
	by zwqz-smtp-mta-g5-3 (Coremail) with SMTP id _____wDXXztqRmxl4UYzEg--.6089S2;
	Sun, 03 Dec 2023 17:12:11 +0800 (CST)
From: Haoran Liu <liuhaoran14@163.com>
To: andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoran Liu <liuhaoran14@163.com>
Subject: [PATCH] [i2c] viperboard: Add error handling in vprbrd_i2c_probe
Date: Sun,  3 Dec 2023 01:12:08 -0800
Message-Id: <20231203091208.38360-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wDXXztqRmxl4UYzEg--.6089S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF48AF1kAFyDKF1fZryfCrg_yoW8AFWrpr
	Z7Krn8CrWUAF1Sqwn7XF48ZryYk3yrGayUCFnrKws7uFsxJFyktrZ8tFWS9F18GrZ7Ca12
	q34jqryfCF1UZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziqYLdUUUUU=
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/1tbiwgw7glc6680olwAAsD
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

This patch introduces improved error handling for the i2c_add_adapter.
The necessity for this enhancement was identified through static analysis,
revealing that the function previously did not properly manage potential
failures of i2c_add_adapter. Prior to this patch, a failure in
i2c_add_adapter could result in partial initialization of the I2C adapter,
leading to unstable operation.

Although the error addressed by this patch may not occur in the current
environment, I still suggest implementing these error handling routines
if the function is not highly time-sensitive. As the environment evolves
or the code gets reused in different contexts, there's a possibility that
these errors might occur. In case you find this addition unnecessary, I
completely understand and respect your perspective. My intention was to
enhance the robustness of the code, but I acknowledge that practical
considerations and current functionality might not warrant this change
at this point.

Signed-off-by: Haoran Liu <liuhaoran14@163.com>
---
 drivers/i2c/busses/i2c-viperboard.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-viperboard.c b/drivers/i2c/busses/i2c-viperboard.c
index 9e153b5b0e8e..13a07290ecf6 100644
--- a/drivers/i2c/busses/i2c-viperboard.c
+++ b/drivers/i2c/busses/i2c-viperboard.c
@@ -400,7 +400,11 @@ static int vprbrd_i2c_probe(struct platform_device *pdev)
 	vb_i2c->i2c.dev.parent = &pdev->dev;
 
 	/* attach to i2c layer */
-	i2c_add_adapter(&vb_i2c->i2c);
+	ret = i2c_add_adapter(&vb_i2c->i2c);
+	if (ret) {
+		dev_err(&pdev->dev, "i2c_add_adapter failed: %d\n", ret);
+		return ret;
+	}
 
 	platform_set_drvdata(pdev, vb_i2c);
 
-- 
2.17.1


