Return-Path: <linux-i2c+bounces-12737-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A10C6B480D4
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 00:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68F237A3951
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 22:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4252929E0EE;
	Sun,  7 Sep 2025 22:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0UA4vvh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC9029293D;
	Sun,  7 Sep 2025 22:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757283219; cv=none; b=RgPq1oCIqOjW5tgwEgqT2/5Kz9QvWJ5qPEwoRDBNACeRP21KFrefZyzsAE4xQbIHte2SlyMoeqqVs4WqZo9eMspKK3eB6RdhXITFzb6qsMoYP36K+BVJqe7yYVCpo0wQUEJh/wpjAQIhOHj2rom6Ax0YHGufNysdMQFb+PWY9JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757283219; c=relaxed/simple;
	bh=r2bRl4B4OF/qKIhdCBGgWHHiscJkRg/BHw+S8XdcwM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MRBZtnv9SCxgR6/s5JAyoW9VOK2rD8LkAvPhGhi/AwaD+5WOJJ1xzZVxciqdSuk/t71Q+sOZj7AM8fprk0slRmPEcuCpAP5IrXiFL/q+KLpktGFYWa5LWy86PM/IKdSpHPAigza0WVwEnqgBQKJAqpoELH/h/6OHchrURIjcADo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0UA4vvh; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4b61161dd37so69441cf.3;
        Sun, 07 Sep 2025 15:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757283216; x=1757888016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLjc6vgKJXwelgY/kFV/7fD4NVClmcvjL7QnlQQl+JY=;
        b=A0UA4vvhgpOmwejjLs/ZIaapyzvETK7yt2muAMkA+iJ7i9tV256cno1eqmSSd6y9KW
         Md/XLVfM0u0rW1sMOg0adHiYxHYmeL5xwDkNBD1H4vVzTnro30tR9Fzvv79nv5IMleF7
         gRmXZes1K++grxEgXXd5gTdf7fyQOjiF4lEQDKiY1PJ00lrV99TLJOXVG3IXuIah+4bC
         /peg5QuNpcXCRyEifyMHb8NxvazrMEXkm/z7U2pd9T3WELFPwfwXn6TiIz5BttFnXyXl
         sIVYtX56G5GxoFaANj4brLkCsH92pY7zbcbHtXcvm/u2nMTqTG6/pngxGE1nYuH0dQ5s
         ddUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757283216; x=1757888016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLjc6vgKJXwelgY/kFV/7fD4NVClmcvjL7QnlQQl+JY=;
        b=VYlrK0Bz61nbdGf4VSLSXmJa4V6fUqN2b972vCDuZtUXzWctrDSdwltOcYYshRYs/U
         jq7ZEAINqRwIRnJG+wamSkBi1i6auYa2q7voz30IOXYYRQXWBVqN3hr8sXPcHnPSQQRO
         RHRCB7EG05KcIy7ixOY+IL/xzsoDbYjclehFpZUwrJ5pHopUT50tco148OICZR8zK/Ha
         db988/PTKbYyTioR8Yb4eQ6REwNiffVU/K/nBNnsWMFxcSjwsF+VfMlhSf1zkTBf09nD
         58vk0KMDD1cKS2dJHI1poyjPs/CPUuZ1atwWydLK0IHTBzAPlgoPGpA+Sb8xClhdoDbB
         VHIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc96EJ8hLPV51caxQ29i4yhaOtpOKar3/o0VcxPdRmXiMM+v/dk/qoU4TsdjQUWuxnVxDOanOu91R45nwR@vger.kernel.org, AJvYcCWawI9a2fmFyEWuGPBQoHGjpDH46AsxA/FO24GsA9v3klt8L/+r5Mq+p0BF5uQmpAAO4QdDN3MBKTQ=@vger.kernel.org, AJvYcCXTXaCO8RyOdJwanox1Yi+fP2xjoVXmTBAyntqfuR83uBLKk0MwRk9e/YyZqBNe4rCnZD54ugMFISk/H3Fg4l/jo74=@vger.kernel.org, AJvYcCXiwHZaLRXeSaS8oDAXFIZxGXlmoamd6RtIAcaMbSoCVQO73vC5r2rvHUiYEbZL6Tn4fHfkrtUrToLZpspX@vger.kernel.org
X-Gm-Message-State: AOJu0YwwZMQGjorjf2/VYJUxkz+ShgHa3BpmA7qDGooyO/8ZOI3we32H
	/uM/0WBNrXdTCkf1IDqf4Yi2Q7blz1fZRC50ZuAhh8Y3PdTpDyrsnMjw
X-Gm-Gg: ASbGncuaexk0tJXX3DlJ9cuZ/OgQbUGzqz8htliWqIt20XS7wf0T8PaxF1wSCVG7KKv
	9PZEctbwb5Hhd6GWkHywadpzvJmqgvS1sMwE2ucdnbL2dI0Y7nOdkGf+et8h7RtH8ZzaTg7upr2
	mgbfK1m5XOT4ZsbdswDff3vuUXS90y7mwNs7DXPOWPKxml67h7I46WVLQui1ruvzLK1/2quSv4U
	IJua6Cgkak+mZzsEkQujm3qj0Fc6ulC1WJ/35i6Mp6HuEM08DHAhdCKhTQj0fMNqzNNjoi85uKN
	jq4FTpJCVV53H7sIalfVod1gnRq3dXanihl2dINcwrEZbGebXqMPjzzrQVhKSHb2KpkMwWrp6rC
	l1uiqFS1yyQZgYYVn659c/to51Av0ZVMhVqEwSlQ1Tg==
X-Google-Smtp-Source: AGHT+IGRmaKRtSfKfKpuR9f06lJAqo/i+CtuomFjPSttzNv9cDCiAGEffYRZ42ZrysUr7h4RmeZBNQ==
X-Received: by 2002:ac8:5d4c:0:b0:4b3:4c51:642e with SMTP id d75a77b69052e-4b5f834ce6emr59720921cf.3.1757283216310;
        Sun, 07 Sep 2025 15:13:36 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa6e4914csm930935285a.16.2025.09.07.15.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 15:13:35 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 22:13:34 +0000
Subject: [PATCH v2 3/8] dt-bindings: soc: samsung: Add Exynos990 USI
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v2-3-58f41796d2d3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757283213; l=951;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=r2bRl4B4OF/qKIhdCBGgWHHiscJkRg/BHw+S8XdcwM0=;
 b=nH7LIMsuL+aarJrc1MqmQ0st3ivx8IadsZQGo7cUUUeZShshaLongk9s2eGBpGlfdZl8aoJJi
 sNuzoJNULipAM1Jrif/IvgHxTklPYWEamF5r1tQJh6jJcQ3L7nvA9No
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add samsung,exynos990-usi compatible string to the
Universal Serial Interface (USI) bindings.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index c694926e56ef991965153b94d704fd53addb5cbe..4a719cea81f9d3c3b5296ba2d45b05dd014a1d9d 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -39,6 +39,7 @@ properties:
               - samsung,exynos2200-usi
               - samsung,exynosautov9-usi
               - samsung,exynosautov920-usi
+              - samsung,exynos990-usi
           - const: samsung,exynos850-usi
       - enum:
           - samsung,exynos850-usi

-- 
2.50.1


