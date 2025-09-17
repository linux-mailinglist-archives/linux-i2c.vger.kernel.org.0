Return-Path: <linux-i2c+bounces-13034-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD70B81DF2
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 23:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E67273BD46D
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 21:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51482F6186;
	Wed, 17 Sep 2025 21:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bsc8cXkh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88AE2F0C61
	for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 21:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758143070; cv=none; b=d1OxyQWhXSZLpnLY2X93tAY54wLLGMki499SKPWtRsQ4Ob1w5Q+zOO1hpOMdjA6zPYN+q4VOGHSkKFT1Fw4MtjQa6KLiIVTNv//yhyCjsYJoqSLrwTIQuF/ewHxaCVj5plOes1hoGe6XOqWuvgUTiYxg3ALmWWmPfu76QgHZ49Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758143070; c=relaxed/simple;
	bh=7/q7KnmwWMN+hTZMk53R59gQ8vuRN9Xg0o9/pqcgARc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bNo/ZOlLQcTvJ7CztXCjcVLPAsAIF5Zt9/TJKWk2MHU1A5UdpDWFIvUv/82i2DrzMrDoc039OHJ0LjF8mJnJY47pqcP8OeLusu8HSonStbHXgOLbeAxObr1sKP61LAVXvsj3cv6r1hlEZaMJwhgMquEjVFDer9MF9YRujD667Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bsc8cXkh; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-7240eb21ccaso12544656d6.0
        for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 14:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758143068; x=1758747868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0t+vzUv4eEyq+7X9KCxZxjlUuJ4kfiiop5UEdAli8J0=;
        b=Bsc8cXkhS5VP7kLhiIooXz2q+HLVCLIeLtuK5NhUBCtq9n2QTe7pLDxcrKeqOszsF0
         qz9ur0zMx3NrFai1nLAvbCbfTEcjYHsQgS6Y9OQDxgkh+d6CwUXn/rQw3uBjvANhrIfz
         wM9ZeXAGhLa2RHf0ZkwEoeoVOa1uTLquMzTpZ+4PcdcmTIEwx7t0eTjZQuroxyJ1OFif
         YZLZQ1ztKKfscr4J0GwgVHtYr2bGP+tx0ZYrzAqJWDr4N+mxC1TTTokWmHBBu8+4VfWU
         GiwJH7KAT3IXpEpZbNMHlAA2jOImExueJ+PwAw/AvAuR3uo64imXDE9I7tDQQt/uQ0n6
         W/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758143068; x=1758747868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0t+vzUv4eEyq+7X9KCxZxjlUuJ4kfiiop5UEdAli8J0=;
        b=bMulWPlgSpJ3Vv70s914VMmV/T0JVLPTIZ8prq91uJAFgfusyWPeIg+Crc/AyTipy3
         90HnPiEvkv3Wwm6aGz8C4yRA8twHWM7N3APrAi0qQgKdNxTEMJefMURkmclLClYNPj/S
         2B6ciSXW0xVHEImahLtAy4zkn0FH0IYDbTaIBmJ807t9BlF/Js0g4X+WeBrwSDxXMbtd
         PGjfk7V5JHPtvbNkdAkf+PjissMT5CMo4Y38LkAlCoHPE2+iTAw0Qnb8xwZvYAfVka9o
         N34OjZOz/KEdK6Sv8H/sHG0gfGFRiEy0jyWtG0K2R+pei59EQdtB5nxypP93goNMpqfq
         x2+w==
X-Forwarded-Encrypted: i=1; AJvYcCVKLk7TNlGTr9mCcWpnH0arsKm3NgEWYtl3QMX24R+sagkWDQqP+lkDjJC7fqhkTUJfu8+uaUXnVLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp98gJ0zczKXCrcUFc0y/tadOmjT3M7E4UmvOUmY7f3vwIwJFP
	7L3TaemuJYjUxfdBSc13+bP7lTbZTKhWDwggnUn1eU9Ko2UaARAprm5O
X-Gm-Gg: ASbGncvAqZ1zrsPKwunLxhS+XhyuhAAZjRxq5FaieSEexkTvhxIeBiKZMFPsp354uVo
	DYKYDmhSQHqXEvHrIOpjVW7M0eEjWqZYqoCaDJ2mztXghVKQm0SLxpSLJrpMejPGSivoV8bSktq
	neexM/vloJNY+pt8D5jFl5OlLP8jrzFrmGyEIgQr/WowPDVbulbHQaelFtJyCDMbWeNGdmPMpOi
	RkT79fuRw+COgTKzhWBJF6LTq3IYpN3OM3ulp0+XT9wK9phKIsdKtrQkMkiNeT81W0cCka+Ro7V
	EnM4zEAlZLdX1zPCd5MtgKJqVFQ+hixHzXtX9rKH8a0UJNenJ5W/dp1UDnEU2zLHEH6/S3Hbp9Q
	LCbd0wnBOmuzYh7Q0TKKpWw7zQmg8FcNYmL4TTZ+IlAS6
X-Google-Smtp-Source: AGHT+IHJJ7FxhXppLqJ5pbKIB4bHEdrdsbUH4s0x4UPdSktVG1rpEIlRtsQvoMJIpZSNXgt5/AVhTQ==
X-Received: by 2002:a05:6214:1943:b0:78d:592d:fd03 with SMTP id 6a1803df08f44-7926a5f662fmr12311516d6.25.1758143067540;
        Wed, 17 Sep 2025 14:04:27 -0700 (PDT)
Received: from [127.0.0.1] ([51.8.152.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793543ffae5sm1897226d6.53.2025.09.17.14.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 14:04:27 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Wed, 17 Sep 2025 21:04:25 +0000
Subject: [PATCH v3 5/7] dt-bindings: serial: samsung: Add Exynos990 UART
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-perics-add-usinodes-v3-5-a3629e4666ef@gmail.com>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
In-Reply-To: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758143062; l=896;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=7/q7KnmwWMN+hTZMk53R59gQ8vuRN9Xg0o9/pqcgARc=;
 b=zSJtklfi96dJ/A6QI2dd3ZrhnFeXwIcQhVDiDgn5BvYrAU8yIcIQ2Q9o4HXUTv5q1HGhchwqS
 BMrhT322R83D2qom3YkcUayxCcLHizrCd+0DeW7F4War6bIhHDCxbDq
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add samsung,exynos990-uart compatible string to the Samsung UART bindings.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


