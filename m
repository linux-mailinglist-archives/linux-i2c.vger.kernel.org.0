Return-Path: <linux-i2c+bounces-50-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AD37E8437
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 21:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9727B20E86
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 20:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E12E3C081;
	Fri, 10 Nov 2023 20:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2F93C06E;
	Fri, 10 Nov 2023 20:41:28 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70EE746B3;
	Fri, 10 Nov 2023 12:41:27 -0800 (PST)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1f06931e4f7so1380280fac.1;
        Fri, 10 Nov 2023 12:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699648886; x=1700253686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBHIKLn/Yt1i+AZlSPolEYBWZ3bHmDQq+CYq1w7SUZQ=;
        b=DjcM4lf/wdPyGGi+uf3IUCIh+zFDWe2tKmEylCIoJGoxYVg5i6SV1IF+h3fEfs0YWU
         5KiEAWmB++23/0kcXZJ3OBsDQcGRmux0BhE2DmAkmNxz3R6slxy1gYqfKaJrDu2RTQx/
         NWokevweiWO1Ujd6EqtWP/tS/dv1tt0nf6aqR4VkT0hbci0VjZMscpVtXWTAMNzynL3m
         C12XpqMKt8Gj1q4r0ARDZFMRoUBpeL19yIVw3IJYGFF42vi9/kcvj4QL4VaQTYlocUlM
         YZairyufLs7XKHdgoZFw4U9e9TlGzRSDsR4WN6K1HkxN90vqeOrq1oQaJWBDuHHCsOBp
         s6MQ==
X-Gm-Message-State: AOJu0Yy5ThfC4I7/yC9eI4+tlAY0at7+U2Q8EfI7ADbGoC2HQO645gX1
	TqARGvPNMZN4p9YvYbGQCA==
X-Google-Smtp-Source: AGHT+IGWPDVMk2FcTLN+vtGTQRj0d3U/p0JEK8eP2bUHcv7B2jUR734/Xzt7iQNmomOefFQYy76Dcw==
X-Received: by 2002:a05:6870:d07:b0:1ef:b16f:d294 with SMTP id mk7-20020a0568700d0700b001efb16fd294mr347134oab.38.1699648886590;
        Fri, 10 Nov 2023 12:41:26 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id zl25-20020a0568716d9900b001cc9bc7b569sm59526oab.27.2023.11.10.12.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:41:26 -0800 (PST)
Received: (nullmailer pid 395677 invoked by uid 1000);
	Fri, 10 Nov 2023 20:41:24 -0000
Date: Fri, 10 Nov 2023 14:41:24 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Thierry Reding <thierry.reding@gmail.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, 
	linux-serial@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, linux-iio@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, linux-sound@vger.kernel.org, 
	Andi Shyti <andi.shyti@kernel.org>, devicetree@vger.kernel.org, 
	Sam Protsenko <semen.protsenko@linaro.org>, linux-i2c@vger.kernel.org, 
	Alessandro Zummo <a.zummo@towertech.it>, Maxime Ripard <mripard@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-rtc@vger.kernel.org, 
	Tomasz Figa <tomasz.figa@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Daniel Vetter <daniel@ffwll.ch>, alsa-devel@alsa-project.org, 
	Thomas Zimmermann <tzimmermann@suse.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Jiri Slaby <jirislaby@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 08/17] dt-bindings: samsung: exynos-pmu: add specific
 compatibles for existing SoC
Message-ID: <169964888359.395618.988473791083039735.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-9-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-9-krzysztof.kozlowski@linaro.org>


On Wed, 08 Nov 2023 11:43:34 +0100, Krzysztof Kozlowski wrote:
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
>  .../devicetree/bindings/soc/samsung/exynos-pmu.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


