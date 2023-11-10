Return-Path: <linux-i2c+bounces-53-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F627E848F
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 21:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46BFD1F20EFD
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 20:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03313C08D;
	Fri, 10 Nov 2023 20:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1722E3AC3C;
	Fri, 10 Nov 2023 20:43:41 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E6B4EDE;
	Fri, 10 Nov 2023 12:43:21 -0800 (PST)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6d2de704f53so1369000a34.2;
        Fri, 10 Nov 2023 12:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699649000; x=1700253800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNaUrVj08NBtZOvpIGNqsCz93eA7N7P0VcAZpJigNHA=;
        b=nrpBf3P138nFtmveThwP/cZJJD4aT2ZiRDjBEcx82GgIRe5VFhYLwK/e3vMvi6vo9u
         3YrprBUg1+wAgq9Qfb3BZZ4IkdT/s22OC8Y3QO6GhgWdBULWWwxR2O7kaD/ugZgkG5t2
         PT9yIggm3JYwXzbU6JIeTbVM0RLGo46Nb1din+qIBTW6U+yj2vRUXMgj4mmP9hZk4KvU
         fDo/+BdQCYRmyTST3/OKOWDCDz3o6EER4GgVJwE3EDKpm/YFcPt7PNQxOcCXBYObu2gM
         zUonzS8BzhCqA/Z/kzgI2qdPm7VaiGNKOGN0U86Jj+mNUKXLNtcNc+DWal3VUKLhChBU
         TC0w==
X-Gm-Message-State: AOJu0YzyumAng1DQRHftGfErlVAjib6wBiqNWZli0cKEaxPC9h7T1luV
	PS05HAPgVNsbYdM0Shpc9g==
X-Google-Smtp-Source: AGHT+IGuCIrvtFv3ALEU5ciLcJTT36N1k9uB2xQVwrMFf1+eMSPG74AQUVS8heVBUqI66wOHlKeqbA==
X-Received: by 2002:a05:6871:551:b0:1dc:9714:e2b3 with SMTP id t17-20020a056871055100b001dc9714e2b3mr423099oal.7.1699649000334;
        Fri, 10 Nov 2023 12:43:20 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l22-20020a056870d4d600b001efc94cc21bsm57823oai.58.2023.11.10.12.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:43:19 -0800 (PST)
Received: (nullmailer pid 398686 invoked by uid 1000);
	Fri, 10 Nov 2023 20:43:17 -0000
Date: Fri, 10 Nov 2023 14:43:17 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Alessandro Zummo <a.zummo@towertech.it>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-serial@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	Thierry Reding <thierry.reding@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-sound@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Lars-Peter Clausen <lars@metafoo.de>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-mmc@vger.kernel.org, 
	Maxime Ripard <mripard@kernel.org>, alsa-devel@alsa-project.org, 
	Alim Akhtar <alim.akhtar@samsung.com>, David Airlie <airlied@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 11/17] ASoC: dt-bindings: samsung-i2s: add specific
 compatibles for existing SoC
Message-ID: <169964899705.398637.5382830943719270282.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-12-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-12-krzysztof.kozlowski@linaro.org>


On Wed, 08 Nov 2023 11:43:37 +0100, Krzysztof Kozlowski wrote:
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
>  .../mfd/samsung,exynos5433-lpass.yaml         |  2 +-
>  .../bindings/sound/samsung-i2s.yaml           | 19 ++++++++++++-------
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


