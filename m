Return-Path: <linux-i2c+bounces-9033-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A55B9A0AA0D
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2025 15:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 897BB18864AB
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2025 14:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D781A2543;
	Sun, 12 Jan 2025 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXKXyKgx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F11E1E4B2;
	Sun, 12 Jan 2025 14:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736692321; cv=none; b=ZgLOy5o2RsGGiGMYOaqGABzX/ohR2ARfM03Dkul6oLMFkN45Qw7DK7QVsyO3i45jIPwym9zxPrIm/s8uBfZQ/bTvnKlPu5z2pBXyRNtGgSffypEBHEY6chTrfWtwwgm83bDLkyNta41lOcPv+uFqh/ngR+6yho/ijGIyLK5Af3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736692321; c=relaxed/simple;
	bh=4zY6lQRxoW1L9wrCl/Jwi1gXSMtdy9LPpIFIXHrUUVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJUpin41fPrfbEyl2FAQykFEEqyeQQn4+J/zdAm6IG+xmfQsCb7bH1/46yL0G92iCBhry+6HF1TBMyNWdCxCYDV5uMBj76ogWbatGUgEG56fi0Pjl4owDXAy2zymsWdKTZZPmDIS9NDuRiO48yN4hHfDOy9mVd80xpzw6uLCsmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXKXyKgx; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaeecbb7309so649099466b.0;
        Sun, 12 Jan 2025 06:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736692317; x=1737297117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zY6lQRxoW1L9wrCl/Jwi1gXSMtdy9LPpIFIXHrUUVk=;
        b=fXKXyKgx6sbcF0te2RTaC+XsL/3e45G9+8jdVvd77zN8AHYXaIcRctkp9jVKoGJ0E/
         YC3O3RtLlzk3t1Qx9Kwp2/lPq92DSlOAQwBeeM7pH/NRBPphiagcg6BO/tWVXjTqPu5p
         AquvLHQI4EyAXGerIT7lNBdw8SLeK5M+6EORWyheBbqG/cDfvj2HGKbAjrhZnDSVG9u7
         3CCeE47LAW3wK2nbalp1DHi8qBcUmV0prC0jLuw4WPmLojRKhkzSMj4Bs7wnK7uNDy9c
         wpvQvcjGyckQghyPjpMnPvImc4E9uq0afzGdo/RzXjbizAztGVWh42twKRsW0HJNql/I
         7p0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736692317; x=1737297117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zY6lQRxoW1L9wrCl/Jwi1gXSMtdy9LPpIFIXHrUUVk=;
        b=eqOSXn8+OzQM5hpc/NA06wGBeG8AZDirctCFZn1DYOPzutnKCSoCaPPO1sxx71LG1J
         /+P5ZTXTLzzU92+D88/9zgnE9rlaZJt/v9daeY/PfFZX2Bs5bHCA7id4BzIjRbk7MTYW
         65qMLjsOqlrSoekC1KcL40fsDU/lPGe91m4GBH0qVYhUI8AfohEm+eKxU1xj92ky5y+2
         2KFwYVpjyzmYKHsfVd7T0tMr1qk+XenSwUIj4EUa4HT7Y/UBu3lWDvPMdz9eSGcSYxkh
         KhA6Tcbs+6PAttynb2klJFNtbkMXXZpuk3Ll5fjfsG3xiPuZ8Zlfv5Pfb0GOwHlV/hl9
         eZQA==
X-Forwarded-Encrypted: i=1; AJvYcCUc8xfweFGx+nXnYh8JiPl44L/feN+ODhJd2ORU2GIo5UJGnq5khv1zgIb5GoZl/IwNiXleAULKlQt9H31T@vger.kernel.org, AJvYcCVeDoxQZlL1vBUkg9MysTNI6ehnEmLQniPXObfQ2rv8eklbNIzCmq4kn6+LKEskqvDtXp+ToJnHgCGhK9zazz8uXnU=@vger.kernel.org, AJvYcCWasta21fQMbhg98eY5O8yIFQpBr+bHeOSnMooRMEGoyHkR4SCOBj5NNeDf7FoILysiUxZfedlE+oM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ReG1rwe4l9WLa+CpWqc2IN5WH+2LOfljfyv25+JMnCGiUWY9
	ztZOo/9RWLV1V8prZSfHRJ+sjOwaJVSk6SFTRSF5FoyWMV7Ls61VvTrmGr+40oFJhXokOwI63Wg
	Uki5S8Qe2AgSuphjkdVUZv2WvZF+EywKg
X-Gm-Gg: ASbGnctRPqTzkvm+ooc2OrtxsH+/GNxYJ0feDF08gh+bNEBeafXulJ81lTm2Flo1aCQ
	nFH82GhRDQongkod1Nu5mcVO1/NW3hJYRxGp3ig==
X-Google-Smtp-Source: AGHT+IGU6zn9wPqVFelTZxwnt5h0/aAjds9jOGr/MjmofeEMZSV1bYFeFv4wpDyypBKFVSCJuF+Irqp+zxqVHHZ/Lvg=
X-Received: by 2002:a17:907:d9e:b0:aae:85ad:6d6b with SMTP id
 a640c23a62f3a-ab2ab748edfmr1666275866b.34.1736692316847; Sun, 12 Jan 2025
 06:31:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <2am3ib7lohj4ilqv3ldww3pkku456m2vyd2zzgm5akx6vluivm@g6wf6d32h62q>
 <CA+V-a8t2V1HP-T-3H4GdMENiaVy+FBXreLd6NxbeWZ-umupJEw@mail.gmail.com>
 <xyphhdf7iesomnbdihonmcnyihgervwczqd2n73a2oguuqvn6s@4axo2yd7gfha> <CAHp75Vf0nea9q1G3-B-9VGmKAvp=T3-_9UxcidR-9ocQLpAwmw@mail.gmail.com>
In-Reply-To: <CAHp75Vf0nea9q1G3-B-9VGmKAvp=T3-_9UxcidR-9ocQLpAwmw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 12 Jan 2025 16:31:20 +0200
X-Gm-Features: AbW1kvZrXmKyoo5E-1C0NhxH-3yfc7PY_NZuHPbvTwwhWgy384d8Kpow0fX2dTc
Message-ID: <CAHp75Vfwpt2sBryu3zfPp9xWnHX7MkogYdoCVqpp9weWRaWDxw@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] i2c: riic: driver cleanup and improvements
To: Andi Shyti <andi.shyti@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 12, 2025 at 4:27=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Jan 9, 2025 at 4:44=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org>=
 wrote:
> > On Sat, Jan 04, 2025 at 08:15:56AM +0000, Lad, Prabhakar wrote:
> > > On Fri, Jan 3, 2025 at 11:54=E2=80=AFPM Andi Shyti <andi.shyti@kernel=
.org> wrote:
> > > > I will need for Andy's ack here because he had some comments.
> > > >
> > > I'll have to respin the series fixing patch 1/9.
> >
> > if you want you can only send patch 1. It's OK as far as I'm
> > aware of it ;-)
> >
> > I pinged Andy privately to give an ack here, we still have a few
> > days to the merge window.
>
> Sorry for the delay, I have got sick just at the end of my vacation
> (and I still have a couple of days left), but I looked at the v4 and
> most of the patches LGTM, the respective comments are in the
> individual replies.

Okay, seems the main concern over v4/v5 is that vdso/* inclusions
while they should be linux/* ones. Otherwise LGTM. Since there are a
few changes required I would expect a v6 soon.

--=20
With Best Regards,
Andy Shevchenko

