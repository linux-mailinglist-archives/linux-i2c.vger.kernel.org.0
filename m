Return-Path: <linux-i2c+bounces-157-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 354D07EB4D3
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 17:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C6131C20AFD
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 16:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85583FB03;
	Tue, 14 Nov 2023 16:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h0oLxdom"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1859B405EB
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 16:31:37 +0000 (UTC)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F115134
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 08:31:35 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-da819902678so5932254276.1
        for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 08:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699979494; x=1700584294; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fr9fBrNQghS3PnJBIgxqFuQ3YV89v+EkFP5jOeoN9BI=;
        b=h0oLxdombhcX61+QbhS50eWQ1gC2f7ymvb1PrvifsdEPOzbPWhmUfqTvCB5ONhKbwE
         8HGwRvgNRrOtf+Kq6WjmsHHlyuDPxTlYVOLw91Ubg8YlhSkuGZr7OkVwiZJCL1sRVPtt
         uxre0gBseJrRX39kQ9CfX1n4jRAFQVbWEKMWvlvIRKPPUt0kkWjDsz0KkxZNmvRIzcfQ
         ZcA6SwWneWcCFlBw0AMBL+JtUNsWYwrxP+bXDpgfkZFp8a73MtUxUFH5gRHW9xY1LBmx
         PSSf7tba6HmEucd6ABJIaEbLHPigHH16xlU/s7ImXFqGAa+p4l0mCmbheKvphCuqLqIo
         009g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979494; x=1700584294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fr9fBrNQghS3PnJBIgxqFuQ3YV89v+EkFP5jOeoN9BI=;
        b=ZnAjMe2wly6DFVfrwFrps7Yw0t3oyZrL/otm+n4pFeRsrtXAdCGqpvd+5tRMMP4eoR
         y7eFuLBjKdqf3csVjq4DrcSCOY/VZYACNVE0tuKJvtVFFYue2ZSmBc2qRppmV8QSvbTp
         rHPl35rq0NGgnosgccgCQp/IJLkl84BwWeFFp5VCkW9mi70BF7PMaiNbjIFOfDDDs6ji
         6Mk4vHqqSEPtwdv1bdsQiMtkwwgnCfBBBiStD9+wSSLUC3E+hFrgoW7kPbJWzpKVu6hu
         BlGwtOd/Ym1gGk6RRE7LSfofCr/0egPhiX68k6kSMwZ2xPyasgm/AhYb7yP+WrSSr1Zl
         Q3Qg==
X-Gm-Message-State: AOJu0YwaeXZ/LtLii0RhIOLUnj1A+UjRfNJCmqTTQm9fY3s9WgOlKRba
	ZutR3ICTvRUEdokl1uYIceM0/LCLwvsPqyP6rWpyFg==
X-Google-Smtp-Source: AGHT+IE5JRixOjxRGUF+c61qIeYY24wdOAvccV78T4FRZCSUWSvo//Cy7fL+VTmLpOHSicQnDTECRUPpp9z3C1BQ8uY=
X-Received: by 2002:a25:1646:0:b0:daf:579a:79cd with SMTP id
 67-20020a251646000000b00daf579a79cdmr7364262ybw.27.1699979494683; Tue, 14 Nov
 2023 08:31:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org> <20231108104343.24192-5-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231108104343.24192-5-krzysztof.kozlowski@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 14 Nov 2023 17:30:58 +0100
Message-ID: <CAPDyKFrynEEd+y6Qkv_9aTSJy1iLO4bhg-Jg8hEP0CZiWnRJ0w@mail.gmail.com>
Subject: Re: [PATCH 04/17] dt-bindings: mmc: samsung,exynos-dw-mshc: add
 specific compatibles for existing SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>, 
	Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
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
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Nov 2023 at 11:44, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
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

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

>
> ---
>
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.
> ---
>  .../bindings/mmc/samsung,exynos-dw-mshc.yaml  | 25 ++++++++++++-------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> index 6ee78a38bd74..5fe65795f796 100644
> --- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> @@ -14,15 +14,22 @@ maintainers:
>
>  properties:
>    compatible:
> -    enum:
> -      - samsung,exynos4210-dw-mshc
> -      - samsung,exynos4412-dw-mshc
> -      - samsung,exynos5250-dw-mshc
> -      - samsung,exynos5420-dw-mshc
> -      - samsung,exynos5420-dw-mshc-smu
> -      - samsung,exynos7-dw-mshc
> -      - samsung,exynos7-dw-mshc-smu
> -      - axis,artpec8-dw-mshc
> +    oneOf:
> +      - enum:
> +          - axis,artpec8-dw-mshc
> +          - samsung,exynos4210-dw-mshc
> +          - samsung,exynos4412-dw-mshc
> +          - samsung,exynos5250-dw-mshc
> +          - samsung,exynos5420-dw-mshc
> +          - samsung,exynos5420-dw-mshc-smu
> +          - samsung,exynos7-dw-mshc
> +          - samsung,exynos7-dw-mshc-smu
> +      - items:
> +          - enum:
> +              - samsung,exynos5433-dw-mshc-smu
> +              - samsung,exynos7885-dw-mshc-smu
> +              - samsung,exynos850-dw-mshc-smu
> +          - const: samsung,exynos7-dw-mshc-smu
>
>    reg:
>      maxItems: 1
> --
> 2.34.1
>

