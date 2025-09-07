Return-Path: <linux-i2c+bounces-12739-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92195B480DD
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 00:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CA1F17F902
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 22:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01862BE653;
	Sun,  7 Sep 2025 22:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4kFqvaj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFE029D276;
	Sun,  7 Sep 2025 22:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757283220; cv=none; b=R+9rTtIBbv8Xd1+YyyH9VWvmG6wuY2dshG/iI1d6b+rTfoKphOTa6n4NOosbkf/VJG/8S49L9ZEjhcGtNjdjBY9r7v+xUkbv84trJ361Pn7AWVD9aNznM63WMbsI+tBiZyaJYZdAZAJHSENkQ8xr9qxixJkYpRbjHK0w8oyAMnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757283220; c=relaxed/simple;
	bh=hh+9fhqz1kD1dKfMIXYK4xNk4jet9TVO/6QTyzg1yh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ePQOz2OwrjE/vrcOilvuYgzkhgGIglk3svF8DEZKoPPb/e6aSeXMe04IswjG4UBbM4oYPmDPvEugPNqBEDPFjC90qiGJ1oe848gUrIRW37jrMdsPQpNLcciUirsRxHDEAPlrE0Ti42iVaKSHjZ/hvlLlk6i1WnVBn6NJKIWNN9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4kFqvaj; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b6004da52bso9776641cf.0;
        Sun, 07 Sep 2025 15:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757283218; x=1757888018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqeQrJ185DBlW+wE5YbZzv/0chMQu7VeHkRXHAPzOgQ=;
        b=N4kFqvajj9uf3O0Ct4yXPMTl1LU7oL4tMCgUa17Y7re+YYh/DgoeaYNyizqqkMoiNA
         fwikAc9vUleHlLkn5mGLvvekrq76xf97RPAxAoQzTrKpj8wcR7TeW4SMxw95ggogc4D+
         ycqVeheBH5qtI9tTtK1iaRv2f7YcQoa0OSGFpQ7OE8IybNXyj/vxS/KRgXxnNkxRyWxf
         eFL044zNpk+vcq3IOuf6TCnF9/klpQe6HULlRMRG3vwk3VW8zOknFM5DtAdVFPwaqHJS
         BtYANKOhY/vq022zZ2g43dYN5dvZvCUi3+hMVW+aRFtEC7oZSzN43JZ2x0AhZ5/Dntre
         pO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757283218; x=1757888018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqeQrJ185DBlW+wE5YbZzv/0chMQu7VeHkRXHAPzOgQ=;
        b=o2EfzHGqXdWidR5SkHwbgII0EmJ1U6CVGS65f+bCa9X6Tv9BC23WeKLSMPv3bqh/w2
         jU15aKubSk7J6YYcXFfwBeh+oKCDvOXTrpJpKw37yGgsY9FCz6Bw5Pczmqny7ZFhx76Q
         NH8+bSO+BEtQvmTULR2meDy1RRbLR3Uma27bA5jxXKNC9rTe+0yfvR15lhlNyNqgC5jP
         duvGVO37Wtx0s2kF8Mu+0p1Dhuqv2XlndIiUNSgeEG8vlNhDvuWg4GGpyjs3OoEV3+w4
         U7mYweBcUljRO0bbOQMBbH9GATBuBiuwBQ2awPMhgq0eltKGdOIiMjaFzLzhhabIKxDK
         GzdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaeXjEbAD6v2yswkMy/zpWYj9xWUL3lZNa42M3TfVKVous0R8Ls0RbZZep5tiRDTkvPLULUbj8pwefKBiH@vger.kernel.org, AJvYcCVg6Lj43iFeWf7OdO7x0PA+Kd36JYG422heCVfdRbcOyL1BBdoByf2rkgF/PTpLlhcWqtzLVY/toubthMvVHruONDU=@vger.kernel.org, AJvYcCWtKXn9Ck1p/lnr4izb1f4MGFgoraKvz5GppSkd0F90ytc8FSx3T/DXMMYvloHOUVnLOQmjtacAieoYWs+5@vger.kernel.org, AJvYcCXydvpMTdUGl53iSdPyxN93lerKbDb0xDT1R2yc3EPZzBgKJEivOwbWnVNg1Wo+nj1wKdzDO3hl9PI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP8htxw2vbkfVDjLNTXUIdEmu3TXvH8CBKj3PBkQMhJxzVZ3Pe
	/xyKy+md+9X+8NJ77DkZt/m8WVTOCyIDknn4a8G3mWHtxLSBDszJGvvu
X-Gm-Gg: ASbGnctDzDsCW4c/7bZqEOWoToWNyLpbEplsB6jS66ZO/QWzSix+aUAb6kqtEy4XTLu
	Qk8uObEfd6heM1U98z5pGZAlHrbWog3lZ9lO4IhqOhx+7zzW2wtaotsx0FHpV4Pm5L8/1h0yei5
	KlCtXIijE3w175kEnKB08RoMWXNBLZ8VFwBYxEdzJETN9c3wml/R8VLJabIztJNg0kXPtunyDZv
	C/Hk2AA4/H9YhHDm+Z/E9+bRoN9wMdtUUlihdu3brlowOCFcvkjUn8/DgvWmbLEFVIEnjaj16ot
	nwQw/ij0o9q33O2QlWnNTYOq1WbMMJMkANrU9xX9NE6WvYAU4p5F1MWVJ6LemV+VTBECe7y18y3
	msoih7NDYCYhR84VB6bnCwGVplEWQgj8=
X-Google-Smtp-Source: AGHT+IGZaBH4TwcPqZtnw82BMwVdYyuU2qWLCQACmyOWTpIF+b25kmP9e4ZbPYHeEXievv97JTeJDA==
X-Received: by 2002:a05:622a:4106:b0:4b2:fdda:f7be with SMTP id d75a77b69052e-4b5f8448a5emr51473771cf.3.1757283217877;
        Sun, 07 Sep 2025 15:13:37 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa6e4914csm930935285a.16.2025.09.07.15.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 15:13:37 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 22:13:36 +0000
Subject: [PATCH v2 5/8] dt-bindings: serial: samsung: Add Exynos990 UART
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v2-5-58f41796d2d3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757283213; l=829;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=hh+9fhqz1kD1dKfMIXYK4xNk4jet9TVO/6QTyzg1yh4=;
 b=66Ak9qnbiUmCDBf7LbfLilcqOdTExwdXAPkCin9xNY7bmRoXIxXnM00VaPZBvbcKbZjmQgK8U
 ph8Ir8hdIwmCo1XNNBe70qWyt3hGa6jp9C6PyNt/DTkX8gALhcNygB7
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


