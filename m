Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB3630AA4
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2019 10:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbfEaIuh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 May 2019 04:50:37 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:19981 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbfEaIug (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 May 2019 04:50:36 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf0eadb0000>; Fri, 31 May 2019 01:50:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 31 May 2019 01:50:35 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 31 May 2019 01:50:35 -0700
Received: from [10.19.65.14] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 May
 2019 08:50:32 +0000
Subject: Re: [PATCH V1] i2c: busses: tegra: Add suspend-resume support
To:     Dmitry Osipenko <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559195718-6693-1-git-send-email-bbiswas@nvidia.com>
 <c8bad04b-67ef-bcdf-04df-4aa61271e81c@gmail.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <9142282b-ab76-53a0-13ce-c43b8adc575f@nvidia.com>
Date:   Fri, 31 May 2019 01:50:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c8bad04b-67ef-bcdf-04df-4aa61271e81c@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559292635; bh=gwf39AOYTh9QTv4U3hBy8Ry+efkLynIwOdktjp72GYQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=OyH3mAtSqXJg7DM81lTRF9F8cR7j833s1uNnWgtMm2oSKeG8WS48JWkCk0hmEs0Hc
         V+xH7/PnTmRi+T0u5d+I2U43sKgdez4Y1ROzjVa6pAlWyAVJ6MaC9uESPgPWks+6E9
         0ciZNRdXUf2rtgnUNnlKESNg97zQqboGgIKjXFtKsPiWdyVHpIG9bVrVjqgv3bcTyc
         fecPgFJ3N4F989E+ep6HRRQHrLeLwe93oCb16s8j0cNBo8EUpI1JrB241S4cwPrLTL
         /jumfEXbFQx9J18Jh+Lx3jZw64cN03ZTkHK2Ieooez4hQvVOACrfxYkSC6fQVfFCfU
         RgvZDw5vXgHog==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 5/30/19 4:27 AM, Dmitry Osipenko wrote:
> 30.05.2019 8:55, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
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
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-teg=
ra.c
>> index ebaa78d..f6a377f 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -1687,9 +1687,33 @@ static int tegra_i2c_remove(struct platform_devic=
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
>> +	i2c_lock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>> +	ret =3D tegra_i2c_init(i2c_dev, false);
>> +	i2c_unlock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>=20
> Why the locking is needed here?

async resume could result in stress test issues if some client accesses=20
the i2c instance. This ensures the i2c instance is locked till the=20
initialization is complete.

>=20
>> +	if (!ret)
>> +		i2c_mark_adapter_resumed(&i2c_dev->adapter);
>> +
>> +       return ret;
>=20
> A very minor nit.. will be a bit more straightforward to write this as:
>=20
> 	int err;
>=20
> 	err =3D tegra_i2c_init(i2c_dev, false);
> 	if (err)
> 		return err;
>=20
> 	i2c_mark_adapter_resumed(&i2c_dev->adapter);
>=20
> 	return 0;
>=20
> It is always cleaner to return 0 on success.
Thanks. I shall update the section in patch as per this suggestion.

-regards,
  Bitan

