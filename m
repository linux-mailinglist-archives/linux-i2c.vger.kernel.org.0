Return-Path: <linux-i2c+bounces-49-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBA37E842F
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 21:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48CFF1C20B36
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 20:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5493C079;
	Fri, 10 Nov 2023 20:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A85B3B7B8;
	Fri, 10 Nov 2023 20:41:13 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A35A185;
	Fri, 10 Nov 2023 12:41:12 -0800 (PST)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1efb9571b13so1413494fac.2;
        Fri, 10 Nov 2023 12:41:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699648872; x=1700253672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBu9jdlI8BmMP2EXqok2V/jfQ0F843VqKLKqoYajCbY=;
        b=m588BxKJH2+Ck7tJHFVuhHesrjOL7NXifPvZ5HJ/+NrTu46HyN9ZF9U5l5gvAPXP2z
         BsLTMezjPZpxoNj068XW5bjM53tahxDzu8rFk/bDgjFfodfUoSFucCOr29p/Pjf9aohN
         SEI6GtHU2J64DoafDoh0hl09zG1PPt9ZvAyQyvJTXM5rtUhQjwpCRy72kijLyOiqat0B
         3X9jwgisFSx+oakRyahOj25jPCxITuzw7dnOxcge4oU/wSpfdBNoDRN2mq53bgCuciyG
         YPDKW+pTlor65WHkNdaotCfgvZuIUwPPQxc8f38qR7Bri9smbJ/7Kb99ZMllBuI7Y+bg
         BbCw==
X-Gm-Message-State: AOJu0YxcuWT8Yng+/etxztdih/HsrkhY49gyrUmQxR0Wl48Vnks7ZFOe
	whF69/tp/e723/EnulHLkQ==
X-Google-Smtp-Source: AGHT+IE7LNnk5DWomU2D9t+1ZTG+6ik+KpyphzRkzXtQujj9+w3A1KWUmfC2t3Snd6+6Q7shaSdaiw==
X-Received: by 2002:a05:6870:c986:b0:1d5:40df:8fb1 with SMTP id hi6-20020a056870c98600b001d540df8fb1mr335335oab.19.1699648871913;
        Fri, 10 Nov 2023 12:41:11 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id mo37-20020a056871322500b001cd1a628c40sm57032oac.52.2023.11.10.12.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:41:11 -0800 (PST)
Received: (nullmailer pid 395219 invoked by uid 1000);
	Fri, 10 Nov 2023 20:41:09 -0000
Date: Fri, 10 Nov 2023 14:41:09 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, Jonathan Cameron <jic23@kernel.org>, linux-rtc@vger.kernel.org, 
	Alessandro Zummo <a.zummo@towertech.it>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-pwm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Airlie <airlied@gmail.com>, 
	Tomasz Figa <tomasz.figa@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-sound@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
	linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Daniel Vetter <daniel@ffwll.ch>, Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org, 
	Maxime Ripard <mripard@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, linux-iio@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 07/17] dt-bindings: serial: samsung: add specific
 compatibles for existing SoC
Message-ID: <169964886893.395180.18336203725841457804.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-8-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-8-krzysztof.kozlowski@linaro.org>


On Wed, 08 Nov 2023 11:43:33 +0100, Krzysztof Kozlowski wrote:
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
> Re-shuffle also the entries in compatibles, so the one-compatible-enum
> is the first.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.
> ---
>  .../devicetree/bindings/serial/samsung_uart.yaml   | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


