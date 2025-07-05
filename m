Return-Path: <linux-i2c+bounces-11847-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D825AF9EF6
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Jul 2025 10:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7659563C65
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Jul 2025 08:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF08283FD6;
	Sat,  5 Jul 2025 07:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="OkbVjjqG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-80.smtpout.orange.fr [80.12.242.80])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DD328B4E0
	for <linux-i2c@vger.kernel.org>; Sat,  5 Jul 2025 07:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751702361; cv=none; b=oeIhGHNqEd/MwKTmXi2F2YW6vsZGL8t+O0U/7wj5/PeoWFjSiRXZ3AWEfbfW5TWUxhuCIcD6erG7meVyx78jCN+MtHSUuzC8kEgDG8wrmw8pz0FfxovtlQYXs0uqddsMIry9FpGS5wtWMCwBXIxYWjKGyjN5h+bjU88FFmVsAw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751702361; c=relaxed/simple;
	bh=RubWeoGD7YmfAjBkG9mnREmRf9RsDJcz+ZcKpddWwKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MxPzUWIFgx5ZH/11IBB8ywxyXvToeJ63oZdfuMK1HEIKKEAtSTBVQvpEIFced3uWIJCxzrT1nYDigY3c32cP0srsWpVg1r8I/7HFQT7fXfynQZwJui0tdf92w9AiJj8Ym0AJslhQ6Y/BwjkcpJsV+eGEkwvZv/PgOf8TivZIh8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=OkbVjjqG; arc=none smtp.client-ip=80.12.242.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id XxmRuIndJIhD3XxmouGNfJ; Sat, 05 Jul 2025 09:58:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1751702295;
	bh=Gh+K9CUjRI08vkOxjKoTjZXj+DSeFO94gLVQU5XQqQU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=OkbVjjqG19/dFr73A0TxfxrRKajx2MBtWxK7Jw7jCXI0cPVIhNWTwc36UfnTfuJWM
	 8B1dwmIjQeJYZObqgUqrj+jbtdt4WfMxWwRPOz4lPupKr6+a2x6fedZz1P6/ehEBzP
	 7KcYCX731nWY/qOmEG7ql4esHvTVTvsKYnqu37VXnXm+dfuP4KfeZO6FSNaMb8NtNn
	 znkwPjpQZkAXazQMnDVovKoUQSVV68xxKKAoSiRmx1kjE/8lGwZUGkpNv7UBt/qcnB
	 T7C0CtW4G0fh6yBHZZ4NH2HFpmr5jzpoY3ggqoHuYQPxHonv1Hakko7grDgp6T6Xvr
	 gwmkfb7l6Lmow==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 05 Jul 2025 09:58:15 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: vigneshr@ti.com,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	andi.shyti@kernel.org,
	miaoqinglang@huawei.com,
	grygorii.strashko@ti.com,
	wsa@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] i2c: omap: Fix an error handling path in omap_i2c_probe()
Date: Sat,  5 Jul 2025 09:57:38 +0200
Message-ID: <af8a9b62996bebbaaa7c02986aa2a8325ef11596.1751701715.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1751701715.git.christophe.jaillet@wanadoo.fr>
References: <cover.1751701715.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after pm_runtime_use_autosuspend(), a corresponding
pm_runtime_dont_use_autosuspend() should be called.

In case of error in pm_runtime_resume_and_get(), it is not the case because
the error handling path is wrongly ordered.
Fix it.

Fixes: 780f62974125 ("i2c: omap: fix reference leak when pm_runtime_get_sync fails")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/i2c/busses/i2c-omap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 485313d872e5..ef1193e0e62d 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1523,9 +1523,9 @@ omap_i2c_probe(struct platform_device *pdev)
 	if (omap->mux_state)
 		mux_state_deselect(omap->mux_state);
 err_put_pm:
-	pm_runtime_dont_use_autosuspend(omap->dev);
 	pm_runtime_put_sync(omap->dev);
 err_disable_pm:
+	pm_runtime_dont_use_autosuspend(omap->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	return r;
-- 
2.50.0


