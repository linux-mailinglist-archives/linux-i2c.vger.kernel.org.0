Return-Path: <linux-i2c+bounces-7630-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A10A9B2B19
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 10:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5995D1F218E9
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 09:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC62192D9A;
	Mon, 28 Oct 2024 09:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dkpvV4L9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52A8193060
	for <linux-i2c@vger.kernel.org>; Mon, 28 Oct 2024 09:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730106853; cv=none; b=Cf7PxiWgwVOLEUezUHPfogq8vLrt6c6iZzL1slp5dOgkGvcP9xlwf90B3vtu45YLaROmdxQuXHrhgV8HTnaxvGnFgybF1yruux36VtNsAMwAd0VMfJBQlIxJdxuVQfPmfXlJ7gCC/k9ESSwX1JS4UawKLNauRH920LjiOdAYyXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730106853; c=relaxed/simple;
	bh=XboTEB9di6fAr/3NESQYccJxywyXVQJjrUFONGeb1W8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pBmGCHXua4sUDj2VQVV3iY8WATdd4b1tSK7+6nGjIBAK9Fj1uZ9J5HkqBEdsxgxbULAmDxefHbOgT0CtnUdR3YWlIwXHhYf0Zd9nSODqO27a14zMOyIUYj1WRm4lsClnDK9NwrDDn+twC+71wwo9m5ZQfuV76oTvmqkAcFLKwKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dkpvV4L9; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so5354097e87.1
        for <linux-i2c@vger.kernel.org>; Mon, 28 Oct 2024 02:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730106850; x=1730711650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7sEAvP8NG9JnAXi5TH/KAqfu5gH9AuYe39avRf1R9I=;
        b=dkpvV4L97+zdOuegtOTKHCGkNDPbthTTA3z373cimkD/qZ/U8WnD8Pe/p7YmLTHfPc
         8usiSoMwtosUI5EKyR4dNlAOtX0c1ZJz1C2Mw4IMEXxdxUiWY/FwLBcc+1xs9dL4wjCF
         ad+Zo1xAUCHz25Xmmgwhyh8KcSWqIf4Yd0FKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730106850; x=1730711650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7sEAvP8NG9JnAXi5TH/KAqfu5gH9AuYe39avRf1R9I=;
        b=eLkKcEv6nnNPphoBl9+2prZ7MFKgLxRrDIl90BZNDPwtR0P8NRL6sr4urKsbAHPHXL
         thS5y3Vmb9jKb1bZD9yANqMIwI8Don7sqwU3t6oNxlMvlgcvGKOyC44WVeYGsoiniwib
         JenBkyrtwLfUUQHsRd5kTl4K/OKJAG3s3G2KByS7Kqcdh3dbn72+zeBz72fBxpxLOVe6
         j+BO45SlqLV8a3WwAPxJVlmI8JexuDxwqOLl7UL7plTuDk3+qKG6NqphCajzAaT0Hboj
         tJMNBuU82obvvlXOmUjt6AjRGRpXLr9NmPAS0VBk1QnLOSUlM6BmPv1qxJe2JYMeb1H8
         4zWg==
X-Forwarded-Encrypted: i=1; AJvYcCWGHKHLnMVQHpr4Vn61vYqLuKsOpffgrA96UGHQZKcwKQme7JhIh7cIju+AxA+vUvZ1UfMRAFnFZdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoK02wisTdXTIzy8HcEbEJL3LfQKgCq+sLazd84Hh8AuRwepl7
	1MA/P0XItjXa6Ah15RFWUu+JcoNrDvMIH23LV0isiOPLlvoBWXHk2b3lcSf4UKanKsmQdTxEi2a
	S1r7V07anK3FDy3VD9SqdV9XqPctw1rGQrY6V
X-Google-Smtp-Source: AGHT+IFPHFbPyPXoPFbsVwjDIUW/0WQx3PxGtpf1eVaSW6Z7Z3fXH3i+SJTqnAp2zN1OASRPnjVQ7nAeuz6Vm9QIUx0=
X-Received: by 2002:a05:6512:1188:b0:539:fc26:74bd with SMTP id
 2adb3069b0e04-53b3490ee7dmr2587366e87.27.1730106849694; Mon, 28 Oct 2024
 02:14:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017094222.1014936-1-wenst@chromium.org> <20241017094222.1014936-8-wenst@chromium.org>
 <CAD=FV=X-YzEGEc+tp-uB6vdPMEC-V9M=Gb60H69=_XY9w4R8nw@mail.gmail.com>
In-Reply-To: <CAD=FV=X-YzEGEc+tp-uB6vdPMEC-V9M=Gb60H69=_XY9w4R8nw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 28 Oct 2024 17:13:58 +0800
Message-ID: <CAGXv+5H8kxrr=JJsMMY5Y+HC5JqMN-bMkm7hztOzQgrbew6-rw@mail.gmail.com>
Subject: Re: [PATCH v9 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 5:16=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Oct 17, 2024 at 2:42=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > Instead of having them all available, mark them all as "fail-needs-prob=
e"
> > and have the implementation try to probe which one is present.
> >
> > Also remove the shared resource workaround by moving the pinctrl entry
> > for the trackpad interrupt line back into the individual trackpad nodes=
.
>
> It could be worth noting in the description that it's a really bad
> idea to pick this patch if you don't also have the patch
> ("platform/chrome: Introduce device tree hardware prober").

I found that there's a stable tag one can add to reject AUTOSEL.
Sounds like the perfect thing to add here.

> > @@ -35,6 +37,7 @@ touchscreen@40 {
> >                 hid-descr-addr =3D <0x0001>;
> >                 interrupt-parent =3D <&pio>;
> >                 interrupts =3D <88 IRQ_TYPE_LEVEL_LOW>;
> > +               status =3D "fail-needs-probe";
>
> It's a little weird that there's no pinctrl definition for the
> touchscreens but there is one for the trackpad, but that predates your
> patch and is unlikely to be a big deal.

To be honest I'm in favor of getting rid of pinctrl settings that
do nothing more than mux in a GPIO, as mentioned in my talk at ELCE.
Such settings are already implied by the interrupts or gpios properties.
The fact that the OS doesn't enforce exclusiveness between the
subsystems is not something the DT should deal with.

> >         };
> >  };
> >
> > @@ -47,6 +50,8 @@ &i2c4 {
> >         trackpad2: trackpad@2c {
> >                 compatible =3D "hid-over-i2c";
> >                 interrupts-extended =3D <&pio 117 IRQ_TYPE_LEVEL_LOW>;
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&trackpad_irq>;
> >                 reg =3D <0x2c>;
>
> I should have noticed before, but officially the order above is
> slightly off. According to:
>
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
>
> The "reg" property should be higher (right after compatible). It's not
> a new problem with your patch but since you're inserting a new
> property you might as well match the new dts style.

The entry in mt8173-elm.dtsi is also in the wrong order. I think I'll
do a patch later on to just fix it up if it's a major eyesore.

Angelo what do you think?

> In any case, nothing is a huge deal.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!
ChenYu

