Return-Path: <linux-i2c+bounces-12840-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A7AB523A4
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 23:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C3E71C82C5F
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 21:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFDE31283D;
	Wed, 10 Sep 2025 21:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rfLYVKQq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14EC30FC03
	for <linux-i2c@vger.kernel.org>; Wed, 10 Sep 2025 21:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757540534; cv=none; b=exA88nxQbKg46iZXIhPnbmHlv3MUhBTjGqwZG/oPhwwMwzuXWLQwXIgo3e2Zsp2SE8ZAUQP120PHaIj0PPKd8gejiIMrC6+bR2mXNcOmkF+bN4RG90X9O51PvWZWVH9w+OiCxDos/YtgpUj4x1ncuZu5l4DMaRNs4PEhDbQQv/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757540534; c=relaxed/simple;
	bh=Vtc1GyPAcEF1ugP0+8GLjXhPqu7RmIfd/JlyHRAC5OM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYjMMrkasBAkzusY7M5FACtGF00EsXE6+v6mo1jsQEzCmBZkeHdxTp+zO1zKAPq3FzJNLUvtZNP7BZSA26ZLJ+nKwafVF9bdxiskBTBD8nLQiD/h8caL9E1lrtghEQNhLMg9HwWLnkEAib9ui6zFmFwSAKQqlORgIxyNLqCLoGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rfLYVKQq; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-560888dc903so3255e87.2
        for <linux-i2c@vger.kernel.org>; Wed, 10 Sep 2025 14:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757540531; x=1758145331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfssQgwNNt3owWOCp8M+EybKjyUjEnQDrgLOR0WxhvM=;
        b=rfLYVKQqBg3m+PCSqF8Ff3HBjJRMFayIcx+9QL0hYpVq5INVsma87iPG1M9ODDT8kj
         UWwXVeohdq2HVaXc2IphtiF6sfyrEuu0xzbcvlSS+dunZgJL0eZJ1WFunfJ0Iow0Rt3n
         P/IvDPb+Kc03Gu7g+Ag6AY5A52g4KunhLmHJAeFaI7e1tlEoyOAF12yVgeox+8XHIwkX
         FiA1wn8WMDHOtTkb/LZBlVrjX/bV3rqiYWnKwBQ6uZK6OMu/BtZJV1ipjz1Mb0XH4un1
         +d/dpHmMUw/63FpFIyxmsJOmPCVoC8JRzaRB5Lr1Rxt4sjT8cQgGht9WKvP4x6uqiOMl
         4Yrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757540531; x=1758145331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfssQgwNNt3owWOCp8M+EybKjyUjEnQDrgLOR0WxhvM=;
        b=cMckilV5gCy2PvrbzeFxbk/UxUhY+6ZMj5wmLo23fEUooP+bkvEv3bY2b/PhMJGqxs
         fjTRJ+kAJsZ7JgiAz7BRIAkWCcZpS1n1hMrroMd/D9uVgs08KcwfzbHUN3YGEn9XdFxt
         DcRzLq3guWuM+dNwlOm1FQCfxSuKgHKdspmEQlIdTu/WiMw/1ecpw9hhE+ucdrgyJcn2
         njKm6m6BksMvieV5g5TqJtQovPS5QLyTpZeSC0iRixnWIFnlOFtwsFQYB7SpmyR1oiOB
         WIGVEf8MvcDInRVMbKtfI+CTO//FtC4B0Bzp6UiHoD7Cv2f+hf/jHfQl8YkXNCuterU2
         4Pkg==
X-Forwarded-Encrypted: i=1; AJvYcCW9JcfXCDnIdbRMYaGNMCmm7DwmAbM92E3KnXoIEH0JgdGpr2g54nDzpQkuAVVF2CtHqJO73dxb1Ks=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4vQ/WlB7q2rp1SreSU+Ogo1+KoYZ9AEfyaLV9xjs4KO1xRvdY
	RPAkNfrhC/Dp8Vq9Ds5hlBDGVC8w4/rtGVCSD2N0a6C5kMIcAZOnIDQhkt63PiFFQbCKJlSNgXh
	K5XIangB7ZN2wWOyOLQE5M0oIzWOsj9bhYS0KyL73zA==
X-Gm-Gg: ASbGnctPrR85kTq9YOZ0nz1wN5MgNMTKFqTnJkevtHElqtD4IKgVlzaAuq+lxUh32Qu
	qE/fRf474cBhrITJO1kum79vhVxZRl9ZGaOVAY/os9YqLe4+eKg38GaF80b+vfIuTt2B7SusFJ/
	KdK5Yvnh4tJJqz9eYRjnzQ3ENygy4TXIStc72twiUWDAkgkQdu/GQB6pAkz8MEpyoI8krpL0ryv
	nwA+Fo=
X-Google-Smtp-Source: AGHT+IFutlHIwj2lsj+jDT7k42Zm8eOFBZR4KCwk+hGGTQIBylx/YAPLbGuT5vRdHvQdR6a4Uk4sEKHn5d0jQ+26HUw=
X-Received: by 2002:a05:651c:20ce:20b0:336:e1d6:8920 with SMTP id
 38308e7fff4ca-33b537e751dmr45597001fa.31.1757540530806; Wed, 10 Sep 2025
 14:42:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910133958.224921-1-hansg@kernel.org> <20250910133958.224921-3-hansg@kernel.org>
In-Reply-To: <20250910133958.224921-3-hansg@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 23:41:59 +0200
X-Gm-Features: Ac12FXzOvkO2a9fvYJf1s2WB79zSocSiy--29h2HtuNVqHlSwVgZxm9T5NCVWzM
Message-ID: <CACRpkdaZHfb_FtimCxoLphnvLswpHSEubpztWwEQoW42qHW3Gw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] gpio: Add Intel USBIO GPIO driver
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

thanks for your patch!

On Wed, Sep 10, 2025 at 3:40=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:

> From: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>
> Add a a driver for the GPIO auxbus child device of the Intel USBIO USB
> IO-expander used by the MIPI cameras on various new (Meteor Lake and
> later) Intel laptops.
>
> Co-developed-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
(...)

> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1448,6 +1448,17 @@ config GPIO_LJCA
>           This driver can also be built as a module. If so, the module
>           will be called gpio-ljca.
>
> +config GPIO_USBIO
> +       tristate "Intel USBIO GPIO support"
> +       depends on USB_USBIO
> +       default USB_USBIO
> +       help
> +         Select this option to enable GPIO driver for the INTEL
> +         USBIO driver stack.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called gpio_usbio.

This is in the wrong submenu (and the GPIO_LJCA is in the
wrong place too, but that's not your problem...)

We have:

menu "USB GPIO expanders"
        depends on USB

So put it in this submeny.

Other than that it looks good, so with that change:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

