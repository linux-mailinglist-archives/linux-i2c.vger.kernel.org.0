Return-Path: <linux-i2c+bounces-1156-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FAF82558A
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 15:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3ADE1F23CE2
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 14:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4E12C6B7;
	Fri,  5 Jan 2024 14:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="n0RgGpMb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDE72E3E4
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jan 2024 14:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id LlMLrGEYBZHPALlMLrhVSf; Fri, 05 Jan 2024 15:39:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1704465583;
	bh=mlZMWue+rUHLA0FDYtCvHGfyfaAK8CYgvZJbBND9Z+Y=;
	h=From:To:Cc:Subject:Date;
	b=n0RgGpMbquaY8uZqtu9kYIqiEkIlQG491OL3+S943O0v+1ibtaO4NA19Jydhy7EPr
	 hIeuUcUiIcS64oIyCAXIWccbQ4eGlSsEMaka7v8MhDmxu103Lxh5Nz8rA4zfaP1fAJ
	 hr1FvHhm7XWwjH8pViq18YbgTvX2N3IF2hhrdNq72Y6TKTPA3SbqHwkkJbU1cm+uTn
	 OXZEsg5NFyJGwQAzddyV1UHLlom65hN7+RpgYXxn9RLvnlV+s6jWbaA0dO73MVLJ16
	 d6tgpGK/2+GIPCVsX1gmpl/ZsgXIpB6/pJlhzE26UovHf2dZfQlCX7rknleDs+m71t
	 BfXeuUlCDzktA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 05 Jan 2024 15:39:43 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: andi.shyti@kernel.org,
	wsa@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] i2c: wmt: Fix an error handling path in wmt_i2c_probe()
Date: Fri,  5 Jan 2024 15:39:35 +0100
Message-Id: <6ed30ecf43a4c8574aa6b9f93be50f3203a42850.1704465414.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wmt_i2c_reset_hardware() calls clk_prepare_enable(). So, should an error
occurs after it, it should be undone by a corresponding
clk_disable_unprepare() call, as already done in the remove function.

Fixes: 560746eb79d3 ("i2c: vt8500: Add support for I2C bus on Wondermedia SoCs")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/busses/i2c-wmt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
index ec2a8da134e5..198afee5233c 100644
--- a/drivers/i2c/busses/i2c-wmt.c
+++ b/drivers/i2c/busses/i2c-wmt.c
@@ -378,11 +378,15 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 
 	err = i2c_add_adapter(adap);
 	if (err)
-		return err;
+		goto err_disable_clk;
 
 	platform_set_drvdata(pdev, i2c_dev);
 
 	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(i2c_dev->clk);
+	return err;
 }
 
 static void wmt_i2c_remove(struct platform_device *pdev)
-- 
2.34.1


