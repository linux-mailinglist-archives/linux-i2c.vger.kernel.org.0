Return-Path: <linux-i2c+bounces-7804-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F1E9BD772
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 22:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82F871C2228A
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 21:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FCD215F55;
	Tue,  5 Nov 2024 21:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOUf7KGU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0761D9A48;
	Tue,  5 Nov 2024 21:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730841044; cv=none; b=NEWMzX8FV++HmwwBoB274xETNNhzutKrKwhpOn4mp3TbEcGST6RGokXVG9gOYLARDus4/WYhsqCRspRQoVpYNHaJ3PaI7kT0BdEFxxbrzg8GQeAy939JU6hs0IYc8vbJtoOM1GmXUT8qI9tXuHID4JxKEcLaEw/rNm6mTDkb7KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730841044; c=relaxed/simple;
	bh=vIo0NaVqwTTucukEfETbcRMwHoSkKBJsMrYGDjW+3Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmjTmWfV3VyXlji9X3+Z3U6lvoQ5nnihiOsFquJsHBgWfgfNurfCdqSycmbV2JUt0YDyNWJy05jgR7cUlCNtBcMWtomG11VIjXIPm14IxRAkbVyfJo+mgAzEs6dEm4InvY7+ocmjrejLZzj8bUhNc63id/h2KlhnM6Wd+dR06vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOUf7KGU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6460C4CECF;
	Tue,  5 Nov 2024 21:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730841043;
	bh=vIo0NaVqwTTucukEfETbcRMwHoSkKBJsMrYGDjW+3Lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LOUf7KGU/6wES0Z3zitERi2w3oNCyirg4QhAg+3zCjZIhXHrz8bab+q3YrBotBma8
	 H+rwnMDlhTMhdzYfb7mUbAuGvI50ZpdGJI5bwiGtgvTxJiEW9apGiMVfdcfzi6iSPL
	 ABNVp/GPiqQYY2lIeIUgOxjB3UgZPuDzZ4HNH//UcyiU9Fu3+o2aGXlt5p/QfVdVbm
	 GTqDFaDF1gdmS2iDR15QOQLsFyD3QY4BkdcQ/r8lZp20qnTRJ06bM6P3v0Ecyk7kDM
	 2k3rTO7gVzZs8NHVDVbcos+TIOwNnwy3L+fVisqxPiB5gGjq5LebluDt9M6LkhWmKP
	 jjreq6p3eD9iQ==
Date: Tue, 5 Nov 2024 22:10:39 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	lee@kernel.org, sre@kernel.org, tsbogend@alpha.franken.de, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v8 7/7] i2c: Add driver for the RTL9300 I2C controller
Message-ID: <x2ptxjqmcui6uh6qhjur5bymb6cjgikekt7bo2bnyoqbble4kh@zanxmiq3sau6>
References: <20241031200350.274945-1-chris.packham@alliedtelesis.co.nz>
 <20241031200350.274945-8-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031200350.274945-8-chris.packham@alliedtelesis.co.nz>

Hi Chris,

On Fri, Nov 01, 2024 at 09:03:50AM +1300, Chris Packham wrote:
> Add support for the I2C controller on the RTL9300 SoC. There are two I2C
> controllers in the RTL9300 that are part of the Ethernet switch register
> block. Each of these controllers owns a SCL pin (GPIO8 for the fiorst
> I2C controller, GPIO17 for the second). There are 8 possible SDA pins
> (GPIO9-16) that can be assigned to either I2C controller. This
> relationship is represented in the device tree with a child node for
> each SDA line in use.
> 
> This is based on the openwrt implementation[1] but has been
> significantly modified
> 
> [1] - https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/realtek/files-5.15/drivers/i2c/busses/i2c-rtl9300.c
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Looks good. As a self reminder:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Some comments below, though.

...

> +#define RTL9300_I2C_MST_CTRL1			0x0
> +#define  RTL9300_I2C_MST_CTRL1_MEM_ADDR_OFS	8
> +#define  RTL9300_I2C_MST_CTRL1_MEM_ADDR_MASK	GENMASK(31, 8)
> +#define  RTL9300_I2C_MST_CTRL1_SDA_OUT_SEL_OFS	4
> +#define  RTL9300_I2C_MST_CTRL1_SDA_OUT_SEL_MASK	GENMASK(6, 4)
> +#define  RTL9300_I2C_MST_CTRL1_GPIO_SCL_SEL	BIT(3)
> +#define  RTL9300_I2C_MST_CTRL1_RWOP		BIT(2)
> +#define  RTL9300_I2C_MST_CTRL1_I2C_FAIL		BIT(1)
> +#define  RTL9300_I2C_MST_CTRL1_I2C_TRIG		BIT(0)
> +#define RTL9300_I2C_MST_CTRL2			0x4
> +#define  RTL9300_I2C_MST_CTRL2_RD_MODE		BIT(15)
> +#define  RTL9300_I2C_MST_CTRL2_DEV_ADDR_OFS	8
> +#define  RTL9300_I2C_MST_CTRL2_DEV_ADDR_MASK	GENMASK(14, 8)
> +#define  RTL9300_I2C_MST_CTRL2_DATA_WIDTH_OFS	4
> +#define  RTL9300_I2C_MST_CTRL2_DATA_WIDTH_MASK	GENMASK(7, 4)
> +#define  RTL9300_I2C_MST_CTRL2_MEM_ADDR_WIDTH_OFS	2
> +#define  RTL9300_I2C_MST_CTRL2_MEM_ADDR_WIDTH_MASK	GENMASK(3, 2)
> +#define  RTL9300_I2C_MST_CTRL2_SCL_FREQ_OFS	0
> +#define  RTL9300_I2C_MST_CTRL2_SCL_FREQ_MASK	GENMASK(1, 0)
> +#define RTL9300_I2C_MST_DATA_WORD0		0x8
> +#define RTL9300_I2C_MST_DATA_WORD1		0xc
> +#define RTL9300_I2C_MST_DATA_WORD2		0x10
> +#define RTL9300_I2C_MST_DATA_WORD3		0x14

Not everything here is perfectly aligned, but I'm not going to
be too picky.

...

> +static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char read_write,
> +				int size, union i2c_smbus_data *data, int len)

You could align this a little better.

> +{
> +	u32 val, mask;
> +	int ret;

...

> +static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned short flags,
> +				  char read_write, u8 command, int size,
> +				  union i2c_smbus_data *data)
> +{
> +	struct rtl9300_i2c_chan *chan = i2c_get_adapdata(adap);
> +	struct rtl9300_i2c *i2c = chan->i2c;
> +	int len = 0, ret;

...

> +	ret = rtl9300_i2c_execute_xfer(i2c, read_write, size, data, len);

do we want to bail out if len is '0'?

...

> +static int rtl9300_i2c_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rtl9300_i2c_chan *chan;
> +	struct rtl9300_i2c *i2c;
> +	struct i2c_adapter *adap;

"chan" and "adap" can be declared inside
the device_for_each_child_node()

> +	u32 clock_freq, sda_pin;
> +	int ret, i = 0;
> +	struct fwnode_handle *child;

...

> +	device_for_each_child_node(dev, child) {
> +		chan = &i2c->chans[i];
> +		adap = &chan->adap;
> +

Thanks,
Andi

