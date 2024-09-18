Return-Path: <linux-i2c+bounces-6862-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A83F97C14B
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 23:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD61D2843BC
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 21:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F93C1CA68A;
	Wed, 18 Sep 2024 21:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="YPLwnaYq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE4D15853D
	for <linux-i2c@vger.kernel.org>; Wed, 18 Sep 2024 21:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726694319; cv=none; b=OTpWe7QWHK2fpyfY6nyXIizi/LTL0IQ+l9Hth7lmgKEL53zdnYHH3M6Gykw12P68lZP0volefrpI7W+Y9Pd6y5QaHx+5xryDfBM3JOAIixEr1m32dednD3AV4VbJSQ5Yu5BHBeVUe0SCaK6udt2W9llkPu1YKdLhZppb123HeNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726694319; c=relaxed/simple;
	bh=qlixMHY8zaeSCH0PrRH4VpKkNV00+HT3o1tRyIHFde8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U50ejOAAW0X2hUK00r88UMmbT9n4RBhOGdI320mJm0W5mt87DxYZTplvugYxLHVwDfAdiQXBZk9qQfdRNshcgVWPe+PbT4k6ef81n8047hUDF5wdMmBVYPfrAJqMbqhc0KWrAZ7RDa5ikkjcxZRpgzb1rtIZspyAx776uSE3Y6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=YPLwnaYq; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BE25B2C031F;
	Thu, 19 Sep 2024 09:18:33 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1726694313;
	bh=2P28iZKI/PhafQeQMnbyavFwtf/65/RZxxkAtfAVnsM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YPLwnaYqhO7Dc0ppqT93vaXY4kO89WnXi8IXjfBTHRTk+z3J77BfCi9zh4H/7n4LN
	 hw/L+zsHDpM1WvSmPCooVnlJfYi5rIwE4OWNelvsktotzjp65C4F0dY6xOxuRNihCf
	 Fqjv/+UlsFaBWzPXPMiREGitaQKdzL2KlPw/9QK3otgPAwoIkzOZfWbS+wVGHCvV0t
	 H7UPSmCCFZnt2WfsHHKILoiBxt8THwlN0Fau8eKK3oPS9vDHZcFgqvPGKutYOAXRt0
	 AhcHLDuYlNfAGSgSSxcTDcLkTBprF9b6LL0MlWvdMlqAleKVq0NSQ2edUYJfnOjPTX
	 Vb1CW4CsEJXyQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66eb43a90000>; Thu, 19 Sep 2024 09:18:33 +1200
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 90BFA13ECCD;
	Thu, 19 Sep 2024 09:18:33 +1200 (NZST)
Message-ID: <de307ae5-dfcf-41ea-8b48-b242cbea7473@alliedtelesis.co.nz>
Date: Thu, 19 Sep 2024 09:18:33 +1200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] i2c: Add driver for the RTL9300 I2C controller
To: Andi Shyti <andi.shyti@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
References: <20240917232932.3641992-1-chris.packham@alliedtelesis.co.nz>
 <20240917232932.3641992-3-chris.packham@alliedtelesis.co.nz>
 <xrr66tlsrqdpasnnz5dmburbotoftrsipnvsfubfyveykhqxob@rqhr5uzfo5fn>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <xrr66tlsrqdpasnnz5dmburbotoftrsipnvsfubfyveykhqxob@rqhr5uzfo5fn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66eb43a9 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=jdP34snFAAAA:8 a=yiKu0h0db0Qe2ZXcVb4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=jlphF6vWLdwq7oh3TaWq:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Hi Andy,

On 19/09/24 08:27, Andi Shyti wrote:
> Hi Chris,
>
> On Wed, Sep 18, 2024 at 11:29:29AM GMT, Chris Packham wrote:
>> Add support for the I2C controller on the RTL9300 SoC. This is based o=
n
>> the openwrt implementation[1] but cleaned up to make use of the regmap
>> APIs.
> Can you please add a few more words to describe the device?

Sure will do.

>> [1] - https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dblob;f=3Dta=
rget/linux/realtek/files-5.15/drivers/i2c/busses/i2c-rtl9300.c
>>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ...
>
>> +#define I2C_MST_CTRL1		0x0
>> +#define  MEM_ADDR_OFS		8
>> +#define  MEM_ADDR_MASK		0xffffff
>> +#define  SDA_OUT_SEL_OFS	4
>> +#define  SDA_OUT_SEL_MASK	0x7
>> +#define  GPIO_SCL_SEL		BIT(3)
>> +#define  RWOP			BIT(2)
>> +#define  I2C_FAIL		BIT(1)
>> +#define  I2C_TRIG		BIT(0)
>> +#define I2C_MST_CTRL2		0x4
>> +#define  RD_MODE		BIT(15)
>> +#define  DEV_ADDR_OFS		8
>> +#define  DEV_ADDR_MASK		0x7f
>> +#define  DATA_WIDTH_OFS		4
>> +#define  DATA_WIDTH_MASK	0xf
>> +#define  MEM_ADDR_WIDTH_OFS	2
>> +#define  MEM_ADDR_WIDTH_MASK	0x3
> can we have these masked already shifted? You could use
> GENMASK().

I'll take a look.

>> +#define  SCL_FREQ_OFS		0
>> +#define  SCL_FREQ_MASK		0x3
>> +#define I2C_MST_DATA_WORD0	0x8
>> +#define I2C_MST_DATA_WORD1	0xc
>> +#define I2C_MST_DATA_WORD2	0x10
>> +#define I2C_MST_DATA_WORD3	0x14
> Can we use a prefix for all these defines?

Yes will add "RTL9300_".

I assume for the bit values too? So something like "MEM_ADDR_OFS"=20
becomes "RTL9300_I2C_MST_CTRL1_MEM_ADDR_OFS" is that OK or too verbose?

>> +
>> +#define RTL9300_I2C_STD_FREQ		0
>> +#define RTL9300_I2C_FAST_FREQ		1
> This can also be an enum.
Ack
>
>> +
>> +DEFINE_MUTEX(i2c_lock);
> ...
>
>> +static int rtl9300_i2c_write(struct rtl9300_i2c *i2c, u8 *buf, int le=
n)
>> +{
>> +	u32 vals[4] =3D {};
>> +	int i, ret;
>> +
>> +	if (len > 16)
>> +		return -EIO;
>> +
>> +	for (i =3D 0; i < len; i++) {
>> +		if (i % 4 =3D=3D 0)
>> +			vals[i/4] =3D 0;
>> +		vals[i/4] <<=3D 8;
>> +		vals[i/4] |=3D buf[i];
>> +	}
>> +
>> +	ret =3D regmap_bulk_write(i2c->regmap, i2c->i2c_mst_ofs + I2C_MST_DA=
TA_WORD0,
>> +				vals, ARRAY_SIZE(vals));
>> +	if (ret)
>> +		return ret;
>> +
>> +	return len;
> why returning "len"? And in any case this is ignored.
I copied that behaviour from the openwrt driver. I think making it the=20
same as the other functions would make more sense.
>
>> +}
>> +
>> +static int rtl9300_i2c_writel(struct rtl9300_i2c *i2c, u32 data)
>> +{
>> +	int ret;
>> +
>> +	ret =3D regmap_write(i2c->regmap, i2c->i2c_mst_ofs + I2C_MST_DATA_WO=
RD0, data);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
> return regmap_write(...) ?
>
> In any case, the returned value of these functions is completely
> ignored, not even printed. Should we either:
>
>   - condier the return value in the _xfer() functions
>   or
>   - make all these functions void?

I suppose it's a bit academic. Under the hood it's mmio so it's not as=20
if it can really fail (famous last words). That said, this switch chip=20
can be run in a core disabled mode and you could then in theory be doing=20
I2C over SPI from an external SoC. If someone were just naively updating=20
a hardware design to add the external=C2=A0SoC they might neglect to move=
 the=20
I2C connections. It's also just good practice so I'll propagate the=20
returns up to the _xfer().

>> +}
>> +
>> +static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char rea=
d_write,
>> +				int size, union i2c_smbus_data *data, int len)
>> +{
>> +	u32 val, mask;
>> +	int ret;
>> +
>> +	if (read_write =3D=3D I2C_SMBUS_READ)
>> +		val =3D 0;
>> +	else
>> +		val =3D RWOP;
>> +	mask =3D RWOP;
>> +
>> +	val |=3D I2C_TRIG;
>> +	mask |=3D I2C_TRIG;
> how about "mask =3D RWOP | I2C_TRIG" to make it in one line?
>
> Also val can be simplified as:
>
> 	val =3D I2C_TRIG;
> 	if (read_write =3D=3D I2C_SMBUS_WRITE)
> 		val |=3D RWOP;
>
> Not a binding commeent, as you wish.

I'll take a look. I kind of did like the pairing of val and mask for=20
each thing being set.

>> +
>> +	ret =3D regmap_update_bits(i2c->regmap, i2c->i2c_mst_ofs + I2C_MST_C=
TRL1, mask, val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D regmap_read_poll_timeout(i2c->regmap, i2c->i2c_mst_ofs + I2C=
_MST_CTRL1,
>> +				       val, !(val & I2C_TRIG), 100, 2000);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (val & I2C_FAIL)
> where is val taking taking this bit?
In the regmap_read_poll_timeout().
>
>> +		return -EIO;
>> +
> ...
>
>> +	switch (size) {
>> +	case I2C_SMBUS_QUICK:
> ...
>> +	case I2C_SMBUS_BYTE:
> ...
>> +	case I2C_SMBUS_BYTE_DATA:
> ...
>> +	case I2C_SMBUS_WORD_DATA:
> ...
>> +	case I2C_SMBUS_BLOCK_DATA:
> ...
>> +	default:
>> +		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
> dev_err() ?
Ack.
>> +		ret =3D -EOPNOTSUPP;
>> +		goto out_unlock;
>> +	}
> ...
>
>> +	switch (clock_freq) {
>> +	case I2C_MAX_STANDARD_MODE_FREQ:
> ...
>> +	case I2C_MAX_FAST_MODE_FREQ:
> ...
>> +	default:
>> +		dev_warn(i2c->dev, "clock-frequency %d not supported\n", clock_freq=
);
>> +		return -EINVAL;
> If we are returning an error we should print an error, let's make
> it a "return dev_err_probe()"
>
> But, I was thinking that by default we can assign
> I2C_MAX_STANDARD_MODE_FREQ and if the DTS defines a different
> frequency we could just print an error and stick to the default
> value. Makes sense?

I don't have a strong opinion. Failing the probe just because something=20
in the dts is wrong where we can have a sane default does seem overly=20
harsh. On the other hand I've had hardware QA folks complain when the=20
I2C bus is running at 98khz instead of 100khz.

>
>> +	}
> ...
>
>> +	return i2c_add_adapter(adap);
> return devm_i2c_add_adapter(adap);
>
> and the remove function is not needed.

OK thanks. I did look for a devm variant but obviously not hard enough.

>> +}
>> +
>> +static void rtl9300_i2c_remove(struct platform_device *pdev)
>> +{
>> +	struct rtl9300_i2c *i2c =3D platform_get_drvdata(pdev);
>> +
>> +	i2c_del_adapter(&i2c->adap);
>> +}
>> +
>> +static const struct of_device_id i2c_rtl9300_dt_ids[] =3D {
>> +	{ .compatible =3D "realtek,rtl9300-i2c" },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, i2c_rtl9300_dt_ids);
>> +
>> +static struct platform_driver rtl9300_i2c_driver =3D {
>> +	.probe =3D rtl9300_i2c_probe,
>> +	.remove =3D rtl9300_i2c_remove,
>> +	.driver =3D {
>> +		.name =3D "i2c-rtl9300",
>> +		.of_match_table =3D i2c_rtl9300_dt_ids,
>> +	},
>> +};
>> +
>> +module_platform_driver(rtl9300_i2c_driver);
>> +
>> +MODULE_DESCRIPTION("RTL9300 I2C controller driver");
>> +MODULE_LICENSE("GPL");
>> +
> Just a trailing blank line here.
Ack.
>
> Thanks,
> Andi
>

