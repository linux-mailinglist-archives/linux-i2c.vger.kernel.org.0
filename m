Return-Path: <linux-i2c+bounces-11792-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CE3AF63AB
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 23:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D221E4E0B28
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 21:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD65E23A9B0;
	Wed,  2 Jul 2025 21:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lcN/2g1d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BD6223DF0
	for <linux-i2c@vger.kernel.org>; Wed,  2 Jul 2025 21:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751490181; cv=none; b=F6isKT/x/C0wlTgWBNdiGqBxnJJcfe7yZXOjoJ9458s1oSyQd3aMGBLS3GYsXTSPGNY/vklIYjFkGWV/zLUb5SJWi+vd53u1cUgSm+9i8x9qOrX58gzpFx8t8eLffL3aHOxGOKRdE3Yw0ng/rTVHjWC/li62P+sUb3n3nHVHfTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751490181; c=relaxed/simple;
	bh=4vQ93QOR7sUMLGuKKWYA5MqL8eulcSCyBQPNC6yOAz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cw37fck0tlj00So+QNH7Xmtma8P0CNxHQzpUQnDwalWbKQKifo8DLA2KTrr5F/kyhjqAow4mYs2niS+7tMkkTrv/2hDcOyusLnxIo1VtmUqD6uXuuDUP0+iDbt5/MophTQJQjU5yA+wihGrz6erzH/FIilsMa9eukiU/a8U46L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lcN/2g1d; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d3e7503333so700893385a.3
        for <linux-i2c@vger.kernel.org>; Wed, 02 Jul 2025 14:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751490178; x=1752094978; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJ91IALf7qL2mLAV9e8zmgMyOJhT80+BeW9rsMA6c10=;
        b=lcN/2g1dPDvkVT7gcoUnSi5cF3fKLcQFP47h2jxNP4+OcUJX3+z1EU1MijGnA+BhCa
         6iU5o9D3lUwJH3ZGp2PjvTSuSum1AwrsX5uImQ0WRn318fBx1NNley0entkaXTkt6NTm
         3/UX3hYj8GjY4/HaWdPaSpEfcNtGjd+dCnGGJ2qZ8GNX12N5iSlrrNbHXENl9JTDfQ9X
         Zm0NAcugGC9AiyDy6Ogy/IiI5tkPv0enAUSdCACh1H2+APpm35gUKOfxcsQH/RtQ2rWY
         qmIY+NjArnY1+Pja8Y6cT8f5xIS/pT1fb8dw6o2CguZLfJ3F57jldd3pi8uG2OCXRWmy
         Zuyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751490178; x=1752094978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJ91IALf7qL2mLAV9e8zmgMyOJhT80+BeW9rsMA6c10=;
        b=GwE31Ny4wVVlxGnVHj04aasmmsYYvzqZ5hcfuaZh34OJmEZFHD+R2LstitQbwKpXeF
         SosRijksc/UYnV/Q9qAv3CXVrKeqwWqUw9OU5aa73ogxLphvSM4QshQGk2Qu7ZyXZMNb
         W+sZsv3zlQ5B674cl9McBlRBKbQ9moG66LyFENSXS9AQGHdqpVENIxwYA4UuXeTAhJWL
         XV19Z8+FaXMrjbTRyT+SBVaZNZs+5I2a9B/Kds7wlNWhRNqb5uMAiMA72mOxjq6sHmUm
         saBKTfB72U1/NeJwX69TzJaGCMCJp9vvoCCwlVLgPe6PQ6rxmTz0/qFAb6+QMqAVErvM
         hkkw==
X-Forwarded-Encrypted: i=1; AJvYcCX7G2mMdo8O8FjxPQnK6TKlgY1ExCVdj02j0Eu5WIYd3vTkDBgH7FxCWSLYJniGpNeD5MLr7CQjjns=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUbAuoedGnUdaVJxS6oVjW66sNmiJyzZH12J3t2pI3Ya9BuIcr
	+LP6eyivaeCmj4TY/cXM57+JesB1LVvuHCxJ7czZ51qmNzj2P1H+5CTBnL3ZStPWd0UB2g5iSRg
	z+uDJ2woSyKTh7RpVmxuzPxFq88jC2jl4CJzW9DUR
X-Gm-Gg: ASbGncsCZfT4sVeq6grA35qPU64pIje/jydHm0SljWpcnZV9KAw8fYfOAXRcmVjGb5F
	W3n77il+iwg05sq66KethpNp/3wfEI945zMh+/QS6dV4zEx715DRW71reUJvcOe3MSNY7BTxFLd
	VOgqKO9456AhiVnzeZTvOcTLlV2d+bKnZ81aYI0jC5gQQ0YhSWrfAPMMxazAoCxM2zQBggBgsD
X-Google-Smtp-Source: AGHT+IHZLJBo9iF9+nKbDyZZYnf6PcVxrcD0+f+tDZM+7z0OQ6NWXKWPaxUOSfKFFIK+EtLpeM3pSDTuYA14QV/DaCA=
X-Received: by 2002:a05:620a:280d:b0:7d3:f0a0:ea5f with SMTP id
 af79cd13be357-7d5d13f3399mr185371785a.22.1751490177645; Wed, 02 Jul 2025
 14:02:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-5-herve.codina@bootlin.com> <CAJZ5v0g01QzAkpnJGdjEuif9h==tyB94tU3nCbumx_Ya3EOoDQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0g01QzAkpnJGdjEuif9h==tyB94tU3nCbumx_Ya3EOoDQ@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 2 Jul 2025 14:02:20 -0700
X-Gm-Features: Ac12FXwhrjwNcoQlswzlpTiwmASKCStdWYLWRIuHlvNKRRZirJ70zPEsjhz1ybo
Message-ID: <CAGETcx85vKLcFcWBR2G005Nup8UkmVZFLYgd4DuUBOKxHvJn8Q@mail.gmail.com>
Subject: Re: [PATCH v3 04/28] driver core: Avoid warning when removing a
 device while its supplier is unbinding
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Peter Rosin <peda@axentia.se>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Davidlohr Bueso <dave@stgolabs.net>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 11:22=E2=80=AFAM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> On Fri, Jun 13, 2025 at 3:48=E2=80=AFPM Herve Codina <herve.codina@bootli=
n.com> wrote:
> >
> > During driver removal, the following warning can appear:
> >    WARNING: CPU: 1 PID: 139 at drivers/base/core.c:1497 __device_links_=
no_driver+0xcc/0xfc
> >    ...
> >    Call trace:
> >      __device_links_no_driver+0xcc/0xfc (P)
> >      device_links_driver_cleanup+0xa8/0xf0
> >      device_release_driver_internal+0x208/0x23c
> >      device_links_unbind_consumers+0xe0/0x108
> >      device_release_driver_internal+0xec/0x23c
> >      device_links_unbind_consumers+0xe0/0x108
> >      device_release_driver_internal+0xec/0x23c
> >      device_links_unbind_consumers+0xe0/0x108
> >      device_release_driver_internal+0xec/0x23c
> >      driver_detach+0xa0/0x12c
> >      bus_remove_driver+0x6c/0xbc
> >      driver_unregister+0x30/0x60
> >      pci_unregister_driver+0x20/0x9c
> >      lan966x_pci_driver_exit+0x18/0xa90 [lan966x_pci]
> >
> > This warning is triggered when a consumer is removed because the links
> > status of its supplier is not DL_DEV_DRIVER_BOUND and the link flag
> > DL_FLAG_SYNC_STATE_ONLY is not set.
> >
> > The topology in terms of consumers/suppliers used was the following
> > (consumer ---> supplier):
> >
> >       i2c -----------> OIC ----> PCI device
> >        |                ^
> >        |                |
> >        +---> pinctrl ---+
> >
> > When the PCI device is removed, the OIC (interrupt controller) has to b=
e
> > removed. In order to remove the OIC, pinctrl and i2c need to be removed
> > and to remove pinctrl, i2c need to be removed. The removal order is:
> >   1) i2c
> >   2) pinctrl
> >   3) OIC
> >   4) PCI device
> >
> > In details, the removal sequence is the following (with 0000:01:00.0 th=
e
> > PCI device):
> >   driver_detach: call device_release_driver_internal(0000:01:00.0)...
> >     device_links_busy(0000:01:00.0):
> >       links->status =3D DL_DEV_UNBINDING
> >     device_links_unbind_consumers(0000:01:00.0):
> >       0000:01:00.0--oic link->status =3D DL_STATE_SUPPLIER_UNBIND
> >       call device_release_driver_internal(oic)...
> >         device_links_busy(oic):
> >           links->status =3D DL_DEV_UNBINDING
> >         device_links_unbind_consumers(oic):
> >           oic--pinctrl link->status =3D DL_STATE_SUPPLIER_UNBIND
> >           call device_release_driver_internal(pinctrl)...
> >             device_links_busy(pinctrl):
> >               links->status =3D DL_DEV_UNBINDING
> >             device_links_unbind_consumers(pinctrl):
> >               pinctrl--i2c link->status =3D DL_STATE_SUPPLIER_UNBIND
> >               call device_release_driver_internal(i2c)...
> >                 device_links_busy(i2c): links->status =3D DL_DEV_UNBIND=
ING
> >                 __device_links_no_driver(i2c)...
> >                   pinctrl--i2c link->status is DL_STATE_SUPPLIER_UNBIND
> >                   oic--i2c link->status is DL_STATE_ACTIVE
> >                   oic--i2c link->supplier->links.status is DL_DEV_UNBIN=
DING
> >
> > The warning is triggered by the i2c removal because the OIC (supplier)
> > links status is not DL_DEV_DRIVER_BOUND. Its links status is indeed set
> > to DL_DEV_UNBINDING.
> >
> > It is perfectly legit to have the links status set to DL_DEV_UNBINDING
> > in that case. Indeed we had started to unbind the OIC which triggered
> > the consumer unbinding and didn't finish yet when the i2c is unbound.
> >
> > Avoid the warning when the supplier links status is set to
> > DL_DEV_UNBINDING and thus support this removal sequence without any
> > warnings.
> >
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>
> The change is OK, so
>
> Reviewed-by: Rafael J. Wysocki <rafael@kernel.org>

You can add mine too.

Reviewed-by: Saravana Kannan <saravanak@google.com>

-Saravana

>
> but it will clash with
>
> https://lore.kernel.org/linux-pm/2793309.mvXUDI8C0e@rjwysocki.net/
>
> that's been queued up by Greg AFAICS.
>
> > ---
> >  drivers/base/core.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 8fead097c404..ce367c44f642 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -1494,7 +1494,8 @@ static void __device_links_no_driver(struct devic=
e *dev)
> >                 if (link->supplier->links.status =3D=3D DL_DEV_DRIVER_B=
OUND) {
> >                         WRITE_ONCE(link->status, DL_STATE_AVAILABLE);
> >                 } else {
> > -                       WARN_ON(!(link->flags & DL_FLAG_SYNC_STATE_ONLY=
));
> > +                       WARN_ON(link->supplier->links.status !=3D DL_DE=
V_UNBINDING &&
> > +                               !(link->flags & DL_FLAG_SYNC_STATE_ONLY=
));
> >                         WRITE_ONCE(link->status, DL_STATE_DORMANT);
> >                 }
> >         }
> > --
> > 2.49.0
> >

