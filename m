Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80026203FA
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2019 13:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbfEPLAL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 May 2019 07:00:11 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:56333 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfEPLAL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 May 2019 07:00:11 -0400
Received: from [192.168.178.167] ([109.104.36.193]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MyJx6-1gSpT7253U-00yixC; Thu, 16 May 2019 12:59:49 +0200
Subject: Re: [PATCH v2] i2c: bcm2835: Model Divider in CCF
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Annaliese McDermond <nh6z@nh6z.net>, eric@anholt.net,
        f.fainelli@gmail.com, wsa@the-dreams.de, swarren@wwwdotorg.org,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, team@nwdigitalradio.com
References: <20190508071227.18609-1-nh6z@nh6z.net>
From:   Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <240084bc-f943-bad4-e937-7aade5d4fcf6@i2se.com>
Date:   Thu, 16 May 2019 12:59:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508071227.18609-1-nh6z@nh6z.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:uTaKrTt1TCKvqBSjjIxyeyqIhcj9I/4e8dE/SBm4/UMXhunOaaT
 XqjJr5JMNHZlBOYg+smuZWICnm05R+i8h30X8jqqZYa+WhlKXH2Rp78Qi246Wcj9sUSFrQ5
 W94/8wB1D7uKyt4nB2Dkffee8LUlXpBIsHu7IukK13Xfh3MAHv01lWD64ozEezdq4kPJ5CZ
 sKVug0wL8qPpezm4o2Xgw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kSrx9TYTtUY=:cEKh4jlKVCutbiqyyLi3Bz
 qVnF8cUfBqh0PFrtgqyiyG2vuyT60jj9wkTGt8OVowGyQGg/e+AFHV+klmp5BZYrwhOTnVjYY
 Fyw2ooiWh1C9Eaq8LNAMc50/ixZG377/8XQFoel/fCC1kLMcxu15S6x5hhbBmHrAX6eXdwreH
 En4wieZCN+hwCVhyjOn6JLEkbBIUA0ybYBnIzorQe9y5twi6kjLMlSJ3Pd3XSLwGXEL3lkMxt
 hlCplLYFWgDkq1BYl4STeNBaQvbEN7jOHJj2NLVtEeu3Tcf9a2UIRqWVLM4c3YuYHJOsBScMP
 vEerkqsC35QQThWUrae3FfCEVF0Q7Sxy4xohIbAOJyj3M810Euqs1kSd4DnUl4/kE+fonhCYH
 BVvwsgenkLcEHUHDGTN2UkE8yBZjtUQxL2ftfECAfvUDqHnQBNu/CkOCtNla1RSRGNK7NQ05q
 cpGiAGa49iRUp+JGbaw8z1mpbzInFByCHCkZwG5VFaf+AEFTky+ynh2KU0uW5RZctcZZnN/PL
 FGuREib8GA/cVDnWX/D311aRQ5+0wRQDuh2qgcMozTdS77ucQnoPJTaTi+3CzK1GzpY+rs89C
 bABe4L6TY2dKwmnqp+6yBq/o37JBPsoFVAdhvFNpjriTSu03Mt2NhD8ukyZ2wpzK2pnJEjWCO
 +fCawb3nqQmC7MQVJ1PjSNN2E0sJNWckvjTWZlilwco/CNcJxjyJLe6jBH9F1a0gBb0vplYS3
 0h3/L83A8mHpIWQutotdiSUVFafPRMEKblXQn0vjQPpO8uRalEno4aQhvqY=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Stephen,
hi Michael,

On 08.05.19 09:12, Annaliese McDermond wrote:
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
>
> Modeling the divider in the CCF natively removes this dependency
> and the divider value is only set upon changing the bus clock
> frequency or changes in the parent clock that cascade down to this
> divisor.  This obviates the need to set the divider with every
> transfer and avoids the deadlock described above.  It also should
> provide better clock debugging and save a few cycles on each
> transfer due to not having to recalcuate the divider value.
could you please take a look at this approach?
>
> Signed-off-by: Annaliese McDermond <nh6z@nh6z.net>
> ---
> Changes in v2:
>  - Remove empty whitespace between declarations
>  - Preserve comment regarding register rounding
>  - Consolodate declarations and initial assignments
>  - Return proper error pointer from bcm2835_i2c_register_div()
>  - Properly handle return value from bcm2835_i2c_register_div()
>    in bcm2835_i2c_probe()
>  - Refactor divider calulation code into separate function
>  - Use clk_set_rate_exclusive() to ensure the clock is not
>    modified by other consumers
>  - Deregister clock in bcm2835_i2c_remove() to properly clean up
>    after ourselves
>
>  drivers/i2c/busses/i2c-bcm2835.c | 144 ++++++++++++++++++++++++-------
>  1 file changed, 113 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
> index d2fbb4bb4a43..e66e569b8f09 100644
> --- a/drivers/i2c/busses/i2c-bcm2835.c
> +++ b/drivers/i2c/busses/i2c-bcm2835.c
> @@ -4,6 +4,8 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
>  #include <linux/completion.h>
>  #include <linux/err.h>
>  #include <linux/i2c.h>
> @@ -51,9 +53,7 @@
>  struct bcm2835_i2c_dev {
>  	struct device *dev;
>  	void __iomem *regs;
> -	struct clk *clk;
>  	int irq;
> -	u32 bus_clk_rate;
>  	struct i2c_adapter adapter;
>  	struct completion completion;
>  	struct i2c_msg *curr_msg;
> @@ -74,12 +74,17 @@ static inline u32 bcm2835_i2c_readl(struct bcm2835_i2c_dev *i2c_dev, u32 reg)
>  	return readl(i2c_dev->regs + reg);
>  }
>  
> -static int bcm2835_i2c_set_divider(struct bcm2835_i2c_dev *i2c_dev)
> +#define to_clk_bcm2835_i2c(_hw) container_of(_hw, struct clk_bcm2835_i2c, hw)
> +struct clk_bcm2835_i2c {
> +	struct clk_hw hw;
> +	struct bcm2835_i2c_dev *i2c_dev;
> +};
> +
> +static int clk_bcm2835_i2c_calc_divider(unsigned long rate,
> +				unsigned long parent_rate)
>  {
> -	u32 divider, redl, fedl;
> +	u32 divider = DIV_ROUND_UP(parent_rate, rate);
>  
> -	divider = DIV_ROUND_UP(clk_get_rate(i2c_dev->clk),
> -			       i2c_dev->bus_clk_rate);
>  	/*
>  	 * Per the datasheet, the register is always interpreted as an even
>  	 * number, by rounding down. In other words, the LSB is ignored. So,
> @@ -88,12 +93,23 @@ static int bcm2835_i2c_set_divider(struct bcm2835_i2c_dev *i2c_dev)
>  	if (divider & 1)
>  		divider++;
>  	if ((divider < BCM2835_I2C_CDIV_MIN) ||
> -	    (divider > BCM2835_I2C_CDIV_MAX)) {
> -		dev_err_ratelimited(i2c_dev->dev, "Invalid clock-frequency\n");
> +	    (divider > BCM2835_I2C_CDIV_MAX))
>  		return -EINVAL;
> -	}
>  
> -	bcm2835_i2c_writel(i2c_dev, BCM2835_I2C_DIV, divider);
> +	return divider;
> +}
> +
> +static int clk_bcm2835_i2c_set_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long parent_rate)
> +{
> +	struct clk_bcm2835_i2c *div = to_clk_bcm2835_i2c(hw);
> +	u32 redl, fedl;
> +	u32 divider = clk_bcm2835_i2c_calc_divider(rate, parent_rate);
> +
> +	if (divider == -EINVAL)
> +		return -EINVAL;
> +
> +	bcm2835_i2c_writel(div->i2c_dev, BCM2835_I2C_DIV, divider);
>  
>  	/*
>  	 * Number of core clocks to wait after falling edge before
> @@ -108,12 +124,60 @@ static int bcm2835_i2c_set_divider(struct bcm2835_i2c_dev *i2c_dev)
>  	 */
>  	redl = max(divider / 4, 1u);
>  
> -	bcm2835_i2c_writel(i2c_dev, BCM2835_I2C_DEL,
> +	bcm2835_i2c_writel(div->i2c_dev, BCM2835_I2C_DEL,
>  			   (fedl << BCM2835_I2C_FEDL_SHIFT) |
>  			   (redl << BCM2835_I2C_REDL_SHIFT));
>  	return 0;
>  }
>  
> +static long clk_bcm2835_i2c_round_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long *parent_rate)
> +{
> +	u32 divider = clk_bcm2835_i2c_calc_divider(rate, *parent_rate);
> +
> +	return DIV_ROUND_UP(*parent_rate, divider);
> +}
> +
> +static unsigned long clk_bcm2835_i2c_recalc_rate(struct clk_hw *hw,
> +						unsigned long parent_rate)
> +{
> +	struct clk_bcm2835_i2c *div = to_clk_bcm2835_i2c(hw);
> +	u32 divider = bcm2835_i2c_readl(div->i2c_dev, BCM2835_I2C_DIV);
> +
> +	return DIV_ROUND_UP(parent_rate, divider);
> +}
> +
> +static const struct clk_ops clk_bcm2835_i2c_ops = {
> +	.set_rate = clk_bcm2835_i2c_set_rate,
> +	.round_rate = clk_bcm2835_i2c_round_rate,
> +	.recalc_rate = clk_bcm2835_i2c_recalc_rate,
> +};
> +
> +static struct clk *bcm2835_i2c_register_div(struct device *dev,
> +					const char *mclk_name,
> +					struct bcm2835_i2c_dev *i2c_dev)
> +{
> +	struct clk_init_data init;
> +	struct clk_bcm2835_i2c *priv;
> +	const char *devname = dev_name(dev);
> +
> +	init.ops = &clk_bcm2835_i2c_ops;
> +	init.name = "bcm2835-i2c";
> +	init.parent_names = (const char* []) { mclk_name };
> +	init.num_parents = 1;
> +	init.flags = 0;
> +
> +	priv = devm_kzalloc(dev, sizeof(struct clk_bcm2835_i2c), GFP_KERNEL);
> +	if (priv == NULL)
> +		return ERR_PTR(-ENOMEM);
> +
> +	priv->hw.init = &init;
> +	priv->i2c_dev = i2c_dev;
> +
> +	clk_hw_register_clkdev(&priv->hw, init.name, devname);
> +	return devm_clk_register(dev, &priv->hw);
> +}
> +
>  static void bcm2835_fill_txfifo(struct bcm2835_i2c_dev *i2c_dev)
>  {
>  	u32 val;
> @@ -271,7 +335,7 @@ static int bcm2835_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>  {
>  	struct bcm2835_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
>  	unsigned long time_left;
> -	int i, ret;
> +	int i;
>  
>  	for (i = 0; i < (num - 1); i++)
>  		if (msgs[i].flags & I2C_M_RD) {
> @@ -280,10 +344,6 @@ static int bcm2835_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>  			return -EOPNOTSUPP;
>  		}
>  
> -	ret = bcm2835_i2c_set_divider(i2c_dev);
> -	if (ret)
> -		return ret;
> -
>  	i2c_dev->curr_msg = msgs;
>  	i2c_dev->num_msgs = num;
>  	reinit_completion(&i2c_dev->completion);
> @@ -338,6 +398,9 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
>  	struct resource *mem, *irq;
>  	int ret;
>  	struct i2c_adapter *adap;
> +	const char *mclk_name;
> +	struct clk *bus_clk;
> +	u32 bus_clk_rate;
>  
>  	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
>  	if (!i2c_dev)
> @@ -351,21 +414,6 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
>  	if (IS_ERR(i2c_dev->regs))
>  		return PTR_ERR(i2c_dev->regs);
>  
> -	i2c_dev->clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(i2c_dev->clk)) {
> -		if (PTR_ERR(i2c_dev->clk) != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "Could not get clock\n");
> -		return PTR_ERR(i2c_dev->clk);
> -	}
> -
> -	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
> -				   &i2c_dev->bus_clk_rate);
> -	if (ret < 0) {
> -		dev_warn(&pdev->dev,
> -			 "Could not read clock-frequency property\n");
> -		i2c_dev->bus_clk_rate = 100000;
> -	}
> -
>  	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>  	if (!irq) {
>  		dev_err(&pdev->dev, "No IRQ resource\n");
> @@ -380,6 +428,35 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	mclk_name = of_clk_get_parent_name(pdev->dev.of_node, 0);
> +
> +	bus_clk = bcm2835_i2c_register_div(&pdev->dev, mclk_name, i2c_dev);
> +
> +	if (IS_ERR(bus_clk)) {
> +		dev_err(&pdev->dev, "Could not register clock\n");
> +		return PTR_ERR(bus_clk);
> +	}
> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
> +				   &bus_clk_rate);
> +	if (ret < 0) {
> +		dev_warn(&pdev->dev,
> +			 "Could not read clock-frequency property\n");
> +		bus_clk_rate = 100000;
> +	}
> +
> +	ret = clk_set_rate_exclusive(bus_clk, bus_clk_rate);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Could not set clock frequency\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(bus_clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Couldn't prepare clock");
> +		return ret;
> +	}
> +
>  	adap = &i2c_dev->adapter;
>  	i2c_set_adapdata(adap, i2c_dev);
>  	adap->owner = THIS_MODULE;
> @@ -402,6 +479,11 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
>  static int bcm2835_i2c_remove(struct platform_device *pdev)
>  {
>  	struct bcm2835_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
> +	struct clk *bus_clk = devm_clk_get(i2c_dev->dev, "bcm2835-i2c");
> +
> +	clk_rate_exclusive_put(bus_clk);
> +	clk_disable_unprepare(bus_clk);
> +	devm_clk_unregister(i2c_dev->dev, bus_clk);
>  
>  	free_irq(i2c_dev->irq, i2c_dev);
>  	i2c_del_adapter(&i2c_dev->adapter);
