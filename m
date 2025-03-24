Return-Path: <linux-i2c+bounces-10003-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7182A6E483
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 21:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FCA01894D5C
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 20:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA511D5159;
	Mon, 24 Mar 2025 20:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+Uan55P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15D52E3374;
	Mon, 24 Mar 2025 20:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742848362; cv=none; b=P3Ns2pPNAd8jDeEOb0kHAq4Az1hRn1OPTRnSLzAsMqdfjRB5SzmILeBv/U+sCt15XvA/OiwWgiOdugQ+gvmagCCwG0pXhS+ny42aYcnYFElRlKG7v0gllkUst8zL5zMz8VmI126rT/i4fY749P5lakAIFex1KKTc2aieQSHsa9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742848362; c=relaxed/simple;
	bh=H55dapffsuhjnE0Ly7V+beIwVQmmUr/D2N7ZOtll3cM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OmlymxOVjWjnd9os6HhpDsaQyNdHC2vCiw7kd2bbyf0BhG2mDxXYEdLy2PThDTZHG52nPA4tzXJm3w/98eg04I1qUPyqFpPN2RPZdfLZ4k0jxE3FCQYQTPsXShGZCxG5+kVLlN2kwbqRJnrErpxNIQnaCQfSlqVmuEx+8EK+OBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+Uan55P; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223f4c06e9fso79970025ad.1;
        Mon, 24 Mar 2025 13:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742848360; x=1743453160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jj5y725C6U/JdWVBPtUFbjlsM0gGbVGWPvReveqEWoM=;
        b=c+Uan55P0d1ep78xTiOqKUqcgZHl5jW2OP2oXQrIHIu2XTkJsHsgPizRDRfbb1jZN4
         ghNYGddnzFh63AkG2rNJHyyV3QnFgXEXEIIsyU9bW1eV7ITXOculEm0sZ+LXfV+QpQVc
         U3Q07NWQoF/+0XFXC9CzUjWRPQPHyZLwswQxncag5JbYg8L9ebAZ8W8FbdPn7IiglemB
         gNlVk7EKRS8XfJ6JUEn65X3hwDFsZ5HrpL/sxmF+YLUGGQJEMKYmkPKwqfhsNHIrvZa8
         1kgChNXq/pCeSpCi/6Nl3pdAvBYeIvcotAnGvxzglbo1Rs2qccfU6T02PhsD/n+iDw2x
         JH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742848360; x=1743453160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jj5y725C6U/JdWVBPtUFbjlsM0gGbVGWPvReveqEWoM=;
        b=JO3YsE4k8uhQAyCUFODVxecuM4751STvNu9FdzHNRmjGQRdGqtLirxvUtywko9yhm0
         58pN/UUwBaSXpg/V8hQ6X6FHSTNqhD+9SSyUIWALmwbIggHgO7h9Ab7nFDSLszPokwXC
         LNzi8XPa36qvTrlKMebToeXV6QPBcLImLJNXUYmfY2xwkmaDusbTt5Zb6HH0dFTdcT/e
         ax2AzaES2RvJ4ToHNe0TKQ9mt/uLu0/X135lZOr2v7UGrWVT0G57Kn2MjfnHAf2pPNrD
         1pJHCPuUxMoiUaBT/3Of3D0KBMQS40PebUyLvQxgE9FPsj1pkzmLvpyFMrXsK08UFMtS
         Qewg==
X-Forwarded-Encrypted: i=1; AJvYcCUzGMGB1Au8TKudLb1pMZDfEGj69OiGtpbhJeJthpXZ3d+DDC6ScKTPz9t3+e747O7D9z61ZDU9AFg/Gat0@vger.kernel.org, AJvYcCWo7ouOu/u43xavED0X2wSMKc0ZH/ofd6/TOXouIX5+7UaylKrRNJsNshSvWa3NpMM5vseO+8NtBkg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlbszofh1nOxWMnMmdMFQjeTA2iPWZ9xym8L1Yzv5qG48uvL5/
	RxkL03jV0Mmsndb90QOGqh4StdBSS9rG5t4sAixq/HewcogzNdpw
X-Gm-Gg: ASbGncuLxG433o63tNo12kTh8cDHAHqTMGu8njG7fOCAJKAmFrPho2S+UYPNoU3ny6e
	vy0injDU22kgOHU+/zEoOdlfO0ZfDjK6fzNO9EH6gpedYE7HarjO3uNMxl6sEQTZ4vPwYKXgZRl
	ExxQrQM+6w4RWFs19/vHoh02jboI5i0Sb0q6oVyJS5oXDN5J+G+pw4zsFV+2h8JIteuN8AR4Wb0
	BZnRwPGEUb4Z+ysFa8dvatNtqTCJ4/7EyOy5gF45maQrFQlrr/tlMtkAkBNwUCHgwrSAhGtK/vc
	GtcZz/g7zZ9BG97eizD/EYerNpkXX0IhURrIrcGjD4TtZLC1KzrRoF98u39cUbNafP7NYWvy5QZ
	BJvk9xXIoge1h3HCuv/W/LK2uBNCb7NklGaXdF3LxrA==
X-Google-Smtp-Source: AGHT+IEkkZwglT7x6V0AyhOCINFRmYgH5G77Wb4O3lcI2Jw9QeTNeTSW9Kfa9CP4TsKw2I2S1Lo4Xg==
X-Received: by 2002:a17:902:da8c:b0:21f:6dcf:fd2b with SMTP id d9443c01a7336-2265e67f76dmr240914285ad.1.1742848359660;
        Mon, 24 Mar 2025 13:32:39 -0700 (PDT)
Received: from elbadrym.c.googlers.com.com (34.125.168.34.bc.googleusercontent.com. [34.168.125.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a23c31sm7593981a12.54.2025.03.24.13.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 13:32:39 -0700 (PDT)
From: mohammed.0.elbadry@gmail.com
To: 
Cc: Tali Perry <tali.perry1@gmail.com>,
	Mohammed Elbadry <mohammed.0.elbadry@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] i2c: npcm: Add clock toggle in case of stuck bus during init in npcm_i2c_init_module
Date: Mon, 24 Mar 2025 20:32:03 +0000
Message-ID: <20250324203233.1266772-2-mohammed.0.elbadry@gmail.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
In-Reply-To: <20250324203233.1266772-1-mohammed.0.elbadry@gmail.com>
References: <mohammed.0.elbadry@gmail.com>
 <20250324203233.1266772-1-mohammed.0.elbadry@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tali Perry <tali.perry1@gmail.com>

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 3ad6124be80f..78c85015d955 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2043,10 +2043,14 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 
 	/* Check HW is OK: SDA and SCL should be high at this point. */
 	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
-		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
-		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
-			npcm_i2c_get_SCL(&bus->adap));
-		return -ENXIO;
+		dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempt recover\n", bus->num,
+				 npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
+		if (npcm_i2c_recovery_tgclk(&bus->adap)) {
+			dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
+			dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
+				npcm_i2c_get_SCL(&bus->adap));
+			return -ENXIO;
+		}
 	}
 
 	npcm_i2c_int_enable(bus, true);
-- 
2.34.1

**Reported-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>**
**Tested-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>**

