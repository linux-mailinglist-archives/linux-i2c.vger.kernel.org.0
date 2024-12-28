Return-Path: <linux-i2c+bounces-8785-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0929FDA18
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 12:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF2A0161ECD
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 11:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59E2155C87;
	Sat, 28 Dec 2024 11:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOuyRwUW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E432C42056;
	Sat, 28 Dec 2024 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735384521; cv=none; b=REvCJir4XkvUNXAM8OAY3mBNHcsZA/bVfxZ9aMbzzMAy8QFy/jDdEAI8LlIEYnIhIifFsCRr1eCOQZjoJJu32RLdMlR12scfXTFWYrsI7vk90fm1b2IDjWJGt1sPdg+0mxVshwjx60Z9vGMvtYJC080Y+1wbTd0JsDhxJkDeWw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735384521; c=relaxed/simple;
	bh=xToZ8vdNaDkxbEfNvnpAf3SO/cEuIvpVfQxUHOGfuBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NrjmRP6Ar+skqvy64Q5ihx3nLPGtyEISHUwprF+HmXIhCinJUyuK5qrdqkf6VARANXcgF8Y1ZoSDUknzTUAnZd5fiIZlE0nzFc0WkCBPVMItvmuXaNzb1hAIhmarWw06mfJ8EZnMiQRQVRH4x+WZYzH86OB1jn6YchCWba54zpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOuyRwUW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so83066955e9.3;
        Sat, 28 Dec 2024 03:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735384518; x=1735989318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ltav9ZVsQNw/ay9m7Rz0/zHo6gLRzWiku8aYgk9owM=;
        b=mOuyRwUWZZh5LcMpiBkeqFiZqwvoGATeBZhUwlJsOJE4kmslx6gxP/wj3IQSNLeIp8
         TEzT9oybnjn60aICzthIg7ExK8/TVBQbNwBs4zLI1OQi4IFH46GXk8zZga7KegBJiFmB
         ye6VgnxVJLGWamAe/J1YodVi1bbQ7d50RR2zBVriqM1QX7/6wuH6Aetz9OGzdtVS7rKe
         blg/JCXsKtlmDus/i/iAM04wjLsvEKXrGQ4LYUKpdC2Hyb0tOpXKnArG2oKXY9vl4H8/
         5xfn8sSFwKaWf4DhjhxhNQ9+80wKRImkhoNgxIXHjIcy05dbCvxjyjykh1aZf00MxTF1
         EHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735384518; x=1735989318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Ltav9ZVsQNw/ay9m7Rz0/zHo6gLRzWiku8aYgk9owM=;
        b=q3D5GC9e/Q7B7TP9xw0hyaP+1e728qVo0OeiBZsI7kJU7ds9AeA6J+SmwpktfdsA6R
         L0cpmBuwUzPAgx69EXSDrIt0efTWbjVLULdxI2I4GS6H3n7byXzibo0EDBxxZBsccfxc
         Jm8kW74H9Tq09jfB2MMwcA0tU+VkOZvcrWo+YCxqRecI2TiSvOLXOsAyugTEE/Xhkha1
         x/z3a7PEp96fmXoLR2jLvYu/8Yzj11FnWcBD9ndEh6lq8DY5V1TJSFV5srRzvitJe+XP
         yl5CnB/gf7gk+8Rhmn1fK+K8X9HkguT+PFLLSqS1je6NUcJ1wVv+MBN1k47f/3LP8KLy
         WGZw==
X-Forwarded-Encrypted: i=1; AJvYcCV9EpxahS4I5ToycI1HPgJrwd3138ql3nfCw1IezXUXWbfYbZxIFCu05APitI8723EiJQkn5nsMsYEvZybl@vger.kernel.org, AJvYcCVMRdfEZygl93ZeXooaWYtJJrW2ErmvilAHNAHI0x8T1hEoQTzCAb6KkdVpB2k8KRTg1mZH06h5jBEOlQCEEXe1wmo=@vger.kernel.org, AJvYcCXgRSGlDXktRRBxMwbWRyNqGb9JS5QD8CN1wQCPeEDEhiBXYOMkpnmEquRNIUraMHo94mW2t4GFxHX7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt3olci9E9qp6TbKEwcni8L5Z+/ntiiIYejvtyW+mVuFZaPPtb
	AJ/YFfdD8MOc7tuYmwCoO4a7GKf5yr4U+2FM2Qo8THuNbkuR/h2/
X-Gm-Gg: ASbGncvSVLMIIYI9wkAS2T8tdhq+OswB78Rm9EkOqkRzS+XES0iy52vobUdGr9iyH+r
	VVkwVseFz98P/FDjxUAI4nA6g9/HPu62pQw8FHGnReT+Z5PWjSykmSU8PS3qMFG6nVNdtmoVsDN
	WvaUPowQLDDuG4RP1vWYJ9hexK7Jw6ZinlaHrRPKiiZcbm7H2iX6zkvdmQL8UNCc8ccAwJJvZKC
	plEjtLqft82yZ/JojM+X2//wh4AyVzmzVJuOWNkk9y8glvdcgLehXXoENDK4zmnD2EgS1umcj4Y
	xR0yA/2g0tfj3+lmNu9ElYaMdd0LMTPu
X-Google-Smtp-Source: AGHT+IEgv+cKrUOJW8hwylWHpkHUGKX29Xg9SVZ08QhDJLZCSBrarfNiSgBAG5RqSBU1af3vUxuGnQ==
X-Received: by 2002:a05:6000:70a:b0:385:e176:4420 with SMTP id ffacd0b85a97d-38a221e2c89mr26519555f8f.10.1735384518226;
        Sat, 28 Dec 2024 03:15:18 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c25sm326226075e9.8.2024.12.28.03.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 03:15:17 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: i2c: exynos5: Add samsung,exynos8895-hsi2c compatible
Date: Sat, 28 Dec 2024 13:15:08 +0200
Message-ID: <20241228111509.896502-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241228111509.896502-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241228111509.896502-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add samsung,exynos8895-hsi2c dedicated compatible for representing
I2C of Exynos8895 SoC. Since there are I2C buses that aren't implemented
as a part of USIv1 blocks, they only require a single clock.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index cc8bba553..70cc2ee9e 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -25,6 +25,7 @@ properties:
           - samsung,exynos5250-hsi2c    # Exynos5250 and Exynos5420
           - samsung,exynos5260-hsi2c    # Exynos5260
           - samsung,exynos7-hsi2c       # Exynos7
+          - samsung,exynos8895-hsi2c
           - samsung,exynosautov9-hsi2c
       - items:
           - enum:
-- 
2.43.0


