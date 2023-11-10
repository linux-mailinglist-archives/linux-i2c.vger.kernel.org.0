Return-Path: <linux-i2c+bounces-47-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 080467E8420
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 21:40:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 813FAB20BE9
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 20:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6877F3C06D;
	Fri, 10 Nov 2023 20:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061783B2A6;
	Fri, 10 Nov 2023 20:40:04 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BF84205;
	Fri, 10 Nov 2023 12:40:03 -0800 (PST)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6cd0a8bc6dcso1399362a34.2;
        Fri, 10 Nov 2023 12:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699648803; x=1700253603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIUKFeCBp8QWWYNKFRJyz0CogaqLBpf4Mvy06PqKugo=;
        b=Rd1PfSHbJmKlw0LNoTOHBcflxxneqSd87lePzCs5duwGWv5uhAblJ/19f9gYDKsijH
         GbEgk7iEaAS4KeRL90UIMc937ww4GU8gg2Bt+69zugcSMUVIP31Kynwph2TcS0VoUe3I
         CdbqO15OSOQKOaEciB+kAtt+jZ3VxaybZ3LlU0vvIXoK1CskiqPHWKgTllZ+ZUPcLo5K
         6qowrrO2NeGIJq6hRyKgjTVE2QqILsl00CTfNkYar/x6tRRJTxNe1jcRCCvCIaEVnJR2
         7ZmFA2hH3yxNDC5Yk24TLWHlDGXoSI2OsYhMlUTBjSlNP5lCkRH2Z5i0la+t8772VjyT
         x0rw==
X-Gm-Message-State: AOJu0YwCn8y8JLvJGkAUDtthrEh/imHru+uUJfRPcFjJLV1LwZOCa8kv
	119lG45oQEGoqLdZ33Y/gw==
X-Google-Smtp-Source: AGHT+IHRxgqmlIcaZxA+uUtss7i4GqToCENI8qvZ/6FLZfO0lFbqJf5Tp34OcuHctKTILzporo4hUw==
X-Received: by 2002:a05:6830:2644:b0:6ba:865b:ca72 with SMTP id f4-20020a056830264400b006ba865bca72mr207172otu.31.1699648803023;
        Fri, 10 Nov 2023 12:40:03 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id do2-20020a0568300e0200b006d64467c68asm46743otb.77.2023.11.10.12.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:40:02 -0800 (PST)
Received: (nullmailer pid 393449 invoked by uid 1000);
	Fri, 10 Nov 2023 20:40:00 -0000
Date: Fri, 10 Nov 2023 14:40:00 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-pwm@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Jiri Slaby <jirislaby@kernel.org>, alsa-devel@alsa-project.org, 
	Tomasz Figa <tomasz.figa@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-i2c@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Lars-Peter Clausen <lars@metafoo.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-serial@vger.kernel.org, David Airlie <airlied@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Jonathan Cameron <jic23@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	linux-rtc@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Alessandro Zummo <a.zummo@towertech.it>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 05/17] dt-bindings: pinctrl: samsung: add specific
 compatibles for existing SoC
Message-ID: <169964880016.393384.2296633788360305234.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-6-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-6-krzysztof.kozlowski@linaro.org>


On Wed, 08 Nov 2023 11:43:31 +0100, Krzysztof Kozlowski wrote:
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
>  .../samsung,pinctrl-wakeup-interrupt.yaml     | 24 ++++++++++++-------
>  .../bindings/pinctrl/samsung,pinctrl.yaml     |  3 ++-
>  2 files changed, 17 insertions(+), 10 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


