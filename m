Return-Path: <linux-i2c+bounces-7708-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C70319B8B1E
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 07:16:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AF40282414
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 06:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA9514EC55;
	Fri,  1 Nov 2024 06:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+7qA85W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F2E146D45;
	Fri,  1 Nov 2024 06:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730441773; cv=none; b=ShHGNanyNGGjz6mUwOTVmrQz/nCmM+VlPcQGGSHiRQIii252XwBMTjYW+zkiBM2e/5rgM9W6zkhYG/TvgQDsn/i/d21VuE5cUtt93qXz95VhkWvdEZWd4ZROIvDHR/2p0JEuKdPWE/TjR1/k2+/GUubaRdBb4g/rrjtphjkKk7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730441773; c=relaxed/simple;
	bh=a7gaRvcsFk7990BgLEMKrwpaq/uiRRcp9jkHGSR92BI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oEruR6D/7CDIPYiB2DoG3HdQ9ifmrWHIU0iuZmlSfWYhqIkE0m5TCO/mCSC5FD/lndsCo7Uz+TipyiFAXrmwwuVzSMKadCk6QcjEIaWSNDMnKbUa3odDfljKmcFTwLZjRnmD3VItzfhHntS24N7IrKjl1I9MKXTtGsk+1RIs3VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+7qA85W; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e290554afb4so1869905276.0;
        Thu, 31 Oct 2024 23:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730441771; x=1731046571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7gaRvcsFk7990BgLEMKrwpaq/uiRRcp9jkHGSR92BI=;
        b=T+7qA85WAX5jK3hEFj9YDnQSf/giHGB/mf5YmJ17lXrCocKr2fNxlF5ZaACob2xq++
         vKXgJKLtqn4m+Z2HK0s8qT9LiYWkSUeKhbkocSo9UehL7mFQdwb93whltSRRmwFtEMGG
         1EW+UCfRQTFCyUgeU7Sz2CNxckms5NxsQ1su8KmzoyvoDK+smsacjnxuFIsjJvOmsZx8
         EhWmhWufbkcO+k4vbL2QyHV7ZiBmoFPyZUZnpYTqcvG9xlrnbplJqYR7O/0vdX5UoIW5
         ByFDrbC75N5WoNpllUNN65X3MT1yHO+e+fewyS6R2BAmj5eRG7VtfuGNOp8raXp/l01R
         aSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730441771; x=1731046571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7gaRvcsFk7990BgLEMKrwpaq/uiRRcp9jkHGSR92BI=;
        b=rwgpvDQmVzvoa32jE9YgOzKYyO0e0F3LgJfjsmZs4XIdsSdIyo5FKfyOn52nYLNzmo
         H7ZU7B0l5iGtbeaszfN0GXMS8E64ioU/hTVFv/kxM5uf2Yn8Us+TOcWeYw/x2LYWLUw9
         M7MAWZrPUmOzyoqhINMViVsk+mcruXHZGmXZCObI+XSRJw8cak2h1Qo7sHTwD6zoWHxA
         6SkQa8CD9qvf55ZXlT2dCa3NM1wh1a3ESZNVtnWGtmbALMHNOj0PhdOvv/eh3tIRyIwb
         9KMBSED7ZQc73AwjFnWJO3v/ubjemPNcW0pRaiqha96pc+Y38z9rFMpSyObGiKBIeQO8
         QY/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1sMvc3n/ZuPv66+ba5gQLh3/+kq/CtTJUC2/03bFtuwe/60UsvMmiTEUxT8OGqm+38q0NYRxh@vger.kernel.org, AJvYcCUCx95UwCIr5ZCWKNsJfH3pePJ0Ez+WzRNFoe0dli+BiOHgpsS3UYaAhT7zaOr0/qzdj1/+SM86xWp1X6I=@vger.kernel.org, AJvYcCULzWCz/It5QbJHQoBotEIUNjUQApi9UGnXdtc/vSsBQq/r3AWmBMhvb4kBoEOYkL9iy/xIVAbLgepe@vger.kernel.org, AJvYcCUQikgN4lUAwAwDH61LL9ljCGSbQav7Fm3qMKT65jPzCfVvxDk0xvRxkAWf8S3G+6nV4+svMdEstHrmv2+A@vger.kernel.org, AJvYcCUfZ9Ele1myXUTjJzI497aGDEjUd3CjCSsvyGRfCJcgRRhxMPj60yMbV7ISl8d62TF3wnzbb294Ydbikm7ndLw=@vger.kernel.org, AJvYcCV+kSvEzuZA059Q3P034Jq4xxnIGVpNNgeae3fsUEDzZczDw/evvN841xXb3yzZG+UtXkaQ5CertIhN@vger.kernel.org, AJvYcCVkWK2yK3iRZgVYM9ljtyuCHh2jxURWzH1LH6xK44YYE6bkhMWC+fMVUDPv9Q7tt7Wxf0IbO7rzx/aT@vger.kernel.org, AJvYcCWj1AyzL1G3J8WbSEAu/P3LzgxKaCrc69osF6ruZTJ00g9wonElOFVOl6pBH1Sw3GazlyJomIylUE7h8Q==@vger.kernel.org, AJvYcCWpokYfRiebrKDWDlArpTZtIIjbfjIW/NpkGeb5hNFNjR4jGVsrI3D4lg1jaMLtDwJjyVE/q9xmCqn9@vger.kernel.org, AJvYcCXHvN8ES3MqGfIK1EyFM1LvYpdoiusl
 Bbbt44kkUho9nc3GeRx3CGYkXuB3SyM3RTZgUL/Ip2B+VG8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6dF5STPBTz6pPDByyLKINCuy0Y/ow7jcshE+6wQgzFhOWd6Dx
	5+pxncY3En+N/e8/D8r/bWZ0q95TB8Uh73d9MbqPGPirlHpdOaFkbACZDlKfIT8saoLNodgdf4C
	jHcGCGjLz0dwY4lJzJjde6fuJfq4=
X-Google-Smtp-Source: AGHT+IFqMKdP/PNKGwnzDQJmnqEp+I7YNFa7RnoAoYOmar2xUzZgcR5eeFveEUZVqb1Er5ED63rd6vgk5E5KJ56d+nU=
X-Received: by 2002:a05:6902:33c7:b0:e30:e0ab:8eed with SMTP id
 3f1490d57ef6-e30e5a3e0eemr5326265276.17.1730441770787; Thu, 31 Oct 2024
 23:16:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-3-tmyu0@nuvoton.com>
 <CAMRc=Mc+SZN=EytxY=qA-qBEAY_F17GP-7FRE9oLojLbdUoPaQ@mail.gmail.com>
 <CAOoeyxW4=+5-QMcd_wgncFC9jgx_1Zf1Tq8RTnBvVqZ1JcUBQg@mail.gmail.com>
 <CAMRc=MexqwSCDrsBS0mK0fo_MCwngAH9XVgjRuDQjw0TVUBmPw@mail.gmail.com>
 <CAOoeyxXRrDuKJRMb3O2h3BF1vC=pwNN3DKfnEN9LnA+jiBCTQg@mail.gmail.com> <CAMRc=Me+R_i1WxFGeVe-MRREGn1YJvUon73A4FHDOPgs8wVaCg@mail.gmail.com>
In-Reply-To: <CAMRc=Me+R_i1WxFGeVe-MRREGn1YJvUon73A4FHDOPgs8wVaCg@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 1 Nov 2024 14:15:59 +0800
Message-ID: <CAOoeyxWo5CjJooM1nG_0Z4ZMaWmcDtt=ysRC5Z6JnpZ7cTcL7A@mail.gmail.com>
Subject: Re: [PATCH v1 2/9] gpio: Add Nuvoton NCT6694 GPIO support
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, jic23@kernel.org, lars@metafoo.de, 
	ukleinek@kernel.org, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bartosz Golaszewski <brgl@bgdev.pl> =E6=96=BC 2024=E5=B9=B410=E6=9C=8831=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=883:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> > > No for line names - as this is a dynamic USB expander, I'd suggest to
> > > have them in the driver and assign to gc->names.
> >
> > Could I create an array to map each of the GPIO pins?
> >
>
> Please trim the quoted email to only the relevant parts.
>
> I'm not sure what you mean by that. There's a field in struct
> gpio_chip which you can use to set the line names from the driver
> code.
>

Understood, thank you very much.

Best regards
Ming

