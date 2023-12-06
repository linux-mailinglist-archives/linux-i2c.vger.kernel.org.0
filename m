Return-Path: <linux-i2c+bounces-634-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE128075F2
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 18:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCBDA1F212AD
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 17:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1339149F6D;
	Wed,  6 Dec 2023 17:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lg+uQ0ZV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC48D3
	for <linux-i2c@vger.kernel.org>; Wed,  6 Dec 2023 09:01:19 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a1db6c63028so93590966b.2
        for <linux-i2c@vger.kernel.org>; Wed, 06 Dec 2023 09:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701882078; x=1702486878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6USO49247dIS4iM67DLL61cvXhjKL/DNTtVy5lpNUks=;
        b=Lg+uQ0ZVQkeebudztZX5+ujD8tCcYzcIj63pKJVuZ5ANSGk/CN2jn/OXUL4XAOqn23
         gAWRa3V8QtgpsDU5gBCkppeFrPx6181NngjWmgKA6CcuBlc68WtfQdlIOqZqvSMdFFkJ
         3Cu8MJM4Ff2fz9Vn5TAviEjxRmoVrvETo3CzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701882078; x=1702486878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6USO49247dIS4iM67DLL61cvXhjKL/DNTtVy5lpNUks=;
        b=PmE/JMqIao83QVOm/X5J6q7CJcMX64QueW/N2hF6pcPcCYIa7mfUbOSWzc1D6/OycS
         SK0UHVxxRxNkwBRak4J/o/BR16e8zA/3DsVFbeumwFNdpBwAUdoRrTQb7RJFLcMKDhQw
         eUJx/7SMN6RBaLNmkFCwoYahUqSRAc3r/VnWGj+Js8aHIS20TomIOXRMpunE+8JU+xav
         t3ZrnTIiAVRUmJOPQyPqknQwtFR1C6ckxII9/JUR0j1bWJcP0dPqJoDsgDcAWtEsy6tj
         gWrFoaIrxiappKHkFuatGPGbjkHKNNC4w6jPVos/LlDpeu0y6W1B2TGpGPyJQDcGYkv6
         wF+g==
X-Gm-Message-State: AOJu0YxYvP1RH60v3jYus6y+l1guZuI3ktxUsUTTplIRrR5yT9Zafxyp
	oVcxq0Y+2CvozlpFckxAn8c/ME7+DTF3RqaLqFYFaHAl
X-Google-Smtp-Source: AGHT+IHxF41Hwa36PxsREZq4TMhutbL5mdOoqawjVeSOcDr+uUQIiz71PhFCz2wlnVL886XUaovkJw==
X-Received: by 2002:a17:906:5586:b0:a19:a19a:eacb with SMTP id y6-20020a170906558600b00a19a19aeacbmr759891ejp.132.1701882078016;
        Wed, 06 Dec 2023 09:01:18 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id md10-20020a170906ae8a00b00a19084099a4sm177326ejb.16.2023.12.06.09.01.17
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 09:01:17 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-548ae9a5eeaso12009a12.1
        for <linux-i2c@vger.kernel.org>; Wed, 06 Dec 2023 09:01:17 -0800 (PST)
X-Received: by 2002:a05:600c:4e8d:b0:40b:33aa:a2b9 with SMTP id
 f13-20020a05600c4e8d00b0040b33aaa2b9mr101895wmq.4.1701882057134; Wed, 06 Dec
 2023 09:00:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-5-wenst@chromium.org>
 <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com>
 <CAGXv+5E+R292XsOFSL-j0KJMmVJjWtxMRgCK8besP7mo6NDOWA@mail.gmail.com>
 <CAD=FV=UQkAjgMuR85cPikNtCxsODWPWs7cibOcOoNGdjSSvF8Q@mail.gmail.com>
 <3700f05f-2411-4422-972f-f3df690efb84@collabora.com> <CAGXv+5G5fFTv8zn=YamSdccjuYemE5oKBqjb8CSyGzu9aMJ0eg@mail.gmail.com>
 <4b9ea82c-d1a4-47b6-ba03-346cfdedef05@collabora.com>
In-Reply-To: <4b9ea82c-d1a4-47b6-ba03-346cfdedef05@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Dec 2023 09:00:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UMRRYieChp2+4Z6zxL-CSVZabiokuHH=qrnMMSmjNM2Q@mail.gmail.com>
Message-ID: <CAD=FV=UMRRYieChp2+4Z6zxL-CSVZabiokuHH=qrnMMSmjNM2Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/5] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de, 
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 6, 2023 at 2:02=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 06/12/23 03:55, Chen-Yu Tsai ha scritto:
> > On Tue, Dec 5, 2023 at 6:22=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 04/12/23 17:50, Doug Anderson ha scritto:
> >>> Hi,
> >>>
> >>> On Sun, Dec 3, 2023 at 10:59=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.=
org> wrote:
> >>>>
> >>>> On Sat, Dec 2, 2023 at 8:58=E2=80=AFAM Doug Anderson <dianders@chrom=
ium.org> wrote:
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromi=
um.org> wrote:
> >>>>>>
> >>>>>> @@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
> >>>>>>                   reg =3D <0x2c>;
> >>>>>>                   hid-descr-addr =3D <0x0020>;
> >>>>>>                   wakeup-source;
> >>>>>> +               status =3D "fail-needs-probe";
> >>>>>
> >>>>> While doing this, you could also remove the hack where the trackpad
> >>>>> IRQ pinctrl is listed under i2c4.
> >>>>
> >>>> Sure. I do think we can do away with it though. According to at leas=
t one
> >>>> schematic, the interrupt line has pull-ups on both sides of the volt=
age
> >>>> shifter.
> >>>>
> >>>> BTW, The touchscreen doesn't have pinctrl entries. This has pull-ups=
 on
> >>>> both sides of the voltage shifter as well.
> >>>
> >>> I dunno if the convention is different on Mediatek boards, but at
> >>> least on boards I've been involved with in the past we've always put
> >>> pinctrl entries just to make things explicit. This meant that we
> >>> didn't rely on the firmware/bootrom/defaults to leave pulls in any
> >>> particular state. ...otherwise those external pull-ups could be
> >>> fighting with internal pull-downs, right?
> >>>
> >>
> >> MediaTek boards aren't special and there's no good reason for those to=
 rely on
> >> firmware/bootrom/defaults - so there is no good reason to avoid declar=
ing any
> >> relevant pinctrl entry.
> >
> > I think this should be migrated to use the proper GPIO bindings: the
> > GPIO_PULL_UP / GPIO_PULL_DOWN / GPIO_BIAS_DISABLE flags.
> >
> > But that's a different discussion.
> >
>
> 100% agreed.

I guess I'd need to see patches as an example to see how this looks,
but I'm at least slightly skeptical. In this case the GPIO is
indirectly specified via "interrupts". Would you add these flags to
the interrupts specifier, too? There's another potential pull as well
(PIN_CONFIG_BIAS_BUS_HOLD) as well as other pin configuration
(PIN_CONFIG_INPUT_DEBOUNCE, for instance). Do we try to fit all of
these into the GPIO / interrupt specifier?

Certainly I will admit that this is a complicated topic, but it seems
weird to say that we use pinctrl to specify pin configuration / pulls
for all pins except ones that are configured as GPIOs or GPIO
interrupts.

-Doug

