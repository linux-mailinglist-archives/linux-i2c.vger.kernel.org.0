Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDF731FED5
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2019 07:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbfEPFms (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 May 2019 01:42:48 -0400
Received: from smtp74.iad3a.emailsrvr.com ([173.203.187.74]:48020 "EHLO
        smtp74.iad3a.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725975AbfEPFmr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 May 2019 01:42:47 -0400
X-Greylist: delayed 340 seconds by postgrey-1.27 at vger.kernel.org; Thu, 16 May 2019 01:42:46 EDT
Received: from smtp18.relay.iad3a.emailsrvr.com (localhost [127.0.0.1])
        by smtp18.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id 9B9D8239DF;
        Thu, 16 May 2019 01:37:05 -0400 (EDT)
X-SMTPDoctor-Processed: csmtpprox beta
Received: from smtp18.relay.iad3a.emailsrvr.com (localhost [127.0.0.1])
        by smtp18.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id 8F5D825198;
        Thu, 16 May 2019 01:37:05 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
        s=20190322-9u7zjiwi; t=1557985025;
        bh=UUI9AFv2jOBD+7i2EggEDN2SaTzCDOdsFGXw0jNsX90=;
        h=Subject:From:Date:To:From;
        b=Vd4WjtpSFrTnspjLhkG7bhrDV7Vh0uRLbmqngIMYPQcGcRAHF0Q7daLx4IMS/vQfl
         ACdERb0NxxoTu3UilFgB5TWbHisTlIqUwFWEJMnBuOK07yMOEW4rEl349qOat5JYx/
         +6cyCTd1IdFvdFrO55hUbZfAwdM5O1DWvIKQU3Dk=
X-Auth-ID: mcdermj@xenotropic.com
Received: by smtp18.relay.iad3a.emailsrvr.com (Authenticated sender: mcdermj-AT-xenotropic.com) with ESMTPSA id 66ABF239DF;
        Thu, 16 May 2019 01:37:04 -0400 (EDT)
X-Sender-Id: mcdermj@xenotropic.com
Received: from [10.0.3.33] (c-73-96-52-102.hsd1.or.comcast.net [73.96.52.102])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:465 (trex/5.7.12);
        Thu, 16 May 2019 01:37:05 -0400
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v2] i2c: bcm2835: Model Divider in CCF
From:   Annaliese McDermond <nh6z@nh6z.net>
In-Reply-To: <20190508071227.18609-1-nh6z@nh6z.net>
Date:   Wed, 15 May 2019 22:37:03 -0700
Cc:     team@nwdigitalradio.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <4174B26B-4E3A-4CCA-A5ED-BE62A3B5E66A@nh6z.net>
References: <20190508071227.18609-1-nh6z@nh6z.net>
To:     Eric Anholt <eric@anholt.net>, stefan.wahren@i2se.com,
        f.fainelli@gmail.com, wsa@the-dreams.de, swarren@wwwdotorg.org,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I=E2=80=99m just following up on this since I haven=E2=80=99t heard =
anything since I submitted the
v2 patch a week ago.  Wolfram, does this look like a sane approach?  =
Stefan,
were my changes in v2 acceptable?

I=E2=80=99m happy to go back to the drawing board to change things if =
there=E2=80=99s a better
answer to the problem.

Thanks for everyone=E2=80=99s patience with me trying to work through =
the proper
process.

--
Annaliese McDermond
nh6z@nh6z.net

> On May 8, 2019, at 12:12 AM, Annaliese McDermond <nh6z@nh6z.net> =
wrote:
>=20
> Model the I2C bus clock divider as a part of the Core Clock Framework.
> Primarily this removes the clk_get_rate() call from each transfer.
> This call causes problems for slave drivers that themselves have
> internal clock components that are controlled by an I2C interface.
> When the slave's internal clock component is prepared, the prepare
> lock is obtained, and it makes calls to the I2C subsystem to
> command the hardware to activate the clock.  In order to perform
> the I2C transfer, this driver sets the divider, which requires
> it to get the parent clock rate, which it does with clk_get_rate().
> Unfortunately, this function will try to take the clock prepare
> lock, which is already held by the slave's internal clock calls
> creating a deadlock.
>=20
> Modeling the divider in the CCF natively removes this dependency
> and the divider value is only set upon changing the bus clock
> frequency or changes in the parent clock that cascade down to this
> divisor.  This obviates the need to set the divider with every
> transfer and avoids the deadlock described above.  It also should
> provide better clock debugging and save a few cycles on each
> transfer due to not having to recalcuate the divider value.
>=20
> Signed-off-by: Annaliese McDermond <nh6z@nh6z.net>
> ---
> Changes in v2:
> - Remove empty whitespace between declarations
> - Preserve comment regarding register rounding
> - Consolodate declarations and initial assignments
> - Return proper error pointer from bcm2835_i2c_register_div()
> - Properly handle return value from bcm2835_i2c_register_div()
>   in bcm2835_i2c_probe()
> - Refactor divider calulation code into separate function
> - Use clk_set_rate_exclusive() to ensure the clock is not
>   modified by other consumers
> - Deregister clock in bcm2835_i2c_remove() to properly clean up
>   after ourselves
>=20
> drivers/i2c/busses/i2c-bcm2835.c | 144 ++++++++++++++++++++++++-------
> 1 file changed, 113 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-bcm2835.c =
b/drivers/i2c/busses/i2c-bcm2835.c
> index d2fbb4bb4a43..e66e569b8f09 100644
> --- a/drivers/i2c/busses/i2c-bcm2835.c
> +++ b/drivers/i2c/busses/i2c-bcm2835.c
> @@ -4,6 +4,8 @@
>  */
>=20
> #include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
> #include <linux/completion.h>
> #include <linux/err.h>
> #include <linux/i2c.h>
> @@ -51,9 +53,7 @@
> struct bcm2835_i2c_dev {
> 	struct device *dev;
> 	void __iomem *regs;
> -	struct clk *clk;
> 	int irq;
> -	u32 bus_clk_rate;
> 	struct i2c_adapter adapter;
> 	struct completion completion;
> 	struct i2c_msg *curr_msg;
> @@ -74,12 +74,17 @@ static inline u32 bcm2835_i2c_readl(struct =
bcm2835_i2c_dev *i2c_dev, u32 reg)
> 	return readl(i2c_dev->regs + reg);
> }
>=20
> -static int bcm2835_i2c_set_divider(struct bcm2835_i2c_dev *i2c_dev)
> +#define to_clk_bcm2835_i2c(_hw) container_of(_hw, struct =
clk_bcm2835_i2c, hw)
> +struct clk_bcm2835_i2c {
> +	struct clk_hw hw;
> +	struct bcm2835_i2c_dev *i2c_dev;
> +};
> +
> +static int clk_bcm2835_i2c_calc_divider(unsigned long rate,
> +				unsigned long parent_rate)
> {
> -	u32 divider, redl, fedl;
> +	u32 divider =3D DIV_ROUND_UP(parent_rate, rate);
>=20
> -	divider =3D DIV_ROUND_UP(clk_get_rate(i2c_dev->clk),
> -			       i2c_dev->bus_clk_rate);
> 	/*
> 	 * Per the datasheet, the register is always interpreted as an =
even
> 	 * number, by rounding down. In other words, the LSB is ignored. =
So,
> @@ -88,12 +93,23 @@ static int bcm2835_i2c_set_divider(struct =
bcm2835_i2c_dev *i2c_dev)
> 	if (divider & 1)
> 		divider++;
> 	if ((divider < BCM2835_I2C_CDIV_MIN) ||
> -	    (divider > BCM2835_I2C_CDIV_MAX)) {
> -		dev_err_ratelimited(i2c_dev->dev, "Invalid =
clock-frequency\n");
> +	    (divider > BCM2835_I2C_CDIV_MAX))
> 		return -EINVAL;
> -	}
>=20
> -	bcm2835_i2c_writel(i2c_dev, BCM2835_I2C_DIV, divider);
> +	return divider;
> +}
> +
> +static int clk_bcm2835_i2c_set_rate(struct clk_hw *hw, unsigned long =
rate,
> +				unsigned long parent_rate)
> +{
> +	struct clk_bcm2835_i2c *div =3D to_clk_bcm2835_i2c(hw);
> +	u32 redl, fedl;
> +	u32 divider =3D clk_bcm2835_i2c_calc_divider(rate, parent_rate);
> +
> +	if (divider =3D=3D -EINVAL)
> +		return -EINVAL;
> +
> +	bcm2835_i2c_writel(div->i2c_dev, BCM2835_I2C_DIV, divider);
>=20
> 	/*
> 	 * Number of core clocks to wait after falling edge before
> @@ -108,12 +124,60 @@ static int bcm2835_i2c_set_divider(struct =
bcm2835_i2c_dev *i2c_dev)
> 	 */
> 	redl =3D max(divider / 4, 1u);
>=20
> -	bcm2835_i2c_writel(i2c_dev, BCM2835_I2C_DEL,
> +	bcm2835_i2c_writel(div->i2c_dev, BCM2835_I2C_DEL,
> 			   (fedl << BCM2835_I2C_FEDL_SHIFT) |
> 			   (redl << BCM2835_I2C_REDL_SHIFT));
> 	return 0;
> }
>=20
> +static long clk_bcm2835_i2c_round_rate(struct clk_hw *hw, unsigned =
long rate,
> +				unsigned long *parent_rate)
> +{
> +	u32 divider =3D clk_bcm2835_i2c_calc_divider(rate, =
*parent_rate);
> +
> +	return DIV_ROUND_UP(*parent_rate, divider);
> +}
> +
> +static unsigned long clk_bcm2835_i2c_recalc_rate(struct clk_hw *hw,
> +						unsigned long =
parent_rate)
> +{
> +	struct clk_bcm2835_i2c *div =3D to_clk_bcm2835_i2c(hw);
> +	u32 divider =3D bcm2835_i2c_readl(div->i2c_dev, =
BCM2835_I2C_DIV);
> +
> +	return DIV_ROUND_UP(parent_rate, divider);
> +}
> +
> +static const struct clk_ops clk_bcm2835_i2c_ops =3D {
> +	.set_rate =3D clk_bcm2835_i2c_set_rate,
> +	.round_rate =3D clk_bcm2835_i2c_round_rate,
> +	.recalc_rate =3D clk_bcm2835_i2c_recalc_rate,
> +};
> +
> +static struct clk *bcm2835_i2c_register_div(struct device *dev,
> +					const char *mclk_name,
> +					struct bcm2835_i2c_dev *i2c_dev)
> +{
> +	struct clk_init_data init;
> +	struct clk_bcm2835_i2c *priv;
> +	const char *devname =3D dev_name(dev);
> +
> +	init.ops =3D &clk_bcm2835_i2c_ops;
> +	init.name =3D "bcm2835-i2c";
> +	init.parent_names =3D (const char* []) { mclk_name };
> +	init.num_parents =3D 1;
> +	init.flags =3D 0;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(struct clk_bcm2835_i2c), =
GFP_KERNEL);
> +	if (priv =3D=3D NULL)
> +		return ERR_PTR(-ENOMEM);
> +
> +	priv->hw.init =3D &init;
> +	priv->i2c_dev =3D i2c_dev;
> +
> +	clk_hw_register_clkdev(&priv->hw, init.name, devname);
> +	return devm_clk_register(dev, &priv->hw);
> +}
> +
> static void bcm2835_fill_txfifo(struct bcm2835_i2c_dev *i2c_dev)
> {
> 	u32 val;
> @@ -271,7 +335,7 @@ static int bcm2835_i2c_xfer(struct i2c_adapter =
*adap, struct i2c_msg msgs[],
> {
> 	struct bcm2835_i2c_dev *i2c_dev =3D i2c_get_adapdata(adap);
> 	unsigned long time_left;
> -	int i, ret;
> +	int i;
>=20
> 	for (i =3D 0; i < (num - 1); i++)
> 		if (msgs[i].flags & I2C_M_RD) {
> @@ -280,10 +344,6 @@ static int bcm2835_i2c_xfer(struct i2c_adapter =
*adap, struct i2c_msg msgs[],
> 			return -EOPNOTSUPP;
> 		}
>=20
> -	ret =3D bcm2835_i2c_set_divider(i2c_dev);
> -	if (ret)
> -		return ret;
> -
> 	i2c_dev->curr_msg =3D msgs;
> 	i2c_dev->num_msgs =3D num;
> 	reinit_completion(&i2c_dev->completion);
> @@ -338,6 +398,9 @@ static int bcm2835_i2c_probe(struct =
platform_device *pdev)
> 	struct resource *mem, *irq;
> 	int ret;
> 	struct i2c_adapter *adap;
> +	const char *mclk_name;
> +	struct clk *bus_clk;
> +	u32 bus_clk_rate;
>=20
> 	i2c_dev =3D devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), =
GFP_KERNEL);
> 	if (!i2c_dev)
> @@ -351,21 +414,6 @@ static int bcm2835_i2c_probe(struct =
platform_device *pdev)
> 	if (IS_ERR(i2c_dev->regs))
> 		return PTR_ERR(i2c_dev->regs);
>=20
> -	i2c_dev->clk =3D devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(i2c_dev->clk)) {
> -		if (PTR_ERR(i2c_dev->clk) !=3D -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "Could not get clock\n");
> -		return PTR_ERR(i2c_dev->clk);
> -	}
> -
> -	ret =3D of_property_read_u32(pdev->dev.of_node, =
"clock-frequency",
> -				   &i2c_dev->bus_clk_rate);
> -	if (ret < 0) {
> -		dev_warn(&pdev->dev,
> -			 "Could not read clock-frequency property\n");
> -		i2c_dev->bus_clk_rate =3D 100000;
> -	}
> -
> 	irq =3D platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> 	if (!irq) {
> 		dev_err(&pdev->dev, "No IRQ resource\n");
> @@ -380,6 +428,35 @@ static int bcm2835_i2c_probe(struct =
platform_device *pdev)
> 		return -ENODEV;
> 	}
>=20
> +	mclk_name =3D of_clk_get_parent_name(pdev->dev.of_node, 0);
> +
> +	bus_clk =3D bcm2835_i2c_register_div(&pdev->dev, mclk_name, =
i2c_dev);
> +
> +	if (IS_ERR(bus_clk)) {
> +		dev_err(&pdev->dev, "Could not register clock\n");
> +		return PTR_ERR(bus_clk);
> +	}
> +
> +	ret =3D of_property_read_u32(pdev->dev.of_node, =
"clock-frequency",
> +				   &bus_clk_rate);
> +	if (ret < 0) {
> +		dev_warn(&pdev->dev,
> +			 "Could not read clock-frequency property\n");
> +		bus_clk_rate =3D 100000;
> +	}
> +
> +	ret =3D clk_set_rate_exclusive(bus_clk, bus_clk_rate);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Could not set clock frequency\n");
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(bus_clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Couldn't prepare clock");
> +		return ret;
> +	}
> +
> 	adap =3D &i2c_dev->adapter;
> 	i2c_set_adapdata(adap, i2c_dev);
> 	adap->owner =3D THIS_MODULE;
> @@ -402,6 +479,11 @@ static int bcm2835_i2c_probe(struct =
platform_device *pdev)
> static int bcm2835_i2c_remove(struct platform_device *pdev)
> {
> 	struct bcm2835_i2c_dev *i2c_dev =3D platform_get_drvdata(pdev);
> +	struct clk *bus_clk =3D devm_clk_get(i2c_dev->dev, =
"bcm2835-i2c");
> +
> +	clk_rate_exclusive_put(bus_clk);
> +	clk_disable_unprepare(bus_clk);
> +	devm_clk_unregister(i2c_dev->dev, bus_clk);
>=20
> 	free_irq(i2c_dev->irq, i2c_dev);
> 	i2c_del_adapter(&i2c_dev->adapter);
> --=20
> 2.19.1
>=20

