Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55447375DA
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 15:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbfFFN7B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 09:59:01 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:3899 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727176AbfFFN7A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 09:59:00 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf91c210000>; Thu, 06 Jun 2019 06:58:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 06 Jun 2019 06:58:59 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 06 Jun 2019 06:58:59 -0700
Received: from [10.19.65.14] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Jun
 2019 13:58:56 +0000
Subject: Re: [PATCH V2] i2c: busses: tegra: Add suspend-resume support
To:     Dmitry Osipenko <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559800475-5446-1-git-send-email-bbiswas@nvidia.com>
 <bf93e88f-cbed-3bb0-223a-74ad0b08aa9e@gmail.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <5871f51b-11d4-8bc9-6f40-4a91f2aab8f8@nvidia.com>
Date:   Thu, 6 Jun 2019 06:58:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <bf93e88f-cbed-3bb0-223a-74ad0b08aa9e@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559829537; bh=jpr983eo6FR4Yd08yaKIZZG/M2mk3OEaK2jrPUrtJsA=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=DRtQGgpRwwQvoV1jn1wXUXplwdgLlkbVWodLf/zfqBOa/KxIHCcR0l6tu11B2U97j
         +lxuv9nPEEhzulbtaYHaT6lVZsmWrZzFcxTSbUIkLa7HYBsC9G+a/KNaA4xMsUkyD9
         wUFCpw+KClh4n7HLAQzRhJA+kPKi2SXw5JO9fuVYuYsoASDjrq9E4fMuUjzd6J2jYz
         C0EfeCHve0tNTTPm2vTyu5S6wYrqPyekcT3fG3o0JL3au/+z/A2wOzIpGdxGarlore
         cfFoyGwgZDrgGbXTTEXZyqtuz6vwOHHnWQvaYwYe9YtC8HwhrDOMImqKIjoCs+AT9a
         titkOOCvf8bGw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/6/19 5:06 AM, Dmitry Osipenko wrote:
> 06.06.2019 8:54, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Post suspend I2C registers have power on reset values. Before any
>> transfer initialize I2C registers to prevent I2C transfer timeout
>> and implement suspend and resume callbacks needed. Fix below errors
>> post suspend:
>>
>> 1) Tegra I2C transfer timeout during jetson tx2 resume:
>>
>> [   27.520613] pca953x 1-0074: calling pca953x_resume+0x0/0x1b0 @ 2939, =
parent: i2c-1
>> [   27.633623] tegra-i2c 3160000.i2c: i2c transfer timed out
>> [   27.639162] pca953x 1-0074: Unable to sync registers 0x3-0x5. -110
>> [   27.645336] pca953x 1-0074: Failed to sync GPIO dir registers: -110
>> [   27.651596] PM: dpm_run_callback(): pca953x_resume+0x0/0x1b0 returns =
-110
>> [   27.658375] pca953x 1-0074: pca953x_resume+0x0/0x1b0 returned -110 af=
ter 127152 usecs
>> [   27.666194] PM: Device 1-0074 failed to resume: error -110
>>
>> 2) Tegra I2C transfer timeout error on jetson Xavier post resume.
>>
>> Remove i2c bus lock-unlock calls in resume callback as i2c_mark_adapter_=
*
>> (suspended-resumed) help ensure i2c core calls from client are not
>> executed before i2c-tegra resume.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-teg=
ra.c
>> index ebaa78d..76b7926 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -1687,7 +1687,30 @@ static int tegra_i2c_remove(struct platform_devic=
e *pdev)
>>   }
>>  =20
>>   #ifdef CONFIG_PM_SLEEP
>> +static int tegra_i2c_suspend(struct device *dev)
>> +{
>> +	struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
>> +
>> +	i2c_mark_adapter_suspended(&i2c_dev->adapter);
>> +
>> +	return 0;
>> +}
>> +
>> +static int tegra_i2c_resume(struct device *dev)
>> +{
>> +	struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret =3D tegra_i2c_init(i2c_dev, false);
>> +	if (ret)
>> +		return ret;
>=20
> We're expecting that tegra_i2c_init returns a error code on a failure
> and nothing else, hence it will be a bit more expressive to name the
> returned variable as "err". There is nothing wrong with yours variant,
> this is just a very minor recommendation from me. Please note that a bit
> more wise choice of the names makes easier to follow the code for other
> people and hence results in a cleaner code.
Agreed.

>=20
>> +
>> +	i2c_mark_adapter_resumed(&i2c_dev->adapter);
>=20
> Please add a blank line here for a better readability and to make the
> patch consistent. You added the blank line in a similar case of
> tegra_i2c_suspend() and this makes it inconsistent.
>=20
OK.

>> +	return 0;
>> +}
>> +
>>   static const struct dev_pm_ops tegra_i2c_pm =3D {
>> +	SET_SYSTEM_SLEEP_PM_OPS(tegra_i2c_suspend, tegra_i2c_resume)
>>   	SET_RUNTIME_PM_OPS(tegra_i2c_runtime_suspend, tegra_i2c_runtime_resum=
e,
>>   			   NULL)
>>   };
>>
I shall send updated patch with suggested changes.

-thanks,
  Bitan
