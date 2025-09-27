Return-Path: <linux-i2c+bounces-13227-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FB1BA5D1A
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 11:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 332C57AF868
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 09:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604082D73A1;
	Sat, 27 Sep 2025 09:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="tuCt6/fv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BA91B5EB5;
	Sat, 27 Sep 2025 09:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758966754; cv=none; b=iHwiJw6lFYfD/2qWLUa5Wyr4/NZ8/pfc1TaA6tIa5AX3X6iJwPIQGGHhW/cX7HNWvcLS8QROt5fMnemVhRApgWJmQdAoHgMy9MhoSlPgQhewNUO0twqy3wdbtcn2lXggp7Fxto+EICBBFZzAi9XeTQ4xhOnSEXbN/v2KHjrHkkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758966754; c=relaxed/simple;
	bh=PHF2eJz1F9yMaae8Aad4ZlFknB8cM2jjGUnF22rh5q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=okvGji/mdlAtdGMA+JK9Y949X5AvNJyAIOtUbKJAyZSgnIpqHaIRS8GUCd86If2Ay2kXAunaWkRPUlcfztzsFIjmVovfQwP/TD9RJ5Zag2l9pB25+uHy09BGnh9MHmDDRJCxOaRqmj5ifbc9PyXfGeLRZ/5Jr37JuwfbaNqdlBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=tuCt6/fv; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: by dvalin.narfation.org (Postfix) id B02DE21778;
	Sat, 27 Sep 2025 09:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1758966743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zAbY3pK7u7KRSB9tROvDcmOUQ3bDPE77eAlWf4O0phA=;
	b=tuCt6/fvqWpgJa9B+lOdgGJoY2Q3bY5/zGBpxj+kRzYKiFyLaxZ9UQ7iwYHJ823tJwkUPI
	17Z6VoVdXcCFBvE7qTCOiPbIc6QausmOyYqsOKUdbw89+DE48Jt/TpurgVbermlbAxJi0R
	cIYceWNRZwNvRixpt8/vK+xxY6nD+g4=
From: Sven Eckelmann <sven@narfation.org>
Date: Sat, 27 Sep 2025 11:52:16 +0200
Subject: [PATCH i2c-host-fixes i2c-host v7 1/2] i2c: rtl9300: Drop
 unsupported I2C_FUNC_SMBUS_BLOCK_DATA
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-i2c-rtl9300-multi-byte-v7-1-c0fd0e78b818@narfation.org>
References: <20250927-i2c-rtl9300-multi-byte-v7-0-c0fd0e78b818@narfation.org>
In-Reply-To: <20250927-i2c-rtl9300-multi-byte-v7-0-c0fd0e78b818@narfation.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=sven@narfation.org;
 h=from:subject:message-id; bh=PHF2eJz1F9yMaae8Aad4ZlFknB8cM2jjGUnF22rh5q8=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBnXN1+Umjc5olYjN0uV3zbTQiBXOVGg/cGMlOSouiVdz
 +Uv+l7qKGVhEONikBVTZNlzJf/8Zva38p+nfTwKM4eVCWQIAxenAEyk5D7DX/l+RbdkDk3nv6oL
 +T+1ZLgy3Mr9JV0oYc0TUyT/9cDUREaGpRNZFMun3mZetGh6dK4OZx6PotSxlQseH2I99PlcmfN
 fPgA=
X-Developer-Key: i=sven@narfation.org; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF

While applying the patch for commit ede965fd555a ("i2c: rtl9300: remove
broken SMBus Quick operation support"), a conflict was incorrectly solved
by adding the I2C_FUNC_SMBUS_I2C_BLOCK feature flag. But the code to handle
I2C_SMBUS_I2C_BLOCK_DATA requests will be added by a separate commit.

Fixes: ede965fd555a ("i2c: rtl9300: remove broken SMBus Quick operation support")
Cc: stable@vger.kernel.org # v6.13+
Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
 drivers/i2c/busses/i2c-rtl9300.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 9e1f71fed0feac41e1534709de2406c7a63fa9cd..af991b28e4f83591a3212f7e5cf8137e36a7693a 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -307,8 +307,7 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 static u32 rtl9300_i2c_func(struct i2c_adapter *a)
 {
 	return I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_BYTE_DATA |
-	       I2C_FUNC_SMBUS_WORD_DATA | I2C_FUNC_SMBUS_BLOCK_DATA |
-	       I2C_FUNC_SMBUS_I2C_BLOCK;
+	       I2C_FUNC_SMBUS_WORD_DATA | I2C_FUNC_SMBUS_BLOCK_DATA;
 }
 
 static const struct i2c_algorithm rtl9300_i2c_algo = {

-- 
2.47.3


