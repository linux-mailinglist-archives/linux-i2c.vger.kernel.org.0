Return-Path: <linux-i2c+bounces-14482-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 378CBCB1928
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 02:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2565C30E3C79
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 01:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940F121C17D;
	Wed, 10 Dec 2025 01:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IxzIIUHC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACA221A457
	for <linux-i2c@vger.kernel.org>; Wed, 10 Dec 2025 01:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765328744; cv=none; b=OVPm7qMeqAZP6GrlETFhqOgS+IqySkD4KQ3f5kFfGAKi8QfeVR+J1w7/miSmRgvqPLz7GtO2eTELzTFwsaLej8toChivyK0EI38dqf8RJ5edZGiIdVMY3nxRoibIhljBps27BIHlbrN2mR1p+mksDZfiWCSlX0MrGFJ7rP5wuJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765328744; c=relaxed/simple;
	bh=J8jdRyxN4pHi5HwGXl4WVjETvZhi27YUV8vuAHkKjmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KGhx5IAMEdxHvMXnNRkP7Vx8j18NhrDYO6kt7/JeKspSRkewHa+PsbKXIV286kkcN7zA4hn6LzAn7HzTVWxJLWf65JzwSLc2bW6mMJ+Q0HD1+dzdfe8aM3+DG92x4XD/iL6rxanfEWweimQhlTMT9pTt+lmzYuGW6J2L3eGhR9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IxzIIUHC; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4775895d69cso31676405e9.0
        for <linux-i2c@vger.kernel.org>; Tue, 09 Dec 2025 17:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1765328741; x=1765933541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMLxoWB0gDu+hYqFcCi8C1Ebr4DsG+tpvO7SBM73pts=;
        b=IxzIIUHCW/DeNp6ilaOVI3QAnUh/lyTK2xZAeINqiZIshDdzefx9POEMaa+aFfAX/o
         Em9YE8m9sbZ8A2PTTCOnoqguSdsqyTG6z1c1YPNNGrMTzVWjf0yCgkeUQe1LAUqUT1lG
         b4carawG6rCsq/fqOclA3YB3bk4DHlCvWeK2XF9KNNsQF1V+ecBa7uuM+EsohEFIvkSl
         TFoPiAcp12P0E9VKiS1uXTF+6XTJl75z83unhfLCisx/M5gop3nc6fep+4vvEKh9zp1+
         rW6uvkMD4H7lHVsSI85nV+u7lSZFX5BYOjArtsa8l1VbdLnx4bt2RnTsYF2IU89AsPVa
         utnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765328741; x=1765933541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tMLxoWB0gDu+hYqFcCi8C1Ebr4DsG+tpvO7SBM73pts=;
        b=E4z3iURq6dZOoBpI//Y2V4O0Wv2STMRNCbRLO4dXI2SMTw/CnbJM/+vPTSwvh1zk9G
         4CEQ1gtEZ29r38GaWav3T7e/Uk4CAkaZAvUCu6mRjrsdPQcwJS13v9lxKYSfI0IeQ8qk
         c0orQ9eRsdwnITgz07YinKbhMmmv2ql/K/Xdr353dP0NJ/NQXkm5Wv8C9uGxuguwQ8Z3
         IuPAOqHIzKZGDCR09O40pldvG19AYlm+OUD0N0BNFrYCVBoNEDqNXj6XZ95qFU2jtk1o
         qZtNRage2U8sTVq1cBj+Q3dcl7hHFne8E1409fzUIz7yBvJoyPx3+/axkhLGjfrBMXvi
         p/xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWETquKZzoXR3W1H0xBFbzMetKD4ljxcmo3BleojAtiIETfKPCiDdPB7FsUiy+7R+eHfsZPvOrYDWo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7+TXTtuF/aMwZ5MQ3yDITi62zXbZwgdwTnxK3iG9tlV6vFyKt
	PtCbvUuQ0C02qZgDU1NrnuBJslVuEXPwsNtoHP8ByQ0NfuLxOu0qTtA0GlsLS4gQ1wo=
X-Gm-Gg: ASbGncvs0cNM5foSAWIBy509xcE+2MNN1C2RsAlppcmQbyRLL13MA5dRPBgddJtER+S
	nqfN9DAauq9H3EFfKCJRnSTW68yz3cbYFqIWuXcmDSWMoEHT6OLxwgL1iCZY5Vw4knyNC/m4CcQ
	KQAKZTqjO3nrk09UQqwCSzFC7BM4TKvC1SvIgoUMvor/jIyYt4OFre/6XJma9tf5ckXRk56tnvN
	ncYEqeyAhNSKc1MjK2r4oT/uG7j9YLR/8Dhmursvcc0XuUN2UCpzCHan33MvKzYDvFa34/yc+o9
	o/6lMzwpGP9ruHCq1sVENfixbhvFmPYl47rU0Ize7AOOf+huJqu/YKLEckmAEzgRBfNHze3G8B/
	UoBY/mYlRvLib0O1sYqHTy1HzGb0F5rbwBfOyCy8Xk94nn15r299crAI1OetOnamEbwsNSFR9AE
	/kY5UPw5IClZUH/gZbtxUyvczxMysACkJ7BCAQNgU733wC8RmyWjODVxt3C9oN
X-Google-Smtp-Source: AGHT+IFYMluiQ4OKPV5Xr6Cra1B0NB6igYOb8auHiypnamFYSFB9jzG6KW2GARdfJZJFx9+vko2ixw==
X-Received: by 2002:a05:600c:1910:b0:477:b734:8c22 with SMTP id 5b1f17b1804b1-47a8376e3d9mr6486015e9.8.1765328741065;
        Tue, 09 Dec 2025 17:05:41 -0800 (PST)
Received: from [10.200.8.8] (p99249-ipoefx.ipoe.ocn.ne.jp. [153.246.134.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf9acsm163206575ad.28.2025.12.09.17.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:05:40 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 10 Dec 2025 10:05:27 +0900
Subject: [PATCH 1/4] dt-bindings: eeprom: at24: Add compatible for Giantec
 GT24P64A
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-fp4-cam-prep-v1-1-0eacbff271ec@fairphone.com>
References: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
In-Reply-To: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765328733; l=737;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=J8jdRyxN4pHi5HwGXl4WVjETvZhi27YUV8vuAHkKjmE=;
 b=mI6wLjWaV6kPINJVrW6xd+goS/oplPOblpiCMDfCYKOyYykcFKB5qA36gXDy031uD9RaEwiY1
 Ga78FKqUPyXA7d53Wc9YGCgs64YyHEeehU3zD27+Qo8eFR8CIdnQRR2
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the compatible for another 64Kb EEPROM from Giantec.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index c21282634780..ce63acb025e8 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -132,6 +132,7 @@ properties:
       - items:
           - enum:
               - belling,bl24s64
+              - giantec,gt24p64a
               - onnn,n24s64b
               - puya,p24c64f
           - const: atmel,24c64

-- 
2.52.0


