Return-Path: <linux-i2c+bounces-12735-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B06DB480CA
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 00:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 451D117AB4D
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 22:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80AAE28E59E;
	Sun,  7 Sep 2025 22:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llfEGJfx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1707E107;
	Sun,  7 Sep 2025 22:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757283217; cv=none; b=I7ROTNP1U6ac1Xd3mSGamcwEa/uQrYplYJ5prafwvRd2b76Y3tY4SnRCvtB1FSSL7pAYU4We1Zfs5mCpPN87TLldrJBfDMEni/Nu1ys+oOIBeq7MlNyCVmpoieyyZ5ctXrn09iXT4nzhiQIddoeAhA/+ooOFt/avTUGbKAJ5D8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757283217; c=relaxed/simple;
	bh=XU1ekLOUNIJuvyNVZ49DfP0GKjHnS4C5v3J1EnzRwMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xv40+/cWRc7fPYuf0O7LDwhAoBM/dp/Aii4u0CBSbOoKpiJn8hO5LoI+8aMPStrtK8KUYDNgV+COiAahg/VV9Yhzth5gw+ZqWknJN7H+OBcWsLVhYV9ouKD3gVz/03HS6+1pR2MXmIPds1gqRdkRk7m4QQ7Jtjw/kD3kew5fDj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llfEGJfx; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-81076e81a23so395511485a.3;
        Sun, 07 Sep 2025 15:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757283215; x=1757888015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1PFOqUngE3WRT3vXoG+nn2/r+9Vx7zz/vfzR0o6Iog=;
        b=llfEGJfxsGSG7EbfFzG8CpFDO/bj4r3bYkFWKKkbY175TlUzIk5lQigk0esMqeQRso
         nE1aCX9Z1EBM8kYTFEUeK5WRCqzWRyImrl4zw6NbOgnTjg+uICpWSWc3DHh38NaXnbBZ
         UtSAv2F2Q4uQK5hx4e6Qyx2V4GjYhtQWXfhBEKXGmdhlswIfECJohJK3JmNGaHlYDT3Z
         tHdpHwUFic/5mFv6fcn2vxocQ/p57CX7MYIhu7PYjfvK64DpTJEedAk72QIF1u4PCIqk
         vW39CC0MFHSnaKbwBgWL+fa13J3Mdmrn3uzivSK3hHInHa2Eaf2S78qrX2op0NZEKoSD
         bJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757283215; x=1757888015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1PFOqUngE3WRT3vXoG+nn2/r+9Vx7zz/vfzR0o6Iog=;
        b=e9Qn+JNAqAqK9PqNaLYDePO/4mGe6pO7BN3+iGyHGe1WZVli2q8YWixzCBkcXohkXn
         kauGP2pMcmXp32VV11Kot2fLIn2SanUnH98aq1cy9z2cZ5kCx4FRESav1JIrxIXRxi46
         WhIoMXnLWlPgBtsTjR2CQW0vfnMDAWMF1KmoLGWYWNqH3fh4aUIGnkl4HKnFw9zKh+8+
         bMBmRYlZAyn4Uu7rQj0Z+iqfikEu155FnuMx2IJlVVSzFEm7bnlhBkCsJyoRpC3Gi1mC
         SC64Ws7igaSuK3Gxq6byXXak5TnezVf/25Eh7Lvg4c8r/QP1h6ShbZJfzzTKe8wW0089
         48tA==
X-Forwarded-Encrypted: i=1; AJvYcCUCFuCsYSnlcs/8LkkwEiLmYwDeaxYEzeR46f6e6ko4WMhO0mAUHAK7P5hLbOUCQeJ/wKkCjeJyzH0=@vger.kernel.org, AJvYcCUHbs6gVkbiqqL+efbMAHGlR2XzNHPW6hFthKrjeruYFpAadO+zwLMa5dfXxT7cprKGmlUzm47k1BdvdBb6MUAsNks=@vger.kernel.org, AJvYcCUZHngl8HAgpIlriK0uA/6GizIPSqiB0j+M4PerNjELLk2AJW1iUyAmP+HwfCZSniBCVzIarLZEHxV5n8wq@vger.kernel.org, AJvYcCXf73H4nQCqTmyRVguzWFiypWbyosASGTMRkVONPmUoQVamFHNkQSQR+jRaMoZoVCEU4RunK6f41+gVAInD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ani+9wdf4fj8NbCtBXGD5AHLsOcJyMLYrjDs8YWxc/G8a25y
	FOoDX1tEqga/A0x0fHi/5SZC4pycprB9tVvWSsbG3IOvTVfd8Hi3A45h
X-Gm-Gg: ASbGncsArutc18b7L16CW4KAQDNbYhEGCxrpprHxDTxYtkdY/HFtxyuBGkiUg4H0v+w
	ZlSIiyG/XX+d+Jh/rIFYIvu+Rcna2VStIrStcnjvyTDYH8mrLyR/0s/VqS0S8AWM8Nabg8VKyIe
	pJh7aDo0hcNpRb+ZQrDeoNiHxQOIPqlEox/6mZsTgHuC8cB65InLcjPlqpn5BFC12vYWRzoKebr
	uTbHImOogLwv8CoBjqTMJNrKkloG+kNGrIH1xU0sNadjTHQdxbA3Ksmbt1nVyOoQbGat3+SxwxA
	0I3cg9Z1S4KsmixLP4nmqugl/OqfVs4gF5dvqwyJsc9Z19plL5Xa9Nhj/MhWkGSL8WR1dUmisr2
	qi0/uWNMklUE1ICfV2NrnXWTc3sN6mTgtJoV/CSqMYw==
X-Google-Smtp-Source: AGHT+IH7c6KdzZ5dtp38wk1JNatpj6P1Vqovsbf4zct9ARqWKDfPpIhrIZt3XljGdPAodN4JBPViXw==
X-Received: by 2002:a05:620a:44d5:b0:7e8:5bb:b398 with SMTP id af79cd13be357-813be15334cmr606600885a.9.1757283214643;
        Sun, 07 Sep 2025 15:13:34 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa6e4914csm930935285a.16.2025.09.07.15.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 15:13:34 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 22:13:32 +0000
Subject: [PATCH v2 1/8] dt-bindings: soc: samsung: exynos-sysreg: Add
 Exynos990 PERIC0/1 compatibles
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v2-1-58f41796d2d3@gmail.com>
References: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
In-Reply-To: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757283213; l=1475;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=XU1ekLOUNIJuvyNVZ49DfP0GKjHnS4C5v3J1EnzRwMc=;
 b=JPKGRnL7yc+uW9TkM1DVLoDpkKLOSjZU2eITTHyO467B96zV+RY7eeKI+Bz8k9a1LiWgSIfQx
 8KjxaYd+YuFAQfTx3a2NC+r4fQDH9nYhae//6afgs9BlpPTNYp2bdF7
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add compatible strings for Exynos990 PERIC0 and PERIC1 system register
controllers.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d8b302f975474a87e4886006cf0b21cf758e4479..173c51b17d9684113bb8254ee0c83e8e74de2fca 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -30,6 +30,8 @@ properties:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos990-peric0-sysreg
+              - samsung,exynos990-peric1-sysreg
               - samsung,exynosautov920-hsi2-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
@@ -93,6 +95,8 @@ allOf:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos990-peric0-sysreg
+              - samsung,exynos990-peric1-sysreg
     then:
       required:
         - clocks

-- 
2.50.1


