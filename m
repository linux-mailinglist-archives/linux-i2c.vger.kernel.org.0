Return-Path: <linux-i2c+bounces-7578-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5E89AFFF8
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 12:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69A461F21A93
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 10:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614D31DE2C2;
	Fri, 25 Oct 2024 10:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+BNIVoM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C591E1A39;
	Fri, 25 Oct 2024 10:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729851741; cv=none; b=fqmYeKruNN3W30eUzUgUW6EMjKWZXh/nYQUinoOP4FNvyGkCxtedRC3KhiICy9Y3IjIrD9MF7nA6XNXlwdWQrPfDb7Lwj61N81xYBa6MV+9ZmKwA5RNBwlA6cvWaEBSA3m2P3PERzMS8P32vqytBZ4KXRHZN5j3w8x42FwcZ50w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729851741; c=relaxed/simple;
	bh=Ri04p8c+74JpkpWGBKlQF7nqMg26O2ywe4tODvk0CsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gb5NNCCPBP9EW+bGUbkztPZq2jwb/M13KsPKATvk0Eq2TOtPR6kJKsxqWVHqxJ1OTaVo7////Sr+WdoF504u0E47vCWXvBna1aN3gC1TH17XN9r+d6zkhzN6bpUHZlk4+scAXBpvPlmfZOO0UTF9bXhxSIo0hb5T+HQFgEcYSMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+BNIVoM; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e29327636f3so2143650276.2;
        Fri, 25 Oct 2024 03:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729851736; x=1730456536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egxANw4xcQVXGYyfOo/xqAjD9VUPgC2DhCZVR2sLk5E=;
        b=B+BNIVoMDrUbvrEJHzntyK//m9K5V8sFF+T6s5fdVSiB2BXi0eYiaTEP/lfip+5pZV
         9NS/JoiKvuJtK63dUIFBgTybQFiDHG4jzz6M8cqFhb6DkOogy3pI5zca4Cuk2rKZFXkk
         hjt2Fw58O4UA3fE3MGcKaomVeAwaSCUOgY2b13oiVyv1mi5fyIJkPqY4MC6cxK2xAdad
         VLfK4EAj7h0o4M4qU7wW03aGvtMojLk8Mo7bgZfdZPe3OUY6H5WdBQ7o7R9Wh08LzdPq
         FW2FH6dK2e1Cy8SdC5DRNPpfNU/JjrIZzdBm2jFJq/U991rSmX9h2bDM4nTvu6EmLQTk
         wxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729851736; x=1730456536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egxANw4xcQVXGYyfOo/xqAjD9VUPgC2DhCZVR2sLk5E=;
        b=XmS4Sn0q1B88vP/SIKZiy3TvLVJ9cZVww6AhbNuRDz2UkyNXMkAqgPJT4Nd8unMFco
         DaUSsuq7zX53pPJbxM4ugnqtq5I2dEC+ikQKytvYyf4wF3Onx49H8m6XMd4tGHARIMZk
         UaTGr+9oF/eucnUi3WY0vHrCTBJhNUu03fNAZcksmXs6EV/ZERQjOwVcE/0PpEp5sFZ3
         bAUVN95vMjvIqSmPFxfDzCh9ZmFRi3YlfY6WWZnYPC2+2jjYSpdV9au55drpy9g2cXbq
         VbPC+M6yeZn/y2JQfm7S4ogix28T5YtxFtREFlqbPokxuqDjUeHj6UpH8/TH3VZ20ona
         fWcA==
X-Forwarded-Encrypted: i=1; AJvYcCUAVvpyUJAK9sAUGISlaOUpKeYPiLSgZQHxFmqEc8WjXxnJLXUhDmt2LvLHEvTkydJTMkxf+3zB45h+mtcYKrU=@vger.kernel.org, AJvYcCUhCZMmpJ+mTIxYn/lm2dChbUoEW9S0kFKDiBS3eENIr8AsYw+0psv3fJyevefx1UXfZnrYYFoR@vger.kernel.org, AJvYcCUnI5NAvF2RZHRs/NL3oEwPgZ/6ri12vPu+SaQcuS31Pyz66KMwoW1mgCJgCX5oN2vPGlU8uZTh4FrViw==@vger.kernel.org, AJvYcCVCFHTk8aHBPPcNENjaTsaJHxlFJs8v3Kjn8XdaK5kb5Sw/xtW9V4ausQpCWa6hCsblchPVsvvjb7qv@vger.kernel.org, AJvYcCVbroW+gJhkIVJYhheLaA2rqgZ939shILVF16IIqNasSzkAi1aNOTTAN9/Qfe381eYDgwFaSb6mFz3L3ov+@vger.kernel.org, AJvYcCVsMdKjh4GiqMjEf+EmS8eK/jpPNkoA6clYj0hTkhiNTWbz6hLdLmxOponfJHbs7q6m84J5r1t4GVjgT0Q=@vger.kernel.org, AJvYcCWNzNvwSPkD5ENYWG2KVdKUAzafnYgvxPne3Oi8t4rD5jdU8ezfNFasvcock7KH2XRi3ap2nqqJnAUr@vger.kernel.org, AJvYcCWmmbIhCzF2MPw2I8RxR5Rxp0dXce3cMOg3TKR8FRZ9Egw8gYRinHj0VKsTzsfqPPp6TiD9l+t+75J6@vger.kernel.org, AJvYcCXUpDyHKDrkfU8V8hFRmJpR9niEJyhjuO20hsEyXGtS263+KOBycN7aEuNe8wgP74fS9miRlzNVWvfs@vger.kernel.org, AJvYcCXxFkj+R9hKa3aK+QAiM1hJ29hnqkiF
 tHxX8NyD3WSlCk9+QE9DNZIpCqrl+XblNloq+wGXKvCzfK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUPO9O2HPZKf/8NpXaq5S5rSd7DD46cyAxfsPiTNiKYyrNsrPw
	Anda1z3ihNio5lBwZpskmailqGulsk9KLDFuWMJOanU9Vaug7LpKSj91qz05U1QxgspKLuMvrvh
	CfXxoKlbLg30isMeDHTcU7TH63pI=
X-Google-Smtp-Source: AGHT+IH3v4SaWhNp1hwnLppS3UubIZYZaKnW18HDGieOhvA/WGJAvZk7jOM/do8hyF9713Ote/QjLu+G3CqO76kawwc=
X-Received: by 2002:a05:6902:150f:b0:e2b:9ae5:5bf7 with SMTP id
 3f1490d57ef6-e2e3a634fd9mr10615558276.19.1729851736203; Fri, 25 Oct 2024
 03:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-2-tmyu0@nuvoton.com>
 <20241024-adventurous-imaginary-hornet-4d5c46-mkl@pengutronix.de>
 <20241024-pumpkin-parrot-of-excellence-299c57-mkl@pengutronix.de>
 <CAOoeyxXX2fpHVJ8urLmy+pBjH1aRdYu6qrtwOmwUxTUyQq30DA@mail.gmail.com>
 <20241025-sexy-fanatic-snail-a1d2e7-mkl@pengutronix.de> <20241025-dark-efficient-bird-6b09b9-mkl@pengutronix.de>
In-Reply-To: <20241025-dark-efficient-bird-6b09b9-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 25 Oct 2024 18:22:05 +0800
Message-ID: <CAOoeyxWC9Yd_mJhMFcHxtwW7d7oOVsSsNCb9wejj95RiiVQY=g@mail.gmail.com>
Subject: Re: [PATCH v1 1/9] mfd: Add core driver for Nuvoton NCT6694
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Got it! I'll make the change in the next patch.

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B410=E6=9C=8825=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:02=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 25.10.2024 10:35:35, Marc Kleine-Budde wrote:
> > > Excuse me, I'm a bit confused. Is there anything I need to
> > > improve on?
> >
> > It looks racy to _first_ add the devices and _then_ the workqueue.
> >
> > So the obvious solution is to allocate the worklist first and then add
>                                              workqueue
> > the devices.
>
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

