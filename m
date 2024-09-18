Return-Path: <linux-i2c+bounces-6863-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6885697C188
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 23:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27087283469
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 21:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1F11CB306;
	Wed, 18 Sep 2024 21:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="mQGgsCkw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA861C9EDD
	for <linux-i2c@vger.kernel.org>; Wed, 18 Sep 2024 21:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726695866; cv=none; b=Or4qE/Vrkx9ORAyotkvIn32WPBGlEBsOB5qljSNac9/Yt7BLCkdQIfkErlwmUVtvWKRUdIwXww3xybgHo9W9hSrYEtZOdb/kQtuztUUFKtPkar8mkLnB3gq2kx5hFpaxsGdL616CyB107XpXhxauNZ6skbq9UXbQT2AZJYyAYV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726695866; c=relaxed/simple;
	bh=FKxeYZYHke3ZZqvbkFKyQa8CuKT+MkxxXC+06ToTxqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EsilbGlt9sW/+5RtXI7noV64vcTtCskTegdk8xMwBImtsy+0R4ZN78jW/7YdV9/Gqp712YCMa0zWFBYgpm5hf2G/RicgJ+QqOKgDnG8eNqCK5DldeZx7oy9xx2vLiZa2ADNgDp174QhEyFDFtZYI/9PO7s0B6KF4WtQa1xVtZ/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=mQGgsCkw; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 64FDB2C031F;
	Thu, 19 Sep 2024 09:44:21 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1726695861;
	bh=v8hRtbYaGnS53ow1QyterGNfThyT+7u5f8l9z8q0xqo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mQGgsCkw6W4Ays9gO8m6qkozkrZ9KnJG92thXrIjJOzoX2GyVcbqUkU1CiNQCvDcV
	 C6TQZWHL7pzmAz2rltKi/DVQgpFDKSQBPDFXsYESsimpOX4Vu1WLC20s6ZHHXsNSqX
	 O8nWFAqdVsY6miS/uxlt4pXBn/+J+vEiKMXkm1UUJP6Cd5Zz+s2llvDYUeROdnEvWK
	 WDe2YhkFXbQLgkCLGkeAB25xrGPerN0YVskOg/Lz3h3q/qKRLvwF1ZqnPpiWeYL2bd
	 n9FM3cq1RtG4jkcSliR6pjfuhHRu5XwwNs5zsXIuYYqXBHVusPYpK+uhmXPG2FbQTm
	 XJZF5/uQkY6lA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66eb49b50000>; Thu, 19 Sep 2024 09:44:21 +1200
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 45BC613ECCD;
	Thu, 19 Sep 2024 09:44:21 +1200 (NZST)
Message-ID: <5ebcd038-a2c7-458d-a04e-31771765ec1f@alliedtelesis.co.nz>
Date: Thu, 19 Sep 2024 09:44:21 +1200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] i2c: rtl9300: Add multiplexing support
To: Andi Shyti <andi.shyti@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
References: <20240917232932.3641992-1-chris.packham@alliedtelesis.co.nz>
 <20240917232932.3641992-6-chris.packham@alliedtelesis.co.nz>
 <2wmlmymzxhf7ytpngbqgubka43rd4ytiwcffvwgaaf6gubvenz@w5gwxarev3r6>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <2wmlmymzxhf7ytpngbqgubka43rd4ytiwcffvwgaaf6gubvenz@w5gwxarev3r6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66eb49b5 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=_L8YfPCUr8UlLk-LaaEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Hi Andi, Rob,

On 19/09/24 08:36, Andi Shyti wrote:
> Hi Chris,
>
> ...
>
>> -module_platform_driver(rtl9300_i2c_driver);
>> +static int rtl9300_i2c_select_chan(struct i2c_mux_core *muxc, u32 chan)
>> +{
>> +	struct i2c_adapter *adap = muxc->parent;
>> +	struct rtl9300_i2c *i2c = i2c_get_adapdata(adap);
>> +	int ret;
>> +
>> +	ret = rtl9300_i2c_config_io(i2c, chan);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
> return "rtl9300_i2c_config_io()"?

Ack.

>> +}
> ...
>
>> +static int rtl9300_i2c_mux_probe_fw(struct rtl9300_i2c_chan *mux, struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
>> +	struct device_node *np = dev->of_node;
>> +	struct device_node *adap_np;
>> +	struct i2c_adapter *adap = NULL;
>> +	struct fwnode_handle *child;
>> +	unsigned int *chans;
>> +	int i = 0;
>> +
>> +	if (!is_of_node(fwnode))
>> +		return -EOPNOTSUPP;
>> +
>> +	if (!np)
>> +		return -ENODEV;
>> +
>> +	adap_np = of_parse_phandle(np, "i2c-parent", 0);
>> +	if (!adap_np) {
>> +		dev_err(&pdev->dev, "Cannot parse i2c-parent\n");
>> +		return -ENODEV;
> return dev_err_probe(...)?

Ack.

>> +	}
>> +	adap = of_find_i2c_adapter_by_node(adap_np);
>> +	of_node_put(adap_np);
> ...
>
>> +static int __init rtl9300_i2c_init(void)
>> +{
>> +	return platform_register_drivers(drivers, ARRAY_SIZE(drivers));
>> +}
>> +module_init(rtl9300_i2c_init);
>> +
>> +static void __exit rtl9300_i2c_exit(void)
>> +{
>> +	platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
>> +}
>> +module_exit(rtl9300_i2c_exit);
> You could use module_platform_driver()

Can I though? I want to support both the simple I2C controller and the 
MUX mode with the same driver. Which is why I've ended up with two 
drivers to register.

On the binding patch, Rob made the suggestion that I just make the 
i2c-mux part of the parent. I did consider that but quickly got tied in 
knots because I couldn't figure out how to have a device that is both an 
adapter and a mux. The main problem was that any child nodes of an i2c 
adapter in the device tree are presumed to be I2C devices and get probed 
automatically by of_i2c_register_devices(). Equally I can't register a 
mux without having an adapter that the mux operates over.

>
> Thanks,
> Andi
>
>>   
>>   MODULE_DESCRIPTION("RTL9300 I2C controller driver");
>>   MODULE_LICENSE("GPL");
>> -- 
>> 2.46.1
>>

