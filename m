Return-Path: <linux-i2c+bounces-6411-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AB0971B3F
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 15:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDA8C1F23178
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 13:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E6D1B6549;
	Mon,  9 Sep 2024 13:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WPthbrET"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B591B3F24;
	Mon,  9 Sep 2024 13:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725889206; cv=none; b=ESGsinf4x+en7A3UnP72izv4AaFxkQaJjcBXu2YRsVpNXJDZ8L8zbEWPFfWdPA5PIT5cJ/Ma1by+GTtI0p3V3HVE5vVPWseHLwJYYvb7MK9zDBHFVIv7kosSoAY8RqMH1VCQ5ku96U8xOy4Dwyc9GCCAigw+JdM5F2mlXH2YY8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725889206; c=relaxed/simple;
	bh=Tpyqc39hrzAjis6+P8WgTXgdaQurNGexyly7YtKG7Hk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdULsvVOZQpsfYbohOJWDA7j2RQdrcrSTg4moU3k3p3EjEKiSrD5U/T4QOpzmWj+QcSQUeaMbLNVNSjLOmLNopKD76cvN21qaEhKwiz2Ea5bWhNQFUglvENzu2Qet/Bg9ZZ7+YtpRGsNhJpHjGWor/d1zPStiAZIpJhGQLn43/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WPthbrET; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32409C4CEC5;
	Mon,  9 Sep 2024 13:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725889206;
	bh=Tpyqc39hrzAjis6+P8WgTXgdaQurNGexyly7YtKG7Hk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WPthbrET7bEwhj+hje1ceIsvBOUqh3bGeW4zvSBtP/SEFXXWATRhWEQvsnksU41nZ
	 wJyHucdt29bvOldCItLc0f/RgPEsbuzYAj4czMeYAPxbx8GnKGyRylxQ09iwJBwllp
	 VyRgUDGe4FzmKDQ9N1UncaCil86Ujb4YicU64zwIUTsJYIs5e4fm7s345nrP6jV2Uz
	 feHPrTHtNw9WIgS7IKPift9mohHhbfkfqPpjh0PegHoJnx22jLTFJu9KApzX0hvrxY
	 YDWR1MvsRR3dUKr55Y5cqEum65CFZqa6A+6LQD0NKKb9GwY8qxq2JqKe5hKefrYm9d
	 dWp7IO0vEdeIA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-535694d67eeso4287623e87.0;
        Mon, 09 Sep 2024 06:40:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOnILt1IOmDaHL2d/eFZH8RvQ6OeT+on8JUW/h7/hkSerYIeHKyUAdOOROeIixcP09p58psLaTTK6DqIMt32px3QM=@vger.kernel.org, AJvYcCUXh86jozI0/FQRDePPDVyD/RTkMblIok3KRhrqB0NQXrGXHeD67JSK+9tHgJs99JE4Uzlmg+m7TFK2p3W/O1k=@vger.kernel.org, AJvYcCWM2w/tyEbY99sYAv5o5ahp1Qp3MvdcJQwFUl1SxkszP75sOQmid7GBQ/51GH8oPIdKgeUox0rQe7S4@vger.kernel.org
X-Gm-Message-State: AOJu0YwdyFOClozwuihZOY3LIelhGpNSawepLYplD+P8hPNLBmtOpeMO
	j0DB6H2o+SuSUJpAJmRKh+RUezUuVhrn0N/G32lHgR7yJwav/wN3sB7A2twdmkICvq1OhFytFgk
	bY7SwjcorW3+s/7Mxgf7IvJTItQ==
X-Google-Smtp-Source: AGHT+IFhUa2jm3fk1kYgf/MC67YdoMrMwtnekkOZYb0WhVDnCOmTfiNWPWdXRHkera5Sq0pzhJJxh8Ftlmjz/g5+1wY=
X-Received: by 2002:a05:6512:e97:b0:52e:8161:4ce6 with SMTP id
 2adb3069b0e04-53657ff58f7mr3628003e87.25.1725889204588; Mon, 09 Sep 2024
 06:40:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909105835.28531-1-wsa+renesas@sang-engineering.com>
 <CAL_JsqLui9=K_LdAoEAibxRo30_2ahdGXhCW50ow8rcqCp6jZA@mail.gmail.com> <CAMuHMdWGtuAuQ3M3HonY8zfODTTz_izV6g9555iwuPLSY+P9_g@mail.gmail.com>
In-Reply-To: <CAMuHMdWGtuAuQ3M3HonY8zfODTTz_izV6g9555iwuPLSY+P9_g@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 9 Sep 2024 08:39:52 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+cFb56e5WvipL1nR-0TDz+v6vnFDvz9F9JbXinxkEt1Q@mail.gmail.com>
Message-ID: <CAL_Jsq+cFb56e5WvipL1nR-0TDz+v6vnFDvz9F9JbXinxkEt1Q@mail.gmail.com>
Subject: Re: [PATCH dt-schema] schemas: i2c: add optional GPIO binding for
 SMBALERT# line
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree-spec@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 8:31=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Rob,
>
> On Mon, Sep 9, 2024 at 3:07=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
> > On Mon, Sep 9, 2024 at 5:58=E2=80=AFAM Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > >
> > > Most I2C controllers do not have a dedicated pin for SMBus Alerts. Al=
low
> > > them to define a GPIO as a side-channel.
> >
> > Most GPIOs are also interrupts, so shouldn't the existing binding be
> > sufficient? The exception is if the GPIO needs to be polled.
>
> If the GPIO pin supports multiple functions, it must be configured as
> a GPIO  first. devm_gpiod_get() takes care of that.  Just calling
> request_irq() does not.  In addition, the mapping from GPIO to IRQ
> number may not be fixed, e.g. in case the GPIO controller supports
> less interrupt inputs than GPIOs, and needs to map them when requested.

All sounds like Linux problems...

> See also the different handling of interrupts and gpios by gpio-keys.

I believe "gpios" is what was originally supported, but now it is
preferred if GPIOs are used as interrupts then we use interrupts in
DT.

Rob

