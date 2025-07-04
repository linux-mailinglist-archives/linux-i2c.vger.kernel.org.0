Return-Path: <linux-i2c+bounces-11840-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B893AF9B5D
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 21:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44D46541D3B
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 19:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6185F2253EA;
	Fri,  4 Jul 2025 19:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZQWPG3w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FD620ED;
	Fri,  4 Jul 2025 19:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751658796; cv=none; b=eVEm3I5g+hTNkXF8ZRaXJi55oxy+CiHMgIT8zZz/LzQADASvkrKEnPos+dRZbb/S/8eETbvYTEsyWAVxtxvjXtlxPvfIJe4JnCjxJNtruqdybxCCWL1xNtHeEJeD++ou4K/TnEP3nLgfhdjgPRVyZJb8T5KSC2hmQI2Uum2XUOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751658796; c=relaxed/simple;
	bh=DET2Gu0vw6K100zocQHh/uFyXtWFTkNoh5o1rTKK820=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PSJc3G0ptJoJCShRtFeZj+HUShREHFd5oRvv3ZdvAtP3DRAuvv2rCrVn/nUek9Z1pi4oNoE2Q8qWe7slblDouwJAZJW89mceuM7BrM8NrdZnXJGLF1q1Kbh3LcI94AbA0AcCjwZfJNqQOZXmgYLrIy8yHojXVUXKEq8lsj9v42c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZQWPG3w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A59DC19421;
	Fri,  4 Jul 2025 19:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751658795;
	bh=DET2Gu0vw6K100zocQHh/uFyXtWFTkNoh5o1rTKK820=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DZQWPG3w0lJkqYfBxwBNM3BVHGWmPzyMBcjTAIkyB/N9SqiQ4/IOx2DJRrKeiNw3i
	 w8lMfZ9su1NRgEQ80Er9kIAvm/ShWhC0Qi20IwZY2UB37ha31FmXvBf8mfBDS4M7qe
	 xwt/q+VrNeGN7W9JlI4kalMSjNfC8yH8yWh5roHFJSIWsERZN/7Xk+QIozVj8kOq0R
	 Qoy0wPppSnr+DF2T5UZqfJ7RoWXYM9MNzS4YD9f6AqHq+fYeV6riQww1jKtdhQXFpg
	 Xri+k6bHoSbB1P2T+bFHl0Y6C0zIsv3HOEFPZZ4nPP/S6IpRlAjFF+Yf4/ZclM//hD
	 f28emAB+5GrbQ==
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7387f21daadso1409244a34.0;
        Fri, 04 Jul 2025 12:53:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6/wqTrQKLFkskvwey5ed3uuYg8b8TJzMRGAA36AM6pAPHJnACO38vGJnBQe6ce8SDyugVT1iT5Uh/@vger.kernel.org, AJvYcCV3jIfbSu9SnOYj+NOFK7tvwkuIFvaBD0XXA5M1YrEN6KpO+KfAk5oBPxF4Jmd8qnGxmVpm7fua11yIJ14=@vger.kernel.org, AJvYcCVEI3hjhiQxNg9XyGP52a2BrI5UzP1pA7SQExIQM070ZBzmFg661cXZfA/KcgcqLRUdeDJaak33hVca@vger.kernel.org, AJvYcCVQiz3X3dLwULVkqW17SPGfttnisuTw6eeJ5p1BbIJeRNQnAoCFncn0UF7SYfbIKsdRpzKzzKtQrTFFBsPq@vger.kernel.org, AJvYcCVcEJZc11p24SKj/vrqVa6medaQK9aUruVC9NA8H1gdMSV0LfIqOjqdCZL9twZULaeyIG9bS4orvru0srxC3ZHhV40=@vger.kernel.org, AJvYcCVeeKGq3p1xVHfrqk6T0a7cx/mgu9pJ/O7397udUXz1i6PO28dThPIbp1mZO+yG6kcVrW2USs6Lq/8Majsqruscsw==@vger.kernel.org, AJvYcCWDdUHmSgwXR22/L9jKIFnSZDYYHFAaND//8PwjWShigIa/5zK6+kHgU6RV3LV4tWJBFYul4eWFmv+CWAL2@vger.kernel.org, AJvYcCWYHkLr7s13pm6NCntUx7ZRCGrZsKhQ7SytuAEs4e5ozGU6xFNlnpyruRxGmKWM3Sb1K3EQItCcn0PpghQw@vger.kernel.org, AJvYcCWbOZxP8Hi3TH6RrFn92rXb4OdPLjPwi7JWsbDV2+heggvnc7yyFESzXyTNBKM3cCswcQ5qzjBFeb/Y@vger.kernel.org, AJvYcCWuEJcV
 T1/+wke4vtzdiM406LdRydcMGH4irFTtqMJ9coAwl3SQOPeZe2fEAq6KcL9GymrgCphQKpI=@vger.kernel.org, AJvYcCXfDIUeXEm4RwdpGDxksDUx1G7srmGevgdjYIKokxob5ISbRV70FdEBI+X9Cju1H7ZaLW68TlYhT8EQ@vger.kernel.org, AJvYcCXgFgyVIK8udl7foc7t7RERBst0yD4T5Ik2BQ+SYs7sWH6kWrlg5zXqmLnqEM5/SiHw58xS2EpZ3nVt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx46CCdg84FCk8EY6Jjhy/WMJEy9wJFVko+/0+2E49DaqS8Et55
	Mm4U98sXfThJN1oeNgIHpiJ3fHhMUHNZGl5N8NefMT9iXu+n7lLrANLN+CsXLDVvNRmKb6t5uGb
	X9MLQBejz/fV3YAVSi0WHU635Yvnhq/U=
X-Google-Smtp-Source: AGHT+IGwyJdpfUpQdC1ll+pDxheWsfqF2OxiXgG5efFF2JMqLn7rWmU52bUG3dmWON2puNLtUSymlX1XAG1ud9UOuuY=
X-Received: by 2002:a05:6808:4f11:b0:40b:1e12:3cda with SMTP id
 5614622812f47-40d028eb731mr3068338b6e.0.1751658794378; Fri, 04 Jul 2025
 12:53:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703112708.1621607-1-claudiu.beznea.uj@bp.renesas.com> <CAPDyKFoznqfdX7Dvu3VPa5Me10VHGphnRRHrU17w-fie7HrQ5g@mail.gmail.com>
In-Reply-To: <CAPDyKFoznqfdX7Dvu3VPa5Me10VHGphnRRHrU17w-fie7HrQ5g@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 4 Jul 2025 21:53:02 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gH9ZAK9br58KB0VEtG+4VdwO7vEKtrKbpcYOKnZPf7bg@mail.gmail.com>
X-Gm-Features: Ac12FXwblY0_4cI57ifv3CnjCYA9AzB00n7d7xgdR8a0f_LjAGiuDDstt8INfuU
Message-ID: <CAJZ5v0gH9ZAK9br58KB0VEtG+4VdwO7vEKtrKbpcYOKnZPf7bg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] PM: domains: Detach on device_unbind_cleanup()
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, rafael@kernel.org, linux@armlinux.org.uk, 
	gregkh@linuxfoundation.org, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, dakr@kernel.org, len.brown@intel.com, pavel@kernel.org, 
	andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, wsa+renesas@sang-engineering.com, 
	mathieu.poirier@linaro.org, vkoul@kernel.org, yung-chuan.liao@linux.intel.com, 
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

On Fri, Jul 4, 2025 at 1:16=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org>=
 wrote:
>
> On Thu, 3 Jul 2025 at 13:27, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> >
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > Hi,
> >
> > Series drops the dev_pm_domain_detach() from platform bus remove and
> > adds it in device_unbind_cleanup() to avoid runtime resumming the devic=
e
> > after it was detached from its PM domain.
> >
> > Please provide your feedback.
> >
> > Thank you,
> > Claudiu
> >
> > Changes in v5:
> > - added PD_FLAG_ATTACH_POWER_ON, PD_FLAG_DETACH_POWER_OFF;
> >   due to this a new patch was introduced
> >   "PM: domains: Add flags to specify power on attach/detach"
> >
> > Changes in v4:
> > - added a flag in dev_pm_info that is saved in dev_pm_domain_attach()
> >   and used in device_unbind_cleanup()
> >
> > Changes in v3:
> > - add devm_pm_domain_attach()
> >
> > Changes in v2:
> > - dropped the devres group open/close approach and use
> >   devm_pm_domain_attach()
> > - adjusted patch description to reflect the new approach
> >
> >
> > Claudiu Beznea (3):
> >   PM: domains: Add flags to specify power on attach/detach
> >   PM: domains: Detach on device_unbind_cleanup()
> >   driver core: platform: Drop dev_pm_domain_detach() call
> >
> >  drivers/amba/bus.c                       |  4 ++--
> >  drivers/base/auxiliary.c                 |  2 +-
> >  drivers/base/dd.c                        |  2 ++
> >  drivers/base/platform.c                  |  9 +++------
> >  drivers/base/power/common.c              |  9 ++++++---
> >  drivers/clk/qcom/apcs-sdx55.c            |  2 +-
> >  drivers/gpu/drm/display/drm_dp_aux_bus.c |  2 +-
> >  drivers/i2c/i2c-core-base.c              |  2 +-
> >  drivers/mmc/core/sdio_bus.c              |  2 +-
> >  drivers/rpmsg/rpmsg_core.c               |  2 +-
> >  drivers/soundwire/bus_type.c             |  2 +-
> >  drivers/spi/spi.c                        |  2 +-
> >  drivers/tty/serdev/core.c                |  2 +-
> >  include/linux/pm.h                       |  1 +
> >  include/linux/pm_domain.h                | 10 ++++++++--
> >  15 files changed, 31 insertions(+), 22 deletions(-)
> >
> > --
> > 2.43.0
> >
>
> The series looks good to me, please add:
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> Rafael, do you intend to pick this via your tree?

I do in general, but I haven't looked at this version yet.  I'll get
to it early next week.

