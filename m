Return-Path: <linux-i2c+bounces-4520-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D44B391DDA6
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 13:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02EB21C2189A
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 11:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECB012CDB0;
	Mon,  1 Jul 2024 11:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dFretxN3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B704F1F949
	for <linux-i2c@vger.kernel.org>; Mon,  1 Jul 2024 11:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719832580; cv=none; b=EqLxix3PyxS/HQuIUcHHjguSnWAzhPnRRXMFIcnVeuGcUSoBRdY93crtWXvy1YZnLDOPa9XrcK3KOOzUMZtQBc6F5VmlY1IxHigMqOU7S2LLw3GFFnPW5inqRSOz68YB35j2ZA1ltnebfKdf/wGs04zKWEbEeVXfbISe9b80DWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719832580; c=relaxed/simple;
	bh=aUmHFmCj00nbSQPlvA2WR19eWFxTbT4x0o2bCJLAsMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7MVdMTgXHleInKG/r4uddQdgWWIrSE1qRPp0kg5+mbETUv0BReyeVBrc9Ly+HJe6PP0kIEVKoJ1D20UHwDN/Msh6o3W1wNBcgTK1U66n6p1kLd5Zd0QUo+qrFBCAEX1JQTaj+iXEPHc24V7+I0ODnB58YFjMbG0PVzo81vv8sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dFretxN3; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52cd717ec07so3582158e87.0
        for <linux-i2c@vger.kernel.org>; Mon, 01 Jul 2024 04:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719832577; x=1720437377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiTqHtixONqyEPfUYaZyZ5XwiBvCrwsHRC/9NwSSQuk=;
        b=dFretxN31ooV7u5zrBSu9x1RXrlgxfQqiLM+RCixX/cHpSoAPigzhQx4JM6YfXQcN7
         RVNoCQscjLfTa2X8czESI3roBtkiX2eTSaSQg4mfhAfKBDtw98nnoJ0ix1OUF0k018q0
         3Zhjj2RAcvozGh8FBjr2sIyPYId8xZgL5QaospRNIR5T+vMRZAwfxEIIDpNaOmdjIDgs
         ljJ7sFWSUbEy76iRPgMpbMr+cu6XjlQdzzRaQlS9+O9fQ9F/t22CdQziBX1i4zicc/fS
         g6IIpKcnNiJwzMY8clXNUZzY0qPUbKtwv32Is2XOYKuRcish6f+gSoYOfRME44l94Z+f
         aWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719832577; x=1720437377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiTqHtixONqyEPfUYaZyZ5XwiBvCrwsHRC/9NwSSQuk=;
        b=tXiOhJxiU2fnVOOA13Bb97hKkikuHzZHm/olQKn3a7fDCYb3chmeRsD48EY/BqiTLD
         vmgusc0WigEkhsAd0L1XhbBMpPrxMfj4W6TMPmWAzNAEb1kTyng6T67tfpXPAuqZUXGQ
         LMG6ZwogloPIp533JOs7I77JexRggE8MWt0s1RWyFKJJWLH9lFZ4HKI9adHJgcirIifT
         BDzeQRx+yqzMkfMz27Kk6XtsDCPG2VD0GlZRFah7jZb6NwttL2u2Tiq7aLZmSr6gW3YH
         62+wXxiN3kpWkPTKBxQ6uEOYEYaFfZEDDWHttewgpwi6HIQiqq7BTFa5nE3RDDQpMlLX
         xISQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLHzwVuK3DZvuNRhX9kJQ5jJpWkbmUec4Pb90vU6HNlDkJZ5t7+/nUSxcaPfdw+7c7Jcl5EjARk2Nkm6qn9/K6z13cT+YI6RQT
X-Gm-Message-State: AOJu0Yys+cN4qggWo8r0Q4bZMzeEIVOv+PokjqB5+5uGseBXjfu4o7K7
	fSKfo2RMYU7XpZUglac5isT0S6EpVI443ErPPvE7RrOh6GJXgakAxCXSp8cxKpy/ERTyXx+7Nmc
	BnYm8Nn0G9M3B/AyImpl/ywpA+hdkYhgrbPuExw==
X-Google-Smtp-Source: AGHT+IFZQjK7geifJ09MRCpbq8brbTyrKcPuKgZAiXAm/M2ljIsoMT+3i7x1VgQPpeH0MNSsnPaG1VF6VOFIScHpZIQ=
X-Received: by 2002:a05:651c:1033:b0:2ec:5488:ccaf with SMTP id
 38308e7fff4ca-2ee5e6bc337mr36386171fa.35.1719832576733; Mon, 01 Jul 2024
 04:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628080146.49545-1-andrei.simion@microchip.com>
 <20240628080146.49545-2-andrei.simion@microchip.com> <CAMRc=MeJyByMvcFT2aJDK87bz4=+UXEuMtQ4G4MZUAUt39SS1Q@mail.gmail.com>
 <67d3646f-1b84-4d2d-9e36-be898f13be90@microchip.com> <CAMRc=MeJM4LmczCbZ8bKytLZKY_mP=Q8eaUprLMmO8BYHecStw@mail.gmail.com>
 <c1b53308-d1d5-412b-9558-9f40dd237397@microchip.com> <CAMRc=Mewx0NAdFBX6hpes_oa62M_Jp=LtzAPK73tZv+tKxnScA@mail.gmail.com>
 <dbba7a80-dc91-4685-bb62-34503eed1a02@microchip.com>
In-Reply-To: <dbba7a80-dc91-4685-bb62-34503eed1a02@microchip.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Jul 2024 13:16:04 +0200
Message-ID: <CAMRc=MfiYZOzA+T6+_jZgz-=UsHxGO5vhS8zhjX2ckUf2YxG_w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] eeprom: at24: avoid adjusting offset for
 24AA025E{48, 64}
To: Andrei.Simion@microchip.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, arnd@arndb.de, gregkh@linuxfoundation.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	claudiu.beznea@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 12:20=E2=80=AFPM <Andrei.Simion@microchip.com> wrote=
:
>
> On 01.07.2024 11:46, Bartosz Golaszewski wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> >
> > On Mon, Jul 1, 2024 at 9:23=E2=80=AFAM <Andrei.Simion@microchip.com> wr=
ote:
> >>
> >>>>
> >>>> For those types of eeprom 24AA025E{48, 64} adjusting offset is not r=
equired (at24_get_offset_adj()).
> >>>> So, indeed, it is an entanglement in logic.
> >>>> To keep the implementation as it is:
> >>>> adjoff (which is a flag that indicates when to use the adjusting off=
set) needs to be 1 for old compatibles but for these new ones needs to be 0=
.
> >>>>
> >>>> I think that is enough not to break the existing users. What are you=
r thoughts?
> >>>>
> >>>
> >>> Wait... is the adjoff field effectively a boolean? Why u8?
> >>>
> >>
> >> struct at24_data contains offset_adj which will get value calling at24=
_get_offset_adj()) if adjoff is true (1).
> >> Yes, adjoff needs to be treated as a boolean. I will change it in the =
next version.
> >>
> >
> > No, wait. Why can't you just do:
> >
> > AT24_CHIP_DATA(at24_data_24aa025e48, 48 / 8, AT24_FLAG_READONLY);
> >
> > and avoid this whole new macro variant entirely?
> >
>
> just AT24_CHIP_DATA(at24_data_24aa025e48, 48 / 8, AT24_FLAG_READONLY):
> # hexdump -C /sys/bus/nvmem/devices/1-00532/cells/eui48@fa\,0
> 00000000  ff ff ff ff ff ff                                 |......|
> 00000006
> # hexdump -C /sys/bus/nvmem/devices/1-00521/cells/eui48@fa\,0
> 00000000  ff ff ff ff ff ff                                 |......|
> 00000006
>
> with this patch (adjoff false and new macro)
> # hexdump -C /sys/bus/nvmem/devices/1-00521/cells/eui48@fa\,0
> 00000000  04 91 62 [the rest bytes]                                 |..b.=
..|
> 00000006
> # hexdump -C /sys/bus/nvmem/devices/1-00532/cells/eui48@fa\,0
> 00000000  04 91 62 [the rest bytes]                                 |..b.=
.m|
> 00000006
> #
>

Ok, but your goal is for at24_get_offset_adj() to return 0, isn't it?
This is what line

at24->offset_adj =3D cdata->adjoff ? at24_get_offset_adj(flags, byte_len) :=
 0;

is effectively achieving. What's the difference between this patch and
the solution I'm proposing? Isn't the offset_adj field 0 in both
cases? Is there any other difference I'm not seeing?

Because I still think we can avoid all this churn.

Bart

