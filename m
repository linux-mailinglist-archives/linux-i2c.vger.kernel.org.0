Return-Path: <linux-i2c+bounces-12959-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9D0B59015
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 10:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBEE3481A4F
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 08:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E3628134C;
	Tue, 16 Sep 2025 08:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyE619/e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2DF28643D
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 08:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758010293; cv=none; b=fS++a9yXxYfggAoW2jD3gRMDTV9bjFNJLeehzFBgHPXQ7hNfeJ66eiacOx3Eqy+JY3humFZQFM9znLwcatBysy9/62uFYM5HekR0iFLjkIxUh+jo1P1HyNpCzAG7r+E6/SYGxzoWraw9Xg2lSEW/yJERs4mxyH1LgaDIMeoDLKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758010293; c=relaxed/simple;
	bh=HyfOs7rbrqIWkqNzUpNMAaZLN/rofAij+yVLXi5+pCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p/SKW7rQVQPXdSFObaBDT8bbjFgZkb9zDmJKxsOrbH1/IKuwj1iXm3cnIpo3ESLFRGngs4lrjU+/22y0RWeTllyLQ9H8QLBPpqsP2OS4zbRz/VHHp97M/tTdFFnm93ki18vzsiKMSSeKRygu7Ijf8BtRY0I3lLbkFCSAtHhTddI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyE619/e; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso45204125e9.2
        for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 01:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758010290; x=1758615090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZZORlflm4LecF9/7KAxcGVbVXdKEFLgc7zSGL4QiDQ=;
        b=FyE619/ekNoM2cBJJesnCrJFqk1gzaO5s+3bZDrODZx1VANC213nn/EDNtF4Q4/9cJ
         saHAMyFT0wKV2dTG8J35qDVfvLfXEGYaWvVsISBaMU+nrPAnSnQyrj5ISGdnYRNEToEq
         mBJYioqwU2I+AGfrsDBVqNVv/lxSQJIhhcd8Ec2LJ0AVHxNzCiORbeYoZg6dnOEi6B9L
         VaUEE/gOYehHAhcs28VdzD5g6t0uZqGcz0EdRaCks5ME8V770gOemiQzUoFPV1a9YYej
         DfvgcQoeXrIBEYM4uhnLQ6R6LNG0gmIdxQK6wCk3Gr60QdxAWqETNt4rpLOuiTisatuz
         Qtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758010290; x=1758615090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZZORlflm4LecF9/7KAxcGVbVXdKEFLgc7zSGL4QiDQ=;
        b=sPXlwMxznTrKH8x6mGc2KV2Ph3AdqgVmkaOthyztjRZ3lpSL4ks2PzHvddnujGN2l8
         AVMNsIgKsweJN+EfOF2xlvpZ53YV5A/yzetdTp9X3hZE9Ap7JJiNYiqTC2ci6bQCz2QY
         Q+1nGkxM4J9kc9pPwC1DSSQH6stX+5XvNBcHAe3hg81WVwvBnSY+rYPO1RCKnnWYwrZ1
         PKnvM/RJGYUHTDh5KeaBvI7c6DPGqZVbrsnFh7DkIYGk5Xdq1ppWhcf0fJxiNYxS65CT
         ru5x5jOz3Xwx6m1A63RAk/TvVAHeGrSDeB7ZBjsNiuvLAUfyq8ZQyHMxW4/nkKD+8Gl1
         CbLw==
X-Forwarded-Encrypted: i=1; AJvYcCVCMCYVcHaDsnoIB/rSyT/nfCtI5fxhm6tr+SwEgPU5tqUM0NNOzu2I7IQEVSo1t13mwAhmrxrlMxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJz2gCN0cm4K6JOQ9r//VYvrw5NgAHn4+wltiw4aynUxqVR8jK
	bxTAyZzu3VTx4RJARWGwsyNcSk1FUSjBURV+NNwFjuotcTsj/+ZZKL8pSua6EgnTkxsrpiGl+bI
	guVsrISfDGzXOSoBpJMrR5nlAz+IX/HU=
X-Gm-Gg: ASbGncvCllzOyt+OvlBljI2tflcxU4qcmrRrrKVzNI6n323608sl4n6u9i+iiUjXzKC
	JdrN3akTgqgGFmEorOICvHWicWEMDQISjhlIFht9uFhMythmF7xhiuv1Fc2YjhSGVuabHOySNSV
	5TEO9hacBdQiWrJ0NG0mAsMmZIe2gPhEdXP3IzkL6JPU4wBDsGlT1vEZec8fa7udRdScCWoSkhM
	E9hp4Iy
X-Google-Smtp-Source: AGHT+IFqLEMM72PchwIu85GLmuVTTpcOHaMo1tyv7F4Po+jfn8jzAhB3sLa3AaeijxW03w2RP5MM6waIv1XXZtoBSHE=
X-Received: by 2002:a5d:5886:0:b0:3e6:116a:8fdf with SMTP id
 ffacd0b85a97d-3e7658bcb87mr14615901f8f.13.1758010289683; Tue, 16 Sep 2025
 01:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915060141.12540-1-clamor95@gmail.com> <aMf6DLr8pTCP8tKn@shikoro>
 <CAPVz0n3m9VOV5unVHhU67XQnk4jckA+zyJdCHXu2fFxCSht4JQ@mail.gmail.com>
 <aMgzzqhXeOi5cn3f@ninjato> <20250916081955.2826c6a8@bootlin.com> <ffa2a954-d161-45f1-a83f-509148be3b6f@lucaceresoli.net>
In-Reply-To: <ffa2a954-d161-45f1-a83f-509148be3b6f@lucaceresoli.net>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 16 Sep 2025 11:11:18 +0300
X-Gm-Features: AS18NWCT5GhXoRK8bMJ59n5EJHC15a_WloTpuyCeHJD_J5GBYxnxIFrz9tOt418
Message-ID: <CAPVz0n1aPWZhmCAft_58-eVaynhxWJRodEzuLE8aqWqqGQHR=w@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] i2c: muxes: Add GPIO-detected hotplug I2C
To: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Herve Codina <herve.codina@bootlin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Rosin <peda@axentia.se>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 16 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 10:50 Luca=
 Ceresoli <luca@lucaceresoli.net> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello,
>
> thanks Wolfram for pulling Herv=C3=A9 and me in.
>
> +Cc my Bootlin e-mail address
>
> Il 16/09/25 08:19, Herve Codina ha scritto:
> > Hi Wolfram,
> >
> > On Mon, 15 Sep 2025 17:42:06 +0200
> > Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> >
> >> On Mon, Sep 15, 2025 at 02:53:23PM +0300, Svyatoslav Ryhel wrote:
> >>> =D0=BF=D0=BD, 15 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 14:3=
5 Wolfram Sang
> >>> <wsa+renesas@sang-engineering.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >>>>
> >>>> On Mon, Sep 15, 2025 at 09:01:36AM +0300, Svyatoslav Ryhel wrote:
> >>>>> Implement driver for hot-plugged I2C busses, where some devices on
> >>>>> a bus are hot-pluggable and their presence is indicated by GPIO lin=
e.
> >>>>> This feature is used by the ASUS Transformers family, by the  Micro=
soft
> >>>>> Surface RT/2 and maybe more.
> >>>>>
> >>>>> ASUS Transformers expose i2c line via proprietary 40 pin plug and w=
ire
> >>>>> that line through optional dock accessory. Devices in the dock are
> >>>>> connected to this i2c line and docks presence is detected by a dedi=
cted
> >>>>> GPIO.
> >>>>>
> >>>>> Micha=C5=82 Miros=C5=82aw (1):
> >>>>>   i2c: muxes: Add GPIO-detected hotplug I2C
> >>>>>
> >>>>> Svyatoslav Ryhel (1):
> >>>>>   dt-bindings: i2c: Document GPIO detected hot-plugged I2C bus
> >>>>>
> >>>>>  .../bindings/i2c/i2c-hotplug-gpio.yaml        |  65 +++++
> >>>>>  drivers/i2c/muxes/Kconfig                     |  11 +
> >>>>>  drivers/i2c/muxes/Makefile                    |   1 +
> >>>>>  drivers/i2c/muxes/i2c-hotplug-gpio.c          | 263 ++++++++++++++=
++++
> >>>>>  4 files changed, 340 insertions(+)
> >>>>>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-hotpl=
ug-gpio.yaml
> >>>>>  create mode 100644 drivers/i2c/muxes/i2c-hotplug-gpio.c
> >>>>
> >>>> Adding Herve and Luca to CC because they want to achieve the same wi=
th
> >>>> their I2C bus extensions, no?
> >>
> >> Sorry, a misunderstanding: the question was for Herve and Luca. I want=
ed
> >> to ask for a comment from them if this is the same problem (which I
> >> think it is). The question was not meant for you.
> >>
> >
> > Indeed, we try to handle the same use case.
> >
> > The i2c-hotplug-gpio.c driver handles only an connector with an I2C bus=
.
> >
> > On our side, we try to have something more generic that can handle more
> > than one I2C and some other busses and resources (gpio, pwm, ...) wired
> > to a connector.
> >
> > To move this i2c-hotplug-gpio to our proposal direction, this should be=
come
> > a connector driver with a i2c bus extension and an addon DT describing =
the
> > i2c devices available on the addon board.
> >
> > The connector driver should monitor the gpio and apply the addon DT whe=
n it
> > detects the addon plugged.
> >
> > Also, I am waiting for conclusions in the export symbols discussion [1]=
 to
> > re-spin the i2c bus extension series.
>
> I just have one question to add to what Herv=C3=A9 wrote.
>
> I guess in the big picture you have a device tree where all
> hot-pluggable I2C devices are always described, but they won't probe
> until i2c_hotplug_activate() adds an adapter for them. Is my
> understanding correct?
>

Yes, your understanding is correct, i2c_hotplug creates a i2c mux from
parent with a set of always described devices by GPIO signal.

> If correct, this implies you can connect only one type of dock. Multple
> dock models with different peripherals cannot be supported.
>

This configuration is used for ASUS Transformers and they don't have
multiple docks, only one accessory is used and it is not swappable
even between models by design, not even talking about different
generations. SO configuration used by Transformers can be described
just as title says "GPIO-detected hotplug I2C" devices are fixed just
can be detached, but never swapped.

> Best regards,
> Luca
>

