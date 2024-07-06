Return-Path: <linux-i2c+bounces-4691-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A9F9292FF
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 334611C21153
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D201714B086;
	Sat,  6 Jul 2024 11:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="etwR/S80"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A32146000
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264916; cv=none; b=ueHNAofayITLlh+yZFrd3XdEnMaAmy81eQu0+Pwpl3svO2qDq6/TYcXpwUZixB1ZS+Flu0DIIYxr1tZoUeSwL8WITjRWTkj0UO5odiwVsF1AgMcH6DbxKQm4nL8xijBLPO2N+BDet7qGP7jRKc7Sljj2RyU8YDmzWUoPQ/+u84k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264916; c=relaxed/simple;
	bh=TNI+L/52fU12C35bC8ALJbFy7cqdmVY1g5fmdAJc1mU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=skbqRF7VchHQSdRT5Ht5NjvvoabS5C9zEctiCDr6AXsT/eJ7Rs6yJ7uKW200k5zJsh/q6KEvKTYuSbtzcu43s/odmYKKOI9RGyoN8LX3g1q01A7s3HXvwVAE89oJDoHv6p6Cpjy3dz0hXpPB4TJNRr34OXYpL8tmwMzcu9rf2XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=etwR/S80; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=SHNrzh4WajxFTgbzTsdFLWb8IzqbL0O1YmyvMU0gP+c=; b=etwR/S
	807NoeIwIQ/0rYzvf4q8FCbehx6M39xADnbyGX2aIZQHAaELyxvz5LqNrcWuvqF+
	4wHrpn9+WU7+IFHY2yQQVaO+CveTvrMRxPeXVzWiXHJfbQQeh6GpvOZ0Ka56yjEN
	CLr8J1xkMMG1iB3KHF49B3WJ2ucpAJQZTskUBCP2o8NjN1CGR2S31tJj8TTjVnZM
	y9X6iHH1ij/GAFjjKQEcKnaw3ZTecRWy4pTLRtjmXSdBvIBeoJYr0460+wlRS26e
	Dp7uw8IigbW9lzrRZjS52l2D/KJy25t2KVAkpQINFgiPOXYz9kJ5+W1y/xBtTTZP
	hQsSUHbo/dlAJsTQ==
Received: (qmail 3810105 invoked from network); 6 Jul 2024 13:21:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:39 +0200
X-UD-Smtp-Session: l3s3148p1@oy07YpIcTIZQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 24/60] i2c: jz4780: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:24 +0200
Message-ID: <20240706112116.24543-25-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-jz4780.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index 7951891d6b97..4aafdfab6305 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -730,8 +730,8 @@ static u32 jz4780_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm jz4780_i2c_algorithm = {
-	.master_xfer	= jz4780_i2c_xfer,
-	.functionality	= jz4780_i2c_functionality,
+	.xfer = jz4780_i2c_xfer,
+	.functionality = jz4780_i2c_functionality,
 };
 
 static const struct ingenic_i2c_config jz4780_i2c_config = {
-- 
2.43.0


