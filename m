Return-Path: <linux-i2c+bounces-7280-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D65FC995675
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 20:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AE1628345B
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 18:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651B8212D2B;
	Tue,  8 Oct 2024 18:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWv3+c7h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67A220B1E5;
	Tue,  8 Oct 2024 18:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728411908; cv=none; b=iY4WxDlRVJ4m4OGBPQ1ELg85C6r0yZ+QDYeTfC1N+NEWbdte9IXY2ireisz0C8oJQSkjTtmfLl2Fawg/WyizRNiveUVThcMuOPPd37ItABn/GUNRI29vPt51qdQprLEIZJBhrKNxN2e0Eh524SuD1DrWZlkspZUJ0ccktCXb7Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728411908; c=relaxed/simple;
	bh=gbTLwyB5anW/NVNa27O4GYEgcT7Zt8zwGlDOBl4w9X4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DSjJ3y7jGCHPN0opTgBqBhLeVfPa0Y6k3x4lo2gFVhGf+YIXbRfaJHdkCYrJtWpj41BhLpVVGwnlq+UUDc0oVHa4+ULwK2vSOh9Iihv9qEZD8L1PG01Wuw4lQNgus1HhQsHBqwrmhWFcAPQIDmycPDt0RIAoPq6xgw5TFhRiC+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWv3+c7h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579F8C4CED3;
	Tue,  8 Oct 2024 18:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728411907;
	bh=gbTLwyB5anW/NVNa27O4GYEgcT7Zt8zwGlDOBl4w9X4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QWv3+c7hgheNar52dT93kuaRJqQGwrTlm+2qt+dJoGyQzAHIgU0jubrC8ThWhyZIZ
	 RS8ECJijkXPnKWXZt/DHYo4oNlel2cdA7QmeMfgDuBLkCfLLpl6vQcl4DNTcV5EyFH
	 5h8XYKukhwE21LUBMtMTij4WxRmO6XhWfjQaEwayPWgg9ncS5s6vbgtpgFKR2d4Ze1
	 U8RaeSIFzvB8vNoypQgBEdP43kZiPZVbc5vt/+kjhif0hCbio5j23Z7Fbcd2MdU+Eu
	 u4mqS8NwdiP912BRPYfCL4ckK1zD9U7UpC3cflIOLH9kTp0r9qM6ScGNZWHbmYuBvP
	 5BPH6goJRp7XQ==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5e5d0a80db4so3217626eaf.3;
        Tue, 08 Oct 2024 11:25:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3C3tK00jRXhoDZ96Dzj87jGGWiyg2EPXq2wo8twXZRCit9AeTBQH0qi7g71NeR3ndkIDf6zbCO2tCxOF3Go0=@vger.kernel.org, AJvYcCUD9UjTrJPYFCwGiVUYkyUEeZBiugwoiKWgkR6f1ZvJQUXSh7pQwb/ehWVwZSj34Obki6ROqP4T+Nwp@vger.kernel.org, AJvYcCUPVbBzCw6zvLiCONNyI1ddGYtUzA+MHpEDBCAsW6t6M65XCOKNj56eshvi2CmN/CpJORuxiTRooGbqUVBR1clH@vger.kernel.org, AJvYcCUafMoirgA3e5dJkDINiZqnh5qLjlbeI47XxJzi6PBgWdYgzJC00+bADWoklUhSt3fTGKXgi/2b7Cs=@vger.kernel.org, AJvYcCUdD/AhSYyBNDirh3PISBiwwXRNURiDVDcxQf77QQEDXCi3oTIY1JW+fz4/Zi5cCG7IsIVcnpYom8xN0XA=@vger.kernel.org, AJvYcCVKjPj8S9Cx++kzEGvwFgrQJ5Ii5xMsQlR05NMOg45G5iaauB8vEZpCTeJI6P5uFkoXKuBGJDKCo+nem6s=@vger.kernel.org, AJvYcCVL45VzJJc9nt6spfbiiO6L9DTnzo7i3yke7UoO/oTfZAtHo/vlmCCdXaBDUIv/E6ydRcx/oQplLjjzoA7H@vger.kernel.org, AJvYcCVMz5l8ZPHKtmjYCxJBkY4DRurKhkDBubjnyu3jKklDdLaVd6ej5iYbecElBzbNN/lfRjj4gAvLQyjH@vger.kernel.org, AJvYcCVTcIwXSAUbucn8TVDe1qx0PSHPmATijxKPLeBF/liopYXcLQ8ScAgnF3Yqj0X5rhu4cG5E48jqB8mc@vger.kernel.org, AJvYcCWClUGOO7yG560xUvaF
 YQCo7slmKdQbsRUjiXB1uhxLvpc+HouPwj4fFoi+FEBisNLRNDd1VQVWiaYj@vger.kernel.org, AJvYcCWOEzBzz0LjlFp6HFvZ11F5QnLq5gjO/21J41JjqVltZc+rpksNlzjeDYalgS79mIC58zE0xBoS@vger.kernel.org, AJvYcCWULSQYYztWyt0PcUroL3N0kIvSh9DCjJZM98nMzpRDokvJjojrZrBiVQDakYuM4uzVnRAV/gE1Sxxi@vger.kernel.org, AJvYcCWgM7Gzxm3gksn1fv9oUHSIJdAhDMK/c6wMzi8J+4YrDwp7epUQPKTEk0BxwOgVby4JbrU4dCZLlTRV@vger.kernel.org, AJvYcCWgXdWexWcVGuVAFwrVWY48r1t9Edbc4p9omIYy5/zgYxMqkiS5sbXJiYfIIlbuXNrhESuKJGWJvHyDiA==@vger.kernel.org, AJvYcCWxiJ/5XtFlUli+/zTZtnfq87fGeioVam9UlDjBmhZoMk8Gu976EkD63HnmmqLXDlr7LvNr4HVIJH9Ql2A7Ryfy/w==@vger.kernel.org, AJvYcCX3ch1TTIOzPm7XF+W4zOr7q8QsmZwzR1oJ6GKkz9XQ7vvlp/fHRjHux9+g6nUd4Z7CK8d5lW0ih6JDg28p@vger.kernel.org, AJvYcCX53X85N4Ri3qdiFm276KT5SNw18oK2Tre6x/w5VUfxRK+Pdh/J9GkRjmO26bM+wd3NMHx4AZ25PlEO@vger.kernel.org, AJvYcCX6L4fi/TdH5zDCtPYXvMzGM/qWvxLz34wO/6FzIoBhCYOEckc7qxU6Wy8CYN8mt+zVyjyO7nLMlK+3@vger.kernel.org, AJvYcCXCupac8c380ExASXZG1cOW3GSRrTD4pOsNa//Ehzy7Mc9+nhrMK91rRqiQYYUUNzHoUj4qEvu62hzFjFM
 =@vger.kernel.org, AJvYcCXN28OzyeGZgOPyw9ddKIIB6Tx6vMl50ZBIBrdKVVHELeHm6OnE7vFC/CpfnJolMr7yZJBzEiCuiH6TWjk1@vger.kernel.org
X-Gm-Message-State: AOJu0YxDtei8K4c+yglZWIg+wthGPZHkZ7UnsIQmNflJFGICsDhc9KZf
	6UGNS75k6Og3dhkPiDn96OjfZNpuVrvIjIr8L8jxLZ+rzJat6qBtCvWOpeT+mLhY8C7hDo0/oWm
	HENFfnjpCC32JdxMZanz8yplv9AQ=
X-Google-Smtp-Source: AGHT+IE8/UzrmOfg0dgL+a7sFpnmZmTmVZlVfZVXeH9h9sR6Zbx0f+k3/XHDUWx/NQFfJo1odWsZ7gtN5j50xL2u+GA=
X-Received: by 2002:a05:6820:228e:b0:5e1:d741:6f04 with SMTP id
 006d021491bc7-5e7cc079979mr12626737eaf.3.1728411906564; Tue, 08 Oct 2024
 11:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com> <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
 <20241007222502.GG30699@pendragon.ideasonboard.com> <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
In-Reply-To: <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 8 Oct 2024 20:24:55 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
Message-ID: <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
Subject: Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
To: Ulf Hansson <ulf.hansson@linaro.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-gpio@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, patches@opensource.cirrus.com, 
	iommu@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org, 
	asahi@lists.linux.dev, Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> On Tue, 8 Oct 2024 at 00:25, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Ulf,
> >
> > On Tue, Oct 08, 2024 at 12:08:24AM +0200, Ulf Hansson wrote:
> > > On Mon, 7 Oct 2024 at 20:49, Laurent Pinchart wrote:
> > > > On Fri, Oct 04, 2024 at 04:38:36PM +0200, Ulf Hansson wrote:
> > > > > On Fri, 4 Oct 2024 at 11:41, Sakari Ailus wrote:
> > > > > >
> > > > > > Hello everyone,
> > > > > >
> > > > > > This set will switch the users of pm_runtime_put_autosuspend() =
to
> > > > > > __pm_runtime_put_autosuspend() while the former will soon be re=
-purposed
> > > > > > to include a call to pm_runtime_mark_last_busy(). The two are a=
lmost
> > > > > > always used together, apart from bugs which are likely common. =
Going
> > > > > > forward, most new users should be using pm_runtime_put_autosusp=
end().
> > > > > >
> > > > > > Once this conversion is done and pm_runtime_put_autosuspend() r=
e-purposed,
> > > > > > I'll post another set to merge the calls to __pm_runtime_put_au=
tosuspend()
> > > > > > and pm_runtime_mark_last_busy().
> > > > >
> > > > > That sounds like it could cause a lot of churns.
> > > > >
> > > > > Why not add a new helper function that does the
> > > > > pm_runtime_put_autosuspend() and the pm_runtime_mark_last_busy()
> > > > > things? Then we can start moving users over to this new interface=
,
> > > > > rather than having this intermediate step?
> > > >
> > > > I think the API would be nicer if we used the shortest and simplest
> > > > function names for the most common use cases. Following
> > > > pm_runtime_put_autosuspend() with pm_runtime_mark_last_busy() is th=
at
> > > > most common use case. That's why I like Sakari's approach of repurp=
osing
> > > > pm_runtime_put_autosuspend(), and introducing
> > > > __pm_runtime_put_autosuspend() for the odd cases where
> > > > pm_runtime_mark_last_busy() shouldn't be called.
> > >
> > > Okay, so the reason for this approach is because we couldn't find a
> > > short and descriptive name that could be used in favor of
> > > pm_runtime_put_autosuspend(). Let me throw some ideas at it and maybe
> > > you like it - or not. :-)
> >
> > I like the idea at least :-)
> >
> > > I don't know what options you guys discussed, but to me the entire
> > > "autosuspend"-suffix isn't really that necessary in my opinion. There
> > > are more ways than calling pm_runtime_put_autosuspend() that triggers
> > > us to use the RPM_AUTO flag for rpm_suspend(). For example, just
> > > calling pm_runtime_put() has the similar effect.
> >
> > To be honest, I'm lost there. pm_runtime_put() calls
> > __pm_runtime_idle(RPM_GET_PUT | RPM_ASYNC), while
> > pm_runtime_put_autosuspend() calls __pm_runtime_suspend(RPM_GET_PUT |
> > RPM_ASYNC | RPM_AUTO).
>
> __pm_runtime_idle() ends up calling rpm_idle(), which may call
> rpm_suspend() - if it succeeds to idle the device. In that case, it
> tags on the RPM_AUTO flag in the call to rpm_suspend(). Quite similar
> to what is happening when calling pm_runtime_put_autosuspend().

Right.

For almost everybody, except for a small bunch of drivers that
actually have a .runtime_idle() callback, pm_runtime_put() is
literally equivalent to pm_runtime_put_autosuspend().

So really the question is why anyone who doesn't provide a
.runtime_idle() callback bothers with using this special
pm_runtime_put_autosuspend() thing, which really means "do a
runtime_put(), but skip my .runtime_idle() callback".

> >
> > >
> > > Moreover, it's similar for pm_runtime_mark_last_busy(), it's called
> > > during rpm_resume() too, for example. So why bother about having
> > > "mark_last_busy" in the new name too.
> > >
> > > That said, my suggestion is simply "pm_runtime_put_suspend".
> >
> > Can we do even better, and make pm_runtime_put() to handle autosuspend
> > automatically when autosuspend is enabled ?
>
> As stated above, this is already the case.

What really is needed appears to be a combination of
pm_runtime_mark_last_busy() with pm_runtime_put().

Granted, pm_runtime_put() could do the pm_runtime_mark_last_busy()
thing automatically if autosuspend is enabled and the only consequence
of it might be delaying a suspend of the device until its autosuspend
timer expires, which should not be a problem in the vast majority of
cases.

