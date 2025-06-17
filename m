Return-Path: <linux-i2c+bounces-11508-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0270BADDBB4
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 20:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B06E17BEFF
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 18:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2492E972B;
	Tue, 17 Jun 2025 18:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JxDTVfBL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1511B2EF9D4;
	Tue, 17 Jun 2025 18:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750186443; cv=none; b=DN8vyVS9w51PMBsPpLC93U36CNnLVyUlDyLI2wXMM9quAGBOrnbtyzBKoitkiZccm/FzfI3qjdYq/JwDn0SJYL7PGsCzeWedgOY52w3sBpDIZJhAzEunZ0snuYvmUvYS4frRtosPARSqClJf5g1tGXHrd4l2EJ9i5SbzWzkOoZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750186443; c=relaxed/simple;
	bh=9i9ls61PxZx/5+9PGjHuX4/pEQ1DV0HHkvZ4b2biL9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VdeJWKj+qU+q2cPUlsv3IewwIxPy+0OXkD/jZDUzywankm9N6F+p73dfTB6hUeZAvCd5WXuX49zMs3AklOLS62MMGpyBjpgU6PIT06qAGMlR/OEBon5oXWsWLfHRuleWD6QeknVx73ogsoFdJ/uLc1ESV+eJajhUYdyC5fpSHHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JxDTVfBL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F845C4CEF4;
	Tue, 17 Jun 2025 18:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750186442;
	bh=9i9ls61PxZx/5+9PGjHuX4/pEQ1DV0HHkvZ4b2biL9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JxDTVfBL05QbOwbh475+SRCtTftF5GRAYNRnI0UGRB/t5Gd/pPz/YK8E2MwG3AqtK
	 jZ3/mQhhrQiMvOQcg5/qti0OhZ5e7WGnNUx1uNSWDFdfduvo7VSYXwUI3k9idlCXwe
	 5vC5HCK/Z/g0Es5r8kgdA6lyCJaOW81lg8o2/I5jND+EOJYTmOs92ekHqAskNmCPxl
	 nUTBn5kwKkymt5uNvu37tMFBUDbqm/poJSsqqY/jZDGcVVOJ0Un5vvqKHxNoHZusLW
	 42JEhBM6NonBZO6QJFgQjbkLQDwYruAZ0jwTZIUoUNBGV+KxQS02xC1EDolRfA6N3X
	 AVo1auGpjhFcQ==
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-408d14c7ebeso3607873b6e.1;
        Tue, 17 Jun 2025 11:54:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1bUwsQ4Z0qi5pQavxmEdx/WirGFYA0j9etmSUIOzTEx0Bsry+hhRQnaCkU2eMyigORjfwX4bATzOo+DcWOWBe54o=@vger.kernel.org, AJvYcCUkbR5Oe6RW9UujQlvUETimWsq1ymsPJDuX2Cce+DxeRQ4kVckLw6gcXxnjZRYZcce/44USE+IRywc=@vger.kernel.org, AJvYcCUt7tiMcS8HJPUk2duxQXXgH7d8C81AzNpPn0Wv1/ls5YKCT2IBfNbsFKSRNTDOzykRu5Ts7TCRShPqPeDq@vger.kernel.org, AJvYcCVpnTmTG4/k3YELpYprMSvNP5kTl5XCDxj2fx+oJCYngIV8mxmSqXrnGEnNmEz1+h1dUft8uKLY51gD@vger.kernel.org, AJvYcCXHbLT/4koh57lAB4bNg/i4VlT3RSXgjB5MFb24uXWIFl/LX27mLyJB2dNaQUi4wxWMa1o86b6RWQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgGlqvmE0UAA3+ssABQ/lQPrnDZASk+RTXrX5GvbJPhwxlXthR
	TiGg6E6CqlTIkk0iwW6pxi4IKzuFPoDLjU5kkO4aoLRQsk17QLc7GctMxcnYsEjinhMSO1S+c4T
	iGJu54OE3gU6g6OkP+Duc/6FjYG7QM0Y=
X-Google-Smtp-Source: AGHT+IEd8WViprdfhxydYy/kh0xByvY+wdhaIDYZqNEcfZ+gCIJDrbuUkGvm6Lh4tVRGEAiC/C+D/DsWcfZbGEZVbbI=
X-Received: by 2002:a05:6808:50a5:b0:402:11c2:253e with SMTP id
 5614622812f47-40a7c16fcb8mr9763628b6e.21.1750186441796; Tue, 17 Jun 2025
 11:54:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616135357.3929441-1-claudiu.beznea.uj@bp.renesas.com>
 <20250616135357.3929441-2-claudiu.beznea.uj@bp.renesas.com>
 <CAJZ5v0j_nm_z4ma2AsRkjiZn-AJ2bK982+Mwa8+_PoUAveNATQ@mail.gmail.com> <04a6c53c-8383-4496-b502-149bd261cfdb@tuxon.dev>
In-Reply-To: <04a6c53c-8383-4496-b502-149bd261cfdb@tuxon.dev>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 17 Jun 2025 20:53:50 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gZ3GZ79j2gbhVSjTN+RmYjEUJQjGMSoLsEkUYtjWTngQ@mail.gmail.com>
X-Gm-Features: AX0GCFv_7lg03g6mEMkhte4gvMSwIs4ChICL1Q43qvGodF4X7SdRBU6RopZF7MQ
Message-ID: <CAJZ5v0gZ3GZ79j2gbhVSjTN+RmYjEUJQjGMSoLsEkUYtjWTngQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] PM: domains: Detach on device_unbind_cleanup()
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, gregkh@linuxfoundation.org, dakr@kernel.org, 
	len.brown@intel.com, pavel@kernel.org, ulf.hansson@linaro.org, 
	jic23@kernel.org, daniel.lezcano@linaro.org, dmitry.torokhov@gmail.com, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, bhelgaas@google.com, 
	geert@linux-m68k.org, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, fabrizio.castro.jz@renesas.com, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, linux-i2c <linux-i2c@vger.kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 4:41=E2=80=AFPM Claudiu Beznea <claudiu.beznea@tuxo=
n.dev> wrote:
>
> Hi, Rafael,
>
> On 16.06.2025 20:14, Rafael J. Wysocki wrote:
> > On Mon, Jun 16, 2025 at 3:54=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.d=
ev> wrote:
> >>
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> The dev_pm_domain_attach() function is typically used in bus code alon=
gside
> >> dev_pm_domain_detach(), often following patterns like:
> >>
> >> static int bus_probe(struct device *_dev)
> >> {
> >>     struct bus_driver *drv =3D to_bus_driver(dev->driver);
> >>     struct bus_device *dev =3D to_bus_device(_dev);
> >>     int ret;
> >>
> >>     // ...
> >>
> >>     ret =3D dev_pm_domain_attach(_dev, true);
> >>     if (ret)
> >>         return ret;
> >>
> >>     if (drv->probe)
> >>         ret =3D drv->probe(dev);
> >>
> >>     // ...
> >> }
> >>
> >> static void bus_remove(struct device *_dev)
> >> {
> >>     struct bus_driver *drv =3D to_bus_driver(dev->driver);
> >>     struct bus_device *dev =3D to_bus_device(_dev);
> >>
> >>     if (drv->remove)
> >>         drv->remove(dev);
> >>     dev_pm_domain_detach(_dev);
> >> }
> >>
> >> When the driver's probe function uses devres-managed resources that de=
pend
> >> on the power domain state, those resources are released later during
> >> device_unbind_cleanup().
> >>
> >> Releasing devres-managed resources that depend on the power domain sta=
te
> >> after detaching the device from its PM domain can cause failures.
> >>
> >> For example, if the driver uses devm_pm_runtime_enable() in its probe
> >> function, and the device's clocks are managed by the PM domain, then
> >> during removal the runtime PM is disabled in device_unbind_cleanup() a=
fter
> >> the clocks have been removed from the PM domain. It may happen that th=
e
> >> devm_pm_runtime_enable() action causes the device to be runtime-resume=
d.
> >> If the driver specific runtime PM APIs access registers directly, this
> >> will lead to accessing device registers without clocks being enabled.
> >> Similar issues may occur with other devres actions that access device
> >> registers.
> >>
> >> Add detach_power_off member to struct dev_pm_info, to be used later in
> >> device_unbind_cleanup() as the power_off argument for
> >> dev_pm_domain_detach(). This is a preparatory step toward removing
> >> dev_pm_domain_detach() calls from bus remove functions. Since the curr=
ent
> >> PM domain detach functions (genpd_dev_pm_detach() and acpi_dev_pm_deta=
ch())
> >> already set dev->pm_domain =3D NULL, there should be no issues with bu=
s
> >> drivers that still call dev_pm_domain_detach() in their remove functio=
ns.
> >>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >> ---
> >>
> >> Changes in v4:
> >> - save dev->power.detach_power_off in dev_pm_domain_attach() and use
> >>   it in device_unbind_cleanup() when detaching
> >> - adjusted patch description
> >>
> >> Changes in v3:
> >> - dropped devm_pm_domain_detach_off(), devm_pm_domain_detach_on()
> >>   and use a single function devm_pm_domain_detach()
> >>
> >> Changes in v2:
> >> - none; this patch is new
> >>
> >>  drivers/base/dd.c           | 2 ++
> >>  drivers/base/power/common.c | 3 +++
> >>  include/linux/pm.h          | 1 +
> >>  3 files changed, 6 insertions(+)
> >>
> >> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> >> index b526e0e0f52d..13ab98e033ea 100644
> >> --- a/drivers/base/dd.c
> >> +++ b/drivers/base/dd.c
> >> @@ -25,6 +25,7 @@
> >>  #include <linux/kthread.h>
> >>  #include <linux/wait.h>
> >>  #include <linux/async.h>
> >> +#include <linux/pm_domain.h>
> >>  #include <linux/pm_runtime.h>
> >>  #include <linux/pinctrl/devinfo.h>
> >>  #include <linux/slab.h>
> >> @@ -552,6 +553,7 @@ static void device_unbind_cleanup(struct device *d=
ev)
> >>         dev->dma_range_map =3D NULL;
> >>         device_set_driver(dev, NULL);
> >>         dev_set_drvdata(dev, NULL);
> >> +       dev_pm_domain_detach(dev, dev->power.detach_power_off);
> >>         if (dev->pm_domain && dev->pm_domain->dismiss)
> >>                 dev->pm_domain->dismiss(dev);
> >>         pm_runtime_reinit(dev);
> >> diff --git a/drivers/base/power/common.c b/drivers/base/power/common.c
> >> index 781968a128ff..a8f302ed27a5 100644
> >> --- a/drivers/base/power/common.c
> >> +++ b/drivers/base/power/common.c
> >> @@ -111,6 +111,9 @@ int dev_pm_domain_attach(struct device *dev, bool =
power_on)
> >>         if (!ret)
> >>                 ret =3D genpd_dev_pm_attach(dev);
> >>
> >> +       if (dev->pm_domain)
> >> +               dev->power.detach_power_off =3D power_on;
> >
> > I'm assuming that you have checked all of the users of
> > dev_pm_domain_attach() and verified that the "power off" value is the
> > same as the "power on" one for all of them.
>
> In v2 it has been discussed to just mirror the power_on acquisition.
>
> Double checking now, all the current users of dev_pm_domain_attach() foll=
ow
> this rule, except the i2c bus. i2c powers on the domain conditionally:
>
> https://elixir.bootlin.com/linux/v6.15.2/source/drivers/i2c/i2c-core-base=
.c#L575
>
> and powers it off unconditionally:
> https://elixir.bootlin.com/linux/v6.15.2/source/drivers/i2c/i2c-core-base=
.c#L638
>
> Should we take this into account ?

I think so.

It is still sufficient to use one device flag to represent the
information whether or not to remove power on detach, but I would
change the second argument of dev_pm_domain_attach() to a u8
representing a mask of bits:

PM_DOMAIN_POWER_ON    BIT(0)
PM_DOMAIN_POWER_OFF    BIT(1)

where PM_DOMAIN_POWER_ON will be set to indicate that the device
should be turned on right after attaching the PM domain and the value
of PM_DOMAIN_POWER_OFF will be stored in the new device flag.

The majority of users will set or clear both, but i2c will set
PM_DOMAIN_POWER_OFF and either set of clear PM_DOMAIN_POWER_ON
depending on the do_power_on value.

