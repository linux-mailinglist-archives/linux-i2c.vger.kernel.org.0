Return-Path: <linux-i2c+bounces-10026-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A22A70F3C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 03:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 926A9170CC4
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 02:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6AF1531E8;
	Wed, 26 Mar 2025 02:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwoA4H+y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBFFEEC3;
	Wed, 26 Mar 2025 02:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742957589; cv=none; b=cisu7RmgZ/WBNW2IhKaCXce3KCJAqd1CsZjt6Y9St3HoRFUwi6Ok762PRTWLKtk+ptKFuHSLOvD/MEG/rCUuWNXqGXnbenaGihv/PbiK7knmGe/lrRs7c/RI8ZNcG6KgKuUmXcXM0MCcAW383C/XeQcTec3fL1VtlvbsYPs0GAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742957589; c=relaxed/simple;
	bh=tR0hpiSjFO/WspQVHGVT8zUQ9voaGhpKDs6/znEN4Yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uOmWWwCRrJPB1ez2EhqQGRPCGJ3hC98u7cnxduuYqQgrqT06I3AdG74bIg8BnBHt05UrVZ4qppZFwH40wx9k6YXsZpR1HHm4K9scmjtrwhUFDlv7TsAcWJnsj1pkm/sSE5+ezLHIH6XMWzYZyj3HIIn0JS1Y9By+88PmCPHsWKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwoA4H+y; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6fecfae554bso54802517b3.0;
        Tue, 25 Mar 2025 19:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742957586; x=1743562386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRVOk3+qVIByxfoFBHmyldpu57c1EQEApVPRpT4+B7I=;
        b=OwoA4H+y9QtFLr/UPxpxX8uSphf1BuR5upEdkf3m4sitIyWWd3b+AhxsL/wPpH1f7D
         ulTD0Fc2mfcqNGONcLpLsbSkdAg6KvepuyHOvJ+DN+wDpbsZ4XSBbKLtsLuAimSOplhK
         78ICAfVyCwz8303RS3A3hmxn3tvzvfKTaZj2Mri1FZviCznK8S1JzFhVczSjXZrbHrMJ
         4+Wh7Cmjy8fYl5q1pf+2e4U3HCDaS5RiLYpS5UVb0jZd841TW3bFYLpcADwgbqFQTtAP
         IbHgfm6ZZpIJjK6cxIIAsz8GQoqfJyW5/4WixLKTcT7/YNiShlEuef3J4HpOVQ4SGGHg
         gcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742957586; x=1743562386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRVOk3+qVIByxfoFBHmyldpu57c1EQEApVPRpT4+B7I=;
        b=qi1b1HGcGL0qblM0I2l811M6ZCbeVLDkP3WH+0aCKU/G48JBkwo3Ob8cra6Z+FxS4S
         hP/R6+p/LzcJIA8+6x1LevrkQvin+355R83E09p6V/Q7Z/8ZK7brrO46CxSeO2kHhSkm
         Qwbg3MPBBeON5ntYZVmIkTk33ai+p50Y0AMauTH94A9eRLp9JMb2Yj5FJuU2swlI9lTE
         6SDWLvxUf/OPcLZlCO5JVdo0vk03RRwJQZxQO8Gj97UF1mO0fXKfzVBz+CqNcmmHP5e/
         fEEvhtk8kWBTYzfBF/Amyci6T+aRsPYDZRRVqa6XxDYji+4Rg61zwPpBN3JZwNQrwS47
         JHPw==
X-Forwarded-Encrypted: i=1; AJvYcCUU/EFzSWGimenfJn/RCFCemPUSviJCxjpspLKhqk0rLCu8Gxw5+SdoMsPYKenP7r40UIQh2LNb8ShP@vger.kernel.org, AJvYcCUblOWL728ecvO4pqguuQo5Z3CsUuC9wcHcYPt4K7AAUbfhaJKCIFCbd5c0nxqCyWUYTCFafBeHjkxTtQ==@vger.kernel.org, AJvYcCUwETAayMPQst9+/HvousaxpvRH007ySznxBCOSjK5WL8tPGV7LgCGrIemueBHKjQAzCvP0qxOto6o=@vger.kernel.org, AJvYcCVc1vbPdsps0JNVQ8OfWFgGzv0T8BhhSUQzlYBbebHddq5yeE4kEPjLS3LRx2/GW2pLNBnxdZtLgTSgVgnr@vger.kernel.org, AJvYcCVsE71xkfTpIBkaMCBmutrvz4cAbUtfpaGj/ueEdeSBuGyL1fR37y8QgHjclwhqOMfy68VU8OUI4W8kBo0=@vger.kernel.org, AJvYcCW1RWrM9JDBaxazvfawaonn681JbuMqtMlnYl1FQDIbxmWgAH6liKOIQfh16rfiAaoP/8ba/lDhec0vKqTsFBo=@vger.kernel.org, AJvYcCWA3tZ/MWfMc+brJ3YzwaUlVTy4eJWrUV6dpesHhTA9eMQlMQC6bll9kAUzb3maMwp1bmQv7noi@vger.kernel.org, AJvYcCX+nVozsYRLyHOdFxRVIBtlKt7c769s9QuAzbc1nnT4SF/F38KFYNiKawmAbicKkXRc9G+4s6GsWJSl@vger.kernel.org, AJvYcCXVUjduQ49oRrjF3+EQPwabdnlbuUfjy6YPeh37+H8OGRziDTmCwQnfVjGhZuWc1GeuDybRlDRmR6Z3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyccvm+edfmFmb12tlWXec36Ug52+c5LI8PUN/A8Urwt9jAtvlM
	rofwd0ixbdvL2E5gl0z3qKmu8ykJRHejqnl2CcqrM/PHOivodDdg3ZlKsavIEn7rKxNcW9Aw/1K
	9Y/5aKYvT1rs+LXnPtV+bsjWQ2Fc=
X-Gm-Gg: ASbGncsFGJonJXSXzMnTgpE7Llfzy/pFyhT2rOZKqpM4NnnHxMegHi2JMy/lQK4HU/1
	Zqy4Bx2zQgNOC/J51vE7tPh0WBIHvEcthq9RYnSf0O2cugSk/Ej34dJIcyDW8IaojPIqi9mQCVY
	aHMQLbX9MZ2n60yUdaeJ0oaV3u35VbJfAAtTq+17RavsRAecgjs3t5/CLjaJIv
X-Google-Smtp-Source: AGHT+IGFmM/43LiglnO1PLksaWD1bA8yVyyua4atAOI0toysfW72PAufjGsdZP3qrneDzJlMRZpR/DRSuqkw2K1SlX0=
X-Received: by 2002:a05:690c:6c85:b0:6fd:33a5:59a with SMTP id
 00721157ae682-700bac6b12cmr265622027b3.18.1742957586397; Tue, 25 Mar 2025
 19:53:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-2-a0282524688@gmail.com> <20250307011542.GE8350@google.com>
 <CAOoeyxUgiTqtSksfHopEDhZHwNkUq9+d-ojo8ma3PX2dosuwyQ@mail.gmail.com> <20250320145042.GS3890718@google.com>
In-Reply-To: <20250320145042.GS3890718@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 26 Mar 2025 10:52:54 +0800
X-Gm-Features: AQ5f1Jr-qehcBUjCHKAC9Ig86kbnYpN20BwJHFrPhGUZx482dDzZ5qYruqNjkmE
Message-ID: <CAOoeyxXZmrzBSNRdRx9vK84m5Z5y8T_A+wY98vVrPUZ7f4w4iw@mail.gmail.com>
Subject: Re: [PATCH v8 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Lee Jones <lee@kernel.org>
Cc: tmyu0@nuvoton.com, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B43=E6=9C=8820=E6=97=A5 =E9=
=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:50=E5=AF=AB=E9=81=93=EF=BC=9A
>
...
> > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x1),
> > >
> > > IDs are usually given in base-10.
> > >
> >
> > Fix it in v9.
> >
> > > Why are you manually adding the device IDs?
> > >
> > > PLATFORM_DEVID_AUTO doesn't work for you?
> > >
> >
> > I need to manage these IDs to ensure that child devices can be
> > properly utilized within their respective modules.
>
> How?  Please explain.
>
> This numbering looks sequential and arbitrary.
>
> What does PLATFORM_DEVID_AUTO do differently such that it is not useful?
>

As far as I know, PLATFORM_DEVID_AUTO assigns dynamic IDs to devices,
but I need fixed IDs.
For example, the GPIO driver relies on these IDs to determine the
group, allowing the firmware to identify which GPIO group to operate
on through the API.

> >
> > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x2),
> > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x3),
> > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x4),
> > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x5),
> > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x6),
> > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x7),
> > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x8),
> > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x9),
> > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xA),
> > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xB),
> > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xC),
> > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xD),
> > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xE),
> > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xF),


Thanks,
Ming

