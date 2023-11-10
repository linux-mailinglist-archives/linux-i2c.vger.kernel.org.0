Return-Path: <linux-i2c+bounces-52-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F977E8476
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 21:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3C84281370
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 20:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2573C085;
	Fri, 10 Nov 2023 20:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231F03AC3C;
	Fri, 10 Nov 2023 20:43:08 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B290E5FFB;
	Fri, 10 Nov 2023 12:42:51 -0800 (PST)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3b2e73a17a0so1406760b6e.3;
        Fri, 10 Nov 2023 12:42:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699648971; x=1700253771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYRGPcRyh2b3fkqQmyXc07beY1rNkEkbKXxns94N0UA=;
        b=Dthf7Vkneienby6Pp5gry+74NlmCIGM2bBheG0Bx6ICKkuGEspR6ykq11hphaYiig6
         n88W+EeNPsgJQlBe7DP2Odvg16PgGebNxjyQMKm82mAwGBCwQElgKZk4rCBt8lreZiJr
         pQLxyRGbFhEmSj5+vcnvS4CL0lj35MDsAiZwQcGst0wNXudQwKdxA4I4NsnqhVEiOyQX
         4sUdROJc1fCGCvdwECyxxWAUfsKOKY0Z2sGOE9+ebdJh8GBSJGiKNcA3Eit/0/fAUasW
         UBamXXFf4Sl/PXpgOqs6sJxzH229UWJLykDMRrZq3OXc5apr6V1f8tPollA51xc/VFxT
         63mQ==
X-Gm-Message-State: AOJu0YyomavQ3VvlxH7RnuVNZVrqA+HcUAwVRxNNSYDmatlcnKoCFWJ+
	Nm1ZsILjlo23Y5zzttY+vg==
X-Google-Smtp-Source: AGHT+IEbpkkUwMS8m0HRQeTKdMYwXj4e9rjshafhVsgnG4tRletjT6wKTUFDB5opO1qLTOQnh19aYQ==
X-Received: by 2002:a05:6808:23cb:b0:3b6:d617:a6f7 with SMTP id bq11-20020a05680823cb00b003b6d617a6f7mr539897oib.3.1699648970928;
        Fri, 10 Nov 2023 12:42:50 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x26-20020a54401a000000b003b2e3e0284fsm42223oie.53.2023.11.10.12.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:42:50 -0800 (PST)
Received: (nullmailer pid 397808 invoked by uid 1000);
	Fri, 10 Nov 2023 20:42:48 -0000
Date: Fri, 10 Nov 2023 14:42:48 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	linux-mmc@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, 
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Sam Protsenko <semen.protsenko@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, linux-pwm@vger.kernel.org, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, linux-sound@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Tomasz Figa <tomasz.figa@gmail.com>, alsa-devel@alsa-project.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-i2c@vger.kernel.org, 
	linux-iio@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Lee Jones <lee@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>, dri-devel@lists.freedesktop.org, 
	Maxime Ripard <mripard@kernel.org>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 10/17] dt-bindings: iio: samsung,exynos-adc: add specific
 compatibles for existing SoC
Message-ID: <169964896802.397769.16770997428730838541.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-11-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-11-krzysztof.kozlowski@linaro.org>


On Wed, 08 Nov 2023 11:43:36 +0100, Krzysztof Kozlowski wrote:
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
>  .../bindings/iio/adc/samsung,exynos-adc.yaml  | 29 +++++++++++--------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


