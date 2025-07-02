Return-Path: <linux-i2c+bounces-11778-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E47AF6109
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 20:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DDBD3B68F2
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 18:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDCB630E85B;
	Wed,  2 Jul 2025 18:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eWdH5Ue0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED242ECEB1;
	Wed,  2 Jul 2025 18:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751480546; cv=none; b=kBdid4B+EarsSG8iR1h29jFzg7hNUAAlBcFyM9Nl092K2U3ro7iQ8MWkP59DbZ0dONEPUDyWyw1yN9yxeHH9pE8MGp8nRQrcPwWNWmcm4S7bhgR9Z31TBqV0LF3Bvg0+jEv0m7P8cBxRq7/Y6A/cGIC6G3dqETD00OkFW0mM74o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751480546; c=relaxed/simple;
	bh=j3/uRPL+87EEZjvciuLYyh5YBCpisy4zQRKraMg6LQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INnY+nqn10J2aLwNsuR+fB8umy/1PrUGON9MMx4jDE3wVAIBz/tJAlnShVnrh0TDt81QdtJTFuMb12GiWuBNN52TZkTyIF6Wfi5NFzEKfXqmpNW82cW1gPKqNDpqfReZC0tDHrb38EQRAGWriQhnTtlIULHhmMpLI1QUmRv3t/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eWdH5Ue0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9DFC4CEF7;
	Wed,  2 Jul 2025 18:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751480546;
	bh=j3/uRPL+87EEZjvciuLYyh5YBCpisy4zQRKraMg6LQQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eWdH5Ue0pAvGCLuTSgm/fal7L45NkmR9SUAu5HgOuR24ALGR3o0Z5uRZm4u+DyzTQ
	 xbIx0UUHi1qhlFrY2keO8QxL8hMKnjLe0jdgKVeCNXTJ0g9Dh1QtkjyGZeISRzGW/6
	 JQhwUkOQ8fmqQYIdl80VJEw1xsupcd/QIjepMjI0wYc5djGwgrB4NQMeUxzf6L8Uxo
	 YvYmESwpzF3cOftgduvYEl8wOmtu2m+TXiqi2hnnUmd4UHgvc73njc1+Q+5Neev+VQ
	 GeYjvxRFUVAEfP5WmLxIeSxxr5Keoi6jkmd9EurugZX7ulMYEJFw57ZE8f+302u3x2
	 rJZjFBiUeMuWg==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-610d86b3da9so1774865eaf.0;
        Wed, 02 Jul 2025 11:22:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFzOYJ/TEWhX1VRMgoqX2Gqt+HkYIufQ06hP5xB1pVGT7eqYoIbexQ2dX0kDmdTQ0VOf7FrLk6SGWF@vger.kernel.org, AJvYcCUMwuLIkp/wf3sjM8qMOu2TEfpuQvOnZyKtpYs147JWujtZ9XeeEshNlRETZ6VbttytdLOvr2nMYvChkw==@vger.kernel.org, AJvYcCUQay7NUhQF/QYXEQIjMXs9iK5C4PjQGDDU5205MNgHtlYzfQ1uevDyDxfC2eRdr1LQy4YU8myybQqq@vger.kernel.org, AJvYcCVFsQTJEy+XtOQAHdRkKDw8VnR/lUEt99evLZRxgxVI8Avl0Ygeunx+JT88x0mOS6DnLZnuTjOkawxd8XmN@vger.kernel.org, AJvYcCVnSdZfrfVG3frH3qClsyJXWMKrZ+jfF8rnxFD974AZRmDX+9onNBGJHqZ+8XaMGZ7Qv1Nr1A8J9WS4@vger.kernel.org, AJvYcCVqzQBpTy3IcgmU+eGg7UK+Yo5ARoZ6mFI86bUQg5Klm5+vBvF0GITpV/p8bFdsD1SHUNeK+BGXA8OR@vger.kernel.org, AJvYcCWjhcXKwmBJuQeZTbdYx4BCnbrXHTg1dOnzayXoz7bP8V/3Wzi9h26/rPB0/o3/vtffRYq4uAhSuX4v@vger.kernel.org, AJvYcCWlBZobwVVfOzmbMqeMQlSGcaJW46tmxzcO5cG6xehL6yeVKMrEzntoHaR0Eqw7AQ3pnAu82K2Lakll@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv0hTFM4mqF2bt0fYWbvMxU1UQ4vo+e6E37uPmi0UwctXxOHOI
	8XT5iuvn+I5jllhNm7qWhhKd5RXmdydJWigugq64CzBdgak2eWpEcFxjHOQ/ilct5gsy4pvGWkk
	j1cyMIoPujBHyMUC7bpGMzrEWX3x43H4=
X-Google-Smtp-Source: AGHT+IGdUWTlRz3gGad/J6GD1otztC6+2hJ3QEKqvGHy0HR3TljgfmbwnHczYyQv3US2qz+AvA1Mx5q2n5hXbXQHZCs=
X-Received: by 2002:a05:6820:2d05:b0:611:ab60:3003 with SMTP id
 006d021491bc7-612012b713bmr2690095eaf.8.1751480545507; Wed, 02 Jul 2025
 11:22:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613134817.681832-1-herve.codina@bootlin.com> <20250613134817.681832-5-herve.codina@bootlin.com>
In-Reply-To: <20250613134817.681832-5-herve.codina@bootlin.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 2 Jul 2025 20:22:14 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g01QzAkpnJGdjEuif9h==tyB94tU3nCbumx_Ya3EOoDQ@mail.gmail.com>
X-Gm-Features: Ac12FXzCIz3WR5_Gfgmi876F2Tv7ANuaisfdJJFJig-pMM_jGk92Xrns93JskcU
Message-ID: <CAJZ5v0g01QzAkpnJGdjEuif9h==tyB94tU3nCbumx_Ya3EOoDQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/28] driver core: Avoid warning when removing a
 device while its supplier is unbinding
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
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

On Fri, Jun 13, 2025 at 3:48=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> During driver removal, the following warning can appear:
>    WARNING: CPU: 1 PID: 139 at drivers/base/core.c:1497 __device_links_no=
_driver+0xcc/0xfc
>    ...
>    Call trace:
>      __device_links_no_driver+0xcc/0xfc (P)
>      device_links_driver_cleanup+0xa8/0xf0
>      device_release_driver_internal+0x208/0x23c
>      device_links_unbind_consumers+0xe0/0x108
>      device_release_driver_internal+0xec/0x23c
>      device_links_unbind_consumers+0xe0/0x108
>      device_release_driver_internal+0xec/0x23c
>      device_links_unbind_consumers+0xe0/0x108
>      device_release_driver_internal+0xec/0x23c
>      driver_detach+0xa0/0x12c
>      bus_remove_driver+0x6c/0xbc
>      driver_unregister+0x30/0x60
>      pci_unregister_driver+0x20/0x9c
>      lan966x_pci_driver_exit+0x18/0xa90 [lan966x_pci]
>
> This warning is triggered when a consumer is removed because the links
> status of its supplier is not DL_DEV_DRIVER_BOUND and the link flag
> DL_FLAG_SYNC_STATE_ONLY is not set.
>
> The topology in terms of consumers/suppliers used was the following
> (consumer ---> supplier):
>
>       i2c -----------> OIC ----> PCI device
>        |                ^
>        |                |
>        +---> pinctrl ---+
>
> When the PCI device is removed, the OIC (interrupt controller) has to be
> removed. In order to remove the OIC, pinctrl and i2c need to be removed
> and to remove pinctrl, i2c need to be removed. The removal order is:
>   1) i2c
>   2) pinctrl
>   3) OIC
>   4) PCI device
>
> In details, the removal sequence is the following (with 0000:01:00.0 the
> PCI device):
>   driver_detach: call device_release_driver_internal(0000:01:00.0)...
>     device_links_busy(0000:01:00.0):
>       links->status =3D DL_DEV_UNBINDING
>     device_links_unbind_consumers(0000:01:00.0):
>       0000:01:00.0--oic link->status =3D DL_STATE_SUPPLIER_UNBIND
>       call device_release_driver_internal(oic)...
>         device_links_busy(oic):
>           links->status =3D DL_DEV_UNBINDING
>         device_links_unbind_consumers(oic):
>           oic--pinctrl link->status =3D DL_STATE_SUPPLIER_UNBIND
>           call device_release_driver_internal(pinctrl)...
>             device_links_busy(pinctrl):
>               links->status =3D DL_DEV_UNBINDING
>             device_links_unbind_consumers(pinctrl):
>               pinctrl--i2c link->status =3D DL_STATE_SUPPLIER_UNBIND
>               call device_release_driver_internal(i2c)...
>                 device_links_busy(i2c): links->status =3D DL_DEV_UNBINDIN=
G
>                 __device_links_no_driver(i2c)...
>                   pinctrl--i2c link->status is DL_STATE_SUPPLIER_UNBIND
>                   oic--i2c link->status is DL_STATE_ACTIVE
>                   oic--i2c link->supplier->links.status is DL_DEV_UNBINDI=
NG
>
> The warning is triggered by the i2c removal because the OIC (supplier)
> links status is not DL_DEV_DRIVER_BOUND. Its links status is indeed set
> to DL_DEV_UNBINDING.
>
> It is perfectly legit to have the links status set to DL_DEV_UNBINDING
> in that case. Indeed we had started to unbind the OIC which triggered
> the consumer unbinding and didn't finish yet when the i2c is unbound.
>
> Avoid the warning when the supplier links status is set to
> DL_DEV_UNBINDING and thus support this removal sequence without any
> warnings.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

The change is OK, so

Reviewed-by: Rafael J. Wysocki <rafael@kernel.org>

but it will clash with

https://lore.kernel.org/linux-pm/2793309.mvXUDI8C0e@rjwysocki.net/

that's been queued up by Greg AFAICS.

> ---
>  drivers/base/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 8fead097c404..ce367c44f642 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1494,7 +1494,8 @@ static void __device_links_no_driver(struct device =
*dev)
>                 if (link->supplier->links.status =3D=3D DL_DEV_DRIVER_BOU=
ND) {
>                         WRITE_ONCE(link->status, DL_STATE_AVAILABLE);
>                 } else {
> -                       WARN_ON(!(link->flags & DL_FLAG_SYNC_STATE_ONLY))=
;
> +                       WARN_ON(link->supplier->links.status !=3D DL_DEV_=
UNBINDING &&
> +                               !(link->flags & DL_FLAG_SYNC_STATE_ONLY))=
;
>                         WRITE_ONCE(link->status, DL_STATE_DORMANT);
>                 }
>         }
> --
> 2.49.0
>

