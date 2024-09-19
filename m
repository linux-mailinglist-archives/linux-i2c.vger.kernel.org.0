Return-Path: <linux-i2c+bounces-6864-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3F297C3C8
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 07:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DC541F22590
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 05:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86AA1B285;
	Thu, 19 Sep 2024 05:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="qNLUUBu8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E74520326
	for <linux-i2c@vger.kernel.org>; Thu, 19 Sep 2024 05:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726722424; cv=none; b=Sp3uWOfq4QhZjvd88rvPFxZ103a9ym7EaovcO08snzWx/0hGEgdGKa4C4O0/sTnsJUhHAO8hjPgeFnDqun/BvXzQxP5NFTHfOxp0tWzYny58BNAgD0aObKUi4PH7H8GuQXvMsCbWSizMSf73/N13XPKyvRLU0NxGJQGajPrL1Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726722424; c=relaxed/simple;
	bh=rZHF5yLvHjff/VNjeM6Ib/NXPjUi+W44fvAN6mcUaoE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LTsM7tV3nu3td++O2qLx6CAJIhPVsfWQ4bv6Y4X2saTDt3FFxpJMTG2dGS2wAtaXoEFXdF8ZbO7Wj5qirByvjua0FcCWD1Ae6Gy+FnIg6bxd9eJSsaY2bsoDsELxmpsGfV2E1yndkQgTvyXIg6UGM7XC0Aum+4B/1pbCI1ZzpTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=qNLUUBu8; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5CA872C0666;
	Thu, 19 Sep 2024 17:06:54 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1726722414;
	bh=rZHF5yLvHjff/VNjeM6Ib/NXPjUi+W44fvAN6mcUaoE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=qNLUUBu8bVVesqIcPHHupdiXjRxoRGt8IRhirYIT7wNO1dkY8F80vqdEFfRE3wCRB
	 QzlezsJCSFNWIO7ZdIRqKZST5VDv7/qOA7R5qh/TYHD1DMwPnWvbhDCr0p1FVxpJL7
	 0/fdijS6Tl9WhPGWO+qLt0XCGFBM47pnO/5gFTsVmFqSSXf85nRwVu1pDqcAA0NaKi
	 U7lQ1ogOKcco5eBvZSbVur5MjnQMVLQkGtaaiwykEZeCK9nr8p7I9PhKTiKNb+x8hM
	 yB3ALWLXviPGP5o9s3S90bbROdJCB11PuofFzY0X/odgId0aznWxQjHFTavRLJZKPT
	 ZvfgMfIZwNQJQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66ebb16e0000>; Thu, 19 Sep 2024 17:06:54 +1200
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 33F3813ECCD;
	Thu, 19 Sep 2024 17:06:54 +1200 (NZST)
Message-ID: <89b2d1a7-fcd5-408c-b632-7052013036f1@alliedtelesis.co.nz>
Date: Thu, 19 Sep 2024 17:06:54 +1200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] i2c: rtl9300: Add multiplexing support
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
References: <20240917232932.3641992-1-chris.packham@alliedtelesis.co.nz>
 <20240917232932.3641992-6-chris.packham@alliedtelesis.co.nz>
 <2wmlmymzxhf7ytpngbqgubka43rd4ytiwcffvwgaaf6gubvenz@w5gwxarev3r6>
 <5ebcd038-a2c7-458d-a04e-31771765ec1f@alliedtelesis.co.nz>
Content-Language: en-US
In-Reply-To: <5ebcd038-a2c7-458d-a04e-31771765ec1f@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66ebb16e a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=uqZk7z4Bu7Qft1aM4NQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat


On 19/09/24 09:44, Chris Packham wrote:
> Hi Andi, Rob,
>
> On 19/09/24 08:36, Andi Shyti wrote:
>> Hi Chris,
>>
>> ...
>>
>>> -module_platform_driver(rtl9300_i2c_driver);
>>> +static int rtl9300_i2c_select_chan(struct i2c_mux_core *muxc, u32=20
>>> chan)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct i2c_adapter *adap =3D muxc->parent;
>>> +=C2=A0=C2=A0=C2=A0 struct rtl9300_i2c *i2c =3D i2c_get_adapdata(adap=
);
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D rtl9300_i2c_config_io(i2c, chan);
>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return 0;
>> return "rtl9300_i2c_config_io()"?
>
> Ack.
>
>>> +}
>> ...
>>
>>> +static int rtl9300_i2c_mux_probe_fw(struct rtl9300_i2c_chan *mux,=20
>>> struct platform_device *pdev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct device *dev =3D &pdev->dev;
>>> +=C2=A0=C2=A0=C2=A0 struct fwnode_handle *fwnode =3D dev_fwnode(dev);
>>> +=C2=A0=C2=A0=C2=A0 struct device_node *np =3D dev->of_node;
>>> +=C2=A0=C2=A0=C2=A0 struct device_node *adap_np;
>>> +=C2=A0=C2=A0=C2=A0 struct i2c_adapter *adap =3D NULL;
>>> +=C2=A0=C2=A0=C2=A0 struct fwnode_handle *child;
>>> +=C2=A0=C2=A0=C2=A0 unsigned int *chans;
>>> +=C2=A0=C2=A0=C2=A0 int i =3D 0;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (!is_of_node(fwnode))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (!np)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 adap_np =3D of_parse_phandle(np, "i2c-parent", 0)=
;
>>> +=C2=A0=C2=A0=C2=A0 if (!adap_np) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&pdev->dev, "Cann=
ot parse i2c-parent\n");
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>> return dev_err_probe(...)?
>
> Ack.
>
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 adap =3D of_find_i2c_adapter_by_node(adap_np);
>>> +=C2=A0=C2=A0=C2=A0 of_node_put(adap_np);
>> ...
>>
>>> +static int __init rtl9300_i2c_init(void)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 return platform_register_drivers(drivers, ARRAY_S=
IZE(drivers));
>>> +}
>>> +module_init(rtl9300_i2c_init);
>>> +
>>> +static void __exit rtl9300_i2c_exit(void)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 platform_unregister_drivers(drivers, ARRAY_SIZE(d=
rivers));
>>> +}
>>> +module_exit(rtl9300_i2c_exit);
>> You could use module_platform_driver()
>
> Can I though? I want to support both the simple I2C controller and the=20
> MUX mode with the same driver. Which is why I've ended up with two=20
> drivers to register.
>
> On the binding patch, Rob made the suggestion that I just make the=20
> i2c-mux part of the parent. I did consider that but quickly got tied=20
> in knots because I couldn't figure out how to have a device that is=20
> both an adapter and a mux. The main problem was that any child nodes=20
> of an i2c adapter in the device tree are presumed to be I2C devices=20
> and get probed automatically by of_i2c_register_devices(). Equally I=20
> can't register a mux without having an adapter that the mux operates=20
> over.

OK I think I've got something working that has a dt binding like

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 i2c@36c {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compat=
ible =3D "realtek,rtl9300-i2c";
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D=
 <0x36c 0x14>;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status=
 =3D "okay";
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #addre=
ss-cells =3D <0x01>;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-=
cells =3D <0x00>;

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c@0 =
{
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x00>;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <1>;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpio@20 {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c@2 =
{
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x02>;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 };

In the probe() I can iterate over the child nodes and create an adapter=20
for each. The code is a bit fiddly but I think it's a net win if I can=20
do away with the rtl9300-i2c-mux part. It also happily means that I=20
don't have an extra I2C bus that is the same as the first mux channel.

I'll try an tidy things up and get another iteration out before my weeken=
d.


>
>>
>> Thanks,
>> Andi
>>
>>> =C2=A0 =C2=A0 MODULE_DESCRIPTION("RTL9300 I2C controller driver");
>>> =C2=A0 MODULE_LICENSE("GPL");
>>> --=20
>>> 2.46.1
>>>

