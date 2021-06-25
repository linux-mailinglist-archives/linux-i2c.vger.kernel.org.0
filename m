Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 680343B45B4
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jun 2021 16:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbhFYOjA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Jun 2021 10:39:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:57996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231617AbhFYOi7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 25 Jun 2021 10:38:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7895061963;
        Fri, 25 Jun 2021 14:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624631799;
        bh=BIBt2J1tIle4a2z03qHYBhi5IgnntqgLKHtoA7QyWhA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B4qi29flVIIjZPenqLpMOIeb9i3Lhm7sRbBvPf6BjbwE9cbPpLWjlf2pQyIHVANTZ
         lioUKB32qXjV659zHf2ADhkBAgS+7lWZXaARvqNqLaAvxBCSa6utsoEw3nR2zf86vi
         o5WFL0oo38cFiteY8YnNlxGpwZpsv7RRC2zuUdpaIePslr9NhTw/dotiSx++uy+MjO
         c2nBg310jmrpgZTwScowRHzS3N1A4fTnMen8A0asUx8ssPovSvcMwhbeicmyMg/yyB
         2JHvdxf0bQy/aFG7ppL4S9J6p3Gvhtf/TdBxb8MIv8mn4LFgMkSIdXtIWIReCYK0nX
         cO5Nz0vmxbIlw==
Date:   Fri, 25 Jun 2021 16:36:36 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     daire.mcnamara@microchip.com
Cc:     linux-i2c@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, palmer@dabbelt.com,
        cyril.jean@microchip.com, padmarao.begari@microchip.com,
        lewis.hanly@microchip.com, conor.dooley@microchip.com,
        david.abdurachmanov@gmail.com
Subject: Re: [PATCH v1 2/2] i2c: microchip: Add driver for Microchip
 PolarFire SoC
Message-ID: <YNXp9DsvMpWllPXT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        daire.mcnamara@microchip.com, linux-i2c@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org, palmer@dabbelt.com,
        cyril.jean@microchip.com, padmarao.begari@microchip.com,
        lewis.hanly@microchip.com, conor.dooley@microchip.com,
        david.abdurachmanov@gmail.com
References: <20210512112024.1651757-1-daire.mcnamara@microchip.com>
 <20210512112024.1651757-3-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QjIu8uDqNngAflAI"
Content-Disposition: inline
In-Reply-To: <20210512112024.1651757-3-daire.mcnamara@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QjIu8uDqNngAflAI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daire,

thanks for your driver! Some issues, but nothing major.

some checkpatch errors first:

ERROR: do not set execute permissions for source files
#47: FILE: drivers/i2c/busses/i2c-microchip.c

This must be fixed.


WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Are you interested in maintaining the driver? Then, please add a section
to MAINTAINERS as well.

WARNING: From:/Signed-off-by: email address mismatch: 'From: Daire McNamara=
 <Daire.McNamara@microchip.com>' !=3D 'Signed-off-by: Daire McNamara <daire=
=2Emcnamara@microchip.com>'

Would be nice to have this consistent as well!


> +config I2C_MICROCHIP
> +	tristate "Microchip I2C"
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  Microchip I2C interface.
> +

Document the module name?

> @@ -0,0 +1,519 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Microchip I2C controller driver
> + *
> + * Copyright (c) 2018 - 2021 Microchip Corporation. All rights reserved.
> + *
> + * Author: Daire McNamara <daire.mcnamara@microchip.com>
> + */
> +#include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +
> +#define MICROCHIP_I2C_TIMEOUT (msecs_to_jiffies(1000))
> +
> +#define MPFS_I2C_CTRL				(0x00)
> +#define   CTRL_CR0				(0x00)
> +#define   CTRL_CR1				(0x01)
> +#define   CTRL_AA				(0x02)
> +#define   CTRL_SI				(0x03)
> +#define   CTRL_STO				(0x04)
> +#define   CTRL_STA				(0x05)
> +#define   CTRL_ENS1				(0x06)
> +#define   CTRL_CR2				(0x07)

Using the BIT() macros, this would remove a lot of "1 << " from the
driver and make it quite more readable, I'd say.

> +static int mpfs_i2c_init(struct mpfs_i2c_dev *idev)
> +{
> +	u32 clk_rate =3D clk_get_rate(idev->i2c_clk);
> +	u32 divisor =3D clk_rate / idev->bus_clk_rate;

Not protected against division by zero, or?

> +	u8 clkval;
> +	int ret;
> +	u8 ctrl =3D readl(idev->base + MPFS_I2C_CTRL);
> +
> +	ctrl &=3D ~CLK_MASK;
> +
> +	ret =3D mpfs_generate_divisor(divisor, &clkval);
> +
> +	if (ret)
> +		return -1;

-EINVAL instead of -1? In mpfs_generate_divisor as well.

> +
> +	ctrl |=3D clkval;
> +
> +	writel(ctrl, idev->base + MPFS_I2C_CTRL);
> +
> +	ctrl =3D readl(idev->base + MPFS_I2C_CTRL);
> +
> +	/* Reset controller */

Very obvious comment :)

> +	mpfs_i2c_reset(idev);
> +
> +	return 0;
> +}

> +static irqreturn_t mpfs_i2c_handle_isr(int irq, void *_dev)
> +{
> +	bool read, finish =3D false;

drivers/i2c/busses/i2c-microchip.c: In function =E2=80=98mpfs_i2c_handle_is=
r=E2=80=99:
drivers/i2c/busses/i2c-microchip.c:244:7: warning: variable =E2=80=98read=
=E2=80=99 set but not used [-Wunused-but-set-variable]

> +	struct mpfs_i2c_dev *idev =3D _dev;
> +	u32 status =3D idev->isr_status;
> +	u8 ctrl;
> +
> +	if (!idev->buf) {
> +		dev_warn(idev->dev, "unexpected interrupt\n");
> +		return IRQ_HANDLED;
> +	}
> +
> +	read =3D idev->msg_read ? 1 : 0;
> +
> +	switch (status) {
> +	case STATUS_M_START_SENT:
> +	case STATUS_M_REPEATED_START_SENT:
> +		ctrl =3D readl(idev->base + MPFS_I2C_CTRL);
> +		ctrl &=3D ~(1 << CTRL_STA);
> +		writel(idev->addr, idev->base + MPFS_I2C_DATA);
> +		writel(ctrl, idev->base + MPFS_I2C_CTRL);
> +		if (idev->msg_len <=3D 0)

    CPPCHECK
drivers/i2c/busses/i2c-microchip.c:263:21: warning: Checking if unsigned ex=
pression 'idev->msg_len' is less than zero. [unsignedLessThanZero]

=2E..

> +static int mpfs_i2c_xfer_msg(struct mpfs_i2c_dev *idev, struct i2c_msg *=
msg)
> +{
> +	u8 ctrl;
> +	unsigned long time_left;
> +
> +	if (msg->len =3D=3D 0)
> +		return -EINVAL;

Use a 'struct i2c_adapter_quirks' with the I2C_AQ_NO_ZERO_LEN flag and
the core will check that for you.

> +static u32 mpfs_i2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}

If you can't do zero lenght transfers, you'll need
(I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK).

> +static int mpfs_i2c_probe(struct platform_device *pdev)
> +{
> +	struct mpfs_i2c_dev *idev =3D NULL;

Initialization not needed.

> +	idev->dev =3D &pdev->dev;
> +	init_completion(&idev->msg_complete);
> +	spin_lock_init(&idev->lock);

This spinlock is not used anywhere? It seems that everything spinlock
related can go?

> +
> +	val =3D device_property_read_u32(idev->dev, "clock-frequency",
> +				       &idev->bus_clk_rate);
> +	if (val) {
> +		dev_info(&pdev->dev, "default to 100kHz\n");
> +		idev->bus_clk_rate =3D 100000;	/* default clock rate */
> +	}
> +
> +	if (idev->bus_clk_rate > 400000) {
> +		dev_err(&pdev->dev, "invalid clock-frequency %d\n",
> +			idev->bus_clk_rate);
> +		return -EINVAL;
> +	}
> +
> +	ret =3D devm_request_irq(&pdev->dev, irq, mpfs_i2c_isr,
> +			       IRQF_SHARED, pdev->name, idev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to claim irq %d\n", irq);
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(idev->i2c_clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to enable clock\n");
> +		return ret;
> +	}
> +
> +	ret =3D mpfs_i2c_init(idev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to program clock divider\n");
> +		return ret;
> +	}
> +
> +	i2c_set_adapdata(&idev->adapter, idev);
> +	snprintf(idev->adapter.name, sizeof(idev->adapter.name),
> +		 "Microchip I2C hw bus");

Most people add the base address of the registers here to be able to
differentiate multiple adapters in one system.

> +	idev->adapter.owner =3D THIS_MODULE;
> +	idev->adapter.algo =3D &mpfs_i2c_algo;
> +	idev->adapter.dev.parent =3D &pdev->dev;
> +	idev->adapter.dev.of_node =3D pdev->dev.of_node;
> +
> +	platform_set_drvdata(pdev, idev);
> +
> +	ret =3D i2c_add_adapter(&idev->adapter);
> +	if (ret) {
> +		clk_disable_unprepare(idev->i2c_clk);
> +		return ret;
> +	}
> +
> +	dev_info(&pdev->dev, "Microchip I2C Probe Complete\n");
> +
> +	return 0;
> +}

But this is all pretty minor stuff. It looks quite good actually!

Happy hacking,

   Wolfram


--QjIu8uDqNngAflAI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDV6fAACgkQFA3kzBSg
Kbah+Q//dI0CSwLbR9S2m53Oo9jVuLo7Wu3Jhm7PeXGWMNQQatu0au6S0i7PJn2u
H0w55WnGOhUiwhKw48uO6Nrn8RWQCjaeC8qBEeTHZ3QnmaBxkYQroEGuMTRED4Tk
4JYwBxDU0uSNwRQGwMeRwQdX4kKD6pM7SVSOs0eH6Fylmieop42YytXPdoK1zySM
nk+2FBCn3/6w8bfL7s7j/W9SHZNLM2eul7F1dymQe5NNEkBZVIkq/MUJIokyHO9X
09ktJ4K+RnJAD/tR/E0+E9+Q5vLUOMsUjiXa86PGmsa2jEvetmxJ3YjSHzDxKyhW
kYLCJLRg4PYzp+HRtCzCU6E9wReFbuUR4sjcFA9gpDareIfurd5RCFFPF4/ruFtF
qfQDRDmyffs8wtu8r7C4SpMX/bqjh2+W24VDbeZkX6CkGIS0xIKRzE/4TMg9ajn+
d6+b4L+t39y3zfNNWPDnacHDanHey9DlYn8p8Ib7yzK1HTWSEEik9P7dUpVJ+xE2
ZGM+FiTqDSv4JgzD2iBg8e+GWOwXGllygqA/ZHF/CTwD67WW2up82cjujDoX+eHg
aSIv64bOu7L3yU4Q/sH9ONO3SK5q2EEFLw2CTEVeyYOM1Ht7W8qL9LzgFo5CZRxh
DCdAznuIstqoR6Qe/Jp96AdjHXMmbx1+x/z10SQQRSLEU38KnE4=
=Hq0M
-----END PGP SIGNATURE-----

--QjIu8uDqNngAflAI--
