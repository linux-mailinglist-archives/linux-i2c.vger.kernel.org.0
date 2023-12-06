Return-Path: <linux-i2c+bounces-641-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 026B7807B19
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 23:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99B9CB21134
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 22:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666F0563A3;
	Wed,  6 Dec 2023 22:05:26 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6BAD7D;
	Wed,  6 Dec 2023 14:05:22 -0800 (PST)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-58cf894544cso1285eaf.3;
        Wed, 06 Dec 2023 14:05:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701900322; x=1702505122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbd5B8BVVpRHLAAm9f1h8aNytsZytNMI1lzIKFManeQ=;
        b=pMxC2nOv9Eu5z315m6/BLH3Tr7emveEAdtWuOH6hXD7TYe61Uy6N5Ipe1uCZSVRJkQ
         it6h3Bgi9KuLmFBEa8hqjelaC4FdINkXGH4tuIV8xD6+F7YL+eQlYfDzho76uuwL6Jwm
         +rMWEYdGnL9ElPP/6f9Fv5F3hn6SCLdzMXyZXYRFfIbBDpSJRxHct5MljgdvmbzfQW97
         TyXGhbYJX2w4yZuQf5P25cC16/mvfVr9uQwVhb7eQuIGsgkmUUoZhBV80abHWmbGBul7
         au3/TBR+2kYgIBlFNJrTMsT6tJfHLJnS7yQPIbGInhM2r2PMx2jkMgmPTZeNcHyeihOJ
         8+gg==
X-Gm-Message-State: AOJu0YyWo34P2QWrvp09VLfcjMP2++KdX1CWu1aClGwYSrYAPU+TJQrX
	BlfpM0fSAwG6T/hYZ7rgBA==
X-Google-Smtp-Source: AGHT+IGje1u2DNEW9pSR9hih68DS0uYGwmFBGf37482odpdjRd1Z0Zs32LrlmDgot+tSfKBspUxDvQ==
X-Received: by 2002:a4a:251b:0:b0:58e:80e2:93b7 with SMTP id g27-20020a4a251b000000b0058e80e293b7mr1466627ooa.0.1701900322055;
        Wed, 06 Dec 2023 14:05:22 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d24-20020a4a9198000000b0057b6ac3922esm803ooh.18.2023.12.06.14.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 14:05:21 -0800 (PST)
Received: (nullmailer pid 3423211 invoked by uid 1000);
	Wed, 06 Dec 2023 22:05:20 -0000
Date: Wed, 6 Dec 2023 16:05:20 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-serial@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, Jiri Slaby <jirislaby@kernel.org>, linux-i2c@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Thierry Reding <thierry.reding@gmail.com>, linux-samsung-soc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 5/6] dt-bindings: watchdog: samsung: add specific
 compatible for Tesla FSD
Message-ID: <170190031995.3423149.13499134597119767259.robh@kernel.org>
References: <20231205092229.19135-1-krzysztof.kozlowski@linaro.org>
 <20231205092229.19135-6-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205092229.19135-6-krzysztof.kozlowski@linaro.org>


On Tue, 05 Dec 2023 10:22:28 +0100, Krzysztof Kozlowski wrote:
> Tesla FSD is a derivative of Samsung Exynos SoC, thus just like the
> others it reuses several devices from older designs.  Historically we
> kept the old (block's) compatible only.  This works fine and there is no
> bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
> 
> Add Tesla FSD compatible specific to be used with an existing fallback.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.
> ---
>  .../bindings/watchdog/samsung-wdt.yaml        | 21 ++++++++++++-------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


