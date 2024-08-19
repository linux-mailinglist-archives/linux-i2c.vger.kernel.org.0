Return-Path: <linux-i2c+bounces-5530-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1377F956AB3
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 14:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A84E81F21050
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 12:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D511F16BE22;
	Mon, 19 Aug 2024 12:23:09 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A057A16A935;
	Mon, 19 Aug 2024 12:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724070189; cv=none; b=Xg67RUWHesuVWrcMPkD5EtvSEsTeiWB/PsHI+D1CRdFrG3Abtr4ZyhgHa4GDAfDZwrakbRLklI18FxRb+FemVJ5idfvG7rxMx2m1X6KtiadDHsJha7TbzzeG1uZzkacnI3pyDtHP2NMXtBXw1nhuh8sBRPOJWDlY2l4Z5GNn/jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724070189; c=relaxed/simple;
	bh=/AtrqrhMsfGN0cqRpWB0QbkwVbz4Zv7nCRd8FMe9y4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=clL+zrZuM+KgQzfB4pZcWxM/l0xlIVGaHbQL5tspcDCT4kDSLcZNCgV1AqgnpLLk+l0UDDpyVOml2vfTb5FhHV8yvOIxBj0iqkratzavuhgkZ+qo+04lE9npdwlnOVIU6d2EplVn0SfNHEN1H3MoWCuONCQhJA3Bm49PA0p7u88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WnWsf0Zhzz1xvVw;
	Mon, 19 Aug 2024 20:21:10 +0800 (CST)
Received: from kwepemg500010.china.huawei.com (unknown [7.202.181.71])
	by mail.maildlp.com (Postfix) with ESMTPS id B32BC14011F;
	Mon, 19 Aug 2024 20:23:03 +0800 (CST)
Received: from [10.67.109.211] (10.67.109.211) by
 kwepemg500010.china.huawei.com (7.202.181.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 19 Aug 2024 20:23:02 +0800
Message-ID: <c1bc5137-9654-4434-a329-9381e14dffaf@huawei.com>
Date: Mon, 19 Aug 2024 20:23:01 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 0/9] drivers: fix some module autoloading
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, <openipmi-developer@lists.sourceforge.net>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<dmaengine@vger.kernel.org>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-usb@vger.kernel.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Robert Jarzmik <robert.jarzmik@free.fr>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Corey Minyard
	<minyard@acm.org>, Ludovic.Desroches <ludovic.desroches@microchip.com>, Alan
 Stern <stern@rowland.harvard.edu>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, <codrin.ciubotariu@microchip.com>,
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, Robert Richter
	<rric@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Haojian Zhuang
	<haojian.zhuang@gmail.com>, Tony Luck <tony.luck@intel.com>, Borislav Petkov
	<bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	<morbidrsa@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod
 Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, James Morse
	<james.morse@arm.com>, Daniel Mack <daniel@zonque.org>
References: <20240819113855.787149-1-liuyuntao12@huawei.com>
 <dabde7bf-dcff-47c6-a68d-f5018ab00282@app.fastmail.com>
From: "liuyuntao (F)" <liuyuntao12@huawei.com>
In-Reply-To: <dabde7bf-dcff-47c6-a68d-f5018ab00282@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemg500010.china.huawei.com (7.202.181.71)

yes sir^^.

Regards!
Yuntao

On 2024/8/19 20:09, Arnd Bergmann wrote:
> On Mon, Aug 19, 2024, at 13:38, Yuntao Liu wrote:
>> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
>> based on the alias from platform_device_id table.
>>
>> Yuntao Liu (9):
>>    usb: ehci-mv: fix module autoloading
>>    soc: pxa: ssp: fix module autoloading
>>    misc: atmel-ssc: fix module autoloading
>>    i2c: at91: fix module autoloading
>>    mpc85xx_edac: fix module autoloading
>>    dmaengine: pxa: fix module autoloading
>>    dmaengine: mmp_pdma: fix module autoloading
>>    dmaengine: at_hdmac: fix module autoloading
>>    ipmi: ipmi_ssif: fix module autoloading
> 
> I looked at all the patches and found that most of them do not
> use the table any more, or will stop using it in the near future.
> 
> I think your work to validate the correctness of the entries
> is useful, but it may be more helpful to focus on removing
> all the unused tables, including those that have a
> MODULE_DEVICE_TABLE() tag.
> 
> If you are planning to do more such cleanups, maybe you can
> go through them one subsystem at a time and look for drivers
> that have both of_device_id and i2c_device_id/platform_device_id/
> spi_device_id tables. If nothing in the kernel creates a device
> with the legacy string, you can then send a patch that removes
> the old device ID list and at the same time makes the DT support
> unconditional in case there is an #ifdef CONFIG_OF check.
> 
> If the probe() function accesses platform_data, this would also
> be unused, allowing an even nicer cleanup of removing the
> platofrm_data path in favor of OF properties.
> 
>        Arnd

