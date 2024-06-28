Return-Path: <linux-i2c+bounces-4468-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8EA91BDA5
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 13:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F26601C22872
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 11:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7C515746E;
	Fri, 28 Jun 2024 11:39:55 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8313113F44F;
	Fri, 28 Jun 2024 11:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719574795; cv=none; b=AA69OJshiQ58XnTzXim7kzmTCF8UlIQHd1pByy0uzTmaZSpVUxA5Z4M3ZhoQZa1fSgLHPbqKFD8JvOpWmMyGu3ZFLpgRjaKF7DQUnrmty1g0Lkd7VKw2UsBtPKpf9hD3VSSdHGLWCyosAlpFKOo2w0Zr3T0F/XvMVUR6Gyb71Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719574795; c=relaxed/simple;
	bh=7CrPAXcPKhfEjKnjhT8dQmsOipY8Ut2f9IbeD8GaVuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EyvSuNPNGLW6nqfyIMI/5wPoyRCNUeXSfdLPaqE9Iy8Psw75xs1TAcIwETwjHGMpXOWA6PKd3JzeVGsS/6QlNgDaCk7zZYhCVB7rGM4sb9Vziy2Vu40gksh4JTFx4zgP2QAg8LyzgGmKnrEZ8vPLn+/wr14mQu1TDv9xYJ2zGKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e02748b2402so498728276.0;
        Fri, 28 Jun 2024 04:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719574790; x=1720179590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yf5oCP+uOrf4HAgLodjrgrRn0kpZejxKOMnUP4LFbpU=;
        b=R6wRnHwPNfMs36gROvEUy/TVO/FzTpsxT5KEZ1Itf6ArC9WHtmqwK9e0UVrlls1ojR
         ZW/5ativDaypljoEW2k6HiMckfVYHTHNz3oC2SiarsAk6IsWrKuq1eA5D4AQksnAvlgP
         462tHjPrpn93S7D9NdnW9Dynv6WuOPJrtdChvwJo2/dnS9ZyH52cGlGRShAmUThELRKR
         PkGFzxgBk0LmY3b2GT16KW5QGUeeCsEogl38vAHN6nT21qtjQXV5ODCwnXH8yyr0xLCE
         VRRiXgaS2bkCY0cWmWpgjW1KOy/uuT275IzHbIg1g9zEdQF+pMjJhLl0TZlvHY3seDmz
         MlSA==
X-Forwarded-Encrypted: i=1; AJvYcCUfipS5yZ0mwMyRCRzMmVsMZMzFnMWlvs6XeZlBk2D8TUuASvfrzFXrv/xr1D1Mh87kkpUA0gWnyWgxrJKC35oCFpKj7G402Ok1imgM9qVV7GZ2gwkcoN6XdJIBALkWRgci4/tR7qxfQktSnhAc+fkLVa5z1hBaEVahxmRkNtS2MDKcHg676uzXzAunVoUJOz/Oak4EA7zMLx5Kc/eM9bHpJ+961Tg1NiRDR1vyeVkVn25pAJXyD/qIng/ULDVvjM8u
X-Gm-Message-State: AOJu0YwT95y01fYoatkXsoJ0irwv2fEWZQhh24QzvHziI9v7d5J/iXVc
	kFFWH2RDcQbu/x82H69q4Xqatk2ba4n8NTNPpNLEskk2UAaWYlWRmu1neE/0
X-Google-Smtp-Source: AGHT+IEC0FGfudbZ4MaiadWj1vV90uT3Vjbdz1zWUd5ua1+C/cJpm42NRUeAt9NDiEBFNZg8njRUrQ==
X-Received: by 2002:a81:b049:0:b0:64b:4a32:850a with SMTP id 00721157ae682-64b4a328848mr7174597b3.29.1719574790455;
        Fri, 28 Jun 2024 04:39:50 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9c4fe1adsm2937327b3.140.2024.06.28.04.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 04:39:49 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-64b417e1511so3195877b3.3;
        Fri, 28 Jun 2024 04:39:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxG2pN49QAcFz3lGwlWPUMmfFa4AGCc30lwr9fnr6iTkcirMOW5EukLEtn9JEDQVUVhLOew8EZydbq/sQ1mhpCdElbFVybRtsmqOE9aMfexqylLCH6WmS05ohNr9sGuxjcXY0/3FF0fZ4eKvwHkM+R4wvTY93mqGi2kri55QrqLd5UEQN2Yx9BgVc9NtYztQjteq5mE38jWFqwaWC64sC6g8C5ed4sA4BR4SF9x6EYDOKw0KdrPb+b3QlcmHG7kSxQ
X-Received: by 2002:a05:690c:3403:b0:627:ddc5:eb5c with SMTP id
 00721157ae682-643ab854633mr189231727b3.34.1719574789421; Fri, 28 Jun 2024
 04:39:49 -0700 (PDT)
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
 <79c26030-4b92-4ef3-b8ce-d011f492161b@tuxon.dev> <CAMuHMdXJ8eKLzMqCPR2ewS9gr_m5OQPneETPMC-rOOmW+--f5A@mail.gmail.com>
 <7c542f46-c644-4f22-bbc4-408b7dad8273@tuxon.dev>
In-Reply-To: <7c542f46-c644-4f22-bbc4-408b7dad8273@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Jun 2024 13:39:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUmiQjsKt93jM62V5YR_NdtUDXhcxFs+F+BCu3NTNsx8Q@mail.gmail.com>
Message-ID: <CAMuHMdUmiQjsKt93jM62V5YR_NdtUDXhcxFs+F+BCu3NTNsx8Q@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
To: "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>, 
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, claudiu beznea <claudiu.beznea@tuxon.dev>, 
	Chris Brandt <Chris.Brandt@renesas.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, 
	"sboyd@kernel.org" <sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 12:29=E2=80=AFPM claudiu beznea
<claudiu.beznea@tuxon.dev> wrote:
> On 28.06.2024 12:13, Geert Uytterhoeven wrote:
> > On Fri, Jun 28, 2024 at 10:12=E2=80=AFAM claudiu beznea
> > <claudiu.beznea@tuxon.dev> wrote:
> >> On 28.06.2024 11:09, Biju Das wrote:
> >>>> -----Original Message-----
> >>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
> >>>> On 28.06.2024 10:55, Biju Das wrote:
> >>>>>> -----Original Message-----
> >>>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
> >>>>>> Patch 09/12 "i2c: riic: Add support for fast mode plus" adds a new=
 member to struct
> >>>> riic_of_data.
> >>>>>> That new member is needed to differentiate b/w hardware versions
> >>>>>> supporting fast mode plus based on compatible.
> >>>>>
> >>>>> Are we sure RZ/A does not support fast mode plus?
> >>>>
> >>>> From commit description of patch 09/12:
> >>>>
> >>>> Fast mode plus is available on most of the IP variants that RIIC dri=
ver is working with. The
> >>>> exception is (according to HW manuals of the SoCs where this IP is a=
vailable) the Renesas RZ/A1H.
> >>>> For this, patch introduces the struct riic_of_data::fast_mode_plus.
> >>>>
> >>>> I checked the manuals of all the SoCs where this driver is used.
> >>>>
> >>>> I haven't checked the H/W manual?
> >>>>
> >>>> On the manual I've downloaded from Renesas web site the FMPE bit of =
RIICnFER is not available on
> >>>> RZ/A1H.
> >>>
> >>> I just found RZ/A2M manual, it supports FMP and register layout looks=
 similar to RZ/G2L.
> >>
> >> I introduced struct riic_of_data::fast_mode_plus because of RZ/A1H.
> >
> > Do you need to check for that?
> >
> > The ICFER_FMPE bit won't be set unless the user specifies the FM+
> > clock-frequency.  Setting clock-frequency beyond Fast Mode on RZ/A1H
> > would be very wrong.
>
> I need it to avoid this scenario ^. In patch 09/12 there is this code:
>
> +       if ((!info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_=
FREQ) ||
> +           (info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_P=
LUS_FREQ)) {
> +               dev_err(dev, "unsupported bus speed (%dHz). %d max\n", t-=
>bus_freq_hz,
> +                       info->fast_mode_plus ? I2C_MAX_FAST_MODE_PLUS_FRE=
Q :
> +                       I2C_MAX_FAST_MODE_FREQ);
>                 return -EINVAL;
>
> to avoid giving the user the possibility to set FM+ freq on platforms not
> supporting it.
>
> Please let me know if I'm missing something (or wrongly understood your
> statement).

Wolfram/Andi: what is your view on this?

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

