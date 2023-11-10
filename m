Return-Path: <linux-i2c+bounces-45-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED047E8410
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 21:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91F521C20A23
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 20:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37203B7BC;
	Fri, 10 Nov 2023 20:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7853A20329;
	Fri, 10 Nov 2023 20:39:15 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E67DA1727;
	Fri, 10 Nov 2023 12:39:11 -0800 (PST)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3b6c31e604cso1244840b6e.2;
        Fri, 10 Nov 2023 12:39:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699648751; x=1700253551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yS2DPG1f2BOqV0lB92Cpsm9LSSGSaVSlz4hVTLG41TM=;
        b=qSm/ozCOlibpVQriZyI3jw4e8Drc9PQi1oCv2tvXAdRujVz7PXn3JAOrU5KS3O5aXt
         1fHjgggi7GhcW6dNskROnNmO1oPNcs8cqUtts5SEKG/ogwpBkxSj47C9dJZW9ecIK1s2
         8PlQyJFPECjbjoluRZImBSobG+SGbnRWRAmx6h+88Rp7sUOsQaWB2AL56umtp45/LyfB
         3BVpsYIvmcmYCDloTAghqeOS3DGsQRm/ulsIODCL1fK+sZJJ/vWos0Ac/06Js8AHVpSD
         /LFJzjc6SZ6PQ7PEQSB9gwfY8LAYyhJkeTuDTiG/8j8XWwSc90bBY2OswB9Im45dUjdM
         r0rQ==
X-Gm-Message-State: AOJu0YxxGGAjbMK+LItmzXnsm+JthZQG+Okb0jcWRrYmaS6CPJRPsnyu
	ctRiWmg96s9cHHdLAaJyJQ==
X-Google-Smtp-Source: AGHT+IE11yxoIUKi4thNm7Iyj/ixtWImO1W2Hn7ItLPU3Js0ofchT4UxunydV7s77gbgBpIQEqwLTQ==
X-Received: by 2002:a05:6808:14c:b0:3b6:c4dd:be83 with SMTP id h12-20020a056808014c00b003b6c4ddbe83mr464930oie.52.1699648751176;
        Fri, 10 Nov 2023 12:39:11 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a9-20020a05680804c900b003b29c2f50f0sm43947oie.18.2023.11.10.12.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:39:10 -0800 (PST)
Received: (nullmailer pid 391980 invoked by uid 1000);
	Fri, 10 Nov 2023 20:39:08 -0000
Date: Fri, 10 Nov 2023 14:39:08 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 03/17] dt-bindings: i2c: samsung,s3c2410-i2c: add
 specific compatibles for existing SoC
Message-ID: <20231110203908.GA391217-robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-4-krzysztof.kozlowski@linaro.org>

On Wed, Nov 08, 2023 at 11:43:29AM +0100, Krzysztof Kozlowski wrote:
> Samsung Exynos SoC reuses several devices from older designs, thus
> historically we kept the old (block's) compatible only.  This works fine
> and there is no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
> 
> Add compatibles specific to each SoC in front of all old-SoC-like
> compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.
> ---
>  .../bindings/i2c/samsung,s3c2410-i2c.yaml     | 22 ++++++++++++-------
>  1 file changed, 14 insertions(+), 8 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

