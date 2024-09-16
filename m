Return-Path: <linux-i2c+bounces-6773-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CAD979BDD
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 09:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AAE7282A87
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 07:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58E613C8FF;
	Mon, 16 Sep 2024 07:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tIVXUipk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D03612BF02;
	Mon, 16 Sep 2024 07:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726470808; cv=none; b=osJGnBVk7Gzm3OitlUKNy3vj+Hpr1MO8K6aprIV8e6/REwSgCYUVFh3bKGFDIXM1Pp6oxptfEwBz4BNnNOM66xt+G/F+xPOQwk2PyCgk8VT1OMPago2EhD8TcTiENBo5vhPakh6Gicy0R9aTMSaga24L3Dc34X0Nt7JTMlTNRC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726470808; c=relaxed/simple;
	bh=2a0pJBR14LWlAhQYOY88JR1dcJJ7eFFl68zpz6H3ptM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YiOD4exV8c6OJ95sJ4cuILnVOawxWiLHYBiN7b/CFZG9wCb4BXoveCceTVlxgRGrOgn/O5H8aQRy4X6+WcDL9f8ipgk6nkguEQ/U6EnC2BjuVXQs7sT7FvWzM0UEDYOXHtAtCgH5o5rSdjIYCgeHzaoln+CX9Apo/87KPraKBEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tIVXUipk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD29FC4CEC4;
	Mon, 16 Sep 2024 07:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726470807;
	bh=2a0pJBR14LWlAhQYOY88JR1dcJJ7eFFl68zpz6H3ptM=;
	h=Date:Subject:List-Id:To:Cc:References:From:In-Reply-To:From;
	b=tIVXUipkjSS946n9IFKZDr7qxpXiEO8TmFKDEMFxxhox7mEIpqXQ94hkR8v+tse0C
	 5mlk9MePKNgtSxsWdCkBYizq1ksD1Jpblu/QlYGzIpsPa5nVFcADXYVl9BJUKhzQ4w
	 xo7GBem/3My7g0ooLu3514Xrpxe9JeqCCTeHrz9a4+93OsykOdNX0iQxMstY06+i0F
	 Mrt9JlxP3WZXoPI+R0OTV0OwbSB4XsIU96T/8yj/0Ts0QKHfhpDx/MlbZ33RZqOUBS
	 rtMAhB6XYuN/GIR5ZLr68/prT9uDMt7wJhSoKbnMd9Ed4+dkGWifVhxIs//IjiGk1j
	 X8YVi7Ob3WT0Q==
Message-ID: <ad7ac580-3593-4b44-b6c9-5c43b80b135e@kernel.org>
Date: Mon, 16 Sep 2024 09:13:14 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/21] i2c: Add driver for ADI ADSP-SC5xx platforms
To: arturs.artamonovs@analog.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Greg Malysa <greg.malysa@timesys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Utsav Agarwal <Utsav.Agarwal@analog.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>,
 Andi Shyti <andi.shyti@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, adsp-linux@analog.com,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-15-458fa57c8ccf@analog.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20240912-test-v1-15-458fa57c8ccf@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2024 20:25, Arturs Artamonovs via B4 Relay wrote:
> From: Arturs Artamonovs <arturs.artamonovs@analog.com>
> 
> Add support for I2C on SC5xx
> 
> Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
> Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
> Signed-off-by: Greg Malysa <greg.malysa@timesys.com>

As in all patches - chain looks wrong.

> ---
>  drivers/i2c/busses/Kconfig       |  17 +
>  drivers/i2c/busses/Makefile      |   1 +
>  drivers/i2c/busses/i2c-adi-twi.c | 940 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 958 insertions(+)



> +static SIMPLE_DEV_PM_OPS(i2c_adi_twi_pm,
> +			 i2c_adi_twi_suspend, i2c_adi_twi_resume);
> +#define I2C_ADI_TWI_PM_OPS	(&i2c_adi_twi_pm)
> +#else
> +#define I2C_ADI_TWI_PM_OPS	NULL
> +#endif
> +
> +#ifdef CONFIG_OF

Drop

> +static const struct of_device_id adi_twi_of_match[] = {
> +	{
> +		.compatible = "adi,twi",
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, adi_twi_of_match);
> +#endif
> +
> +static int i2c_adi_twi_probe(struct platform_device *pdev)
> +{
> +	struct adi_twi_iface *iface;
> +	struct i2c_adapter *p_adap;
> +	struct resource *res;
> +	const struct of_device_id *match;
> +	struct device_node *node = pdev->dev.of_node;
> +	int rc;
> +	unsigned int clkhilow;
> +	u16 writeValue;
> +
> +	iface = devm_kzalloc(&pdev->dev, sizeof(*iface), GFP_KERNEL);
> +	if (!iface)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&(iface->lock));
> +
> +	match = of_match_device(of_match_ptr(adi_twi_of_match), &pdev->dev);

Drop of_mathc_ptr

> +	if (match) {
> +		if (of_property_read_u32(node, "clock-khz",

Uh? I really do not get what is this.


> +			&iface->twi_clk))

Really odd alignment.

> +			iface->twi_clk = 50;
> +	} else
> +		iface->twi_clk = CONFIG_I2C_ADI_TWI_CLK_KHZ;
> +
> +	iface->sclk = devm_clk_get(&pdev->dev, "sclk0");
> +	if (IS_ERR(iface->sclk)) {
> +		if (PTR_ERR(iface->sclk) != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "Missing i2c clock\n");

Eh... there is nowhere such code. Please work with upstream code, not
downstream. When writing drivers take UPSTREAM driver as template.
Whatever you have in downstream is not a good to send to us.

Syntax is return dev_err_probe.

> +		return PTR_ERR(iface->sclk);
> +	}
> +
> +	/* Find and map our resources */
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (res == NULL) {
> +		dev_err(&pdev->dev, "Cannot get IORESOURCE_MEM\n");
> +		return -ENOENT;
> +	}
> +
> +	iface->regs_base = devm_ioremap_resource(&pdev->dev, res);

Combine these two calls with proper helper.

> +	if (IS_ERR(iface->regs_base)) {
> +		dev_err(&pdev->dev, "Cannot map IO\n");
> +		return PTR_ERR(iface->regs_base);
> +	}
> +
> +	iface->irq = platform_get_irq(pdev, 0);
> +	if (iface->irq < 0) {

Here you have correct, other patch has a bug. That makes me wonder about
consistency of this code. There are several other hints that people
wrote it with quite different coding style.

> +		dev_err(&pdev->dev, "No IRQ specified\n");
> +		return -ENOENT;

No. return the error. Anyway, that's never a correct errno. Read
description of this errno: no such file. This is not a file you are
getting here.

This comment applies to all your code.

> +	}
> +
> +	p_adap = &iface->adap;
> +	p_adap->nr = pdev->id;
> +	strscpy(p_adap->name, pdev->name, sizeof(p_adap->name));
> +	p_adap->algo = &adi_twi_algorithm;
> +	p_adap->algo_data = iface;
> +	p_adap->class = I2C_CLASS_DEPRECATED;
> +	p_adap->dev.parent = &pdev->dev;
> +	p_adap->dev.of_node = node;
> +	p_adap->timeout = 5 * HZ;
> +	p_adap->retries = 3;
> +
> +	rc = devm_request_irq(&pdev->dev, iface->irq, adi_twi_interrupt_entry,
> +		0, pdev->name, iface);
> +	if (rc) {
> +		dev_err(&pdev->dev, "Can't get IRQ %d !\n", iface->irq);
> +		rc = -ENODEV;

???

Sorry, this driver is in really poor shape.

> +		goto out_error;
> +	}
> +
> +	/* Set TWI internal clock as 10MHz */
> +	clk_prepare_enable(iface->sclk);
> +	if (rc) {
> +		dev_err(&pdev->dev, "Could not enable sclk\n");
> +		goto out_error;

return

> +	}
> +
> +	writeValue = ((clk_get_rate(iface->sclk) / 1000 / 1000 + 5) / 10) & 0x7F;

No camelCase. Please follow Linux coding style.

> +	iowrite16(writeValue, &iface->regs_base->control);
> +
> +	/*
> +	 * We will not end up with a CLKDIV=0 because no one will specify
> +	 * 20kHz SCL or less in Kconfig now. (5 * 1000 / 20 = 250)
> +	 */
> +	clkhilow = ((10 * 1000 / iface->twi_clk) + 1) / 2;
> +
> +	/* Set Twi interface clock as specified */
> +	writeValue = (clkhilow << 8) | clkhilow;
> +	iowrite16(writeValue, &iface->regs_base->clkdiv);
> +
> +	/* Enable TWI */
> +	writeValue = ioread16(&iface->regs_base->control) | TWI_ENA;
> +	iowrite16(writeValue, &iface->regs_base->control);
> +
> +	rc = i2c_add_numbered_adapter(p_adap);
> +	if (rc < 0)
> +		goto disable_clk;
> +
> +	platform_set_drvdata(pdev, iface);
> +
> +	dev_info(&pdev->dev, "ADI on-chip I2C TWI Controller, regs_base@%p\n",
> +		iface->regs_base);

Drop. Driver should be silent on success.

> +
> +	return 0;
> +
> +disable_clk:
> +	clk_disable_unprepare(iface->sclk);

devm_clk_get_enabled

> +
> +out_error:

Drop

> +	return rc;
> +}
> +
> +static void i2c_adi_twi_remove(struct platform_device *pdev)
> +{
> +	struct adi_twi_iface *iface = platform_get_drvdata(pdev);
> +
> +	clk_disable_unprepare(iface->sclk);
> +	i2c_del_adapter(&(iface->adap));
> +}
> +
> +static struct platform_driver i2c_adi_twi_driver = {
> +	.probe		= i2c_adi_twi_probe,
> +	.remove		= i2c_adi_twi_remove,
> +	.driver		= {
> +		.name	= "i2c-adi-twi",
> +		.pm	= I2C_ADI_TWI_PM_OPS,
> +		.of_match_table = of_match_ptr(adi_twi_of_match),

Drop of_match_ptr. None of your other code has it, right? This should
make you wonder.

> +	},
> +};
> +
> +static int __init i2c_adi_twi_init(void)
> +{
> +	return platform_driver_register(&i2c_adi_twi_driver);
> +}
> +
> +static void __exit i2c_adi_twi_exit(void)
> +{
> +	platform_driver_unregister(&i2c_adi_twi_driver);
> +}
> +
> +subsys_initcall(i2c_adi_twi_init);

No, i2c driver can be just module platform driver.

> +module_exit(i2c_adi_twi_exit);
> +
> +MODULE_AUTHOR("Bryan Wu, Sonic Zhang");
> +MODULE_DESCRIPTION("ADI on-chip I2C TWI Controller Driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:i2c-adi-twi");

You should not need MODULE_ALIAS() in normal cases. If you need it,
usually it means your device ID table is wrong (e.g. misses either
entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
for incomplete ID table.

> \ No newline at end of file


> 

Best regards,
Krzysztof


