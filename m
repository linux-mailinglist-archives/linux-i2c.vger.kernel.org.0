Return-Path: <linux-i2c+bounces-8918-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3BBA0133C
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 09:16:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69F9E7A1E4E
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 08:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D6314A639;
	Sat,  4 Jan 2025 08:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHrtJUXC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C57155A25;
	Sat,  4 Jan 2025 08:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735978586; cv=none; b=QRR+du19IeOy/+ayTT1ddSefYB52/FA4RlIBAKmLe92d4QAKpe/fv3fICVi9kz2C77WFfurvRFTgZcdscwFYK5XjKKm1K2QdfHcQVUF0PPhVryEdQx9ovOhNXyqWiV+RSCDoNurO0MmBUGWfwM5PAUGE/DlGtTNRG+gmVE5fPk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735978586; c=relaxed/simple;
	bh=r2vXLgLOaWyzTk87MuiRa3zgsQ7JWSgXCgbNvvDODBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rgn/KxUxLsuWJWV7LXdYxpdFgsurh3lnrvHr7Gi4I2Ewr1lCL46G66umKc3kjVWRTKbcuDihdaCEBgxUjGLsKbWIixeNHDYzD0W7aqf29z85NTWTbhwUjT99ZDUcWqXC8SnLQ0XZYaPLKuba+IHam7xHOw/X0BPRpP6Q2zGJwxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHrtJUXC; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5174f9c0e63so4018734e0c.1;
        Sat, 04 Jan 2025 00:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735978582; x=1736583382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbDfCJYATK6t2iXo91CsOLU8gJCSTnU/gO7g/AHDH/c=;
        b=gHrtJUXC9SVrG9zUml1OBGb4EqtSxJP60iv5lp9L2lSuRyMUREr3sol89al0Qgo078
         OVNT/9MdVpVZRsvOqa0JhYcfvDSy7abalKAchJHgcUHz2B/aQE/CJ6i2E3YH0Ueo10y6
         VbNO6Efqg9izMZ3dhfYaUYtcyn+EFSEI8Fwx8kiciX0WJP5162XWsntI4Kwu3xv6oOvs
         g8H8bGklBjEDRn0/cvap3lOVGi1mWPJTxdq0s96brZHoo2/F/4rYkLDz2HpNUtU/LTLi
         +OAAnFPzB8rh/GyU96C7/149DXqxdnQlfx2lsn2Z8582L/pqPJpgiw4U9mg2zIoAcQj3
         yCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735978582; x=1736583382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbDfCJYATK6t2iXo91CsOLU8gJCSTnU/gO7g/AHDH/c=;
        b=Uo/hGgNLBdTAVwe5LFQ4/ERbcYXI1MD1w+fG3r0DzYSPFLW40YXI0Drzfe0aGjByyJ
         PeA4HU4e0aFEuHK0xPG1JAZxQErpbnSdlvwUJ2qSuHxR1uVJ+KGzU2/pj52Y4idGnF9K
         iIFhloQT5rdsTm2XIIIiWMofUSNWOfFSpPX+dE0ttCxS5XHW8unVSZTkhKcdw4DBFROb
         zMfezaGc2K0RX2XxiglVtLzhSKj1xTtaEFHcmeyrAowQJZk63VSfDDvYnfdKWmprGKyV
         lh8au60LLkETeDp14tsaAGiRSoYooPjdwzRa2QqapRG5MutMzm8ZPJchyTDzLM1R7gos
         DDXw==
X-Forwarded-Encrypted: i=1; AJvYcCUEDnMAMhkwa7FPGuPaMCw3eKzeqNCTU4lc8676CKTtGt7ceAomFS3OBnjKUdLBzTs0vlxRuV1UdCeMeHlr@vger.kernel.org, AJvYcCUyJqJcJ15iXp4o+lZcJ5O+erGr43ATy6a6fUSxyGghYHge5NasVaDghfvYITnE456poj+e/GdJ2IY=@vger.kernel.org, AJvYcCWQC3jqAG8WPKaVas0Tf0aZb6/AM85SWzAd6qfHn/8GT6iZFpLvYyUjzqX0jfFvspdmN2WMzYxAHuDuvGvrQlQylQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoSb2yj6XiqAggUiTlYMZJ4z4Xv5RtIEhM1gF8+bHsaSS5Vcgy
	VR4oM6ls7bNzBsuJtmYIy2sOhDhfhk1Ozwb8yEz7dfD7TYUEaecGW9tLrXCEPYp1n4VGzVmP4PW
	kVhUE8BXppX1KqgR7mPQGjoPHp1EDxxSZ
X-Gm-Gg: ASbGncuE/3a0TssJL/HPg2wvg9gMUz8t4wep72Ag2hfGae8Z9k1vlr899WTAyQQApUg
	LNiQm3ZRO9V+JUoW4u5SSq+e5vCfF9PGPN76iyBc=
X-Google-Smtp-Source: AGHT+IHRr8/sV+ZqWMX+tJJYfd2JgKG3T/i3ZCCCFro5XcrTOu22gl102B7dqc0eb9Hmrk6TL4l726pIMl291ydItzI=
X-Received: by 2002:a05:6122:d04:b0:518:80fb:df24 with SMTP id
 71dfb90a1353d-51b75c3b88amr42145832e0c.3.1735978582507; Sat, 04 Jan 2025
 00:16:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <2am3ib7lohj4ilqv3ldww3pkku456m2vyd2zzgm5akx6vluivm@g6wf6d32h62q>
In-Reply-To: <2am3ib7lohj4ilqv3ldww3pkku456m2vyd2zzgm5akx6vluivm@g6wf6d32h62q>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 4 Jan 2025 08:15:56 +0000
Message-ID: <CA+V-a8t2V1HP-T-3H4GdMENiaVy+FBXreLd6NxbeWZ-umupJEw@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] i2c: riic: driver cleanup and improvements
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Fri, Jan 3, 2025 at 11:54=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi,
>
> I will need for Andy's ack here because he had some comments.
>
I'll have to respin the series fixing patch 1/9.

Cheers,
Prabhakar

> Thanks,
> Andi
>
> On Fri, Jan 03, 2025 at 09:18:51AM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Simplify and modernize the RIIC I2C driver with the following changes:
> >
> > 1. Refactor error handling in `riic_i2c_probe()` and `riic_init_hw()` b=
y
> >    replacing `dev_err()` with `dev_err_probe()` and using a local `dev`
> >    pointer.
> > 2. Use `BIT()` and `GENMASK()` macros for consistent and clear bit
> >    handling.
> > 3. Manage reset lines with `devm_reset_control_get_exclusive()` to
> >    simplify resource handling.
> > 4. Mark `riic_irqs` as `const` and simplify clock tick calculations wit=
h
> >    predefined macros.
> > 5. Add `riic_bus_barrier()` to check bus availability and improve
> >    reliability.
> >
> > v3->v4
> > -> Created new patch 1/9
> > -> Dropped RB/TB tags from patch 8/9
> > -> Dropped `unsigned long` cast and updated the format specifier while
> >    printing bus frequency
> > -> Included required headers
> > -> Propogated the error
> >
> > Cheers,
> > Prabhakar
> >
> > Lad Prabhakar (9):
> >   i2c: riic: Introduce a separate variable for IRQ
> >   i2c: riic: Use dev_err_probe in probe and riic_init_hw functions
> >   i2c: riic: Use local `dev` pointer in `dev_err_probe()`
> >   i2c: riic: Use BIT macro consistently
> >   i2c: riic: Use GENMASK() macro for bitmask definitions
> >   i2c: riic: Make use of devres helper to request deasserted reset line
> >   i2c: riic: Mark riic_irqs array as const
> >   i2c: riic: Use predefined macro and simplify clock tick calculation
> >   i2c: riic: Add `riic_bus_barrier()` to check bus availability
> >
> >  drivers/i2c/busses/i2c-riic.c | 137 ++++++++++++++++++----------------
> >  1 file changed, 72 insertions(+), 65 deletions(-)
> >
> > --
> > 2.43.0
> >

