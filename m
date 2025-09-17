Return-Path: <linux-i2c+bounces-13033-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D504DB81DED
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 23:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1E2C7B1FCA
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 21:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25632F3C1A;
	Wed, 17 Sep 2025 21:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9RZO4/0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6042DA75C
	for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 21:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758143069; cv=none; b=Z49TEn4KmrE6uGBpFXW8VI+fLLNegCrGPyhclUT6t39KVoxGazzexKPHPGMY2LIQPNZjg9fgkCCux7eJU7LhSGY6xgdUdQvH65zS8B5bRWDpz1GMc5X5vn/4JIokL9HXnx+gJk/EVAi2TrjVoDrgTNmqOrzb1ziqhKm6AVN0s6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758143069; c=relaxed/simple;
	bh=r2bRl4B4OF/qKIhdCBGgWHHiscJkRg/BHw+S8XdcwM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YD/fxSIQaOAKJ28YCxY4AQ3hvFICXZNz+Z3IXDvJxQnj2UAJA0vmtmVrLMazZ107VA4npTuqSa3Z9IypVqe3gfZbpYG4U3S8RUDXDQ2pOmsggT5hcivyqt7aL/inp1PBTexTqCm0emtEkAJuc7nRH5S3CWyf01iFQinZPo64PmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9RZO4/0; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-78de32583fbso1554386d6.1
        for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 14:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758143066; x=1758747866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLjc6vgKJXwelgY/kFV/7fD4NVClmcvjL7QnlQQl+JY=;
        b=W9RZO4/0DliJmALonxeiq538anDPYMHS1SiGkE3jmI4AyzaAepJ8CKZIWDuOVs9ejf
         ZDTPCjqz2+9MBOnBiJra4IE6iHa/0s0QVbJEC7AUhyNpWVGRhtbKWACq8TLHHQAQLHZo
         NVWp7LOSI2ozZM8vJ8jX7yumSDuTtlH6W1g0F4Xrbus3YqDC8P5KGdoCU0zhRuWs7Yks
         N8z+EmAM30gPJQOp1xs9wyRxCDd+lbBrTfVCOBb4qyMgjtu5PYX4H4bU/CRjMmWEGRQH
         YJq1uhkvtCRW2qGMKGA2GW5Z8PXu0tCVNcOgVaxE5k49PFc817+Ow6qREx8y2nJ13Kmr
         Iriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758143066; x=1758747866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLjc6vgKJXwelgY/kFV/7fD4NVClmcvjL7QnlQQl+JY=;
        b=q5sAqRBxxo1pbTN8g4wAJft4UQ1bCoPnDyjm5Qdd7C4d2Zoj11KZPVWb+9rI7W8FoJ
         unSD7KjwkJTH4tk2XjUUJAT0/P51j8xCqARjtzXel73qQLyvXRA+ckBOL9hNkBbsKRIf
         wVK1Mv9GiSMg1FzR79mlsgF6WH174qQ7dbsxhCN0RYtPFfxy3ljnDTS1NcEdtFckdXO2
         7NqjTuC0CRDJq3djGkql8dy8Pbg5BhSSwhIgg2+ereyh8HJKhBdF4w5wIwfd+MS8Aszm
         PBTYGG0eIkBvGg8HD74KKwxmsYoMpDsQhFOk9PSe24ZzjLWcTRJs6O5Kfq2l3aDlPUk/
         1owA==
X-Forwarded-Encrypted: i=1; AJvYcCUj19wZf8jiEazYegQbdazIvSVs66Y0VJ+MQYi62GVBvYwbaxbucaK5EmfIL6i45TuVYKS6Kc6kMHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzJ/i/K2TaqqKxYC6LhCLFqlPm8J4Ah2TgqC3e36sgYXuj2ryW
	hCFi29JhKwGN9BZnbOHcIdUvebXEDnoxF92XmZHflA6UzOV9aufLMtUh
X-Gm-Gg: ASbGncuhTMQs6BO482FfuzknVnxJiLfjvx5cvwPk7R+zMARx27C7NCle5AuKsaA7568
	SrXgrSdISHjB+ZTCBgZbCqLGvANr+UiJXKCtavoVPzxArQ76tmTVeM+wRUdav8By3kGSHhbYJml
	iwvskyfggl7wdaqznxqAf60ttXbh7y+2Meq2bQOsUSyVzpe4PWiQ8w/sr03Sl3jPiECEG/f+Dtc
	Ilpf0yt7AUTAOagmCExoLh756UFm6CW2nvQbokQyxQ2hsJAiUYZqCMsE9kUZmwvbTHMmrMzXsFy
	fKQN08XBAr1Tu0cQo28wTibj1LMoR6te1BS+TOuHEcJ7PLCUtjowmMRuvYHcPZeWB1j2JfZ+CG8
	w17bA7eJnHew4o3K1PuDts/UIspuB1HeSKcIv1eZLSu2G0t2Sn8/hpFU=
X-Google-Smtp-Source: AGHT+IFrkfpjfpj4V1IzxwzgKJOiCNq9/t9HIBwNE2UrLVBPq1G0Uq+ssai2vuM9RqyWADLBL3pR8A==
X-Received: by 2002:a05:6214:f6d:b0:76e:7c27:f040 with SMTP id 6a1803df08f44-78ecf20bc3cmr46716026d6.54.1758143065909;
        Wed, 17 Sep 2025 14:04:25 -0700 (PDT)
Received: from [127.0.0.1] ([51.8.152.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793543ffae5sm1897226d6.53.2025.09.17.14.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 14:04:25 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Wed, 17 Sep 2025 21:04:23 +0000
Subject: [PATCH v3 3/7] dt-bindings: soc: samsung: Add Exynos990 USI
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-perics-add-usinodes-v3-3-a3629e4666ef@gmail.com>
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
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758143062; l=951;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=r2bRl4B4OF/qKIhdCBGgWHHiscJkRg/BHw+S8XdcwM0=;
 b=YwGiTLaTBVm47v5bQ1r7SxkCTmRNrDBm0v+/xK7ZoG2m3QWbczPFTXoj63VvdUma7/FMZZavm
 PNX+CL7qfzgAUhzJGU6eQe3/hjmT/WCuBfEKA95LyjY8PVKIYEYFIUp
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


