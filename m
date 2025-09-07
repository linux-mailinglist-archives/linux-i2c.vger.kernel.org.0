Return-Path: <linux-i2c+bounces-12730-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96286B4805F
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 23:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46A4A3AD077
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 21:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440E92BDC14;
	Sun,  7 Sep 2025 21:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvguxeWd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629BB29BDAD;
	Sun,  7 Sep 2025 21:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757280859; cv=none; b=lDHZnCOxy1G6nWHzAW6dkb7x/9h2OS46ch5rs7Ih5U5KNXrySqKyV6/yXSIbHWVqswPmCG9CE1nH5GAkKzWbRm2HBXWYq2Ukris/s5nbB2OErakvqIZ5dFkJgGaPTvSdyeliPgv7o70O3WkLSq3M1zKg+xiQgO5hoECFmJQRdUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757280859; c=relaxed/simple;
	bh=hh+9fhqz1kD1dKfMIXYK4xNk4jet9TVO/6QTyzg1yh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sZLErvfeQ2vCLzQaAzrSAaTHmdkrl9GrWPgnhtIU96IGTh7dwAhyyUmFOHuM9gRRy+zIKnvepO3PBsk+94TKLibawHwhM8AZT9Oqf63/S2Zf8dG4EjPzaYJ8MDNeqi8su+Xih6H+4IKOhPFTPeAn0J3kRVj1n9yNl5rMBm/GeKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvguxeWd; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-7211b09f639so43610706d6.3;
        Sun, 07 Sep 2025 14:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757280855; x=1757885655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqeQrJ185DBlW+wE5YbZzv/0chMQu7VeHkRXHAPzOgQ=;
        b=PvguxeWdxlJTjK2W+S8pbVrKpH6CJjYu2dJ4Az9kCgOnAOr801mxIJmkj9Yl8ciz73
         tZt5CL4pNTT5ObKndbQEbyTmDqzc/JHa7Oh46zWsIoimVwc35W1tDqyy0wo1j9VTm5QV
         ozp26ZgrSuPJKjSJh1FL82KX4eBtgEIxL1cbel/CKwV1zvzrdqr34XV9Y8uanmmIRnlZ
         eNom74a/tv4a6XRLTPMDBkjATTJHX2/j7ectdRfFqdnM3dQVQj2IQmFf/D50eymj+0oJ
         uL1jNTXf/2wFs0mwZ669jRixepxVe5Vi/xh1MBNU2iObUS0BR3HHtlryfuZbC1m0WNX0
         3inA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757280855; x=1757885655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqeQrJ185DBlW+wE5YbZzv/0chMQu7VeHkRXHAPzOgQ=;
        b=nTRUWbWiTY/3vJCXCgQIMjeBJ7fdP29ac2qYpERZzn4+2NpNMIGP6wlh0H1ozTYYW8
         U8vi2lRjaS3YoaXXpVSNy2P6fIvKl9e7+OMeXcdZdZlDiYCrxaWixI7GCPA5+NobJJDt
         b4guqujk8SFsFwEp/GCpPvOSF5zA0e1XjvNCOMYWA2oMW7LXLnMYSSuOUAyFSdQTy7K4
         HQc8GzZjYcNpDF2qYek5k30meFkDzRdfb4mPGITh4Xudvh0TCcMZmGMwlypOu8QKEATJ
         0a1CXbOG7LiRcktsN3fw+dEDjbo/PSJjUNiUOuOiFOZr5yYjhFiXjAr/efn8Ix+3prFb
         mfRw==
X-Forwarded-Encrypted: i=1; AJvYcCV33q2WxrHGlS3zNgZhwXaLzKN9BNmhVax+MHOAnhxNt3ZJ4xM1otMoptg6fS/j2lcO9qG97yTdWubqgty96K2sUV8=@vger.kernel.org, AJvYcCVjghta10WZ7cmZdbsCG71sitdAmqCckPgGPIyYXC0PJpw0+RePtQwdXUvFDzY/7BSQF15nhfuM3/K7HJio@vger.kernel.org, AJvYcCXIJLliFCJN4fuseBPKypa7SLKfvOpqtlIHl7EVm77cVZV163GO5ww/ymbfEXk0byYfUtSRaAqKfWs=@vger.kernel.org, AJvYcCXgvVbD5Z5JeMX3bZX4flxd7bv2naNKQeRiyrJ5qpSdAH22l2WILMvh1uHnLvMOsao6LHWT1aFT9r1Pn4i7@vger.kernel.org
X-Gm-Message-State: AOJu0YzAQCMaof6zCYk9k73lpbTEHPJt2630m5mtMo6MptvaaBcgWVqL
	qYoLe0agGj2q2AwapZCi/LcsKinvjg5WpMcJPcbm4vPMXVhf4hfvuok0syx5eZ+Y
X-Gm-Gg: ASbGncsKz7JuwOIGKuuGRdXOseQ0VkRb393WWumwnq7m2TCknnvrFqIWD0EUkDcicME
	/wF9PXNJ8Y7m1aR6qEx+30fpvBtoRlcinSEvplaplvIhBKh7pDHx223s4X5ZapzIl1wKh2JAsu8
	29o2a4Xo+NyyMVQ4Sg4mMXtSpNIz/cF5LAhst4tfy2MB0cKcI/jcF/abVPF0JRLDpL8h0yjqDws
	FOtFftGd7Ma+yo3sZFTnuOWqC2Iur3adrSYpzV3SSOpW1TcG+4ltS0cyPgw1YL3jTOJzj+qr1YK
	WBuMY7LvL7k6fEiUFUicq0HZiCED7vCFkUJZ+7ucEI7UDSuYLLjr4bK8f9/07SL/oWjpL+I20uh
	E/uXQ8vlo4EsFerJWPV4wibI9NlIUSMQ=
X-Google-Smtp-Source: AGHT+IHXklgWFXby/bp65BLyGVcDZtpXh+u/zMKhn6dIPnXSmK7pvBMv9FBiAh8gjVD9MgRLg8Eohw==
X-Received: by 2002:ad4:5e8e:0:b0:70d:bcbe:4e87 with SMTP id 6a1803df08f44-7391f30407fmr72791436d6.8.1757280854878;
        Sun, 07 Sep 2025 14:34:14 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b46660e5sm108637486d6.45.2025.09.07.14.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 14:34:14 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 21:34:01 +0000
Subject: [PATCH 5/8] dt-bindings: serial: samsung: Add Exynos990 UART
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v1-5-ae7600491a7f@gmail.com>
References: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
In-Reply-To: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757280850; l=829;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=hh+9fhqz1kD1dKfMIXYK4xNk4jet9TVO/6QTyzg1yh4=;
 b=1Kf8VB5nTLeupBLJfZNM0bhOTvUL+qq2/AmUVU/5EIihFYKCrUKKPoF/PlIxZPJVM5PtoFrzF
 1O8gkd8Oj6sBHzp7Dnm9TJoDgQB/zuBOuwb7Qko+1MBu8m4XvHXlQWZ
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add samsung,exynos990-uart compatible string to the Samsung UART bindings.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 1a1f991d536491007c7a87b24a6efd4ec3bc0ec7..369eaa9054908f7e1b63bba2e83be612d22f0718 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -49,6 +49,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos7870-uart
+              - samsung,exynos990-uart
           - const: samsung,exynos8895-uart
 
   reg:

-- 
2.50.1


