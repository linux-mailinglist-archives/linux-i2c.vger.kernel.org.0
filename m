Return-Path: <linux-i2c+bounces-10926-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F63AB287E
	for <lists+linux-i2c@lfdr.de>; Sun, 11 May 2025 15:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3ADC1890D20
	for <lists+linux-i2c@lfdr.de>; Sun, 11 May 2025 13:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0922256C98;
	Sun, 11 May 2025 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIYDn57/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5F42AD18;
	Sun, 11 May 2025 13:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970295; cv=none; b=RcLb/ZcrnntBsk9t6bMH0HLgmdPVO7UtxVpMoxBaOQBUfuHDWAI24aUJtuoIDWq3Fe/jLiOOOv7FdcKGsYxoDTXf16ULy+xzmUIfzc5fNqqwd8TnJUO02QvbsaqvvUVtn5EFuq/9uLQBwGY11E7jevaVmd/e8b9YWhKjhQntQKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970295; c=relaxed/simple;
	bh=06A+QSY2MonnzxB8ERPSHhZI9/TenJ59NQ66t3K3LRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UHn+8828wlRJXDILtAFiLgTS8CuukUZhvsyCcWvYL6cHikvPccb3xJvQKmqr5MfsUNuJtcxjs+dR6ZuWxYxhw2rBNxh/qk2H9xjXuCJ7x59QBP8kLwKcHkkIrTHpK3966sW5YsgFAYJjYqPdJjFdBBYGRDBka7Tr+vLXlboQimg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIYDn57/; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so8933193a12.0;
        Sun, 11 May 2025 06:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746970292; x=1747575092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9RYlne5nhTN7kCu5Yc7zW4CF0YUJUWg2clQo/viA0M=;
        b=EIYDn57/cA93peoj1BxbSBR3d84QppV/im46c84Lke4iZ/XA9JESiGeNxgkSmy+TxW
         NFABbIQ7sriv68lnXNWkMg30bdti6E0mOJTw722y+I7bVdPr7IWHantHsFe10vKIpQlb
         vQ+x+T8B3GLr1rStO5wM11RlENCzt8fiHc9FgegXCYzBrAvHoeFX53sBfafxYcgucsai
         fSIoTzIAA0Sn84u2TZmydFSe5jyPe4NF8suqpJlwRf4yP5B6fGob7Fd2w+FMrsNphqbr
         t/Vn2cUreMUTngs7LPgX2XN7+TqZFwJqp9ps2cXEqXfpvEAik6Y1aWALXXz9cAGhF1ve
         UeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970292; x=1747575092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9RYlne5nhTN7kCu5Yc7zW4CF0YUJUWg2clQo/viA0M=;
        b=IR5u/057mHpQnZcmIYuNPyWzhG7UuBT0F5bvcRWfK0XDvFih/GDk1omJXrXm3qRGRx
         yCNdEzDfCcj2xa+r/m1VsqBSLpEDxc+aRYDyaZCtL9zF5QcmrqE7lz++HRdmfB4hPdu/
         VfhW9nkNofGzbddGCx4fyBXT+zdHExtHF1bGWIexXE10o6Yzv5vSQkrjWRmzWnH7en+q
         aXQ8epYcpFyEk+t9Hiw0r2GAdhfVd99S4TPcn5Dxi/jmjK9n3jGV97BH7tS5QHJK21c1
         Vd8l00HK42Mvogu1o1VkNuYKo4UhyAobP/faQ7l4dldeosFEHOBflMpN7sXexOHYdceL
         sb4w==
X-Forwarded-Encrypted: i=1; AJvYcCVf7HFGyAqc4avZKp4drYkmMCcTCG9GR8SizHbqSz/JPGAiluyXKz7bAZ5Ir+nGPqusxElJXPpkOfBP1WQV@vger.kernel.org, AJvYcCW7P7aA2cBwHopfcW7u+2Su+2MabiHaF7qlHf83ZSEwWQoh1KqlaovKdw1PpO7398xOOe4HXjvoRUM=@vger.kernel.org, AJvYcCWLu+UP5O3hL9y3cCQn0+TZj3JQKLJLdIHIZA2HPeUvtR1iDpBPjAcGnaktG5ruF1JO8ixjkVqB@vger.kernel.org
X-Gm-Message-State: AOJu0YwargZHtl/DwaMy9E1jhfevyPFcFvkqlzxQ+duez7G5sFRNtkhc
	0JFj7976fnjADEa5d5APSbiGnbiL5sQP/eZvL5MT22TTdHL/RcPg
X-Gm-Gg: ASbGncsjClB84+s9l8CGa9wZiU2smWDkjhPpCE2QfPGP83evjvTb1QxRmCk24wdwcpE
	ml6mPnJvPwSKovztfmY9QSixjuJCflf4ctbOIykhNBPsOiCyCDNycw+DNRMmDg2OfV1jKDDsjtV
	lD4i+eAqqfJb2iz0H2InE59liIB2CUvksOxzXOwF7uf1EhtU6RgoAbzM3pIgDj1BkkqV6CE41Jo
	vXPCyIflFm3rzSzy7VJL/I8YsynfpsT3LorUL/XMUyegT4+akz4mOLJAXyIhiaPCjvObP9RSD2k
	FZh6KcyqIAfHSpegwrnUFXZMkztI3AM3PIm5Sm2RftfXSODkDrVViTsKPtwUCyQaMIbykCBRZsB
	0n+XI
X-Google-Smtp-Source: AGHT+IFAmDDIIuhS51ef1EGvEQpU//VoeH0fQBhRPIfrKUiYydYis8s+qNymb53gRE7q67J/kVk0HA==
X-Received: by 2002:a17:907:94d5:b0:acb:3acd:2845 with SMTP id a640c23a62f3a-ad1fccfced9mr1181053766b.25.1746970291841;
        Sun, 11 May 2025 06:31:31 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197bd398sm466765366b.152.2025.05.11.06.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:31:31 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sun, 11 May 2025 15:31:05 +0200
Subject: [PATCH 1/3] i2c: add init_recovery() callback
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250511-i2c-pxa-fix-i2c-communication-v1-1-e9097d09a015@gmail.com>
References: <20250511-i2c-pxa-fix-i2c-communication-v1-0-e9097d09a015@gmail.com>
In-Reply-To: <20250511-i2c-pxa-fix-i2c-communication-v1-0-e9097d09a015@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>
Cc: Robert Marko <robert.marko@sartura.hr>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, Imre Kaloz <kaloz@openwrt.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

Add a new init_recovery() callback to struct 'i2c_bus_recovery_info'
and modify the i2c_init_recovery() function to call that if specified
instead of the generic i2c_gpio_init_recovery() function.

This allows controller drivers to skip calling the generic code by
implementing a dummy callback function, or alternatively to run a
fine tuned custom implementation.

This is needed for the 'i2c-pxa' driver in order to be able to fix
a long standing bug for which the fix will be implemented in a
followup patch.

Cc: stable@vger.kernel.org # 6.3+
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
 drivers/i2c/i2c-core-base.c | 8 +++++++-
 include/linux/i2c.h         | 4 ++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7ad1ad5c8c3f56943b627254b1fdbf8f787afdb5..6b8b961b845caf6f28ea1a9a76d623ac73f5e0dd 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -427,12 +427,18 @@ static int i2c_init_recovery(struct i2c_adapter *adap)
 	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
 	bool is_error_level = true;
 	char *err_str;
+	int ret;
 
 	if (!bri)
 		return 0;
 
-	if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER)
+	if (bri->init_recovery) {
+		ret = bri->init_recovery(adap);
+		if (ret)
+			return ret;
+	} else if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER) {
 		return -EPROBE_DEFER;
+	}
 
 	if (!bri->recover_bus) {
 		err_str = "no suitable method provided";
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 2e4903b7f7bc11627f9cbc23a4d549dd48c4dcc7..1cff399822c817429e520572546a3d0b7f704723 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -638,6 +638,9 @@ struct i2c_timings {
  *	for generic GPIO recovery.
  * @get_bus_free: Returns the bus free state as seen from the IP core in case it
  *	has a more complex internal logic than just reading SDA. Optional.
+ * @init_recovery: If specified, it will be called instead of the generic GPIO
+ *	recovery initialization code. Platform may use a dummy callback to skip
+ *	calling the generic code, or it may use a custom implementation.
  * @prepare_recovery: This will be called before starting recovery. Platform may
  *	configure padmux here for SDA/SCL line or something else they want.
  * @unprepare_recovery: This will be called after completing recovery. Platform
@@ -662,6 +665,7 @@ struct i2c_bus_recovery_info {
 	void (*set_sda)(struct i2c_adapter *adap, int val);
 	int (*get_bus_free)(struct i2c_adapter *adap);
 
+	int (*init_recovery)(struct i2c_adapter *adap);
 	void (*prepare_recovery)(struct i2c_adapter *adap);
 	void (*unprepare_recovery)(struct i2c_adapter *adap);
 

-- 
2.49.0


