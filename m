Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02C0122FAAA
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 22:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgG0Uw4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 16:52:56 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:9194 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbgG0Uwz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jul 2020 16:52:55 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f1f3e990000>; Mon, 27 Jul 2020 13:52:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 27 Jul 2020 13:52:55 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 27 Jul 2020 13:52:55 -0700
Received: from [10.2.168.236] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 20:52:54 +0000
Subject: Re: [RFC PATCH v4 04/14] i2c: tegra: Fix runtime resume to re-init VI
 I2C
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
 <1595548272-9809-5-git-send-email-skomatineni@nvidia.com>
 <d427f421-3c20-2aa3-b719-638be6aeca1d@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <5d49d755-2eec-1c46-4d4c-87ec837bc5bd@nvidia.com>
Date:   Mon, 27 Jul 2020 13:58:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d427f421-3c20-2aa3-b719-638be6aeca1d@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595883161; bh=UGMt8TwvCp08KuZfursHHfETCghFq1sNm6XqxSy966s=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=rMG45YVKb0X9dS26bZOMWmtNdQH9HjvkG7gdeI7ltFgF+RXpKPkocwPj+5mc7oh6n
         uUziG6tMZ6pou9YWPVP7aHDKYD0nxs2fHfxuQunw/yg1wEDSys4RTvKFMhRhe0H583
         7Ues5DdGgcjBMAjn6v0Ff2i6ihEheItRk/69FYf/Hj1dgObKExY9qasdmAB6KFsqgk
         pr8H6tBoZ/rWKyjFYyxh8Ls0jxQTH17ZuSvxmDW22N4vtRkeRllxH4k/Fbj+/Ns1Zz
         7/txNoGFEriNBdRHLGkTQyyaVvVIn5ki+yOvvyYMjowIZ1/dshww04KuhvUyWUW85Y
         dfow99fOdlFow==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/26/20 4:53 PM, Dmitry Osipenko wrote:
> 24.07.2020 02:51, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> VI I2C is on host1x bus and is part of VE power domain.
>>
>> During suspend/resume VE power domain goes through power off/on.
>>
>> So, controller reset followed by i2c re-initialization is required
>> after the domain power up.
>>
>> This patch fixes it.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-teg=
ra.c
>> index 7b93c45..1bf3666 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -293,6 +293,8 @@ struct tegra_i2c_dev {
>>   	bool is_curr_atomic_xfer;
>>   };
>>  =20
>> +static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reini=
t);
>> +
>>   static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>>   		       unsigned long reg)
>>   {
>> @@ -675,8 +677,22 @@ static int __maybe_unused tegra_i2c_runtime_resume(=
struct device *dev)
>>   		goto disable_slow_clk;
>>   	}
>>  =20
>> +	/*
>> +	 * VI I2C device is attached to VE power domain which goes through
>> +	 * power ON/OFF during PM runtime resume/suspend. So, controller
>> +	 * should go through reset and need to re-initialize after power
>> +	 * domain ON.
>> +	 */
>> +	if (i2c_dev->is_vi) {
>> +		ret =3D tegra_i2c_init(i2c_dev, true);
>> +		if (ret)
>> +			goto disable_div_clk;
>> +	}
>> +
>>   	return 0;
>>  =20
>> +disable_div_clk:
>> +	clk_disable(i2c_dev->div_clk);
>>   disable_slow_clk:
>>   	clk_disable(i2c_dev->slow_clk);
>>   disable_fast_clk:
>>
> This look okay, but isn't RPM usage a bit too expensive for VI? Maybe
> RPM autodelay needs to be set for the I2C driver?
>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>
Thanks Dmitry. Will look into and have separate patch for VI I2C RPM=20
auto-delay out of this series sometime next week.

Regards

Sowjanya

