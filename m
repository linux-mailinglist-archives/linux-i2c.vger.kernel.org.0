Return-Path: <linux-i2c+bounces-6806-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 247A097A4AC
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 17:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4878E1C21720
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 15:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE19115DBB6;
	Mon, 16 Sep 2024 14:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aSW1kPl1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B7415D5CE
	for <linux-i2c@vger.kernel.org>; Mon, 16 Sep 2024 14:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726498746; cv=none; b=XybUofqN402VgBDTlZthe3fLirC+eK3RY+Jc5tAzulJPm+B28aJsPt/xTU/+3B9b4NUtw1HhGxnRf+vs01mXYXST9mDZ96kUi6J74bXZHbkBOJdE2xzPlA4RD/mzwu/TCic1jSCak9TStYY1wetlz+LZMENqN5Evr3cd2AT+ggQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726498746; c=relaxed/simple;
	bh=+JwIeJpbnxQcpqJOWKCJ3QmtYIYu8glAU1smt81y76U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nAKLLPiJFQY/xtl8e3QuIf7ckI9XkdIwSZ3ulM0SQJZMTooICAcDs+DZftLgoc6JbT6SQmWeNsZ2MkkIN+rRFBY/b/N0N7jXAXPVxUzqY8KAN1kU8Xqx2s1n//TDcSk78qhkQngHzojnl8PIrTPbg8TK0naYb5ge3HSWtlTtPIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aSW1kPl1; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53567b4c3f4so4392085e87.2
        for <linux-i2c@vger.kernel.org>; Mon, 16 Sep 2024 07:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726498743; x=1727103543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mKFbvl3FRfknVVQd9F2VGjZGmbz4CE84EcQSXZolvo=;
        b=aSW1kPl1SyH6ATKSm9pZCmSRpO5b7m/Wuhi7S6j2A4jiUqk1Jrl5+KFPdtw4YiqFlE
         Ybd9UlmIALc83cbxQaiyHhIDNYXAaHkNSJKYoOga63xNdEpJ7nNTZkWbgFhgb1CeQCE1
         liS2HIE2e/mnfbEGAo8/Da6rNL0x6smPvhwuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726498743; x=1727103543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mKFbvl3FRfknVVQd9F2VGjZGmbz4CE84EcQSXZolvo=;
        b=obLkWLMewtTqSgmIxB4XWz19S7SwQXeg3tWUypLfdrGPp+BpkUs1Z3kIiAXQewj9xK
         18tWLvbtCa36uJ2ZmDx/OCwRglLSRHZgGdk/A9z7LoOPyyhtEH/Fvjji0IM08dJr0nNT
         hnf+WsFhV4T6rtGgC5FzIxlfF7B/Bj5F+lZCNxpWS+PPKweMleAoMWVXT3aI1vtbItTR
         vnAl548jyjH501CS2pDB/D7jAt1V3ELUTxIA2336EDsY/hZ7p6TaAzviG9QFAhTT0xZY
         1rQIOwqqSni5OrbUHeoOjOWaneezlaY9uEzA0VMR3DBcvHDcPH98yXrfpxM7ge+Bi32Q
         SmaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs/imvToacvzC4J1QvvuqBtVLxKrb5rTDR53CU8KTOmp6E2cc5W0Gb/TK9DoFWqVnoQgXIRf8V5vQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YziW04tBQbce+WTRUaiE20pijlS15tK3impza/BuEEK6X2rnBmN
	dOGExQ9EqIEfT6Qt/9xOFH9hi/lwEgMeRGzwOGZKI76H9pgnR/RnUuP9shK39DlzqHaSYodmR05
	poe7EKH1ytyVSln6oFu3+veQKIoG0Tzj1rCDn
X-Google-Smtp-Source: AGHT+IFzocyQXiHJ7IGC6/o9lODvUjZ8bZDDkxYaKMNeJriFadvyYRFY1CoEermaKv4PHMS4vAciuIhFJjjOmqh9esA=
X-Received: by 2002:a05:6512:3f18:b0:536:52ec:2870 with SMTP id
 2adb3069b0e04-53678fcd14cmr8312496e87.28.1726498742804; Mon, 16 Sep 2024
 07:59:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-10-wenst@chromium.org>
 <CAD=FV=WtVSQ5GX6H5CtxNPTdOAJVMj_xNRvG9siZB6_ePZr7CQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WtVSQ5GX6H5CtxNPTdOAJVMj_xNRvG9siZB6_ePZr7CQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 16 Sep 2024 16:58:51 +0200
Message-ID: <CAGXv+5HRLHV2tDZxiqFRhz1p+_bhMzMXoJMBnhy-R=8C4hBjnQ@mail.gmail.com>
Subject: Re: [PATCH v7 09/10] platform/chrome: Introduce device tree hardware prober
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 1:43=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Sep 11, 2024 at 12:29=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > @@ -8,6 +8,7 @@ obj-$(CONFIG_CHROMEOS_ACPI)             +=3D chromeos_a=
cpi.o
> >  obj-$(CONFIG_CHROMEOS_LAPTOP)          +=3D chromeos_laptop.o
> >  obj-$(CONFIG_CHROMEOS_PRIVACY_SCREEN)  +=3D chromeos_privacy_screen.o
> >  obj-$(CONFIG_CHROMEOS_PSTORE)          +=3D chromeos_pstore.o
> > +obj-$(CONFIG_CHROMEOS_OF_HW_PROBER)    +=3D chromeos_of_hw_prober.o
>
> "o" sorts before "p" so "of" should sort before "privacy"?
>
> I guess it's not exactly all sorted, but this small section is. Since
> it's arbitrary you could preserve the existing sorting. :-P

To me it seemed more like they are just sorted in the order they were
added.

> > +static const struct hw_prober_entry hw_prober_platforms[] =3D {
> > +       { .compatible =3D "google,hana", .prober =3D chromeos_i2c_compo=
nent_prober, .data =3D &chromeos_i2c_probe_dumb_touchscreen },
> > +       { .compatible =3D "google,hana", .prober =3D chromeos_i2c_compo=
nent_prober, .data =3D &chromeos_i2c_probe_dumb_trackpad },
>
> The fact that the example is only using "dumb" probers doesn't make it
> quite as a compelling proof that the code will scale up. Any chance
> you could add something that requires a bit more oomph? ;-)

I only have a hacked up thing right now.

This is the one I'm using to test things:
http://git.kernel.org/wens/c/5c2c920429167a15b990a7cf8427705eec321134

About this one, it seems we can at least merge the device trees of
each product into just one. The touchscreen or trackpad (or lack thereof)
is probed by the kernel.


This one I only started looking into:
http://git.kernel.org/wens/c/42c21929aeb3c7ca7b0ce9cacb1d0ff915d3c783

About the second one, AFAIK the device tree descriptions are incomplete.
Only one of the trackpad options has the regulator supply described.
The regulator itself is marked as always on, so things currently work.
Some work will need to be put in to research the schematics and test
whether things do work correctly.

> > +static int chromeos_of_hw_prober_driver_init(void)
> > +{
> > +       size_t i;
> > +       int ret;
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
> > +               if (of_machine_is_compatible(hw_prober_platforms[i].com=
patible))
> > +                       break;
> > +       if (i =3D=3D ARRAY_SIZE(hw_prober_platforms))
> > +               return -ENODEV;
> > +
> > +       ret =3D platform_driver_register(&chromeos_of_hw_prober_driver)=
;
> > +       if (ret)
> > +               return ret;
> > +
> > +       chromeos_of_hw_prober_pdev =3D
> > +                       platform_device_register_simple(DRV_NAME, PLATF=
ORM_DEVID_NONE, NULL, 0);
> > +       if (IS_ERR(chromeos_of_hw_prober_pdev))
> > +               goto err;
>
> FWIW if you didn't want to see your prober called over and over again
> if one of the devices deferred you could just register one device per
> type, right? Then each device would be able to defer separately. Dunno
> if it's worth it but figured I'd mention it...

I think that adds some unnecessary complexity, and more lingering devices
in the system. These platform devices are not removed.

> Also: as a high level comment, this all looks much nicer to me now
> that it's parameterized. :-)

Thanks!

ChenYu

