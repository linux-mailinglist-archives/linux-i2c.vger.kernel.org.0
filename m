Return-Path: <linux-i2c+bounces-4456-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0D091BB36
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 11:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF0AA1C20B09
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 09:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BA514F9F2;
	Fri, 28 Jun 2024 09:13:57 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0D913FD9C;
	Fri, 28 Jun 2024 09:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719566037; cv=none; b=YdniMnA1NVIN+nbZIkVhAssKx9XXE1WwHYq07kI5rubzNBn/GHqABOpuAWyh+YGrNIy88Ctgd0Sg32lnwoKbJ4BNTpgB7vhp+CMfVEA9NmWUvudpxjpdn9aFGDMV33s8UvwojHfNud4ryneaDMGOt0ksCEdz9r4NgGvdeewl8I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719566037; c=relaxed/simple;
	bh=MAQPkLcYx9XStCCPe7HrxPpQJ62LVuaYAOnkvcDW5Mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fokd2TpmOLfIisLKrzFgjUBlyBrNIWmq5wtPC0W6wziNs7NdS4InELyTwcadmLWCR/U69LynRfuPhGe9V2T6Jmq9y05z7UR0Phhvg3eIx+lz62rAmWf9IE9XlX2jIjZw1UB8N6o0yFSfzvlOuv8N1OFgDiCT9hvP+SIagOp/Jfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dfdb6122992so309488276.3;
        Fri, 28 Jun 2024 02:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719566034; x=1720170834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ggUsABRPu6n/gyhT1zy1+IkWXP3pHpkQgN5AG3/lfc=;
        b=MmRWX+k5UWMQAF6ehzhLqE4sZVqA73McBuIU2xh1XkdkenRNFuchlm4j1Y5690v4fB
         dKgvVzZ8M/1IYKhXlNUolPrOg6IZbm9ICB9AtsZ2uZUe9WBrEKfvv+IPV8xNpgj9/Otk
         vHhzeSKIHJ3weDljR2rixJVEzEu/jQzd8bTOYvc915ruFvnmzODwj0lD1HMSi/9QgImf
         6/iaI4O5IQlWfvWFFOnQbZAq1elpU4Cj5F6DQwpRH9ipJ5+XyxeZub9LDBhNMkxe2cMc
         OunEJzR+A0u1NEBmyncXQBLvTKtC7alWpQFa0s9kOIhUgeI9dfczZ8sOC79gd0k8bN7t
         83xA==
X-Forwarded-Encrypted: i=1; AJvYcCWGU8zjfd+BGL41bOfFH1MOU2TG1wzssRvtCPcOJCCo1Fe3T6FutJ0yhE9FmispgJvCMnjfYU7VO+J24Ng40MLcbmVz3klj1QfT7itFpREy7bZxka0qEk0fPEbLXi0pCFIaZu7LxaiO0sc8GwG5TsouRPmBf/MUEUPR2oFXAjgxdxO7UprezG1qgWImgJ19r7e39cLeKgn6N2RJNEmPFFeyxSYHJpaM01ggwHT0clX2gqL9Bh/t7sXrL7XJmfVZm1tN
X-Gm-Message-State: AOJu0YycTVOoa3up97HsRT54ohM4+3eyoy7JNxrnd+ozbmLPZinpqHu/
	XbDgFieougBFBwf2SBufABLyZAiHQJfl8/Yo+CGh6b2/hKGnfQ55h51kYvUp
X-Google-Smtp-Source: AGHT+IFc05sp2wYlrEc0pNQV5/HuVdXkkEd1Hq9DDv/bDe9LySpTHJpdam2QMnX9g9SOCZwmSspreA==
X-Received: by 2002:a25:5f50:0:b0:e03:63c7:7b46 with SMTP id 3f1490d57ef6-e0363c77d3emr50565276.20.1719566034438;
        Fri, 28 Jun 2024 02:13:54 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0353d591d8sm261816276.12.2024.06.28.02.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 02:13:54 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-64a6bf15db9so3481427b3.0;
        Fri, 28 Jun 2024 02:13:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/OjhH6AcRp7qTcIaNDiKSAYERaL03mUndBc+bKSD48eOUJLfo0d3MBXIRJfS9rlWKP33Qihs3N2I26aVDJAYJNfzguj2HjHH5vWfxGT3qdsxTSJK1hL18nuwf16XgynH5k5Rrk1o9hz2PLMbWEHM7GdWXQM78ayvv/ZSbzoeKDax1I7QSHllfPcc0AY6Z6zQzWN0Sv6bvoZpi/x1zYCx7MBhRHAPQWomdjrC6yTiBBrh8gsuJwf4Z2wYIaq7gu9M+
X-Received: by 2002:a05:690c:3709:b0:64b:44f2:70fb with SMTP id
 00721157ae682-64b44f272f0mr5563117b3.41.1719566033879; Fri, 28 Jun 2024
 02:13:53 -0700 (PDT)
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
 <79c26030-4b92-4ef3-b8ce-d011f492161b@tuxon.dev>
In-Reply-To: <79c26030-4b92-4ef3-b8ce-d011f492161b@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Jun 2024 11:13:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJ8eKLzMqCPR2ewS9gr_m5OQPneETPMC-rOOmW+--f5A@mail.gmail.com>
Message-ID: <CAMuHMdXJ8eKLzMqCPR2ewS9gr_m5OQPneETPMC-rOOmW+--f5A@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Chris Brandt <Chris.Brandt@renesas.com>, 
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Fri, Jun 28, 2024 at 10:12=E2=80=AFAM claudiu beznea
<claudiu.beznea@tuxon.dev> wrote:
> On 28.06.2024 11:09, Biju Das wrote:
> >> -----Original Message-----
> >> From: claudiu beznea <claudiu.beznea@tuxon.dev>
> >> Sent: Friday, June 28, 2024 9:03 AM
> >> Subject: Re: [PATCH v2 07/12] i2c: riic: Define individual arrays to d=
escribe the register offsets
> >>
> >>
> >>
> >> On 28.06.2024 10:55, Biju Das wrote:
> >>> Hi Claudiu,
> >>>
> >>>> -----Original Message-----
> >>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
> >>>> Sent: Friday, June 28, 2024 8:32 AM
> >>>> Subject: Re: [PATCH v2 07/12] i2c: riic: Define individual arrays to
> >>>> describe the register offsets
> >>>>
> >>>> Hi, Biju,
> >>>>
> >>>> On 28.06.2024 08:59, Biju Das wrote:
> >>>>> Hi Claudiu,
> >>>>>
> >>>>>> -----Original Message-----
> >>>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
> >>>>>> Sent: Tuesday, June 25, 2024 1:14 PM
> >>>>>> Subject: [PATCH v2 07/12] i2c: riic: Define individual arrays to
> >>>>>> describe the register offsets
> >>>>>>
> >>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>>>>
> >>>>>> Define individual arrays to describe the register offsets. In this
> >>>>>> way we can describe different IP variants that share the same
> >>>>>> register offsets but have differences in other characteristics.
> >>>>>> Commit prepares for the addition
> >>>> of fast mode plus.
> >>>>>>
> >>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>>>> ---
> >>>>>>
> >>>>>> Changes in v2:
> >>>>>> - none
> >>>>>>
> >>>>>>  drivers/i2c/busses/i2c-riic.c | 58
> >>>>>> +++++++++++++++++++----------------
> >>>>>>  1 file changed, 31 insertions(+), 27 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/i2c/busses/i2c-riic.c
> >>>>>> b/drivers/i2c/busses/i2c-riic.c index
> >>>>>> 9fe007609076..8ffbead95492 100644
> >>>>>> --- a/drivers/i2c/busses/i2c-riic.c
> >>>>>> +++ b/drivers/i2c/busses/i2c-riic.c
> >>>>>> @@ -91,7 +91,7 @@ enum riic_reg_list {  };
> >>>>>>
> >>>>>>  struct riic_of_data {
> >>>>>> -        u8 regs[RIIC_REG_END];
> >>>>>> +        const u8 *regs;
> >>>>>
> >>>>>
> >>>>> Since you are touching this part, can we drop struct and Use u8* as
> >>>>> device_data instead?
> >>>>
> >>>> Patch 09/12 "i2c: riic: Add support for fast mode plus" adds a new m=
ember to struct
> >> riic_of_data.
> >>>> That new member is needed to differentiate b/w hardware versions
> >>>> supporting fast mode plus based on compatible.
> >>>
> >>> Are we sure RZ/A does not support fast mode plus?
> >>
> >> From commit description of patch 09/12:
> >>
> >> Fast mode plus is available on most of the IP variants that RIIC drive=
r is working with. The
> >> exception is (according to HW manuals of the SoCs where this IP is ava=
ilable) the Renesas RZ/A1H.
> >> For this, patch introduces the struct riic_of_data::fast_mode_plus.
> >>
> >> I checked the manuals of all the SoCs where this driver is used.
> >>
> >> I haven't checked the H/W manual?
> >>
> >> On the manual I've downloaded from Renesas web site the FMPE bit of RI=
ICnFER is not available on
> >> RZ/A1H.
> >
> > I just found RZ/A2M manual, it supports FMP and register layout looks s=
imilar to RZ/G2L.
>
> I introduced struct riic_of_data::fast_mode_plus because of RZ/A1H.

Do you need to check for that?

The ICFER_FMPE bit won't be set unless the user specifies the FM+
clock-frequency.  Setting clock-frequency beyond Fast Mode on RZ/A1H
would be very wrong.

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

