Return-Path: <linux-i2c+bounces-7807-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC8A9BD89B
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 23:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 902F81C22081
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 22:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3BF21644E;
	Tue,  5 Nov 2024 22:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="VElI0Yor"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77023216433
	for <linux-i2c@vger.kernel.org>; Tue,  5 Nov 2024 22:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730845633; cv=none; b=TQkgG9Fbz6GYysSpzR7RUI83zFVl9FDtWBC8pksl7UlawA2oZMvnkDHRnGuPDuMO0FNNvRF5HGp0wxIoIJGb1elsobdyXNNM0px6v64YNBnSGzyUb8CL7Tb3twbEQDDkDMDDPEbhcW8zktImc70zXw3Q0Q/VF2QarcK60+VjynY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730845633; c=relaxed/simple;
	bh=F6WCB3ktHHg+ij4FHJhdtfQMaZPpNGQxSLIHDywd7Uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JH+ZXbjt2Npcdb6lCvt1NiYGa1RzUOi+H9Cl1ZEIafRuRdmSH6xZMYUQz3GvsWv57s6Y0BJNzRlI3YlH8Zg5lu7qi0CEBOnLloRjLKvCtIOVgpd91qQFJytQc9leI4+OLK+emTXK5szWsXOckDu2RwCsrPbmbcOaz6bd2/KeFGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=VElI0Yor; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2E3E92C0272;
	Wed,  6 Nov 2024 11:27:08 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1730845628;
	bh=JY02SUnt6htoA49OFlo1YnKt7Mb4X+QH3DcUwcE5qIE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VElI0Yor/guJRRzsi3xED56igPWeJMeq9aCKOlRicOKFZIScBm8m19gFHJxw1LQzI
	 MQuRLruOkJCyqyzp564r7+C+k7oExnGerikLawWTDwZ4MjO6mb0MUDXMsvvZOXsUQ+
	 l+OVmfkJxdkd9ab13gIGa5rbO8E9xl/kH4xNKoLPiz06xsDWnQIGnFzdaH1MD/MSCq
	 WqrV0ilVg1JABpf57hIiyAesON7u3EjBkpeCz1wlg4Fg0m8ryo7ZFwbCKPergqQFxn
	 kIzOAX4bw7CnvJ6FJbLeCDxKUrDZh6LhfEleZIea3TpORllq3dIu4dqQjZBoIyMfX0
	 WeWnl6InC4CAQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B672a9bbc0000>; Wed, 06 Nov 2024 11:27:08 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 0197B13ECC4;
	Wed,  6 Nov 2024 11:27:08 +1300 (NZDT)
Message-ID: <5b915330-ef77-418d-82b1-9d751f1c157e@alliedtelesis.co.nz>
Date: Wed, 6 Nov 2024 11:27:07 +1300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v8 7/7] i2c: Add driver for the RTL9300 I2C controller
To: Andi Shyti <andi.shyti@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 sre@kernel.org, tsbogend@alpha.franken.de, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-mips@vger.kernel.org
References: <20241031200350.274945-1-chris.packham@alliedtelesis.co.nz>
 <20241031200350.274945-8-chris.packham@alliedtelesis.co.nz>
 <x2ptxjqmcui6uh6qhjur5bymb6cjgikekt7bo2bnyoqbble4kh@zanxmiq3sau6>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <x2ptxjqmcui6uh6qhjur5bymb6cjgikekt7bo2bnyoqbble4kh@zanxmiq3sau6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=672a9bbc a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=62ntRvTiAAAA:8 a=jdP34snFAAAA:8 a=VwQbUJbxAAAA:8 a=NGLwXv0Z13XHn4elL4kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pToNdpNmrtiFLRE6bQ9Z:22 a=jlphF6vWLdwq7oh3TaWq:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat


On 6/11/24 10:10, Andi Shyti wrote:
> Hi Chris,
>
> On Fri, Nov 01, 2024 at 09:03:50AM +1300, Chris Packham wrote:
>> Add support for the I2C controller on the RTL9300 SoC. There are two I2C
>> controllers in the RTL9300 that are part of the Ethernet switch register
>> block. Each of these controllers owns a SCL pin (GPIO8 for the fiorst
>> I2C controller, GPIO17 for the second). There are 8 possible SDA pins
>> (GPIO9-16) that can be assigned to either I2C controller. This
>> relationship is represented in the device tree with a child node for
>> each SDA line in use.
>>
>> This is based on the openwrt implementation[1] but has been
>> significantly modified
>>
>> [1] - https://scanmail.trustwave.com/?c=20988&d=2Imq58SgjkO2w5EzbSeL1kys6iYwJJIG5Ij2dyaU8A&u=https%3a%2f%2fgit%2eopenwrt%2eorg%2f%3fp%3dopenwrt%2fopenwrt%2egit%3ba%3dblob%3bf%3dtarget%2flinux%2frealtek%2ffiles-5%2e15%2fdrivers%2fi2c%2fbusses%2fi2c-rtl9300%2ec
>>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Looks good. As a self reminder:
>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>
> Some comments below, though.
>
> ...
>
>> +#define RTL9300_I2C_MST_CTRL1			0x0
>> +#define  RTL9300_I2C_MST_CTRL1_MEM_ADDR_OFS	8
>> +#define  RTL9300_I2C_MST_CTRL1_MEM_ADDR_MASK	GENMASK(31, 8)
>> +#define  RTL9300_I2C_MST_CTRL1_SDA_OUT_SEL_OFS	4
>> +#define  RTL9300_I2C_MST_CTRL1_SDA_OUT_SEL_MASK	GENMASK(6, 4)
>> +#define  RTL9300_I2C_MST_CTRL1_GPIO_SCL_SEL	BIT(3)
>> +#define  RTL9300_I2C_MST_CTRL1_RWOP		BIT(2)
>> +#define  RTL9300_I2C_MST_CTRL1_I2C_FAIL		BIT(1)
>> +#define  RTL9300_I2C_MST_CTRL1_I2C_TRIG		BIT(0)
>> +#define RTL9300_I2C_MST_CTRL2			0x4
>> +#define  RTL9300_I2C_MST_CTRL2_RD_MODE		BIT(15)
>> +#define  RTL9300_I2C_MST_CTRL2_DEV_ADDR_OFS	8
>> +#define  RTL9300_I2C_MST_CTRL2_DEV_ADDR_MASK	GENMASK(14, 8)
>> +#define  RTL9300_I2C_MST_CTRL2_DATA_WIDTH_OFS	4
>> +#define  RTL9300_I2C_MST_CTRL2_DATA_WIDTH_MASK	GENMASK(7, 4)
>> +#define  RTL9300_I2C_MST_CTRL2_MEM_ADDR_WIDTH_OFS	2
>> +#define  RTL9300_I2C_MST_CTRL2_MEM_ADDR_WIDTH_MASK	GENMASK(3, 2)
>> +#define  RTL9300_I2C_MST_CTRL2_SCL_FREQ_OFS	0
>> +#define  RTL9300_I2C_MST_CTRL2_SCL_FREQ_MASK	GENMASK(1, 0)
>> +#define RTL9300_I2C_MST_DATA_WORD0		0x8
>> +#define RTL9300_I2C_MST_DATA_WORD1		0xc
>> +#define RTL9300_I2C_MST_DATA_WORD2		0x10
>> +#define RTL9300_I2C_MST_DATA_WORD3		0x14
> Not everything here is perfectly aligned, but I'm not going to
> be too picky.
>
> ...

Since I'm making other changes I'll tidy up the alignment.

>> +static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char read_write,
>> +				int size, union i2c_smbus_data *data, int len)
> You could align this a little better.

Ack.

>> +{
>> +	u32 val, mask;
>> +	int ret;
> ...
>
>> +static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned short flags,
>> +				  char read_write, u8 command, int size,
>> +				  union i2c_smbus_data *data)
>> +{
>> +	struct rtl9300_i2c_chan *chan = i2c_get_adapdata(adap);
>> +	struct rtl9300_i2c *i2c = chan->i2c;
>> +	int len = 0, ret;
> ...
>
>> +	ret = rtl9300_i2c_execute_xfer(i2c, read_write, size, data, len);
> do we want to bail out if len is '0'?
>
> ...

I think it'll be OK. In the write case the len should be set via 
data->block[0]. I the read case we will pass len=0 which will cause 
rtl9300_i2c_execute_xfer() to grab all 16 bytes from the i2c controller 
registers but for the read block data the i2c device should provide the 
correct number bytes in byte 0.

>> +static int rtl9300_i2c_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct rtl9300_i2c_chan *chan;
>> +	struct rtl9300_i2c *i2c;
>> +	struct i2c_adapter *adap;
> "chan" and "adap" can be declared inside
> the device_for_each_child_node()
Ack.
>> +	u32 clock_freq, sda_pin;
>> +	int ret, i = 0;
>> +	struct fwnode_handle *child;
> ...
>
>> +	device_for_each_child_node(dev, child) {
>> +		chan = &i2c->chans[i];
>> +		adap = &chan->adap;
>> +
> Thanks,
> Andi

