Return-Path: <linux-i2c+bounces-7635-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1002F9B3529
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 16:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51D03B21AC6
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 15:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BCC1DE4DF;
	Mon, 28 Oct 2024 15:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HtIwKIE3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D451DD54F
	for <linux-i2c@vger.kernel.org>; Mon, 28 Oct 2024 15:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730130195; cv=none; b=XJoLkgKSAnwQSQ+peUN4EdiFGNwJ43d37tx2CLeTF7pfsZcB8Zwr5kQE/9ZPcc4TONmUyx8JJvWamjXQbncwed45AWFQjpKCiUZwBf4dRmzjPGlBhquSmLvAU8Es6FJ/ap8JQb1Q9hOKUhYOFohBcVO9UnlpCKQ6qeaTH6JWilE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730130195; c=relaxed/simple;
	bh=XVo/3bwi+PIOaKUXsNSyar2v36pwhDUCgR7r4pY4lo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m2kiJMfYLqGcf+4CKLu9GdCnGN7/+sbbkFkIOV9cvW+/LNEFPEPuIEJiao21lBNlwKo3uofLXfTsVAxl6eQun8/ipiZBaTnTnOPCLtZ6Wl4mh3exFbg384MxFYo1hvJ7qhHdy0hyyqqJoVdE8l4+rf4Qeaui0nVO6T7AltHEZCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HtIwKIE3; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so42616791fa.2
        for <linux-i2c@vger.kernel.org>; Mon, 28 Oct 2024 08:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730130189; x=1730734989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/+Fm3T4pn4crwgwgU+f7W2PGkdCB3Gmk2ieoRtXcSM=;
        b=HtIwKIE3GbGro4mPu24poxpiMtHmrY8DCi6un52MDWdh3ai+b5LkCFMvWKU4ISd3Z3
         +BU2X9YF5UwYwKK729DMxl/OyuZxbKQj5erUnTPm1GzkhhRDL6ar2bbCfxv7NqogGqEW
         tY3b3Iw6QmYicUzCQpEF55G5FQExg77ZC/Lx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130189; x=1730734989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/+Fm3T4pn4crwgwgU+f7W2PGkdCB3Gmk2ieoRtXcSM=;
        b=EkfFOlodjzPs41lxE/6oVI5BTIYbhhna/xJkmzca+F7bnP6QQx/HqOhu8ncCJJHwq7
         cTIjYCtncCje6emJjpg523+hRHfkob8+dIUnHvcEz9wY0RH5f/zYlh0ni3IxVpYegxrl
         E85gzCTh5ItLFJ4YuRYdirzdjvxAr0OgCWTnt3+yr4SC18UZeYC0QQhOGsAS+GqAVpjT
         7JIviVkuEb7bXtu31SOFG9sC6gR/5Duq7Ri7D39azSz/uXj8RSCZ3KSj6oE6rwt2OkS7
         fA17BVKeE7G0eGhugCoQvsnlvMVNg7L2pvrgHbkE3SSelFuBFrZrHH9eyRGQspKyzz9p
         aDaw==
X-Forwarded-Encrypted: i=1; AJvYcCVI9mX3t3PkM1ZQjHXWIUF62osi/FpSp9l/rmNwxZzFIkie75+E2GLWflUFG2e6R0gUe9MDdpoPOTc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+K1v1uwfsD3eGY7oS5wREnD2HoJO6mAHhTAVIQgMcvoFjxnam
	dDxQLJzyXXU2PG0N/dOmiYCiDEH0OlDI+hclmP6AaVdrPFZFUeR6YO6h0DT3cb6Hw6RtonQbsFI
	khg==
X-Google-Smtp-Source: AGHT+IEjQmOwT7ztns41l5uOZz4fQs0xKfKtGYnHBb6ObK4FCk4YR3FEDqcs4eFllQyVYpZrA0ta9w==
X-Received: by 2002:a2e:be85:0:b0:2fa:f5f1:2539 with SMTP id 38308e7fff4ca-2fcbe00392dmr34702781fa.24.1730130188653;
        Mon, 28 Oct 2024 08:43:08 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb45d1be3sm12095571fa.99.2024.10.28.08.43.06
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 08:43:07 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb3110b964so35189331fa.1
        for <linux-i2c@vger.kernel.org>; Mon, 28 Oct 2024 08:43:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3lBJAptW3bwgC010rpSKFDczyW2ouolBPASJzi9590FF1DYKkWrLtjXwnPJUr8mBWqzudtY/I6e8=@vger.kernel.org
X-Received: by 2002:a2e:bc0d:0:b0:2fa:d9db:7bac with SMTP id
 38308e7fff4ca-2fcbdf6250cmr34338691fa.3.1730130185979; Mon, 28 Oct 2024
 08:43:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017094222.1014936-1-wenst@chromium.org> <20241017094222.1014936-8-wenst@chromium.org>
 <CAD=FV=X-YzEGEc+tp-uB6vdPMEC-V9M=Gb60H69=_XY9w4R8nw@mail.gmail.com> <CAGXv+5H8kxrr=JJsMMY5Y+HC5JqMN-bMkm7hztOzQgrbew6-rw@mail.gmail.com>
In-Reply-To: <CAGXv+5H8kxrr=JJsMMY5Y+HC5JqMN-bMkm7hztOzQgrbew6-rw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Oct 2024 08:42:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VbTMLr8ybCvKwm4aau+UkwCewuj2mqFX_+9hdCALLBRA@mail.gmail.com>
Message-ID: <CAD=FV=VbTMLr8ybCvKwm4aau+UkwCewuj2mqFX_+9hdCALLBRA@mail.gmail.com>
Subject: Re: [PATCH v9 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Chen-Yu Tsai <wenst@chromium.org>
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

Hi,

On Mon, Oct 28, 2024 at 2:14=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> > > @@ -35,6 +37,7 @@ touchscreen@40 {
> > >                 hid-descr-addr =3D <0x0001>;
> > >                 interrupt-parent =3D <&pio>;
> > >                 interrupts =3D <88 IRQ_TYPE_LEVEL_LOW>;
> > > +               status =3D "fail-needs-probe";
> >
> > It's a little weird that there's no pinctrl definition for the
> > touchscreens but there is one for the trackpad, but that predates your
> > patch and is unlikely to be a big deal.
>
> To be honest I'm in favor of getting rid of pinctrl settings that
> do nothing more than mux in a GPIO, as mentioned in my talk at ELCE.
> Such settings are already implied by the interrupts or gpios properties.
> The fact that the OS doesn't enforce exclusiveness between the
> subsystems is not something the DT should deal with.

One could also argue that the fact that the Linux kernel happens to
auto-mux pins to GPIO is not something that the device tree should
assume. Personally I have never liked the "auto-mux" behavior of Linux
and I've found that it can get in the way when you need to do more
advanced pinmuxing, like when a driver needs to sometimes use a pin in
"special function" mode and sometimes in GPIO mode. The auto-muxing
happens behind the back of the driver which then needs to account for
this fact and work around it. Just sayin. :-P

