Return-Path: <linux-i2c+bounces-4718-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE97929338
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE523282B01
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B134176FB8;
	Sat,  6 Jul 2024 11:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="i2FX1UCT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5802617622D
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264939; cv=none; b=ftBzZ+KdWMiVBHftRrn6aDcWyQV1KeV1TVsIUtUS2XnBzAV4IfcNIQImC0UbWge5jxn6fc+ICdkuuxOY7ZZ+SYHqJjlvcuXlOYzjUJm0clGNGF8glbVgo0EoKxEz2Zp5FABAKBP3a6NkhZB3JSKbzM76r4qlz/HSt8U0mbJywnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264939; c=relaxed/simple;
	bh=ay0NNYp6uB+Hzz66hQmEVe14Hbw3ALbsqZ22fhHX/ig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CUl40Ao70DJOKil8kJbB7gvxgdvvkfdNL7+n199XLpLuoENAVlJZS+GfBtKFJxgaJ7bsu66ufNgJiVdaXKDWxzPBdsiSAAEd51eQ1+vNOhvI80jPMX7yJDDn0MlJ93siM0mDLqAFmcVJF9h8S2nNUIWuZc6TSHg7kcx1Jbcai1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=i2FX1UCT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=/7futhidHP5gSersG6I/0JwsF+rinC/q3OXwrLgvIjY=; b=i2FX1U
	CThJagfpuhB9HEIXbAPHzXQKPTA86+2GDZY5JSShYE/8EwJGbEz5fzXO8/+4Uncm
	YyejBkkdbEI2C9wtliJEG59GuRP52GbU1VfSuijw9Ap2sfj6GtE8zUUlZASt3CJL
	gS6m6BgTlsCdiLY/BubVSLcVgBvE4m4CnYzMZEiUSLRWuf3ZT+OgLU6MN713+p7h
	MnT8IGy7gFDYyln3ns3l+x4wrEWWfKr5xabgf+0Or3Fq7+0pxHj97PuiCR1rwthZ
	vSLmzAAujQeIxrPKDR+1LKfpiHb070i0MFDsoMyX3+rgjT4bDkSKYvlKtePSd48+
	9AiJjDYtdU4RPz3Q==
Received: (qmail 3811008 invoked from network); 6 Jul 2024 13:21:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:58 +0200
X-UD-Smtp-Session: l3s3148p1@XelaY5IcduFQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Robert Richter <rric@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 51/60] i2c: thunderx-pcidrv: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:51 +0200
Message-ID: <20240706112116.24543-52-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
specifications and replace "master/slave" with more appropriate terms.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-thunderx-pcidrv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
index 32d0e3930b67..143d012fa43e 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -72,7 +72,7 @@ static u32 thunderx_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm thunderx_i2c_algo = {
-	.master_xfer = octeon_i2c_xfer,
+	.xfer = octeon_i2c_xfer,
 	.functionality = thunderx_i2c_functionality,
 };
 
-- 
2.43.0


