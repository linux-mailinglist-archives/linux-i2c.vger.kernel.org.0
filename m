Return-Path: <linux-i2c+bounces-1904-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C4585EB6F
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 22:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2D0B1C23F6F
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 21:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107B2128386;
	Wed, 21 Feb 2024 21:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="drqEE/Ra"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC21F1272CB
	for <linux-i2c@vger.kernel.org>; Wed, 21 Feb 2024 21:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708552513; cv=none; b=l8rVatRPLGjcWvfmZaokOFjTKC5U+aRavag8AWiCU7ks8a2APCPQBcUW3Pjliu1dS9LUOH+Xo03RrpE/pa0CVf96QYHtG7wVP7KMaqSz9W71bERwevFLaciZ+jLkMjLRWXXDIyt0UX1lrkeLD/UxAw3HhYCrPZSbq6fC7ilzu4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708552513; c=relaxed/simple;
	bh=vWHrhgI4Kt8kGUNcvtf3QHT4fPb4OVK0J5B/aX4bSNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OlyEp0/BQPlx0aSStZLeWFFva+uOzzA4Vogi4G1EXJXeZfIXD+XzCpAbIE3h5yKIKogJJ7RhV7s1P88nLHP/w4K+Vtn4SViVSMdzpd4o+DZTfd2BtLgpuJpKhm+v65XV+9vJdafHiUV5BTdE3yKwd9Qk84lnpUOB8Zrhijkb63Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=drqEE/Ra; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60884277a6dso11633937b3.1
        for <linux-i2c@vger.kernel.org>; Wed, 21 Feb 2024 13:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708552510; x=1709157310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWHrhgI4Kt8kGUNcvtf3QHT4fPb4OVK0J5B/aX4bSNk=;
        b=drqEE/Ra7/oHoShJ7/NZDmAVwtS0BWeyxBhhJ8pG0Q+hfOT7/RkP1v4BPHiKR0l+TW
         2pEHKFm5WmwIi9za/fv4FYJimgSrIxuuEs/7MGdBTLj4f3X7E48RBGOjLOwBhjpAFduM
         42tjxlzb8MDXXHi9bR0NOa27f6f6ILYvFdV2v/Sa2UzsetY5ZWkpMYqftkKJqXbgtauK
         WORIW/FkuPGeVWFU//sFhGjZs6bd231h00u9XX95CqEJaGaWxRgtJCStxG/IDH8qVDmH
         Hh9nB/0AwHVFxofSGBzQyKaoahb+eCHVljS8/7bqDQu4+VFfhZo4a8EYIDrzh0t/bdJQ
         lA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708552510; x=1709157310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWHrhgI4Kt8kGUNcvtf3QHT4fPb4OVK0J5B/aX4bSNk=;
        b=PWt5JTP3tBhCvHy6TUoVTYPORev4t6ABUOr4FmSdk0AjMBRsBEZAnIFFILriXoAFwn
         UWYTTEAJswtK+0629IYDRsRAH9TLgw1+5CPM1tTUUQjZkCi3onH8faa5W7iG6BJJ51pY
         j8WczZdRoLfDTEp6DF80B9ojUrLNxZig1eWhU85Sh11aZzEwZhCNnlBt1TiUcrCJcEwM
         Y5UJa671XF9S3JjQ2U61Bw4EDhjPei98p/GSPa4HfVr9kb/Hff91uCoCvTYLEWeuTxW8
         PhaZ98oSmm2UfGFYZ1E1k1VKfsZ7dQQ3m64JG43esdX8Wlqw3yFb3q+RZWl/nnRoHIDx
         784A==
X-Forwarded-Encrypted: i=1; AJvYcCW/Dz2Ld3V4AF6bDZr/2lllPoV+o2aigPoxEVnL4R9QeuuVE7nDwRJjbPGBYpvRV5JNYgA0wTdoEYPdHsHv5whwfoMvPZgoS4Oc
X-Gm-Message-State: AOJu0Yz2xOabpNc2R3TNctA1Z6XApe1h05dZnmRegGrokl4s+qJNX1x9
	jwKmGy7QgBeH8YryODqiTHz7S8sgJ6qWxSnm5iu2g0R8eEJloqzw2uag3cQJSeHKKl0pX6uYeG8
	ZD256Qb3n8A144w3TFFyodxekMhNaqxH/kfEoaA==
X-Google-Smtp-Source: AGHT+IFG7OkXBXjbNPYxfp6BSZzFgHptfq8O7pHlOruVpRLafhQo6wGBbhxmoAykBBf2wzpi0CwmDlGUgveqYfQh/CQ=
X-Received: by 2002:a81:8341:0:b0:5ff:796e:481f with SMTP id
 t62-20020a818341000000b005ff796e481fmr18807228ywf.11.1708552509905; Wed, 21
 Feb 2024 13:55:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com> <20240102-j7200-pcie-s2r-v3-1-5c2e4a3fac1f@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v3-1-5c2e4a3fac1f@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 22:54:59 +0100
Message-ID: <CACRpkdYSw5_70H4k5ZX-stCU=CH=v_0Ggm+R+FSBhdbk6mnhOA@mail.gmail.com>
Subject: Re: [PATCH v3 01/18] gpio: pca953x: move suspend()/resume() to suspend_noirq()/resume_noirq()
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, 
	gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
	thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 4:18=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Some IOs can be needed during suspend_noirq()/resume_noirq().
> So move suspend()/resume() to noirq.
>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

