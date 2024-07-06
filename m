Return-Path: <linux-i2c+bounces-4693-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8314D929304
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BE98B21BBB
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B821114F119;
	Sat,  6 Jul 2024 11:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RULRLKX/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A923614A62F
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264918; cv=none; b=EFAL2t0Io5xepmh1XImrXLvNAday03NVbQiirtU1fuqEDwzqut5eCjnw5qjssMgzuIaMlXnCfgIaBrskXM25sP6Gkyse78rh9RHApcdlIchhbz/tWOIFhfbscV+E9+ykAX4OlJHfhrP/+rnqqtTYdEppg3H49m1rYAvjCLz6ECY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264918; c=relaxed/simple;
	bh=T4jrk/kzzw6tCtoxphDXWydkQlC4LvCGJTQQEQf4feQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AgTCHTrY6AEMxpDzHHJlv88AlWWsC93P7+QVFk3L/g9iD//bvE1Ju+S++aFcDKE/wQLS+YSHKrevvdu1/PCVjd7z5TS4WbxJNZ+7i2IPdBAtPbkf5Q18S9jhToi1oDCw4blu32NwNFNRswE+MR5omCUAqLHbUQNgTmMNHOIxvnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RULRLKX/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=SKSqotO9cRDWN6hrQrF4vCwa0Gryrx/y0GC4hbpD4k0=; b=RULRLK
	X/1FBMiWoQKbx0toQDy8/KyiVHgjw64Pmxo5j7T5NVpgf0pFtOzWVPHZQgTh53my
	hdjW61UcieQu0/QBGlAVkOrel8LL99utIyKPl3ZAAzPneCUQDI+x9O/NyVtR2Mgm
	D0WhCt9pBCfg4/K+YjSb94RTOa/WYc5hSeJfNTEip9u+0ogFfiwnxehAS3lp022x
	/Rw1r7TTKVHNdEh+c/WV2OiFdXx5VGfEEHO5GRT8eGALEzvznDme18CiAtt/MlSl
	ebPMbdIOQ531Z0KleFWK48VgboNHcw7jk0Xc8iXUbhznmjl0KK4p1f6E9OBz7moG
	6QE0DBxb6E06WYpQ==
Received: (qmail 3810155 invoked from network); 6 Jul 2024 13:21:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:40 +0200
X-UD-Smtp-Session: l3s3148p1@djtFYpIcXIZQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 25/60] i2c: kempld: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:25 +0200
Message-ID: <20240706112116.24543-26-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-kempld.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-kempld.c b/drivers/i2c/busses/i2c-kempld.c
index c3a529a73b5b..eb66942e0b7d 100644
--- a/drivers/i2c/busses/i2c-kempld.c
+++ b/drivers/i2c/busses/i2c-kempld.c
@@ -276,8 +276,8 @@ static u32 kempld_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm kempld_i2c_algorithm = {
-	.master_xfer	= kempld_i2c_xfer,
-	.functionality	= kempld_i2c_func,
+	.xfer = kempld_i2c_xfer,
+	.functionality = kempld_i2c_func,
 };
 
 static const struct i2c_adapter kempld_i2c_adapter = {
-- 
2.43.0


