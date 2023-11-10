Return-Path: <linux-i2c+bounces-54-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C596F7E8493
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 21:44:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A8DE1F20EC6
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 20:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C563C08E;
	Fri, 10 Nov 2023 20:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A58A3C084;
	Fri, 10 Nov 2023 20:43:56 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E00E15596;
	Fri, 10 Nov 2023 12:43:37 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6ce2fc858feso1340548a34.3;
        Fri, 10 Nov 2023 12:43:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699649017; x=1700253817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JelqBtasuctrFq8aA1lg5BQxbworEzE8yTnhOMjZkc=;
        b=g3Z97gzxwzroBwBn23TrnQrTUU3yKB7lZPzm5LZHjrMTEThjfDkrn5X1FgQ2ji5wSi
         dLpjzbjr0MX+pa5hlTfiBCSBDTKpYvcjvXan/UMF9dlTe9/OK0E++X/IgtqG/xQD84bs
         oPQkgOebb3OhqCXYQzYgdXMsC5rzwFLGqPhAOF73R8mttCR09Ouc8yoK8+Kk8DNMu2pO
         ymd6Py26ZN0E69vK0K/SNu26ZE+6/7LaeMZBHh2DQFuS4nMLZ7hofnLBixHPq+RzLg5x
         KgCil5ReM8VEjqqA6HoM+OSfFFCSlnGIE96eNvevfmgtL3Jz8zChfHStWbrIp6NV0Z4j
         2a7Q==
X-Gm-Message-State: AOJu0Yxe3D0xrPc72/W/HPK4Crsvew2EY5B8uc9E9/3CjsLf6jHCPsdT
	EEgPHtYC4eUwj2ageZhd8A==
X-Google-Smtp-Source: AGHT+IHvxcWxE9DKzdafhiZ3HFcZS9N0tFj/iDRHQnxnirdx157d/x13I8sAnvTh754BbGSMSLyN9Q==
X-Received: by 2002:a05:6830:3492:b0:6b8:dc53:9efd with SMTP id c18-20020a056830349200b006b8dc539efdmr345339otu.3.1699649017102;
        Fri, 10 Nov 2023 12:43:37 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l19-20020a056830269300b006ce2fce83cbsm52941otu.25.2023.11.10.12.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:43:36 -0800 (PST)
Received: (nullmailer pid 399226 invoked by uid 1000);
	Fri, 10 Nov 2023 20:43:34 -0000
Date: Fri, 10 Nov 2023 14:43:34 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-pwm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-mmc@vger.kernel.org, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-gpio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, linux-kernel@vger.kernel.org, 
	Andi Shyti <andi.shyti@kernel.org>, linux-sound@vger.kernel.org, 
	linux-iio@vger.kernel.org, Sam Protsenko <semen.protsenko@linaro.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org, 
	Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, 
	Jaehoon Chung <jh80.chung@samsung.com>, linux-i2c@vger.kernel.org, 
	Thomas Zimmermann <tzimmermann@suse.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Maxime Ripard <mripard@kernel.org>, alsa-devel@alsa-project.org, linux-rtc@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, 
	Alessandro Zummo <a.zummo@towertech.it>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, David Airlie <airlied@gmail.com>, 
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 12/17] dt-bindings: pwm: samsung: add specific
 compatibles for existing SoC
Message-ID: <169964901433.399188.3619478168082919994.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-13-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-13-krzysztof.kozlowski@linaro.org>


On Wed, 08 Nov 2023 11:43:38 +0100, Krzysztof Kozlowski wrote:
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
>  Documentation/devicetree/bindings/pwm/pwm-samsung.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


