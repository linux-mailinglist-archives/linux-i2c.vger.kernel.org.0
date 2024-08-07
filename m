Return-Path: <linux-i2c+bounces-5197-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF1594AF75
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 20:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09CE51C213DE
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 18:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8771418EBF;
	Wed,  7 Aug 2024 18:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mq1JRN2J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA11363CB
	for <linux-i2c@vger.kernel.org>; Wed,  7 Aug 2024 18:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723054510; cv=none; b=IPiAEf48K5bE9fADr5Jb2s93yUkMSvZEOKSwie2b5V7OzXsHXbCUOL4D5oz5O6gmFAMfgfBX7sUiSJJbi1xRI8kM28L1thYxLwYjO6ZionCiSNEnZ/scqgwHxb2bFMCIP8VXyqz/IgfYYqWXtMjQzMP0oMDuFurNLtdNaOLkebw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723054510; c=relaxed/simple;
	bh=QhNYRC+a30WNitMs5e4+ADzAfHP0LXcqwf713cxZ4mg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Erq8Mu+j5qJT3BLzSK7UVUYDnjRZuQlxPKae5+iqS6rutXBU7ceY0zsEhnrsrAkio+qqWUWikI5/U6KB40XmgsdSa/lKgYwNRyCy2TevUD0EiM4Uw68axYI2PEzjYk8JbL+2y8CGoX4dZ5lSmVapH4LveH5DM2xTN2Qo4A17UR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mq1JRN2J; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1ff496707beso283705ad.2
        for <linux-i2c@vger.kernel.org>; Wed, 07 Aug 2024 11:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723054508; x=1723659308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+EljhIbUlFEdiTyTsdDG5I37orVtSDpLZuQNUDIqnUA=;
        b=Mq1JRN2JOTmlswgIptUfvRoTHbwp56stbePTZW0bJ+KnQ6QwesLaRontq3zns1rBSz
         YXEKJOUAdLGluco0VWnxMUfOnhgcy4+w2Sb6mkXgeruCPyLRi5pDDZZsqrz4IudnPbKf
         Py1CeM59OHDlN8//cKnzRnl1SeEiU/VH+HA/asHrj4c1ypFgohbeUyGIQwinF4c1iP/U
         5wd53VV8vpcPz+WJ0SvXa6zbimwe7HU+Nh/zFvqyIAuryvJ3jHyrNZ7XAktqSVqrl/s1
         HJeYUn7+83aE7u2vDY2nqxb6t2h2CRTGtsxvXq6f+Vq/LCREaWU+eDyQaptcCfuQc/OS
         2Kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723054508; x=1723659308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EljhIbUlFEdiTyTsdDG5I37orVtSDpLZuQNUDIqnUA=;
        b=sWocjpQywiYtmtWdlyzTj5BQEDC9reevrl//BT1EV/yPrYskkQLm5nvg/56791KpPw
         HJrlvk6Hogx072jKFAKztYgQqvxy7ax7XDUXciwMAeO+xVS9eyieIdlNgMcaEZjKHtks
         NJD3BmQvtszKiq3UsMrVVkv3QpHRHKNuo2g7fm4MGRr+peM+NM6GTrZNkaq0yhGjPFsT
         gEH8AsJFPfgcX/uYFMrFStO8yygoyK02j3TcantJ49LB8vHTLLAsC6HyUSdEOAB0K8e/
         dsScjBY3PWu+d3q8WJx+E44GEecnQ0oC9bba/ClSHEIv4DcdlJqJ+pTgISXvkNaflKfl
         MfNA==
X-Forwarded-Encrypted: i=1; AJvYcCXCQeIafIOwYMSFHV2RO+RO/HIXlkNF+fbjGUme5/0p7h1cx1MJix3/5uUKMACd8wDO38TmvYUaeeM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk4JYwIhlnhQI7KIMyxFbZdZBQtV6X0Q1kku4LaR0fuOilHqny
	FdNB5fGGDQRIyQ6JVjqH0JurDN60wAoHh7p3nnugfYZESfAhKlbE
X-Google-Smtp-Source: AGHT+IHbGln9B4S62DoiodS8x0mOg+Yp4kXx3K8j/ACW5WXW4mmlW5Y+22Uc9DjH6wV6KnXIaRkPdg==
X-Received: by 2002:a17:902:dac4:b0:1fd:d7a7:a88d with SMTP id d9443c01a7336-1ff57531b2fmr153558705ad.11.1723054508043;
        Wed, 07 Aug 2024 11:15:08 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5e1c:17b4:a72d:e3b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff592b541esm108924275ad.297.2024.08.07.11.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 11:15:07 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: o.rempel@pengutronix.de
Cc: andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] i2c: imx: Switch to RUNTIME_PM_OPS()
Date: Wed,  7 Aug 2024 15:14:56 -0300
Message-Id: <20240807181456.78760-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Replace SET_RUNTIME_PM_OPS() with its modern RUNTIME_PM_OPS()
alternative.

The combined usage of pm_ptr() and RUNTIME_PM_OPS() allows the
compiler to evaluate if the runtime suspend/resume() functions
are used at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/i2c/busses/i2c-imx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 3842e527116b..d68b575e5d18 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1549,7 +1549,7 @@ static void i2c_imx_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused i2c_imx_runtime_suspend(struct device *dev)
+static int i2c_imx_runtime_suspend(struct device *dev)
 {
 	struct imx_i2c_struct *i2c_imx = dev_get_drvdata(dev);
 
@@ -1558,7 +1558,7 @@ static int __maybe_unused i2c_imx_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused i2c_imx_runtime_resume(struct device *dev)
+static int i2c_imx_runtime_resume(struct device *dev)
 {
 	struct imx_i2c_struct *i2c_imx = dev_get_drvdata(dev);
 	int ret;
@@ -1571,8 +1571,7 @@ static int __maybe_unused i2c_imx_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops i2c_imx_pm_ops = {
-	SET_RUNTIME_PM_OPS(i2c_imx_runtime_suspend,
-			   i2c_imx_runtime_resume, NULL)
+	RUNTIME_PM_OPS(i2c_imx_runtime_suspend, i2c_imx_runtime_resume, NULL)
 };
 
 static struct platform_driver i2c_imx_driver = {
@@ -1580,7 +1579,7 @@ static struct platform_driver i2c_imx_driver = {
 	.remove_new = i2c_imx_remove,
 	.driver = {
 		.name = DRIVER_NAME,
-		.pm = &i2c_imx_pm_ops,
+		.pm = pm_ptr(&i2c_imx_pm_ops),
 		.of_match_table = i2c_imx_dt_ids,
 		.acpi_match_table = i2c_imx_acpi_ids,
 	},
-- 
2.34.1


