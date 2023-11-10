Return-Path: <linux-i2c+bounces-46-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E797E8415
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 21:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C266928144F
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 20:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79573B7BF;
	Fri, 10 Nov 2023 20:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F4B3B293;
	Fri, 10 Nov 2023 20:39:42 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1625FD64;
	Fri, 10 Nov 2023 12:39:41 -0800 (PST)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6d2efe8c43eso1717041a34.0;
        Fri, 10 Nov 2023 12:39:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699648780; x=1700253580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2mpCZw6APjzuy5DVtlkGaasSgeytmGTQ3T7Ai89NIc=;
        b=bVz+XnC+QhEXIyzRB2E/rrmOYOb/xPYk1eOL0KFli3omnRFURI40Ch6OTp7a1Fytab
         A9qXAz869eTVMPL4Q7pzKgqaf2ZHr6jGvD3WBzY8YD05LP7XFJ36ncB1G50iOjRp1pTZ
         +Vj/951EaPxyTKKGgifPqf+Vtv5c5++68GX0pkFXUzI6A5k4FnWktaceX4yLR/sXDwAx
         F/7BgTuZyY90Dx8md2gGK2J+K/pipmphUMj20KaUK71BHBrRZJQbzup7uDUXcclPlTd1
         xVroJlk3TQsBWe3Z0XUjUcWDtsW5B9MUdq1BoEDSeCtrT8Koxct+OpC2Ul4Sv7mWGiMm
         AqZA==
X-Gm-Message-State: AOJu0YwtPjr7Z0VzJ7XzKImIzc7YFfud16iONzjbN6f2mAU4IV50Hc3Y
	4S1vgx/SqQpAO5j6MwruwbcqFQxdyA==
X-Google-Smtp-Source: AGHT+IFDEevgxfWBbNoBxZy5wpEh6g0d1RAursubSv3B8D6mEOOuHNqGY4vD4lMK2cqLkNv2mYVlyQ==
X-Received: by 2002:a9d:73d0:0:b0:6d6:5175:50c9 with SMTP id m16-20020a9d73d0000000b006d6517550c9mr157442otk.6.1699648780318;
        Fri, 10 Nov 2023 12:39:40 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i15-20020a056830450f00b006ce2b90d0cesm51017otv.24.2023.11.10.12.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:39:39 -0800 (PST)
Received: (nullmailer pid 392734 invoked by uid 1000);
	Fri, 10 Nov 2023 20:39:37 -0000
Date: Fri, 10 Nov 2023 14:39:37 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Alessandro Zummo <a.zummo@towertech.it>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-serial@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Jonathan Cameron <jic23@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, linux-samsung-soc@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, linux-gpio@vger.kernel.org, 
	Daniel Vetter <daniel@ffwll.ch>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, 
	Maxime Ripard <mripard@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Tomasz Figa <tomasz.figa@gmail.com>, alsa-devel@alsa-project.org, 
	Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-sound@vger.kernel.org, 
	linux-pwm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/17] dt-bindings: mmc: samsung,exynos-dw-mshc: add
 specific compatibles for existing SoC
Message-ID: <169964877627.392672.14874068087701843483.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-5-krzysztof.kozlowski@linaro.org>


On Wed, 08 Nov 2023 11:43:30 +0100, Krzysztof Kozlowski wrote:
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
> While re-indenting the first enum, put also axis,artpec8-dw-mshc in
> alphabetical order.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.
> ---
>  .../bindings/mmc/samsung,exynos-dw-mshc.yaml  | 25 ++++++++++++-------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


