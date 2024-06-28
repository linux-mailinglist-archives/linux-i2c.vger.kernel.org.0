Return-Path: <linux-i2c+bounces-4454-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 271DE91BB23
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 11:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D661828596A
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 09:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184611514CE;
	Fri, 28 Jun 2024 09:09:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72966143886;
	Fri, 28 Jun 2024 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719565741; cv=none; b=ZhpuK7sQJipGmYGuQ+0JDXIDz0b9aUdJU/nopioEubJ2KpDQPfkaaKNRSvAe2MuwYqdC6wGHx2salAYr+IFyG0KML4j0GTs4Hwf3OtodK7mHd3N4eW2FQqDPr1QAw+bERELPhnJ/7eyEHZbL2uPYg1AgSE4SMo2mUtUcnM/V8Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719565741; c=relaxed/simple;
	bh=V9E60qE03GNp1ZSzcc5LUZ5BfHBScjNIHpUp764H5Sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mv2C0z0GanxX9wagGJcxaaiJCgvbxCj1hGNpELjcLJ2fM1YAEpdC4Sq5AOsU0bbOe09LGByhNHs9B8AzzP9aB9kGgdPt+Cz6NCBUQuEbnsD+bTrGid5u58aeTk0rolNuVM7IflkoPDaYjbAAQPKJasUy40PiyJDgUieSte8PSYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e035dc23a21so268295276.0;
        Fri, 28 Jun 2024 02:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719565737; x=1720170537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmEhtYpo+REVO/LhNr2Nj/+NOg5cmsiF88zpbEmWvCQ=;
        b=nLkb1hbKEaq84NFzYho9QXUgWBi9BAHfbkshCkMV7uuHeN3K/y8M+sTJ9DMvfErk9M
         9jf254rODKMAESK43crKHU8Y2dHja37pU0HbYC1rKmsY+ug58vFfvScTK/gbHVvCMjQQ
         A3pewX4sDVvOAqwRwQaSPc+71uC/DqFg0K8UloItMT7k1RTIgUjANGgJjVJAShGIZxaH
         ZcDVH8oxVEheSKyphBV+M7NvLbQHkHGWYsjeX5K8bPijX9kWCG6WF0/Mw4Q6WVqFPqX0
         htGfWlE7dyDpSW/bYySXWBD3+I8JAc8JRUuvmJlgSve9/qMmkzGdXt7ADyA3q6cysWtX
         vK7A==
X-Forwarded-Encrypted: i=1; AJvYcCV1P1K3uLGrJoYK2Q+kQdttrmROFNORZcP1lt71lGkjsctIBrpbahpNA/mT/jgf84pwFshf/m1AxyF4ypurUUBATgXh38BBvyNcsFyQxGISFbouLpY2FJeWT/ZbyvaWJl54UgNOZGT6/2cWI5wld5inz/U4bQwSzcwHoEnKMSRIc37J+Brk7KvzDjPZB6vJ4yyH8OkcIyufO/YuzyDaBiU6VYa3/qbf+HclZynrciw5d66SYfv1ro8jItydpeo8JFxg
X-Gm-Message-State: AOJu0YwaBuUqCRh1DWpy+UM4T3HjDdNl6dWTPVvdN0cOA22gpyYzJLSK
	shIFVFRPCf1DwOEKjmGmaVMJUoHEVXoRq3CVqhBt+pn/tciqa6lIewRJhmaV
X-Google-Smtp-Source: AGHT+IEdLQVdDZIKv5kTADQPClDDJ9RYFiHmeHyrh+V2qmFh14Vd421MbTW5RDjkcOW3gcIN0rRFeQ==
X-Received: by 2002:a5b:b0d:0:b0:e02:bc67:829e with SMTP id 3f1490d57ef6-e0345587a0fmr4644925276.65.1719565736763;
        Fri, 28 Jun 2024 02:08:56 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0353d79c73sm257216276.24.2024.06.28.02.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 02:08:56 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-64b0d45a7aaso3072657b3.0;
        Fri, 28 Jun 2024 02:08:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVodL8ffWFlkBworYdqfcDgy7p4jDGxn3MlH3gD5dA0eOWNhvfwNjVeOfLHDyHoWdmiZHor2pFF6S+r7tQVm9ujsYqxSzzboPwd6ZciUrkofqNQxl39c6ObZH/YEoi2Qm1bqAqfOKKQok3gWlElCH0zshToB45enlYFrbQ9AYg4xBoniQn/XjgCfORHuK6TTdHOQCiWT7wUdTfVqXZ/4htvTg/pGV3Q3cOfDoJkBBiZ3Al5z6qxHz7pRr4r36S5VrH4
X-Received: by 2002:a81:6e54:0:b0:63c:486a:289e with SMTP id
 00721157ae682-643abf3cbd5mr164214937b3.32.1719565735023; Fri, 28 Jun 2024
 02:08:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346EF9A001F68162148B70F86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <6289f329-118f-4970-a525-75c3a48bd28b@tuxon.dev> <TY3PR01MB1134603F92C72D9B6C6C3733C86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2f162986-33c5-4d80-958c-4f857adaad20@tuxon.dev> <TY3PR01MB11346CA73575CF61B2024F3B386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346CA73575CF61B2024F3B386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Jun 2024 11:08:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRQ-o2ERma2UD0NJ6CgoJv_TaQYua+mS3tZdGziThjDg@mail.gmail.com>
Message-ID: <CAMuHMdVRQ-o2ERma2UD0NJ6CgoJv_TaQYua+mS3tZdGziThjDg@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, Chris Brandt <Chris.Brandt@renesas.com>, 
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, 
	"sboyd@kernel.org" <sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Jun 28, 2024 at 10:09=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> > -----Original Message-----
> > From: claudiu beznea <claudiu.beznea@tuxon.dev>
> > On 28.06.2024 10:55, Biju Das wrote:
> > > Are we sure RZ/A does not support fast mode plus?
> >
> > From commit description of patch 09/12:
> >
> > Fast mode plus is available on most of the IP variants that RIIC driver=
 is working with. The
> > exception is (according to HW manuals of the SoCs where this IP is avai=
lable) the Renesas RZ/A1H.
> > For this, patch introduces the struct riic_of_data::fast_mode_plus.
> >
> > I checked the manuals of all the SoCs where this driver is used.
> >
> > I haven't checked the H/W manual?
> >
> > On the manual I've downloaded from Renesas web site the FMPE bit of RII=
CnFER is not available on
> > RZ/A1H.
>
> I just found RZ/A2M manual, it supports FMP and register layout looks sim=
ilar to RZ/G2L.
> Wolfram tested it with r7s72100 genmai board acessing an eeprom. Not sure=
 is it RZ/A1 or RZ/A2?

Genmai is RZ/A1H (r7s72100).

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

