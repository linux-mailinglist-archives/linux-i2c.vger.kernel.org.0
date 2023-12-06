Return-Path: <linux-i2c+bounces-638-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED55A807AFD
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 23:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97D231F2188D
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 22:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842B556393;
	Wed,  6 Dec 2023 22:03:03 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D460012F;
	Wed,  6 Dec 2023 14:03:00 -0800 (PST)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1fb04fb8d28so188550fac.3;
        Wed, 06 Dec 2023 14:03:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701900180; x=1702504980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqClogHPgv5qufltAKwY4e5KCGDpltadq8sBvRE0DI8=;
        b=U+P9nhDKOrEeT+xSWT0Hu1iaSGI684jDPDseJb3vkLH9iegHodH34g9rAJtCHOKxSZ
         +fGMqtvcQ+4buHZ5bu4p9ezDk51j5+9x5DWj+jkpOvoKUntiHy6VOnbHwjwVEafx2E96
         sd5fHbr9Dx1Oqzun6r0XeVpFiRcJZ1tQH0zJpoYuzO2ZNLeeDwii2z3QhFdVpiu7IkUW
         xyT05ROUHNlX4H42QB++NA+BFHVBAimvfT2RisrMjdXyKfcl2HHDxykiTfgYrN7+/mf1
         xx1IU0d2vf4jLpM6JlHEGps820dvp2wHIJxEdyHUHZCfIgvRyPoVUJ64m8Wl6C65nAJF
         cQZg==
X-Gm-Message-State: AOJu0YygxH9NlJkIWBTT0iKR1CzhkupCqqDe/KN57qlvZvMD+EA2FC6b
	U9Qk2rctWfSPFLcTH+B+UA==
X-Google-Smtp-Source: AGHT+IFIQ+Fmn/gm8PmlODgpjRX9aEH12Xe42KCENR5PO5Z3OQhqKfSEIkDTkNueoJsHJHs5SR25BQ==
X-Received: by 2002:a05:6870:1642:b0:1fb:50f0:82ab with SMTP id c2-20020a056870164200b001fb50f082abmr1826372oae.40.1701900180112;
        Wed, 06 Dec 2023 14:03:00 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id hb20-20020a056870781400b001fb0a948af4sm166458oab.1.2023.12.06.14.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 14:02:59 -0800 (PST)
Received: (nullmailer pid 3416927 invoked by uid 1000);
	Wed, 06 Dec 2023 22:02:58 -0000
Date: Wed, 6 Dec 2023 16:02:58 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jiri Slaby <jirislaby@kernel.org>, linux-fsd@tesla.com, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-serial@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Alim Akhtar <alim.akhtar@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-pwm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: pwm: samsung: add specific compatible
 for Tesla FSD
Message-ID: <170190017774.3416623.1160750978805123790.robh@kernel.org>
References: <20231205092229.19135-1-krzysztof.kozlowski@linaro.org>
 <20231205092229.19135-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205092229.19135-3-krzysztof.kozlowski@linaro.org>


On Tue, 05 Dec 2023 10:22:25 +0100, Krzysztof Kozlowski wrote:
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
>  Documentation/devicetree/bindings/pwm/pwm-samsung.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


