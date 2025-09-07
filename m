Return-Path: <linux-i2c+bounces-12741-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBE3B480E6
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 00:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EBF63A5A2B
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 22:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D49F2C0265;
	Sun,  7 Sep 2025 22:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQy9x5aK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819B42BE02C;
	Sun,  7 Sep 2025 22:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757283222; cv=none; b=heuou1X3Pn80y07MFxB0te/jsDNRhkHotDdvJY8NlyKKazqqWdqiSiQRyleAa+FUUBIUyQTPySCZA/8ndjwqHFqHvN0ImuNMIHtNnCXJvruAbzhTCPBrTaKXX0k+DoFUEcGnvsDo2IRl+8YJY4zDhsU0SitkZIDmIdmS5GAZkuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757283222; c=relaxed/simple;
	bh=sk6UDVI+7Kd9lIW0AsYOL2i9ElBbm6Hbh+uzwTLnIrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X+nsKJtRnxfRqB2UUlFXd8UNKXIm25nuppuV7Ekl8J569P1XCq2fyZddpOv3H6GGQcuKbO819KENdTUq1W1+tQNa1ybtHxYl8YY2dzeHvbQzT30bKmTtsjH6R4w9a6jpT2tBBI0jvP98BEe2+en5TzA4ReljUbCtpS8V9wUL9Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQy9x5aK; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-812bc4ff723so174077385a.0;
        Sun, 07 Sep 2025 15:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757283219; x=1757888019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8MNTCcCI05lKy8GxRsjPvBNkyGZcGYhXm3EBNYA8RY=;
        b=eQy9x5aKj2gEyyXgVT7EJTYEtETF/9Pa4LWnM75ZE8oCSgU0MovUe500dELE8yvWbf
         5qY9+NLJoK15TrqRIqAA/YuH6apnq7732g/BJakUeqALVfETCaRea3sszd+TcMHGNJYf
         IQaH0iuGsSqRlIgsvKCj6o17D6UGp7tuqmOyx8e1nukz3wVeDFb3zBe3eWN1MDjoP7aK
         5cNp6m8ym7KIA/u6Cp62xq8pBEzRse+aojKppnorjdgvyHWsoWv9zsz4V9soJXwYcDnA
         esWlKO+KcPV6yhMNiA3+V5Gimekco3ZtbN9AOId6667zuIz3kGWHP8alnQl/NAfq/5uA
         Qicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757283219; x=1757888019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8MNTCcCI05lKy8GxRsjPvBNkyGZcGYhXm3EBNYA8RY=;
        b=QoWd+blKNKjznQtCuOtecsNjyjIbFyiGdeJjC0gDg8pkwt0r9RcbKnqHMcywLC4KXz
         vNkA67BeB+SwUYnwtoV6gxicXcHedfRcDPsl9IMXsx8CFigLw40h8O2ipXSspBZHIaId
         DtFe8ezNo8H8uZFGLjAIxmdYheKR/M92O7C9K58GJfNvxllRPbsJu6+7EimqcQDN/wkI
         Bo+B8KbMiYER9Pegxvn9dle3dx00odSlklvSg/8TuSQT2qSE21jCPHUC47rqAh6iHER9
         TA2iUZZS3ylshUvGvzoW212Ip/+/Fe+LsscwklogfW0XzocP1DphkfvGVZoHYiyo209h
         N0fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzBMZa6tIK8ShwpXiI8VFepoqQwqL7YGeByoG7y7geJbBY1Y2a4tAFgTNNc3qZqgCeyfQKn/p76Uiw9zLM@vger.kernel.org, AJvYcCWHxqaD/w/IAaAn/MTfzdm3nu188bnE+amPPTOTi81Yr7XLXyaCwb0t7UzduSson6uPdjKOonHeoRipaqSxu6YKS/w=@vger.kernel.org, AJvYcCWRWqfGMh2B8emoRXJ92j6uy3bXdmK1anvaRYxEVQYywYe+MPfVw82BoPkBrIlP1e6XbTEb6O18VpM=@vger.kernel.org, AJvYcCWlq9h60u84yckNBN8gXnScM+7iEorfdPk2OEQX02+2Q8gT7ZoK3Wt02iMgC8wDEz6aKx7ZjAOwEvytV0WD@vger.kernel.org
X-Gm-Message-State: AOJu0YxR6VWcTxIRQ4c7O+kvzuFZrmTXTeZ6sAsJP4GBRkj9D3A8kyI2
	y214pF7tPo2/BSmD/O0a07fF0WvjMd01XQb35X1gbhxeMGyMnXV1/eVJ
X-Gm-Gg: ASbGnctQ2Td3L6Z7il9Fp4oTl3tm/Zco+zPJXd6sH3c8RNOCvQ5sqOrXKYjA48SmWzP
	G4gMAHrg4+FnQFDrHpLLZ6bVkmbK4I/n98b1jDWUDURycvNYJ0XQKdFd6uqnlgwlcm3eVXCBwHT
	wjLPP4YJq8pi/q+cw5jl1r6+LI+ttJdnMSULFic4y7xJIaeEaeT6s0WcX2BpghGS9/Xz864g5N1
	f98r1kqqXDbp+A7ODQkFbkUnGw0yNVqNMA16ixnoPgqTMEny3u45ovXJXBDb9WAcZZhi7qEoaBW
	Ak7fghfyWGM6RLCcasfCIKNYveknhFANiVK06uPV+sIjETd8bHqG44hdzO/DYVOLS7s+Yiu8UPy
	KECl8MMXf9/igIg0S4+n/W2iLbRViFUo=
X-Google-Smtp-Source: AGHT+IE1KnGgUGzQYayOeIn4igAJi5V7ifutA8i7Ug7tvLbQKmSmOMB8AAgMDWHe2LgEYdprzhWsSw==
X-Received: by 2002:a05:620a:19a5:b0:80c:a9c2:d0c6 with SMTP id af79cd13be357-813c443d872mr625273585a.84.1757283219289;
        Sun, 07 Sep 2025 15:13:39 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa6e4914csm930935285a.16.2025.09.07.15.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 15:13:39 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 22:13:38 +0000
Subject: [PATCH v2 7/8] dt-bindings: i2c: exynos5: Add exynos990-hsi2c
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v2-7-58f41796d2d3@gmail.com>
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
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757283213; l=1022;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=sk6UDVI+7Kd9lIW0AsYOL2i9ElBbm6Hbh+uzwTLnIrc=;
 b=EmbaVCXec4bAF0b/8PD/Sq7A5JYr7QLAANw8SjOX/Kn7rt/+FRwpa3laOL3Rb5Cp4MSbVbvVm
 1gZim+s6BbQCKQbVwxlN/0+hnLngcttPGSx4MdO5KONdSvLlAPM+6Ak
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add samsung,exynos990-hsi2c dedicated compatible for
representing I2C of Exynos990 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 7ae8c7b1d0067e7e7a73a58e8bcb4aac71e87dd8..6fc03281a8f8440ba64df569f6c83ba2d9f6915e 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -38,6 +38,7 @@ properties:
               - google,gs101-hsi2c
               - samsung,exynos2200-hsi2c
               - samsung,exynos850-hsi2c
+              - samsung,exynos990-hsi2c
           - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
         deprecated: true

-- 
2.50.1


