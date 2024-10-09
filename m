Return-Path: <linux-i2c+bounces-7302-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54478996C35
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 15:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 948EBB223FE
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 13:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710461991B6;
	Wed,  9 Oct 2024 13:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3neOl0y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD05190462;
	Wed,  9 Oct 2024 13:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728480888; cv=none; b=Z2eINOjI2aU0YxCsNUnHslmhYJbTngidl5avMIkzs7Y4ZR2kvfrbfg3SosxuqFTy+hrw5t5evGGiy7YHEF4LcOQABqP/4igYSp/nSktmr737eDlcAiiTKidlUtZj7S6qrjt0uguK0XdAy3PbKLWtaaBDeRCc7hrcwAu84OaOaJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728480888; c=relaxed/simple;
	bh=e0gqHlZkDT5WvXlJLxiiH51AUvpJH6OopoCW36UMFTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRFVrw3eJcJ+dnhgjvlteKcJ+U4Z1OnxblcpdTkdy4P/MU8bphu3ut4yYISToG0gUycyRkYpms1KC8BtRN8fWn1rELh0RxCCLxV0rNqaSnNgMqafDolaNrdIlBU+mUTVEkFRsYIC24MJeSxGuMO3tnJ0thcnkvKLH+D6wfJZbNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3neOl0y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45939C4CEC5;
	Wed,  9 Oct 2024 13:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728480886;
	bh=e0gqHlZkDT5WvXlJLxiiH51AUvpJH6OopoCW36UMFTI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U3neOl0ybb4Ab65jgWhp3xT7HcEy4YMuUgGV+fe0qorbYgOtJiVf4vdBC8aSbF+zk
	 VaSzmlKJr1Td+ZlEfUnqPwPvP3ItSIxZE3mhiSqTU0Y+ILn1z2LAcj5l0mNd964u9E
	 IJiiL6vn/nZ84NJqFn6bT+eDEGpN/zUWDJjiTS1Nw44OfqVQU1G+/BklpTTM5qjnQt
	 qFWcWXBTn592t1uwoUFl7fAOhoRDLvjep0N3/TGk+zJy9Qodx9ZM9pOn4mlQ+m1tjB
	 +zz3ljVHlk8StJ6aovxl3cW8GcQDcp3o2MYDG6IpoR0lwS4CMa0F2Pi7cYkeI0mOAq
	 BM9t8zEhFY8Sg==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5e7ae4c504fso3516272eaf.1;
        Wed, 09 Oct 2024 06:34:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCYBHtap9eFCW3ArtkPXaJnLn5ePbzRMLF94mTPKDCWvHZaXlO+efrZQ9WoBsAW0rGiCPuWUm/2hvW@vger.kernel.org, AJvYcCUJRLIt8++Asms4Z6YFGduZz8EUvaosy8ELAKdBk+YukWLoGYsCrAtZdLTQc+ePCbKPuLAKP+Q6Zddn@vger.kernel.org, AJvYcCUkPQvB1cQEd6oDHYzl+hw0cOlWz0zA32hTDm3HcGJ0BcYfiF6olPe/8ROtsL9QjfHFIUclxOMX4k1jzLI=@vger.kernel.org, AJvYcCV+aUdQXyBHAQNGH+brWQcmtteeQij7cC3p3WZpGRHm3y8ytXsWqv2rTFgdcJi1SvgsXPm7fj8AfpEI@vger.kernel.org, AJvYcCV/SF2Y8hgvSLREEQc3GPe+mhTti6rVXDdkPnBHdVtfBymF2iS04KGUf2U50I8yY3ugTXfAhBjz8ZxFAfPC@vger.kernel.org, AJvYcCVAYbdllUvcFJHe9+OctVfnyiD1tBGVy8aMJw1USr80rTMmRyHUt2uwlClssBFzEacOJTeSmY3ufPkZ@vger.kernel.org, AJvYcCVx0ILIb2bqJQwGWfceTiTswMWA7qkQBF3IDNK3Y++9GLJQKODRq+kbM8nNuT3GzDjMDDmj/exrfiLmHWxbyWvT@vger.kernel.org, AJvYcCW1arAhCLgfrrrpmNH8RanrE0gw8qbtN97USny55mxxStVROHs0OMiv6MGpBFbXIhOH4kvdsi6qRNOpsrI=@vger.kernel.org, AJvYcCW4uK4pp/SfwHOf8uV1KoMQH4aO0RVtfqyJg//wiE9xXy+VP3lt2iakoAfe5+Nj0B50bs1nkwoVfdhVIPr1ZtZ2kA==@vger.kernel.org, AJvYcCWMWHrYPU+Wj7NG
 TB2viIz++k/HlsVtqdh7QGTchZSaPcS9eruc6QMo5nmbhl/3j4x7rYQhz199pS5H@vger.kernel.org, AJvYcCWY1lWuqm50sh0wqMQMb+jDeJM+5Al6i42vWPqEiagWwABWr8vmt3d3vq9HKLiTtUNmtX7dEwefsI4=@vger.kernel.org, AJvYcCX3/WApf0RVgTI4rS7fgqUNzwuIRFSnJi0/x3ucVs2nDFYdO2MIrbZYThNNCwEGBOpzAwTK0EbU87Eo@vger.kernel.org, AJvYcCX9EDj4AyeWl5BKC2QlKRGaDYJzv0/hphzvGEfgGlK8Dpcf+46uKBu63g5b0eYIqHhJd6cXfC33@vger.kernel.org, AJvYcCXIB0DquxdKTLyab8yODrwn6Tlh9jjDfSHjxtm9fuMqtD1tpa4wuK65HOYAzXtvvY6TZZau8tiIIz0r/nqHVhc=@vger.kernel.org, AJvYcCXKRq6frWMsrT1XWrvf13RSumJym9g1pd6E8CgisgVautUqJ+mNDLK6my7dU/DRGFhJWvGkjqjJqiDZGFyN@vger.kernel.org, AJvYcCXPLfXcgojrQWn5dzzgPtuZpIGeyk1TBqBpQmBuBV0mwNY8kpNEJ2UCQpLUiUGQ4SwS5+Lz9dHRkffSsg==@vger.kernel.org, AJvYcCXTR+XrB33gvXCC3gkxiLVco9iP2hjj9cKBXmn5FUgvCC43QOGCsSe5OwDUYDubrm3Bj/Wf4fb5KGRj@vger.kernel.org, AJvYcCXchzfBXIXTdWLD8grIaI7Y7jNnWL6rqNLCCErTzbGLYjzIfQamfIqB4MzX1OhILl0fcvzQfiKQwZCq@vger.kernel.org, AJvYcCXsg22ML+HaZwTtG/y6l6UZNcCgdKEpRV1K6j8zuoK+E0qBh2l9gn6y5ubGXUrnxRpAzQaatusnfW3eUYm
 W@vger.kernel.org, AJvYcCXtXbSqnrF9IfHakH1CLfhw7uDd/khZ9tDC/RwUkUFRD6vTCBh1T2V5L56FXtzBEt3F9UABgnX7rnsRaLY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi/Hxvnc7e8NrjIW5/GnwKMx7fVvoVB1d02sUfbqGECs4pEIz/
	0eY293poLJic+qEAqL8Bod+C1gJLSEuI/VrqBUE4KJxWyf9eWEIbXEm0Zrtg6kTZcTN0xPq9OGG
	2f1HTVEYCyeoz/zOiJzRTuo8BNxI=
X-Google-Smtp-Source: AGHT+IGPvjQmX3zbZk+/LQ5kxG4XslEJ8m7y5iETpKVOpmsBmOdZ4tET2kRXnqT/piSrFy5yYrBa2CfwSNatwWXgz3s=
X-Received: by 2002:a05:6820:270f:b0:5e5:c489:6f3c with SMTP id
 006d021491bc7-5e987bc9df9mr1249377eaf.5.1728480885551; Wed, 09 Oct 2024
 06:34:45 -0700 (PDT)
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
 <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com> <41a0ad69-912b-4eb3-84f7-fb385433c056@opensource.cirrus.com>
In-Reply-To: <41a0ad69-912b-4eb3-84f7-fb385433c056@opensource.cirrus.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 9 Oct 2024 15:34:33 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gbrhMpPT0fHYSC+ES5WS5kv7XkM2hj9M4vpNwFFs6xsQ@mail.gmail.com>
Message-ID: <CAJZ5v0gbrhMpPT0fHYSC+ES5WS5kv7XkM2hj9M4vpNwFFs6xsQ@mail.gmail.com>
Subject: Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
To: Richard Fitzgerald <rf@opensource.cirrus.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
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
	asahi@lists.linux.dev, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 2:48=E2=80=AFPM Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:
>
> On 08/10/2024 7:24 pm, Rafael J. Wysocki wrote:
> > On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro=
.org> wrote:
> >>
> >> On Tue, 8 Oct 2024 at 00:25, Laurent Pinchart
> >> <laurent.pinchart@ideasonboard.com> wrote:
> >>>
> >>> Hi Ulf,
> >>>
> >>> On Tue, Oct 08, 2024 at 12:08:24AM +0200, Ulf Hansson wrote:
> >>>> On Mon, 7 Oct 2024 at 20:49, Laurent Pinchart wrote:
> >>>>> On Fri, Oct 04, 2024 at 04:38:36PM +0200, Ulf Hansson wrote:
> >>>>>> On Fri, 4 Oct 2024 at 11:41, Sakari Ailus wrote:
> >>>>>>>
> >>>>>>> Hello everyone,
> >>>>>>>
> >>>>>>> This set will switch the users of pm_runtime_put_autosuspend() to
> >>>>>>> __pm_runtime_put_autosuspend() while the former will soon be re-p=
urposed
> >>>>>>> to include a call to pm_runtime_mark_last_busy(). The two are alm=
ost
> >>>>>>> always used together, apart from bugs which are likely common. Go=
ing
> >>>>>>> forward, most new users should be using pm_runtime_put_autosuspen=
d().
> >>>>>>>
> >>>>>>> Once this conversion is done and pm_runtime_put_autosuspend() re-=
purposed,
> >>>>>>> I'll post another set to merge the calls to __pm_runtime_put_auto=
suspend()
> >>>>>>> and pm_runtime_mark_last_busy().
> >>>>>>
> >>>>>> That sounds like it could cause a lot of churns.
> >>>>>>
> >>>>>> Why not add a new helper function that does the
> >>>>>> pm_runtime_put_autosuspend() and the pm_runtime_mark_last_busy()
> >>>>>> things? Then we can start moving users over to this new interface,
> >>>>>> rather than having this intermediate step?
> >>>>>
> >>>>> I think the API would be nicer if we used the shortest and simplest
> >>>>> function names for the most common use cases. Following
> >>>>> pm_runtime_put_autosuspend() with pm_runtime_mark_last_busy() is th=
at
> >>>>> most common use case. That's why I like Sakari's approach of repurp=
osing
> >>>>> pm_runtime_put_autosuspend(), and introducing
> >>>>> __pm_runtime_put_autosuspend() for the odd cases where
> >>>>> pm_runtime_mark_last_busy() shouldn't be called.
> >>>>
> >>>> Okay, so the reason for this approach is because we couldn't find a
> >>>> short and descriptive name that could be used in favor of
> >>>> pm_runtime_put_autosuspend(). Let me throw some ideas at it and mayb=
e
> >>>> you like it - or not. :-)
> >>>
> >>> I like the idea at least :-)
> >>>
> >>>> I don't know what options you guys discussed, but to me the entire
> >>>> "autosuspend"-suffix isn't really that necessary in my opinion. Ther=
e
> >>>> are more ways than calling pm_runtime_put_autosuspend() that trigger=
s
> >>>> us to use the RPM_AUTO flag for rpm_suspend(). For example, just
> >>>> calling pm_runtime_put() has the similar effect.
> >>>
> >>> To be honest, I'm lost there. pm_runtime_put() calls
> >>> __pm_runtime_idle(RPM_GET_PUT | RPM_ASYNC), while
> >>> pm_runtime_put_autosuspend() calls __pm_runtime_suspend(RPM_GET_PUT |
> >>> RPM_ASYNC | RPM_AUTO).
> >>
> >> __pm_runtime_idle() ends up calling rpm_idle(), which may call
> >> rpm_suspend() - if it succeeds to idle the device. In that case, it
> >> tags on the RPM_AUTO flag in the call to rpm_suspend(). Quite similar
> >> to what is happening when calling pm_runtime_put_autosuspend().
> >
> > Right.
> >
> > For almost everybody, except for a small bunch of drivers that
> > actually have a .runtime_idle() callback, pm_runtime_put() is
> > literally equivalent to pm_runtime_put_autosuspend().
> >
> > So really the question is why anyone who doesn't provide a
> > .runtime_idle() callback bothers with using this special
> > pm_runtime_put_autosuspend() thing,
>
> Because they are following the documentation? It says:
>
> "Drivers should call pm_runtime_mark_last_busy() to update this field
> after carrying out I/O, typically just before calling
> pm_runtime_put_autosuspend()."
>
> and
>
> "In order to use autosuspend, subsystems or drivers must call
> pm_runtime_use_autosuspend() (...), and thereafter they should use the
> various `*_autosuspend()` helper functions instead of the non#
> autosuspend counterparts"
>
> So the documentation says I should be using pm_runtime_put_autosuspend()
> instead of pm_runtime_put().
>
> Seems unfair to criticise people for following the documentation.

I'm not criticising anyone, just wondering why they do what they do.

"Because it is documented this way" is a fair answer, but it doesn't
invalidate the observation that the difference between
pm_runtime_put_autosuspend() and pm_runtime_put() boils down to the
cases when the .runtime_idle() callback is present (which are few and
far between so to speak).  Moreover, there are call sites using
pm_runtime_*() functions even though they may not know whether or not
autosuspend is enabled for the target devices, so the advice given in
the documentation cannot be universally followed regardless.

This thread is about the way to go, generally speaking, and what I'm
saying is effectively that replacing pm_runtime_put_autosuspend() with
pm_runtime_put() almost everywhere (if not just everywhere) would be
fine with me.

I also think that the current users of pm_runtime_put_autosuspend()
that is not immediately preceded by pm_runtime_mark_last_busy() can be
readily switched over to using pm_runtime_put() instead of it and then
pm_runtime_put_autosuspend() can be made call
pm_runtime_mark_last_busy(), so the latter can be removed from the
code using the former.  Note that this last step does not require
tree-wide changes, because calling pm_runtime_mark_last_busy() twice
in a row for the same device is not a problem.

Of course, the documentation needs to be updated in accordance with
the code changes, which didn't happen when previous changes were made
to pm_runtime_put() and that likely is why it does not reflect the
current code.

