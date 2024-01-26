Return-Path: <linux-i2c+bounces-1474-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A35583E3E8
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 22:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D56AAB20BD0
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 21:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DFE24A08;
	Fri, 26 Jan 2024 21:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLcEEvxA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8022E24B20;
	Fri, 26 Jan 2024 21:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706304556; cv=none; b=W1upz8l2/zfkf5DXpwrBQ1oGSYfkFruzeXaibf85UCt/9NRozSoDmM+20dURwsPmPSMgt7Lz4eqy3dT2wJU/SVC08i8zsjZ5PllIl7PXRHOkeJnwOJHA7cT0jm7DYo6z+C2Obbul1Rd76hRxCnn8MphOSx10vhoSPHatw5sfses=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706304556; c=relaxed/simple;
	bh=45f7pdvd5/Owsm6Q92oWoQ9hQwOd+JfrrIryHMgKxfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h5RV3XJwn+PyYXmdiJpPmDqGRoFJdd3s5Ud18SFm+c7xFuLRbIqgUjoI75iMv0spMX2Hwzel1xc4sNy1gG7q9o5JH8i6r14UkDfc1bYaCSgvNb+Pp1eMwRoTDoPiljqn2Q0w0KCS8LSM9TblbEqyAmke2t9AAhT/M9nngRDslmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLcEEvxA; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50eac018059so1056496e87.0;
        Fri, 26 Jan 2024 13:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706304552; x=1706909352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dGaRcZGZXBVKac7GIu7GBfbJOVUBsye+tLRWwIY3dY=;
        b=TLcEEvxAzX+vAHmul62iTukL7WOPI+xG79GNDOtwm60uaKrLVeiTxAWeZ8qRwEHASj
         VzcL8ntJnt+e/mZf/wqJHJJEJf5qJERjzzEtxayk/WzxEdzVxjkMb/acDPLPxzwOf54U
         L//9OPxA+oN40RIWKGoTIHLLZLR7q77/e3R1RogsUoGLW5rR4f5d2k5tjBsCSwXMBxy6
         uuHHwSJfrpOlPEIBWLV3FVZclx21qOzdFC9/NMSRsAJu7YxcAe7LrscrXg406QnOvuXO
         XH0VTBQA1CNJC05YO5IpgEX+UkBQIC3IkSJMZlYjFIruoLX9tWl71Mux5adlzu1blNCh
         bGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706304552; x=1706909352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dGaRcZGZXBVKac7GIu7GBfbJOVUBsye+tLRWwIY3dY=;
        b=dsRgnKqbJkMijWbFcLBOqWCPpSUM4vaNX/LTKri+PO8xZ4ghy+2XOtFzIuPTLH40Jv
         etVU502i9c+UiaDr5MwiUxDE8dS6dOQ8IPoGXi8KcADXinPt3gMcj1JZKI6P5ACHCftg
         cM817j1qmyrmDtDiNpaOJI5buNCAquVSxgFGxNNMW+XGagyV3inF7J9mT+Q1TZui2QuA
         88FVQKvHgDNo6lLxORad60RbRAV2Lfk+OrYKJydtPEOdF6WtDtdzHi6XnVc5jiuR27dq
         X52MxiKZLwoCuaDWGOPOnUmHroogNpQ/8OaeN1OSbbNVNWMGS41QorBeQjLddyTWV4w0
         51dw==
X-Gm-Message-State: AOJu0YwZvhGp6xcqclKZM4nBOIZJ+Ug5IcL1m51DtOckilyTREnF3Fpn
	1kd/vM0GDVPyE85x9sKvB2E+3ksnRsRATaF5eivU132cTn1MKUHGcDOuhGGvuyFpxY60vNXOCcG
	u6QmHmYr5E3b4pqnlUZ2hXaML+Rg=
X-Google-Smtp-Source: AGHT+IGeM+pQ+Cnao4mzrrHgxL3aMLIh3IIoj3QybKfVNw6pv8H/R/tftIwIc8VbdO+9lsAp4rKqVnSWF8w3kXZnZrc=
X-Received: by 2002:a19:ad4a:0:b0:510:106b:3369 with SMTP id
 s10-20020a19ad4a000000b00510106b3369mr218788lfd.26.1706304552212; Fri, 26 Jan
 2024 13:29:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com> <20240102-j7200-pcie-s2r-v2-4-8e4f7d228ec2@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v2-4-8e4f7d228ec2@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 26 Jan 2024 23:28:35 +0200
Message-ID: <CAHp75Ve2K=v=OrNPH0q+K6vp2283HSMBYYSh0hYbw56snGd+xg@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] mux: add mux_chip_resume() function
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Tom Joseph <tjoseph@cadence.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, 
	gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
	thomas.petazzoni@bootlin.com, u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 4:37=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> The mux_chip_resume() function restores a mux_chip using the cached state
> of each mux.

...

> +int mux_chip_resume(struct mux_chip *mux_chip)
> +{
> +       int ret, i;
> +
> +       for (i =3D 0; i < mux_chip->controllers; ++i) {
> +               struct mux_control *mux =3D &mux_chip->mux[i];

> +               if (mux->cached_state !=3D MUX_CACHE_UNKNOWN) {

  if (_state =3D=3D ...)
    continue;

?

> +                       ret =3D mux_control_set(mux, mux->cached_state);
> +                       if (ret < 0) {
> +                               dev_err(&mux_chip->dev, "unable to restor=
e state\n");
> +                               return ret;
> +                       }
> +               }
> +       }
> +       return 0;
> +}

--=20
With Best Regards,
Andy Shevchenko

