Return-Path: <linux-i2c+bounces-11870-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7304EAFBAFF
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 20:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CC063A94AA
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 18:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548A6265292;
	Mon,  7 Jul 2025 18:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1Gc354h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD67F262FF0;
	Mon,  7 Jul 2025 18:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751913812; cv=none; b=FE+1iLnT6ekWPO/MEBUcl766mMJmVnWSvPQ6at5tOpjK2FPSN+LU65xnlfeQcGvZOoaj5nGAoMvA1+nlfwCHBFnq5KKlA2elJm7iuvOHZTjc03cTPWKjhy9FVDPcE1xhjjvJnsoqIFiktu6Ru1T6Vo2NiO794rzao3bvL96/0Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751913812; c=relaxed/simple;
	bh=hrM7TAUwUzWNU7f4k4yx1Gu9ZxX5m6dymI/e327xOKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UdH406kFvGLfVRdgv9sRdiXwFre76j8Cm1g9IwyPPjVSqlT1gM35Dxa62cG4UwQ6gjWUs9kJJuXwHVJ7Ch8+RYQANshLK/2aQYXGGEcBb7GidrjKeUfE1l3eX/c6C3wmPbyzcJa3pofG8yRVmUD+hcKrGcd6uWwJA0k9bQzhUvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1Gc354h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77161C4AF0F;
	Mon,  7 Jul 2025 18:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751913811;
	bh=hrM7TAUwUzWNU7f4k4yx1Gu9ZxX5m6dymI/e327xOKY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I1Gc354hwbuJzz57xuHU0adjTwd//JV0gPzmskPDKzgFi0rUipml8X0O2V6LITrXo
	 3E8TyhoiOVpRorL5Je7NJYQJm7wFgMsRyX73rzrAPpeRq5Y6mKZ/snvPp9NZnIQljo
	 EJ/Yb7UdKN5WtGgio8YxdoU+yw6/C05cM08V0Q4zjByYzRZFUAg7rdN4loP5CZ0m7N
	 DSAIL4wUpN9lWI2/2fezfjt8ic6poJ7CHum+6NsaPgJsidjfva1nIMP/bhQLou0fTs
	 z74T2zsEVCgOebD+jix36p0L6MdL6vdi5pf9RYqMHBP7hnTRoskg4TuCI+hiEinqgi
	 MQud3uX4AQx2g==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-61390809a36so956977eaf.1;
        Mon, 07 Jul 2025 11:43:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHutvs2AN81vZ6J6Q44DnFjKkFGsfTsMHcGCDetQlgfAE+a3iARkRtgaHwExh0oQKXOXqInpwmGaIa@vger.kernel.org, AJvYcCUo0ZaWXpF053kafWae7MwisDyQ0QlbMGyIEojlRqTWsH/zzJUeuZlDZMDfrevYJcfdo2TjWKJ5CQbL@vger.kernel.org, AJvYcCUwOqRHYxAO9vvknUtTXYhqSAWbZaurZJgn+NEYh+zHE2kW38f5gR3qywEvit0301JGgO9OPe5ce/AEDIjF05AVfA==@vger.kernel.org, AJvYcCV3+1Z22IW6zQmqMbl8WjcjY4zpbRxmlnnsWu0AMqaN4wbXtvSPjJJzFnxyPExWJZytA2r8tkWUJepuONNk@vger.kernel.org, AJvYcCV8JgaoCGEwfMiHrZI9nSaZ6n60BzWuf0DRBxy6tTFSkW7l11jFrnR34rCf/f1Sm72JCA8Y4t6ut8nG@vger.kernel.org, AJvYcCVAjpxXZce9ThTnKCtLFdNDBQJ6dFkbn4E1lYjAjfDgOhxZnbF/BdocT3/7/Xx72aeJrrLnR8FzoqmWAIJ6@vger.kernel.org, AJvYcCVgSUnObPlYLwb1yKcxjJ6OtcDsOYjJv8GIJNvHCYWyU9NYVqL0+ibanlbx80WuXgNgecQz/KhWc8qq@vger.kernel.org, AJvYcCVwzyL4hvT+Ci/bldHrMMZ9+H09l9AT17O5r31rmOXV15IztHMs8HrgsQVTID8q/ieBVikSVCnE2l55gEOZSN9dlYo=@vger.kernel.org, AJvYcCWlv+YsG3nt98nHkqFtTTWakByeRqg32/XeY6IA7Pu5cuU4C6uGVF3b4zLWtJtp74SU7eXQcPIOBuVSfiE=@vger.kernel.org, AJvYcCWtB2OrmkOS
 bK0Vu1CHes+E3pkuD5poesbhjL3HEtVYLVtu4+yn+eOawr5CY21GsbnY2mjbZM5xGzBb@vger.kernel.org, AJvYcCWxW6EtxI1dpYAYx59v5ff2MrnQUsU3u2e+GCDu/FYhc1sWB3lIXnJC2r5lNGqTCeFGSvrgYrVIJkg=@vger.kernel.org, AJvYcCXfL4M0d21XFlYxz9O0xXWGcCpQVj0YtD7X5IBJ7DcmnSDnjD7zrrcwBqRJgWJ992l2yxT/RJNTZmcuOb6i@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4hAwDnHt3HYo7wiMB+zRmQf8Sg4F2mN7dks+B1034Qjsfrx5G
	1LZ/VxRskxHsyYVoNLwEdExgiATxzrjleqOwKFoUxo6WcMLXhIuIXgLVmlYYohmWqlJFUla1Smw
	lZT7gDMfj47W4I/CtgAVjjATrj+5zIW0=
X-Google-Smtp-Source: AGHT+IGWFo0UcD4MojnRdJcVhqk/giYu4pxqlIjmLkAJEnDd4MWXJ9qI/qzV8bVwGlXxOpEoErWIuer/la1NZ2vHba8=
X-Received: by 2002:a05:6820:c8d:b0:611:e30a:f9c7 with SMTP id
 006d021491bc7-613c0292e6amr496213eaf.7.1751913810559; Mon, 07 Jul 2025
 11:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703112708.1621607-1-claudiu.beznea.uj@bp.renesas.com>
 <CAPDyKFoznqfdX7Dvu3VPa5Me10VHGphnRRHrU17w-fie7HrQ5g@mail.gmail.com> <CAJZ5v0gH9ZAK9br58KB0VEtG+4VdwO7vEKtrKbpcYOKnZPf7bg@mail.gmail.com>
In-Reply-To: <CAJZ5v0gH9ZAK9br58KB0VEtG+4VdwO7vEKtrKbpcYOKnZPf7bg@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 7 Jul 2025 20:43:18 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gZK_JYgXYdbJ9pOBgrMO9sBa=VWP8HGOVV4C2mCOSSWg@mail.gmail.com>
X-Gm-Features: Ac12FXx21d9hRiF0Pqe_4V96M5MioxLeGCoj8OSAh6lGgwSlfReCuBO8e1tghsQ
Message-ID: <CAJZ5v0gZK_JYgXYdbJ9pOBgrMO9sBa=VWP8HGOVV4C2mCOSSWg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] PM: domains: Detach on device_unbind_cleanup()
To: Ulf Hansson <ulf.hansson@linaro.org>, Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux@armlinux.org.uk, gregkh@linuxfoundation.org, 
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org, 
	dakr@kernel.org, len.brown@intel.com, pavel@kernel.org, andersson@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	wsa+renesas@sang-engineering.com, mathieu.poirier@linaro.org, 
	vkoul@kernel.org, yung-chuan.liao@linux.intel.com, 
	pierre-louis.bossart@linux.dev, broonie@kernel.org, robh@kernel.org, 
	jirislaby@kernel.org, saravanak@google.com, jic23@kernel.org, 
	dmitry.torokhov@gmail.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, bhelgaas@google.com, geert@linux-m68k.org, 
	linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	fabrizio.castro.jz@renesas.com, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 9:53=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.org=
> wrote:
>
> On Fri, Jul 4, 2025 at 1:16=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.or=
g> wrote:
> >
> > On Thu, 3 Jul 2025 at 13:27, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> > >
> > > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >
> > > Hi,
> > >
> > > Series drops the dev_pm_domain_detach() from platform bus remove and
> > > adds it in device_unbind_cleanup() to avoid runtime resumming the dev=
ice
> > > after it was detached from its PM domain.
> > >
> > > Please provide your feedback.
> > >
> > > Thank you,
> > > Claudiu
> > >
> > > Changes in v5:
> > > - added PD_FLAG_ATTACH_POWER_ON, PD_FLAG_DETACH_POWER_OFF;
> > >   due to this a new patch was introduced
> > >   "PM: domains: Add flags to specify power on attach/detach"
> > >
> > > Changes in v4:
> > > - added a flag in dev_pm_info that is saved in dev_pm_domain_attach()
> > >   and used in device_unbind_cleanup()
> > >
> > > Changes in v3:
> > > - add devm_pm_domain_attach()
> > >
> > > Changes in v2:
> > > - dropped the devres group open/close approach and use
> > >   devm_pm_domain_attach()
> > > - adjusted patch description to reflect the new approach
> > >
> > >
> > > Claudiu Beznea (3):
> > >   PM: domains: Add flags to specify power on attach/detach
> > >   PM: domains: Detach on device_unbind_cleanup()
> > >   driver core: platform: Drop dev_pm_domain_detach() call
> > >
> > >  drivers/amba/bus.c                       |  4 ++--
> > >  drivers/base/auxiliary.c                 |  2 +-
> > >  drivers/base/dd.c                        |  2 ++
> > >  drivers/base/platform.c                  |  9 +++------
> > >  drivers/base/power/common.c              |  9 ++++++---
> > >  drivers/clk/qcom/apcs-sdx55.c            |  2 +-
> > >  drivers/gpu/drm/display/drm_dp_aux_bus.c |  2 +-
> > >  drivers/i2c/i2c-core-base.c              |  2 +-
> > >  drivers/mmc/core/sdio_bus.c              |  2 +-
> > >  drivers/rpmsg/rpmsg_core.c               |  2 +-
> > >  drivers/soundwire/bus_type.c             |  2 +-
> > >  drivers/spi/spi.c                        |  2 +-
> > >  drivers/tty/serdev/core.c                |  2 +-
> > >  include/linux/pm.h                       |  1 +
> > >  include/linux/pm_domain.h                | 10 ++++++++--
> > >  15 files changed, 31 insertions(+), 22 deletions(-)
> > >
> > > --
> > > 2.43.0
> > >
> >
> > The series looks good to me, please add:
> > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> >
> > Rafael, do you intend to pick this via your tree?
>
> I do in general, but I haven't looked at this version yet.  I'll get
> to it early next week.

Now applied as 6.17 material, thanks!

