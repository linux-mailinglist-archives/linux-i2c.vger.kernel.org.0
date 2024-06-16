Return-Path: <linux-i2c+bounces-4051-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F9C909FF2
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2024 23:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF071B211D7
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2024 21:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3C36E614;
	Sun, 16 Jun 2024 21:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aafkBiRj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE926A33F
	for <linux-i2c@vger.kernel.org>; Sun, 16 Jun 2024 21:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718573400; cv=none; b=mPW/XrHWgM0d5/9lopaXZ92HWdlz3Odv/9xgdbnzDzgm/lRqKiA2rJG4d+y4enbP5No4nhqsOxxfrL9PjviyC+0BV9ogfUJfuIR/8qF1Pyp8A20JFBmI0/ChBq6HQYUl5dTOLk/YwMIdaEI0xdAkSoPyzPPleiLvbjP8lhMi34o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718573400; c=relaxed/simple;
	bh=77qTZ2/jNB1s3kvHZeR23oY3xoIE8oX+Pbgo1oPSZVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjJ3qZ7vLvP4LvlXuJ4dSIuv+kzJTCQlkBXCJ/XlLGUS+kGt0yomQYFvRkg4aLEdywFUcR6HQGq2pFsUJxyc/mKEhygUj9V2z5xSWc04BE3FV7Yv4ogWxuC8tjeX2Ui9fX80+In0JmqEI2RgTS44mMT65oIm7ojJsnWSuusj5tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aafkBiRj; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6f8b0b10f4so10755266b.0
        for <linux-i2c@vger.kernel.org>; Sun, 16 Jun 2024 14:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718573396; x=1719178196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kmVQxJoiRRnVxUmJPLxuy9ofoBMY/z2Ox1ZWQdCQeiQ=;
        b=aafkBiRj0Yn6c/bZ1p14eumNaiQ/bsJFCm37mOdKdnaPCC4XvrnCYuioEZO8WssSwO
         6U637L21bQHhTg9w8tJYYy2hKeR+SxJFPzkLdWhOqoJXYHBSsa+J8nCyN8zpMloL6K8a
         yZUuxrMnQUV//AliVgRgGoPDPt6bySgxZDyxVSHd2vxjKufne1dBh97wtR9uIOQj3Mdm
         B+I9ATkEwxemVMAnxE2mSgRDXyEvY6plAI8GZrMxr9uc7ZPCeDgVP5XVP9xpsFqqvvTS
         aV7UTIsvHOTjdhVbLbtgTs3qS3/NHg4Yp1UEHVf1ajOhEsb/6atr3qlZNA123inXNWDi
         77oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718573396; x=1719178196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmVQxJoiRRnVxUmJPLxuy9ofoBMY/z2Ox1ZWQdCQeiQ=;
        b=OOt6EqWdjlHCIW6dgzeO3V+QWErEfMjhddFPMeiqkwk0cv3z29l/X5upPEmF6Ov3TI
         JxY2KkQiWeDoZn+NUCy50xthU010brLaFcvGIw3OMIEPCA4ALvd8/bh2WMYRnASyjOsu
         H+dSQNGERQ+ROvIninY8MrS8vfW5UTDc7oBXttYDMrf3mYdi8REBySw7kJS90JA09zr8
         QkHzJKGlIz9hiEfWxQ5U5bCKqTGQdsS5FjHeNwr8sCsEwbrcURC7vDGpFMd8ER/xb3NW
         l/nRDbPB/6UZR5efJTM7wMLyrvRhmAFI1SyAVTLPW1ZnvNyNRlrHanyRlq2RxKu1a5g2
         4KrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7KIxtUHoUaiwCcftVylQfHMrLGJbVUo3ycRv99Abyg4JUZq/PGmMRE+kw+YOYBkGgx84sLm2gVnK1RX98z0/aLVWPSr98qE4A
X-Gm-Message-State: AOJu0Yx4olMVE+0Ul/7hol+FQCySMIgLsP7VW+LgGnwf8d9SLTheN6U/
	6wAvnSPFUU3P6a1+jNqqkgTFi/EjkJcJrM7x3Yr2+/Y3jP3ea1QOtWvg4PzGN6A=
X-Google-Smtp-Source: AGHT+IEvUS/odyJPhKK7Glqf82cIjEvLFIs9anp+ZsBOp8SFgZaTIpP8nTwgP28wMtCwtrwni3h6Dg==
X-Received: by 2002:a17:907:c302:b0:a6f:6337:1ad5 with SMTP id a640c23a62f3a-a6f63371be1mr650604966b.27.1718573396000;
        Sun, 16 Jun 2024 14:29:56 -0700 (PDT)
Received: from linaro.org ([188.24.162.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f5f1c8d6fsm384984166b.0.2024.06.16.14.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 14:29:55 -0700 (PDT)
Date: Mon, 17 Jun 2024 00:29:53 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: drop stale Anson Huang from maintainers
Message-ID: <Zm9ZUWpievH+P8Yc@linaro.org>
References: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>

On 24-06-14 11:59:27, Krzysztof Kozlowski wrote:
> Emails to Anson Huang bounce:
> 
>   Diagnostic-Code: smtp; 550 5.4.1 Recipient address rejected: Access denied.
> 
> Add IMX platform maintainers for bindings which would become orphaned.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[...]

> diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
> index bae4fcb3aacc..74cfdcf1c93b 100644
> --- a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
> @@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Freescale i.MX6 Quad Clock Controller
>  
>  maintainers:
> -  - Anson Huang <Anson.Huang@nxp.com>
> +  - Shawn Guo <shawnguo@kernel.org>
> +  - Sascha Hauer <s.hauer@pengutronix.de>
> +  - Fabio Estevam <festevam@gmail.com>
>  

For the clocks, please add me as well. Don't mind having more help from
the others :-) . But i.MX clock bindings usually go through my tree.

Thanks.

