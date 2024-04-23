Return-Path: <linux-i2c+bounces-3073-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C09C8AE5C0
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 14:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D0B81C21FEB
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 12:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16171127E0B;
	Tue, 23 Apr 2024 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OsLrmj9V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2050A84DE5
	for <linux-i2c@vger.kernel.org>; Tue, 23 Apr 2024 12:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713874416; cv=none; b=nbtex/l2XvsyjztN58/xVpRwXyabno79nTxq29Y7Z11w4d59zqzTYFWS1DJtuVPWG69/f/YH8XNM6myauHWIOOAibCNpf2tcpAPM0IHE6V4msCFVkzzb6ziUs2mzcXpNIuTKip+GKTPQ8wg10rrhvYTyRS4RgLyLb2z+lKpJH+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713874416; c=relaxed/simple;
	bh=xbf1WNjP4IO1W0OZaIGlDuC4mr4dA5AtAr7R2Nila7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nk+TM/1AsdUcJ1AR1PeOtOqLL3ZIS+Uffmbl/SdBYJYc/Lb/yRQd7mRCSPoLhTHsYucD1a0NRZ3VaBqCAus2hBOnApsTI5O/rm1em7ppCacMRv0xH2jabXyqKYxbUww9TuLnGBbbNnnRKVgpl3z+T+Ja7yDLDvIICC57qXZdYKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OsLrmj9V; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=7RDJRV5+hQ+u4dC/v/o4TT1cTTNjvD7fahHVBI9qmOM=; b=OsLrmj
	9VBC/sUCRhezmgv2Kvwp5KDUo0sKJFU5oLlAorfOsEsUiGFGnGukpqQ3RGlUKEno
	4zqE+6wCW4NOxLyWPx3nlUvMPDwjfnSf6+0gmg8zv+aL59eM6QMcX2jlrrYHqgow
	a6yCs3Q23+QTl/uQvZfYrgsLX0mtv+WiZ3ieTEot4NbymRk3WrEtFoaT9JJriKuB
	enmSOkxbQixzHWpKdcQfTaqePkf04sEWzihlWZ77x/bX7e1O/nKqGZV1De79unB0
	RW/zpielGkhB4ZMwgkkrzPVWeQLK5BnELptpBOIWJYDUJWnUeLYo9sZAtt5onf70
	pvI4I8OxECiLRbfw==
Received: (qmail 215926 invoked from network); 23 Apr 2024 14:13:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Apr 2024 14:13:29 +0200
X-UD-Smtp-Session: l3s3148p1@3SVZe8IWUsIgAwDPXxiyACzheF6dGXh7
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] i2c: ali1535: remove printout on handled timeouts
Date: Tue, 23 Apr 2024 14:13:19 +0200
Message-ID: <20240423121322.28460-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423121322.28460-1-wsa+renesas@sang-engineering.com>
References: <20240423121322.28460-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C and SMBus timeouts are not something the user needs to be informed
about on controller level. The client driver may know if that really is
a problem and give more detailed information to the user. The controller
should just pass this information upwards. Remove the printout.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-ali1535.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali1535.c b/drivers/i2c/busses/i2c-ali1535.c
index 461eb23f9d47..9d7b4efe26ad 100644
--- a/drivers/i2c/busses/i2c-ali1535.c
+++ b/drivers/i2c/busses/i2c-ali1535.c
@@ -285,10 +285,8 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 		 && (timeout++ < MAX_TIMEOUT));
 
 	/* If the SMBus is still busy, we give up */
-	if (timeout > MAX_TIMEOUT) {
+	if (timeout > MAX_TIMEOUT)
 		result = -ETIMEDOUT;
-		dev_err(&adap->dev, "SMBus Timeout!\n");
-	}
 
 	if (temp & ALI1535_STS_FAIL) {
 		result = -EIO;
@@ -313,10 +311,8 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 	}
 
 	/* check to see if the "command complete" indication is set */
-	if (!(temp & ALI1535_STS_DONE)) {
+	if (!(temp & ALI1535_STS_DONE))
 		result = -ETIMEDOUT;
-		dev_err(&adap->dev, "Error: command never completed\n");
-	}
 
 	dev_dbg(&adap->dev, "Transaction (post): STS=%02x, TYP=%02x, "
 		"CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
-- 
2.43.0


