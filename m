Return-Path: <linux-i2c+bounces-13545-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E919BE053E
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 21:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53B01428447
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 19:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A69C303A02;
	Wed, 15 Oct 2025 19:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CuNCKEzm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D6E30101E
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 19:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760555569; cv=none; b=a0vsm2QywPVaJSkk4CvE8PbSlJCVEUbEVF9P5ontL4GyYcT44HRNjAVMAQoQI43SDTNUYrDVeHCkkpGwoT6owy1Ftp65ctbPWUaEfdzfCmsXVrtKSb4IHnL4ixSkz7+mTJEoJzMMwr1XDWWQPf1l17fsmtMatdyaQLJyq2J65n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760555569; c=relaxed/simple;
	bh=MvR+0JKXb5CBAEei5A2lB3ToTgOiUAvcquMmLPEYUy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uaW0lJQ1Vhytyz84AV9Syg5Dq2Vmt+mDiON3o9GmXLVpic2YkgbSL09f2Z+grIZ54a/DBL6sAkRQYu3Kaqx5bZOaaJaFNrYR8rk64I+/DFOk863NSvDilqZR4zglPlqS86cyzWgKYe2EwjsGtw5Qv7RX2SoY0i6ot8ZGbPjJlW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CuNCKEzm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ee12a63af1so4169802f8f.1
        for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 12:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760555565; x=1761160365; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhyinuDlZwKREDWmNx8hCk7tI9XdjStorfWj2UhFgTY=;
        b=CuNCKEzmNNFm8QiEk1EemTNCB6eJcJOl2G6kmRrvOOPZeNuHHc/nuUrKRbByMYG9s1
         srbVteVPPFS+W06BULQrxd2QQu9RmE1kf4nT0JG0sEJ1MrRh4wvGSBfiAEbqdJYe3ft+
         RjUR5zktBIwXWG3dCodcI/Kj57YsJBJt+/z+mcJmEFpBxaCLMVonjNdRtZCWZuZxp9/E
         3MKLDqoTibeQ6y02BvALO+5X/ko+kKbojFMjtp3/5mCRo645aBYCLyUQKvQX1qcX8Mku
         w2Pp2Nk73XqO5jFn7A7CDyRYeg75hJDZLKwDZQLv17wioIEH6takbzzcPl5I9jepR/1q
         d8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760555565; x=1761160365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhyinuDlZwKREDWmNx8hCk7tI9XdjStorfWj2UhFgTY=;
        b=fgDb66EdqENyDs7JP2ZGy7sC9SLNTppsqvfXzeczF6e6CNfsoDZ/292Yu7BgfQpy7v
         xbc/YxpBPA0ukM5Q0k2LTJXga4zR5bqF6VaZshNdRykJOXf1a9v/FeNoxiT5HJ8QdXT4
         updaAOnjgknD76H/mrYHJmAkWGsTpJ1Uhzb/uCqoZHSSFK2+x/gFA6J2sJhTNuiRvbRV
         r7VF1g7mJHE7pJ+fjNkPwmc6E0DIGO0Q0hNEZqYlosxrCaoVopgL01GHeGUc2Ybe6Bgj
         yd2VxJNBqub9A0uya3RXCrTMfEvfZJ5cujFsY3VutKonLWiiXAx7Hm1PUSRhKCBTWIbQ
         WR2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGm4sIrqI1EyYU70F2NSB1ty1gJMS+g+a1mU97CkM+0hyOEjwoxxUxcPMLJ+rxSEWfgzlPUgmTbmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YykDHYailQA3XVAnc2BsOekWQj/qga12y7Pe6xY2Jv7syl+/OHs
	Q93QjYRESOSDrIo0+SMMFe7GMTgCFnMqBRLMzuOjwg4DEkg3A52oy70N88v4bHAnDDBT+mlCdN1
	BQym+qEt4L2GgwYRsBGZWpjr8WSaZ1BE=
X-Gm-Gg: ASbGncvbl9I99VlG5qUWmClxCXZbROZlci7o0Ah4UY537FtlFRB6SLXTVMdRAkfkaBJ
	z2K6ttxndsOmEEdVE24l20quT3aVVi61t8n1mOx1a2ramkshEcy+IXG3EtsFSmm4dqOgUM+I/gc
	FNNaHUn4fm9WN+CIqRzCSXbSQC9oaw5bJ/upPGVygV5tDoAcTM8P6jhnc+VMQWG3308X3Ibvv5/
	glC+y6qvEUmHVKrAuzNKMtCYDvu4GlTMDAhdyhVVF0N1SmJBs4mLh7YJZ2X
X-Google-Smtp-Source: AGHT+IGptweOAxfQob9Jd4H5eNxPIDoVFH0g644LiyqMYerOmNSPqkAZdQtC7+4FweyrZZizKJf/AjDZCN535DWV0k8=
X-Received: by 2002:a05:6000:2c0c:b0:3f1:5bdd:190a with SMTP id
 ffacd0b85a97d-42666ac3a16mr18451032f8f.3.1760555564585; Wed, 15 Oct 2025
 12:12:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014153314.177300-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUBthNYYOg4WHjt+gJRL=g00wmiqCsx+La_3NCUrCJ9gg@mail.gmail.com>
In-Reply-To: <CAMuHMdUBthNYYOg4WHjt+gJRL=g00wmiqCsx+La_3NCUrCJ9gg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 15 Oct 2025 20:12:18 +0100
X-Gm-Features: AS18NWCeX_juiZImnilmkiUrbUqjiLLajME51FAEENFN1IPwAIZdGkxwJx_QjPc
Message-ID: <CA+V-a8vUKJDFCwQ3tMyhuMEaoR1DhpEhhHfwRnmMwNerdBM49w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Add VCC supply for EEPROM
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linux I2C <linux-i2c@vger.kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Wed, Oct 15, 2025 at 4:36=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> CC at24, regulator
>
> On Tue, 14 Oct 2025 at 17:33, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > The R1EX24016 EEPROM on the RZ/T2H-N2H Evaluation Kit is powered from
> > the 3.3V rail. Add the regulator phandle for the VCC supply to reflect
> > this in the device tree and avoid the fallback to the dummy regulator:
> >
> >     at24 0-0050: supply vcc not found, using dummy regulator
> >
> > Fixes: 0176c9e82e10 ("arm64: dts: renesas: rzt2h-n2h-evk-common: Enable=
 EEPROM on I2C0")
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > @@ -160,6 +160,7 @@ eeprom: eeprom@50 {
> >                 compatible =3D "renesas,r1ex24016", "atmel,24c16";
> >                 reg =3D <0x50>;
> >                 pagesize =3D <16>;
> > +               vcc-supply =3D <&reg_3p3v>;
> >         };
> >  };
>
> "vcc-supply" is not a required property, according to the DT bindings,
> and I believe the 3.3V supply can be considered always-on (but see
> below to encounter dragons).
> I was always under the impression that these "supply not found, using
> dummy regulator"-messages are just informational, and can be ignored,
> but they are at the KERN_WARNING level.
> So should we add real dummy supplies to DTS, or not?
>
Agreed, I get your point. Let's drop this patch.

Cheers,
Prabhakar

