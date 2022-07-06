Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C55CD567FAC
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jul 2022 09:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbiGFHTb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 03:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230411AbiGFHTb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 03:19:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF8817597;
        Wed,  6 Jul 2022 00:19:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C1216B81B34;
        Wed,  6 Jul 2022 07:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941B5C3411C;
        Wed,  6 Jul 2022 07:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657091967;
        bh=FB2gZ5iWwU/2a567MT026YYSUHCSk5tzPNywBL8SsB0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gulmZnpLXpwkVNG1h2iqjiRdlj+KzXD4IWAE8z8c7ef356hRD3AbS6b0Pjo/174UC
         jq16jN9qYaqz/biFvuhK0hrBachfGHCD4LvJ875cZhn92tSkZPn+QvTiB9WYx4pBTJ
         0bwX6VEtilDMmhFNue5bPo/P81T21At1swZYmj7SQzUFkSfdIK1Sq2kEQez7LVE6Ec
         wWIBrOWcxwWqIlGQ+MyfgWecnUZNXscInBq2bp25NKY12ISM9GTobPvoTa0zTdCidL
         4uaiSyq48mSOcUpjrWP67nTZ/z5nSF2LHuaoP1Nwa2nteuJYh6U52yVvnHxZwZRvTL
         mpgsnx2xYv1uQ==
Date:   Wed, 6 Jul 2022 09:19:20 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        daire.mcnamara@microchip.com
Subject: Re: [PATCH v6 1/2] i2c: add support for microchip fpga i2c
 controllers
Message-ID: <YsU3eLA3PrceFS65@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        daire.mcnamara@microchip.com
References: <20220621074238.957177-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OmL4pllIGSAYh4OI"
Content-Disposition: inline
In-Reply-To: <20220621074238.957177-1-conor.dooley@microchip.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OmL4pllIGSAYh4OI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Conor,

thank you for sending this driver.

On Tue, Jun 21, 2022 at 08:42:38AM +0100, Conor Dooley wrote:
> Add Microchip CoreI2C i2c controller support. This driver supports the
> "hard" i2c controller on the Microchip PolarFire SoC & the basic feature
> set for "soft" i2c controller implemtations in the FPGA fabric.
>=20
> Co-developed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Where are the bindings? Are they already on the way upstream?

>  drivers/i2c/busses/i2c-microchip-core.c | 486 ++++++++++++++++++++++++

The biggest remark I have is to rename the driver a little. Usually a
"-core" suffix means that there are other drivers like "-platform" or
"-pci" use this core. Would "i2c-microchip-fpga" or
"i2c-microchip-corei2c" work for you?

> +#include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>

Do you really need that?

=2E..

> +static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
> +{
> +	u32 status =3D idev->isr_status;
> +	u8 ctrl;
> +	bool last_byte =3D false, finished =3D false;
> +
> +	if (!idev->buf)
> +		return IRQ_NONE;
> +
> +	switch (status) {
> +	case STATUS_M_START_SENT:
> +	case STATUS_M_REPEATED_START_SENT:
> +		ctrl =3D readb(idev->base + CORE_I2C_CTRL);
> +		ctrl &=3D ~CTRL_STA;
> +		writeb(idev->addr, idev->base + CORE_I2C_DATA);
> +		writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +		if (idev->msg_len <=3D 0)
> +			finished =3D true;

How can it happen that len is < 0? Wouldn't that be an error case?

=2E..

> +static u32 mchp_corei2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;

Have you testes SMBUS_QUICK as well?

=2E..

> +	idev->dev =3D &pdev->dev;
> +	init_completion(&idev->msg_complete);
> +	spin_lock_init(&idev->lock);

You never use this lock.

=2E..

> +	idev->adapter.owner =3D THIS_MODULE;
> +	idev->adapter.algo =3D &mchp_corei2c_algo;
> +	idev->adapter.dev.parent =3D &pdev->dev;
> +	idev->adapter.dev.of_node =3D pdev->dev.of_node;
> +	idev->adapter.timeout =3D MICROCHIP_I2C_TIMEOUT;

Simply use HZ here?

All in all, only minor stuff. Driver looks really good in general.

Thanks and happy hacking,

   Wolfram


--OmL4pllIGSAYh4OI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLFN3MACgkQFA3kzBSg
Kba8NRAAqyqEH6g74uljPcXWAkLi3roPje6JaNcEUiOq3uuDxx9YV5NA5iGAB5Tr
kxGim4tON8th0+soWiJDwimGPBE5Qjpe6sbn5gWT5AVp/3yPeo4eJTId/ck8siSu
ocINGQuQrSNY3obDX+t6gkWPbl8i4/DKwuGZf1/O3zTBS+HdlFuiWQHUAEmyQe5d
aBEg2+zXHiU4F317yDZaZSHWpbljfqlFYzF4KiLL9tuQjY2Hfk1Zp0eQYbj00Eke
4h0khf3y0smBvb2LDPL/BqDBxBK+1iZ1pmuFbmIdEvj77dUcfWvobZDcl1H/CefE
UhMET1HczdIw4K/RpUugCzyKQmTs7Z9TOB59U8pI+xZqr1XUq8qGawtrbZbVw1fV
BGIDShROfHS3sYd6yEDAg4fQJo2VHxSvqqeBk01Js2JMnB2iTB/LgUw45DqgViAU
8q5f77M+DGHOlxbjCCwr04Xf8iE8rZUl3pBAjC4rBN0LUoBT/BdkGf/xwGvaU3eg
DId0nedud9Zb+dMwHa9OcJBdrpI6xy7Wsg0PWa3xseB0TokNws+1HzPEHNU6jVJR
ej+IrfqaKPbyuaAH0QO/82qdwgW80uBuL9qp+/XcsK6yKdXH5r/a3FOwRCar6cil
W8eS6gjbP79w47yTAFJFEwae/wDZM0/EyEWF4YxWSe89sFjYJw4=
=R64A
-----END PGP SIGNATURE-----

--OmL4pllIGSAYh4OI--
