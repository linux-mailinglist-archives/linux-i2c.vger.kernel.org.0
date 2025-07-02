Return-Path: <linux-i2c+bounces-11777-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D766AF60F8
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 20:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F8BD48357B
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 18:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26765309A70;
	Wed,  2 Jul 2025 18:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbEdL3RA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF95A1E9B3D;
	Wed,  2 Jul 2025 18:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751480247; cv=none; b=j3xr5z/QmiEvmS5ldL270SdI3/DBQ/la9WFXV5STY9PEDqsgZmwlvPXepeK6I3swnC256RTq5OvJXPu0y11Es4P/IZIW07JTlWa0Pls+EF9wMVcHFljrpXk2N5m8WHtG5M35A7CTV2Pi8zYpVzMZ+raM2Ao4Z+jSnXlqnAT5ng8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751480247; c=relaxed/simple;
	bh=VOX4noNm5hdr9//VV8fJuTw8qZlpN0KBl19xUJwzM0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GOxcUHQ/pjJCze69ylXdvplj0DN58D4zIrAibM3iwEURRXxET9J3UArCFldFzmcJ41Z+0OkpzV9FR5GVdYsVVCaONlZ9MZIiR/CmA3wsQZLZ/iRD+KeSgmH4BKhLyudF4oWQHfFe57EPrWS8b2xXrZOi9K1bSLF5NqAABKPGDCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbEdL3RA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54794C4CEFC;
	Wed,  2 Jul 2025 18:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751480247;
	bh=VOX4noNm5hdr9//VV8fJuTw8qZlpN0KBl19xUJwzM0g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WbEdL3RAX7oh0LBqkU3I3xP9rxn+OnYM54L831FAt+pVpseWAnxG9do6M0hFrTw6V
	 JzhR5pI+UY5MbjHtc84RUu8yHKAJpECxGX6va3IKYIH9a1q1mwa1q02Vlfe6zP4Eyc
	 ZzcgLvQlzIW9LnRbQuE1v5pOnJknFded/cQTn/r9/hXtS0sBrH7BNZzjGiHYZJwMmz
	 FRev7V7GBEpBFphCi9Oa0z1+Y8tLKN53iH/iqz18S90j8xm4UZj3NGYVkVYRAO6BfD
	 6GxrzN9gjLGGChImowxx6JhrruR0uBxUHLLEb8FSoGwAiLoFd89GPoSmXzfsRGa8VW
	 DHbOiS6ok/W4A==
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-73afbe1494fso2712294a34.0;
        Wed, 02 Jul 2025 11:17:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8cojmHQtKYVnGibw2wbd+zKyhkdgtOwNXkQ4zueQwsqgRdlTetb7O96oXLMwtTak3N5aRghZn8XJbvpDp@vger.kernel.org, AJvYcCUff5TJOBlDsnPrDfrG2MramNzrrkpeCk2+hAWXq3zCMAlXrb3h+CneSRytd57+W+i0+yAYcGdSbkvq2A==@vger.kernel.org, AJvYcCVzLI93VPeTOt5LI0tMX+Tett4faXvifi5iSzegm/YaA6/7g6T2FZPfTEHkJOmSpv9Phill9/X3Gaj+@vger.kernel.org, AJvYcCWiXyG4CVLTT7RqAsmcqpr7G1w0KXkM95/5M1uOPoQHE1GATMkh8HyVn1lfegfcL+48Vj038DshtOGX@vger.kernel.org, AJvYcCWrjdBTAWWXIyIX7UN5lOHVsZ3UzT0+6VbFbZvqCBxXH5ynU49UBOIrTAb4NQ7UpsIXLlmPqIPIqBB/@vger.kernel.org, AJvYcCXQko8St8L8Gtevx/azqg8f1pEPHgqmYgJA3ENgacvSNjGrLvSrcf8IqLeIh2UDdyeqymTZmzpojJ3w@vger.kernel.org, AJvYcCXYp76o/YxtnM+W9EnnE8188ZV0h8l9HGIBFAkEhFeHNe4AGnMGtmk8TUO7Rk089YOw86BVx6++fUs0@vger.kernel.org, AJvYcCXZFEjV3zGn3ya/s7vslVFDj+wnbLiDZTGThBiWUnOOajG6X7ADEoEhaTKtALr39mJXfjVZsIY8Tk1/@vger.kernel.org
X-Gm-Message-State: AOJu0YzzFJWn/KFgl8H2vF8eV7BqqdMk6ZKVzK4FztGJacVc8tSrZrpZ
	f2FppIuKvYRrB1avl6Dto2zTchOG1lPkE3llXzO4Rvlvh/kayXVRhId7l829SDty2huPIpmhsWc
	9Wj5v6RiTRVXT0mXIq8OUMun0cElU5+Y=
X-Google-Smtp-Source: AGHT+IFE15rcuOH+m5poFA5DuefTIa1FPtQnOGtl5tYQRl/dPKV6mXQEiFHJyvorY6w4piWgIZxb7JHJlha8CbYbuSQ=
X-Received: by 2002:a05:6830:8008:b0:72b:ae42:3530 with SMTP id
 46e09a7af769-73b4d10411fmr2321774a34.15.1751480246377; Wed, 02 Jul 2025
 11:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613134817.681832-1-herve.codina@bootlin.com> <20250613134817.681832-3-herve.codina@bootlin.com>
In-Reply-To: <20250613134817.681832-3-herve.codina@bootlin.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 2 Jul 2025 20:17:15 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iaqT5VY3=UCkTGQKjE7thEPmsSqsrEw9ntWEpZ6bNR3A@mail.gmail.com>
X-Gm-Features: Ac12FXwDgJ7Vxx3Bq6Wnh6b7GRhQ7F_SCrOgcKmm9L_ptDl7NqzS0VvNcXasFf0
Message-ID: <CAJZ5v0iaqT5VY3=UCkTGQKjE7thEPmsSqsrEw9ntWEpZ6bNR3A@mail.gmail.com>
Subject: Re: [PATCH v3 02/28] driver core: Rename get_dev_from_fwnode()
 wrapper to get_device_from_fwnode()
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
> get_dev_from_fwnode() calls get_device() and so it acquires a reference
> on the device returned.
>
> In order to be more obvious that this wrapper is a get_device() variant,
> rename it to get_device_from_fwnode().
>
> Suggested-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aYSV=
=3DiEkKPNbNOccYmA@mail.gmail.com/
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Saravana Kannan <saravanak@google.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/base/core.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index cbc0099d8ef2..36ccee91ba9a 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1881,7 +1881,7 @@ static void fw_devlink_unblock_consumers(struct dev=
ice *dev)
>         device_links_write_unlock();
>  }
>
> -#define get_dev_from_fwnode(fwnode)    get_device((fwnode)->dev)
> +#define get_device_from_fwnode(fwnode) get_device((fwnode)->dev)
>
>  static bool fwnode_init_without_drv(struct fwnode_handle *fwnode)
>  {
> @@ -1891,7 +1891,7 @@ static bool fwnode_init_without_drv(struct fwnode_h=
andle *fwnode)
>         if (!(fwnode->flags & FWNODE_FLAG_INITIALIZED))
>                 return false;
>
> -       dev =3D get_dev_from_fwnode(fwnode);
> +       dev =3D get_device_from_fwnode(fwnode);
>         ret =3D !dev || dev->links.status =3D=3D DL_DEV_NO_DRIVER;
>         put_device(dev);
>
> @@ -1960,7 +1960,7 @@ static struct device *fwnode_get_next_parent_dev(co=
nst struct fwnode_handle *fwn
>         struct device *dev;
>
>         fwnode_for_each_parent_node(fwnode, parent) {
> -               dev =3D get_dev_from_fwnode(parent);
> +               dev =3D get_device_from_fwnode(parent);
>                 if (dev) {
>                         fwnode_handle_put(parent);
>                         return dev;
> @@ -2016,8 +2016,8 @@ static bool __fw_devlink_relax_cycles(struct fwnode=
_handle *con_handle,
>                 goto out;
>         }
>
> -       sup_dev =3D get_dev_from_fwnode(sup_handle);
> -       con_dev =3D get_dev_from_fwnode(con_handle);
> +       sup_dev =3D get_device_from_fwnode(sup_handle);
> +       con_dev =3D get_device_from_fwnode(con_handle);
>         /*
>          * If sup_dev is bound to a driver and @con hasn't started bindin=
g to a
>          * driver, sup_dev can't be a consumer of @con. So, no need to ch=
eck
> @@ -2156,7 +2156,7 @@ static int fw_devlink_create_devlink(struct device =
*con,
>         if (sup_handle->flags & FWNODE_FLAG_NOT_DEVICE)
>                 sup_dev =3D fwnode_get_next_parent_dev(sup_handle);
>         else
> -               sup_dev =3D get_dev_from_fwnode(sup_handle);
> +               sup_dev =3D get_device_from_fwnode(sup_handle);
>
>         if (sup_dev) {
>                 /*
> @@ -2225,7 +2225,7 @@ static void __fw_devlink_link_to_consumers(struct d=
evice *dev)
>                 bool own_link =3D true;
>                 int ret;
>
> -               con_dev =3D get_dev_from_fwnode(link->consumer);
> +               con_dev =3D get_device_from_fwnode(link->consumer);
>                 /*
>                  * If consumer device is not available yet, make a "proxy=
"
>                  * SYNC_STATE_ONLY link from the consumer's parent device=
 to
> --

There are patches in flight that add new users of get_dev_from_fwnode(), se=
e

https://lore.kernel.org/linux-pm/20250701114733.636510-1-ulf.hansson@linaro=
.org/T/#mc45a73769821cc520c35d8eb92d4bac75412bb7c

