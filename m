Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89C3F33971
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 22:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbfFCUBn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 16:01:43 -0400
Received: from sauhun.de ([88.99.104.3]:40238 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726057AbfFCUBm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Jun 2019 16:01:42 -0400
Received: from localhost (p5486CC42.dip0.t-ipconnect.de [84.134.204.66])
        by pokefinder.org (Postfix) with ESMTPSA id 96C6E2CF690;
        Mon,  3 Jun 2019 22:01:39 +0200 (CEST)
Date:   Mon, 3 Jun 2019 22:01:39 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stefan Roese <sr@denx.de>
Cc:     linux-i2c@vger.kernel.org, Steven Liu <steven_liu@mediatek.com>,
        Jan Breuer <jan.breuer@jaybee.cz>,
        John Crispin <john@phrozen.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver
Message-ID: <20190603200139.GA2383@kunai>
References: <20190506105746.16397-1-sr@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <20190506105746.16397-1-sr@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

thanks for your patch.

On Mon, May 06, 2019 at 12:57:46PM +0200, Stefan Roese wrote:
> This patch adds a driver for the I2C controller found on the MediaTek
> MT7621/7628/7688 SoC's. The base version of this driver was done by
> Steven Liu (according to the copyright and MODULE_AUTHOR lines). It
> can be found in the OpenWRT repositories (v4.14 at the time I looked).
>=20
> The base driver had many issues, which are disccussed here:
>=20
> https://en.forum.labs.mediatek.com/t/openwrt-15-05-loads-non-working-i2c-=
kernel-module-for-mt7688/1286/3
>=20
> From this link an enhanced driver version (complete rewrite, mayor
> changes: support clock stretching, repeated start, ACK handling and
> unlimited message length) from Jan Breuer can be found here:
>=20
> https://gist.github.com/j123b567/9b555b635c2b4069d716b24198546954
>=20
> This patch now adds this enhanced I2C driver to mainline.
>=20
> Changes by Stefan Roese for upstreaming:
> - Add devicetree bindings
> - checkpatch clean
> - Use module_platform_driver()
> - Minor cosmetic enhancements
>=20
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Steven Liu <steven_liu@mediatek.com>
> Cc: Jan Breuer <jan.breuer@jaybee.cz>
> Cc: John Crispin <john@phrozen.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> v2:
> - Configure I2C controller to open-drain instead of push-pull, as
>   noticed and suggested by Jan (misleading bit description)
>=20
>  .../devicetree/bindings/i2c/i2c-mt7621.txt    |  25 ++
>  drivers/i2c/busses/Kconfig                    |   8 +
>  drivers/i2c/busses/Makefile                   |   1 +
>  drivers/i2c/busses/i2c-mt7621.c               | 385 ++++++++++++++++++
>  4 files changed, 419 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt7621.txt
>  create mode 100644 drivers/i2c/busses/i2c-mt7621.c

Would you be willing to maintain this driver? I'd appreciate it. If so, ple=
ase
add it to MAINTAINERS, then.

>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt7621.txt b/Docum=
entation/devicetree/bindings/i2c/i2c-mt7621.txt
> new file mode 100644
> index 000000000000..bc36f0eb94cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt7621.txt

Please add the bindings as a seperate patch and CC the devicetree list.
Rob requires this. And checkpatch warns about it.

BTW, if you run checkpatch with '--strict', you get the following which
I think are worth checking:

CHECK: Macro argument 'x' may be better as '(x)' to avoid precedence issues
#154: FILE: drivers/i2c/busses/i2c-mt7621.c:45:
+#define SM0CTL1_PGLEN(x)	(((x - 1) << 8) & SM0CTL1_PGLEN_MASK)

CHECK: Please use a blank line after function/struct/union/enum declarations
#274: FILE: drivers/i2c/busses/i2c-mt7621.c:165:
+}
+static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *m=
sgs,

CHECK: Lines should not end with a '('
#356: FILE: drivers/i2c/busses/i2c-mt7621.c:247:
+					ret =3D mtk_i2c_check_ack(

CHECK: spaces preferred around that '/' (ctx:VxV)
#465: FILE: drivers/i2c/busses/i2c-mt7621.c:356:
+	dev_info(&pdev->dev, "clock %u kHz\n", i2c->cur_clk/1000);


> +config I2C_MT7621
> +	tristate "MT7621/MT7628 I2C Controller"
> +	depends on (RALINK && (SOC_MT7620 || SOC_MT7621)) || COMPILE_TEST
> +	select OF_I2C
> +	help
> +	  Say Y here to include support for I2C controller in the
> +	  MediaTek MT7621/MT7628 SoCs.
> +
>  config HAVE_S3C2410_I2C

Sorting?

> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7=
621.c
> new file mode 100644
> index 000000000000..fcacbfbc8c47
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -0,0 +1,385 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * drivers/i2c/busses/i2c-mt7621.c
> + *
> + * Copyright (C) 2013 Steven Liu <steven_liu@mediatek.com>
> + * Copyright (C) 2016 Michael Lee <igvtee@gmail.com>
> + * Copyright (C) 2018 Jan Breuer <jan.breuer@jaybee.cz>
> + *
> + * Improve driver for i2cdetect from i2c-tools to detect i2c devices on =
the bus.
> + * (C) 2014 Sittisak <sittisaks@hotmail.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/reset.h>
> +
> +#define REG_SM0CFG2_REG		0x28
> +#define REG_SM0CTL0_REG		0x40
> +#define REG_SM0CTL1_REG		0x44
> +#define REG_SM0D0_REG		0x50
> +#define REG_SM0D1_REG		0x54
> +#define REG_PINTEN_REG		0x5C
> +#define REG_PINTST_REG		0x60
> +#define REG_PINTCL_REG		0x64
> +
> +/* REG_SM0CFG2_REG */
> +#define SM0CFG2_IS_AUTOMODE	BIT(0)
> +
> +/* REG_SM0CTL0_REG */
> +#define SM0CTL0_ODRAIN		BIT(31)
> +#define SM0CTL0_CLK_DIV_MASK	(0x7FF << 16)
> +#define SM0CTL0_CLK_DIV_MAX	0x7ff
> +#define SM0CTL0_CS_STATUS       BIT(4)
> +#define SM0CTL0_SCL_STATE       BIT(3)
> +#define SM0CTL0_SDA_STATE       BIT(2)
> +#define SM0CTL0_EN              BIT(1)
> +#define SM0CTL0_SCL_STRETCH     BIT(0)
> +
> +/* REG_SM0CTL1_REG */
> +#define SM0CTL1_ACK_MASK	(0xFF << 16)
> +#define SM0CTL1_PGLEN_MASK	(0x7 << 8)
> +#define SM0CTL1_PGLEN(x)	(((x - 1) << 8) & SM0CTL1_PGLEN_MASK)
> +#define SM0CTL1_READ		(5 << 4)
> +#define SM0CTL1_READ_LAST	(4 << 4)
> +#define SM0CTL1_STOP		(3 << 4)
> +#define SM0CTL1_WRITE		(2 << 4)
> +#define SM0CTL1_START		(1 << 4)
> +#define SM0CTL1_MODE_MASK	(0x7 << 4)
> +#define SM0CTL1_TRI		BIT(0)
> +
> +/* timeout waiting for I2C devices to respond (clock streching) */
> +#define TIMEOUT_MS              1000
> +#define DELAY_INTERVAL_US       100
> +
> +struct mtk_i2c {
> +	void __iomem *base;
> +	struct device *dev;
> +	struct i2c_adapter adap;
> +	u32 cur_clk;
> +	u32 clk_div;
> +	u32 flags;
> +};
> +
> +static void mtk_i2c_w32(struct mtk_i2c *i2c, u32 val, unsigned int reg)
> +{
> +	iowrite32(val, i2c->base + reg);
> +}
> +
> +static u32 mtk_i2c_r32(struct mtk_i2c *i2c, unsigned int reg)
> +{
> +	return ioread32(i2c->base + reg);
> +}

I am not a big fan of such simple wrappers, but well, no nack.

> +
> +static int poll_down_timeout(void __iomem *addr, u32 mask)
> +{
> +	unsigned long timeout =3D jiffies + msecs_to_jiffies(TIMEOUT_MS);
> +	int current_delay =3D 1;
> +
> +	do {
> +		if (!(readl_relaxed(addr) & mask))
> +			return 0;
> +
> +		if (current_delay > 0 && current_delay < 10)
> +			udelay(current_delay);
> +		else if (current_delay >=3D 10)
> +			usleep_range(current_delay, current_delay + 50);
> +
> +		current_delay *=3D current_delay;
> +		if (current_delay > DELAY_INTERVAL_US)
> +			current_delay =3D DELAY_INTERVAL_US;
> +	} while (time_before(jiffies, timeout));
> +
> +	return (readl_relaxed(addr) & mask) ? -EAGAIN : 0;
> +}

readl_relaxed_poll_timeout()? Or one of its friends?

> +static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
> +{
> +	int ret;
> +
> +	ret =3D poll_down_timeout(i2c->base + REG_SM0CTL1_REG, SM0CTL1_TRI);
> +	if (ret < 0)
> +		dev_dbg(i2c->dev, "idle err(%d)\n", ret);
> +
> +	return ret;
> +}
> +
> +static void mtk_i2c_reset(struct mtk_i2c *i2c)
> +{
> +	int ret;
> +
> +	ret =3D device_reset(i2c->adap.dev.parent);
> +	if (ret)
> +		dev_err(i2c->dev, "I2C reset failed!\n");
> +
> +	barrier();

What is the barrier needed for?

> +	/*
> +	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
> +	 * configure open-drain mode, this bit needs to be cleared.
> +	 */
> +	mtk_i2c_w32(i2c, ((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) |
> +		    SM0CTL0_EN | SM0CTL0_SCL_STRETCH, REG_SM0CTL0_REG);
> +	mtk_i2c_w32(i2c, 0, REG_SM0CFG2_REG);
> +}
> +
> +static void mtk_i2c_dump_reg(struct mtk_i2c *i2c)
> +{
> +	dev_dbg(i2c->dev,
> +		"SM0CFG2 %08x, SM0CTL0 %08x, SM0CTL1 %08x, SM0D0 %08x, SM0D1 %08x\n",
> +		mtk_i2c_r32(i2c, REG_SM0CFG2_REG),
> +		mtk_i2c_r32(i2c, REG_SM0CTL0_REG),
> +		mtk_i2c_r32(i2c, REG_SM0CTL1_REG),
> +		mtk_i2c_r32(i2c, REG_SM0D0_REG),
> +		mtk_i2c_r32(i2c, REG_SM0D1_REG));
> +}
> +
> +static int mtk_i2c_check_ack(struct mtk_i2c *i2c, u32 expected)
> +{
> +	u32 ack =3D readl_relaxed(i2c->base + REG_SM0CTL1_REG);
> +	u32 ack_expected =3D (expected << 16) & SM0CTL1_ACK_MASK;
> +
> +	return ((ack & ack_expected) =3D=3D ack_expected) ? 0 : -ENXIO;
> +}
> +
> +static int mtk_i2c_master_start(struct mtk_i2c *i2c)
> +{
> +	mtk_i2c_w32(i2c, SM0CTL1_START | SM0CTL1_TRI, REG_SM0CTL1_REG);
> +	return mtk_i2c_wait_idle(i2c);
> +}
> +
> +static int mtk_i2c_master_stop(struct mtk_i2c *i2c)
> +{
> +	mtk_i2c_w32(i2c, SM0CTL1_STOP | SM0CTL1_TRI, REG_SM0CTL1_REG);
> +	return mtk_i2c_wait_idle(i2c);
> +}
> +
> +static int mtk_i2c_master_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len)
> +{
> +	mtk_i2c_w32(i2c, cmd | SM0CTL1_TRI | SM0CTL1_PGLEN(page_len),
> +		    REG_SM0CTL1_REG);
> +	return mtk_i2c_wait_idle(i2c);
> +}
> +static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg =
*msgs,
> +		int num)
> +{
> +	struct mtk_i2c *i2c;
> +	struct i2c_msg *pmsg;
> +	u16 addr;
> +	int i, j, ret, len, page_len;
> +	u32 cmd;
> +	u32 data[2];
> +
> +	i2c =3D i2c_get_adapdata(adap);
> +
> +	for (i =3D 0; i < num; i++) {
> +		pmsg =3D &msgs[i];
> +
> +		dev_dbg(i2c->dev, "addr: 0x%x, len: %d, flags: 0x%x\n",
> +				pmsg->addr, pmsg->len, pmsg->flags);

This dbg can go, we have tracing for this in the core.

> +
> +		/* wait hardware idle */
> +		ret =3D mtk_i2c_wait_idle(i2c);
> +		if (ret)
> +			goto err_timeout;
> +
> +		/* start sequence */
> +		ret =3D mtk_i2c_master_start(i2c);
> +		if (ret)
> +			goto err_timeout;
> +
> +		/* write address */
> +		if (pmsg->flags & I2C_M_TEN) {
> +			/* 10 bits address */
> +			addr =3D 0xf0 | ((pmsg->addr >> 7) & 0x06);
> +			addr |=3D (pmsg->addr & 0xff) << 8;
> +			if (pmsg->flags & I2C_M_RD)
> +				addr |=3D 1;
> +			mtk_i2c_w32(i2c, addr, REG_SM0D0_REG);
> +			ret =3D mtk_i2c_master_cmd(i2c, SM0CTL1_WRITE, 2);
> +			if (ret)
> +				goto err_timeout;

By any chance, were you able to test this? No problem if not, yet I am
still looking for a 10-bit client out there.

> +		} else {
> +			/* 7 bits address */
> +			addr =3D pmsg->addr << 1;
> +			if (pmsg->flags & I2C_M_RD)
> +				addr |=3D 1;

i2c_8bit_addr_from_msg()


> +			mtk_i2c_w32(i2c, addr, REG_SM0D0_REG);
> +			ret =3D mtk_i2c_master_cmd(i2c, SM0CTL1_WRITE, 1);
> +			if (ret)
> +				goto err_timeout;
> +		}
> +
> +		/* check address ACK */
> +		if (!(pmsg->flags & I2C_M_IGNORE_NAK)) {
> +			ret =3D mtk_i2c_check_ack(i2c, BIT(0));
> +			if (ret)
> +				goto err_ack;
> +		}
> +
> +		/* transfer data */
> +		j =3D 0;

Maybe put this...

> +		for (len =3D pmsg->len; len > 0; len -=3D 8) {
> +			page_len =3D (len >=3D 8) ? 8 : len;
> +
> +			if (pmsg->flags & I2C_M_RD) {
> +				cmd =3D (len > 8) ?
> +					SM0CTL1_READ : SM0CTL1_READ_LAST;
> +			} else {
> +				memcpy(data, &pmsg->buf[j], page_len);
> +				mtk_i2c_w32(i2c, data[0], REG_SM0D0_REG);
> +				mtk_i2c_w32(i2c, data[1], REG_SM0D1_REG);
> +				cmd =3D SM0CTL1_WRITE;
> +			}
> +
> +			ret =3D mtk_i2c_master_cmd(i2c, cmd, page_len);
> +			if (ret)
> +				goto err_timeout;
> +
> +			if (pmsg->flags & I2C_M_RD) {
> +				data[0] =3D mtk_i2c_r32(i2c, REG_SM0D0_REG);
> +				data[1] =3D mtk_i2c_r32(i2c, REG_SM0D1_REG);
> +				memcpy(&pmsg->buf[j], data, page_len);
> +			} else {
> +				if (!(pmsg->flags & I2C_M_IGNORE_NAK)) {
> +					ret =3D mtk_i2c_check_ack(
> +						i2c, (1 << page_len) - 1);
> +					if (ret)
> +						goto err_ack;
> +				}
> +			}
> +			j +=3D 8;

=2E.. and this into the for-loop? I'd think it is a tad more readable, but
it is a minor nit.

> +		}
> +	}
> +
> +	ret =3D mtk_i2c_master_stop(i2c);
> +	if (ret)
> +		goto err_timeout;
> +
> +	/* the return value is number of executed messages */
> +	ret =3D i;
> +
> +	return ret;

return i?

> +
> +err_ack:
> +	ret =3D mtk_i2c_master_stop(i2c);
> +	if (ret)
> +		goto err_timeout;
> +	return -ENXIO;
> +
> +err_timeout:
> +	mtk_i2c_dump_reg(i2c);
> +	mtk_i2c_reset(i2c);
> +	return ret;
> +}
> +
> +static u32 mtk_i2c_func(struct i2c_adapter *a)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}

You have I2C_M_IGNORE_NAK, but no I2C_FUNC_PROTOCOL_MANGLING here.

> +
> +static const struct i2c_algorithm mtk_i2c_algo =3D {
> +	.master_xfer	=3D mtk_i2c_master_xfer,
> +	.functionality	=3D mtk_i2c_func,
> +};
> +
> +static const struct of_device_id i2c_mtk_dt_ids[] =3D {
> +	{ .compatible =3D "mediatek,mt7621-i2c" },
> +	{ /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, i2c_mtk_dt_ids);
> +
> +static void mtk_i2c_init(struct mtk_i2c *i2c)
> +{
> +	i2c->clk_div =3D 40000000 / i2c->cur_clk - 1;

What is 40000000? Maybe a define for this magic value?

And no protection if cur_clk is 1 and thus the divider is 0!

> +	if (i2c->clk_div < 99)
> +		i2c->clk_div =3D 99;
> +	if (i2c->clk_div > SM0CTL0_CLK_DIV_MAX)
> +		i2c->clk_div =3D SM0CTL0_CLK_DIV_MAX;
> +
> +	mtk_i2c_reset(i2c);
> +}
> +
> +static int mtk_i2c_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct mtk_i2c *i2c;
> +	struct i2c_adapter *adap;
> +	const struct of_device_id *match;
> +	int ret;
> +
> +	match =3D of_match_device(i2c_mtk_dt_ids, &pdev->dev);

My compiler warns about it:

drivers/i2c/busses/i2c-mt7621.c: In function =E2=80=98mtk_i2c_probe=E2=80=
=99:
drivers/i2c/busses/i2c-mt7621.c:311:29: warning: variable =E2=80=98match=E2=
=80=99 set but not used [-Wunused-but-set-variable]
  const struct of_device_id *match;

> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "no memory resource found\n");
> +		return -ENODEV;
> +	}

No need for error checking, devm_ioremap_resource will do it.

> +
> +	i2c =3D devm_kzalloc(&pdev->dev, sizeof(struct mtk_i2c), GFP_KERNEL);
> +	if (!i2c)
> +		return -ENOMEM;
> +
> +	i2c->base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(i2c->base))
> +		return PTR_ERR(i2c->base);
> +
> +	i2c->dev =3D &pdev->dev;
> +
> +	if (of_property_read_u32(pdev->dev.of_node,
> +				"clock-frequency", &i2c->cur_clk))
> +		i2c->cur_clk =3D 100000;
> +
> +	adap =3D &i2c->adap;
> +	adap->owner =3D THIS_MODULE;
> +	adap->class =3D I2C_CLASS_HWMON | I2C_CLASS_SPD;

Why do you want the classes?

> +	adap->algo =3D &mtk_i2c_algo;
> +	adap->retries =3D 3;
> +	adap->dev.parent =3D &pdev->dev;
> +	i2c_set_adapdata(adap, i2c);
> +	adap->dev.of_node =3D pdev->dev.of_node;
> +	strlcpy(adap->name, dev_name(&pdev->dev), sizeof(adap->name));
> +
> +	platform_set_drvdata(pdev, i2c);
> +
> +	mtk_i2c_init(i2c);
> +
> +	ret =3D i2c_add_adapter(adap);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to add adapter\n");

Drop the dev_err. The core will print it.

> +		return ret;
> +	}
> +
> +	dev_info(&pdev->dev, "clock %u kHz\n", i2c->cur_clk/1000);
> +
> +	return ret;
> +}
> +
> +static int mtk_i2c_remove(struct platform_device *pdev)
> +{
> +	struct mtk_i2c *i2c =3D platform_get_drvdata(pdev);
> +
> +	i2c_del_adapter(&i2c->adap);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver mtk_i2c_driver =3D {
> +	.probe		=3D mtk_i2c_probe,
> +	.remove		=3D mtk_i2c_remove,
> +	.driver		=3D {
> +		.owner	=3D THIS_MODULE,
> +		.name	=3D "i2c-mt7621",
> +		.of_match_table =3D i2c_mtk_dt_ids,
> +	},
> +};
> +
> +module_platform_driver(mtk_i2c_driver);
> +
> +MODULE_AUTHOR("Steven Liu <steven_liu@mediatek.com>");
> +MODULE_DESCRIPTION("MT7621 I2C host driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:MT7621-I2C");
> --=20
> 2.21.0
>=20

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz1fJ4ACgkQFA3kzBSg
Kbb5ZBAAjZ8g8LfeAQ0/Eg/bAp3ZUkr2nEMGrYXl96vT3m3ZMxdM+Iq6MJv+Dxn6
VFrX/UQzvVybaGU0dbJlSIOdYATPaPWC/QzLUnEA6VFBTrPWAWmv8FtMdTiQyEiS
l4uvGQUA3ReUbU/nNsvRLamQR1E4Dka9QqoHBPjp6XBt2yWzOannfRZUbIf6VacK
toEaEoJ97Hr0ToYyt/c141lWbVcp9aVw1T5xNBLObtMVqpzob5iAA944dtL4T/h+
L3ytoaKS0X5OkYpkJIgsjUKgSWMGCb14QRMFZeHJnsfUFOAj/q1Gnl4HR1NZBZZT
7o1UDR+jk/IubXPbMaI6m3JzABLsA7jaLB/lRyPd2jLuoCGO8vkcWBlkTizHzOB/
Uq2pigEhXMrSrr3Bhq6z44ziBDNnGU/HVcNEbvXrk3spfzuymyeS1wNukvGLEw0s
4qXEwhZZkhtybzhj5Ur6CeT6EbEKyS0KAhn5O2374je5JgiXynzj+OqVKLHVat/g
aW/bWSO7/ISt+MqMqIGM4D4sPkZrIi+5s4+/UApjyguIKsXfWYv/fq7WDUbbC3uO
PDqTYZALiUjwBk3Gr8FmaQ40uGxlPV/drLBlULkJwCmm8vCbyjE1QXJxq5X2M6T4
jbzc3nXUf20Eb4dZbdpYkGZ23P5tBiOJJs9y12bSLjvy1Ep2Fcw=
=dM8x
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
