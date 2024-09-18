Return-Path: <linux-i2c+bounces-6858-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 821AD97C0BA
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 22:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A1F81C20F2D
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 20:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9F91CA6A0;
	Wed, 18 Sep 2024 20:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAIoCU4/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714941C9EBF;
	Wed, 18 Sep 2024 20:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726691263; cv=none; b=d0umvdN36QzIzzqMfLXMLllGmduylfnDA9vkiC45xMLq5CTxJEIwJBI/mftmdJoztwcNVNgfL1QTqcQEUSMxg92BWRH7+v+6OlhIFMunuSqKZlyN57xUS/5Q7xxu5LnB2eRk8p7PPmGMIyhGbkx0PUursQHo2tFHsiyXE8fQ+fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726691263; c=relaxed/simple;
	bh=slXnhnFIqTwaXqPB2hmVKRpVnOfftcaem0Vt6vv3B+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KS5dBvKZ8dmV1dqyRvEVYajM3ej4bvCTtxV2QUypHmANBYirHMHr5Q6WsuMIuoQl6CwIRwOxgCMg7QvSZN05zURqZYLdAASn2M6oioQmFh+fbYF3yL8BIn7J5SMsYkNi2yTjShGatvUGFWhomYgLoP11R1bA2Hd99D/sRpqiEyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAIoCU4/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F621C4CEC2;
	Wed, 18 Sep 2024 20:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726691262;
	bh=slXnhnFIqTwaXqPB2hmVKRpVnOfftcaem0Vt6vv3B+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nAIoCU4/z+F4w48NjA0EJK8uGEVP5cJD9nk3nnC86FaJE1M2csMZCPNWd64rxhkS8
	 VTZx3IwAjCJu/tON+KKwmVClUFSmxCY8ml4FDlXONBqHwMkLeNuoaQ8eCSe+0y+cd+
	 u9O2aCPaLIZubRz6SiFj3FeyV+llrULzaBn8Jnunx3gFqRbJffwpbHTMPwEVEL9e/d
	 8aL3uPoV24rqzQtPxU2WWzLVJnsYi068IEzS6hQqFf1sl3i4cC8aBz5LGes9U5EpbO
	 eSbRHaCqtCdxHE9PDyETZsn0Hrs+aTzIAjaghaQb/U6PVv1HY4fxd1fjHHKYdTE40Q
	 iUjPfa6QxJTWA==
Date: Wed, 18 Sep 2024 22:27:39 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	tsbogend@alpha.franken.de, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 2/5] i2c: Add driver for the RTL9300 I2C controller
Message-ID: <xrr66tlsrqdpasnnz5dmburbotoftrsipnvsfubfyveykhqxob@rqhr5uzfo5fn>
References: <20240917232932.3641992-1-chris.packham@alliedtelesis.co.nz>
 <20240917232932.3641992-3-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917232932.3641992-3-chris.packham@alliedtelesis.co.nz>

Hi Chris,

On Wed, Sep 18, 2024 at 11:29:29AM GMT, Chris Packham wrote:
> Add support for the I2C controller on the RTL9300 SoC. This is based on
> the openwrt implementation[1] but cleaned up to make use of the regmap
> APIs.

Can you please add a few more words to describe the device?

> [1] - https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/realtek/files-5.15/drivers/i2c/busses/i2c-rtl9300.c
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

...

> +#define I2C_MST_CTRL1		0x0
> +#define  MEM_ADDR_OFS		8
> +#define  MEM_ADDR_MASK		0xffffff
> +#define  SDA_OUT_SEL_OFS	4
> +#define  SDA_OUT_SEL_MASK	0x7
> +#define  GPIO_SCL_SEL		BIT(3)
> +#define  RWOP			BIT(2)
> +#define  I2C_FAIL		BIT(1)
> +#define  I2C_TRIG		BIT(0)
> +#define I2C_MST_CTRL2		0x4
> +#define  RD_MODE		BIT(15)
> +#define  DEV_ADDR_OFS		8
> +#define  DEV_ADDR_MASK		0x7f
> +#define  DATA_WIDTH_OFS		4
> +#define  DATA_WIDTH_MASK	0xf
> +#define  MEM_ADDR_WIDTH_OFS	2
> +#define  MEM_ADDR_WIDTH_MASK	0x3

can we have these masked already shifted? You could use
GENMASK().

> +#define  SCL_FREQ_OFS		0
> +#define  SCL_FREQ_MASK		0x3
> +#define I2C_MST_DATA_WORD0	0x8
> +#define I2C_MST_DATA_WORD1	0xc
> +#define I2C_MST_DATA_WORD2	0x10
> +#define I2C_MST_DATA_WORD3	0x14

Can we use a prefix for all these defines?

> +
> +#define RTL9300_I2C_STD_FREQ		0
> +#define RTL9300_I2C_FAST_FREQ		1

This can also be an enum.

> +
> +DEFINE_MUTEX(i2c_lock);

...

> +static int rtl9300_i2c_write(struct rtl9300_i2c *i2c, u8 *buf, int len)
> +{
> +	u32 vals[4] = {};
> +	int i, ret;
> +
> +	if (len > 16)
> +		return -EIO;
> +
> +	for (i = 0; i < len; i++) {
> +		if (i % 4 == 0)
> +			vals[i/4] = 0;
> +		vals[i/4] <<= 8;
> +		vals[i/4] |= buf[i];
> +	}
> +
> +	ret = regmap_bulk_write(i2c->regmap, i2c->i2c_mst_ofs + I2C_MST_DATA_WORD0,
> +				vals, ARRAY_SIZE(vals));
> +	if (ret)
> +		return ret;
> +
> +	return len;

why returning "len"? And in any case this is ignored.

> +}
> +
> +static int rtl9300_i2c_writel(struct rtl9300_i2c *i2c, u32 data)
> +{
> +	int ret;
> +
> +	ret = regmap_write(i2c->regmap, i2c->i2c_mst_ofs + I2C_MST_DATA_WORD0, data);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

return regmap_write(...) ?

In any case, the returned value of these functions is completely
ignored, not even printed. Should we either:

 - condier the return value in the _xfer() functions
 or
 - make all these functions void?

> +}
> +
> +static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char read_write,
> +				int size, union i2c_smbus_data *data, int len)
> +{
> +	u32 val, mask;
> +	int ret;
> +
> +	if (read_write == I2C_SMBUS_READ)
> +		val = 0;
> +	else
> +		val = RWOP;
> +	mask = RWOP;
> +
> +	val |= I2C_TRIG;
> +	mask |= I2C_TRIG;

how about "mask = RWOP | I2C_TRIG" to make it in one line?

Also val can be simplified as:

	val = I2C_TRIG;
	if (read_write == I2C_SMBUS_WRITE)
		val |= RWOP;

Not a binding commeent, as you wish.

> +
> +	ret = regmap_update_bits(i2c->regmap, i2c->i2c_mst_ofs + I2C_MST_CTRL1, mask, val);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read_poll_timeout(i2c->regmap, i2c->i2c_mst_ofs + I2C_MST_CTRL1,
> +				       val, !(val & I2C_TRIG), 100, 2000);
> +	if (ret)
> +		return ret;
> +
> +	if (val & I2C_FAIL)

where is val taking taking this bit?

> +		return -EIO;
> +

...

> +	switch (size) {
> +	case I2C_SMBUS_QUICK:
...
> +	case I2C_SMBUS_BYTE:
...
> +	case I2C_SMBUS_BYTE_DATA:
...
> +	case I2C_SMBUS_WORD_DATA:
...
> +	case I2C_SMBUS_BLOCK_DATA:
...
> +	default:
> +		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);

dev_err() ?

> +		ret = -EOPNOTSUPP;
> +		goto out_unlock;
> +	}

...

> +	switch (clock_freq) {
> +	case I2C_MAX_STANDARD_MODE_FREQ:
...
> +	case I2C_MAX_FAST_MODE_FREQ:
...
> +	default:
> +		dev_warn(i2c->dev, "clock-frequency %d not supported\n", clock_freq);
> +		return -EINVAL;

If we are returning an error we should print an error, let's make
it a "return dev_err_probe()"

But, I was thinking that by default we can assign
I2C_MAX_STANDARD_MODE_FREQ and if the DTS defines a different
frequency we could just print an error and stick to the default
value. Makes sense?

> +	}

...

> +	return i2c_add_adapter(adap);

return devm_i2c_add_adapter(adap);

and the remove function is not needed.

> +}
> +
> +static void rtl9300_i2c_remove(struct platform_device *pdev)
> +{
> +	struct rtl9300_i2c *i2c = platform_get_drvdata(pdev);
> +
> +	i2c_del_adapter(&i2c->adap);
> +}
> +
> +static const struct of_device_id i2c_rtl9300_dt_ids[] = {
> +	{ .compatible = "realtek,rtl9300-i2c" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, i2c_rtl9300_dt_ids);
> +
> +static struct platform_driver rtl9300_i2c_driver = {
> +	.probe = rtl9300_i2c_probe,
> +	.remove = rtl9300_i2c_remove,
> +	.driver = {
> +		.name = "i2c-rtl9300",
> +		.of_match_table = i2c_rtl9300_dt_ids,
> +	},
> +};
> +
> +module_platform_driver(rtl9300_i2c_driver);
> +
> +MODULE_DESCRIPTION("RTL9300 I2C controller driver");
> +MODULE_LICENSE("GPL");
> +

Just a trailing blank line here.

Thanks,
Andi

