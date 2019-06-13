Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D98B43B0D
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 17:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbfFMPZc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 11:25:32 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:10738 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731542AbfFMMAu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jun 2019 08:00:50 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d023af20000>; Thu, 13 Jun 2019 05:00:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 13 Jun 2019 05:00:49 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 13 Jun 2019 05:00:49 -0700
Received: from [10.19.65.14] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Jun
 2019 12:00:46 +0000
Subject: Re: [PATCH V3] i2c: busses: tegra: Add suspend-resume support
To:     Dmitry Osipenko <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>,
        "Wolfram Sang" <wsa@the-dreams.de>
References: <1559885867-10190-1-git-send-email-bbiswas@nvidia.com>
 <21a2b722-cd1d-284f-2a4d-99bb12c98afd@gmail.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <508037a2-52cb-43e8-24a9-1c064972d2d8@nvidia.com>
Date:   Thu, 13 Jun 2019 05:00:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <21a2b722-cd1d-284f-2a4d-99bb12c98afd@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560427250; bh=23RUxXLABPsWTgbFYKYPOjxplDTXER3cpUykkuAC2Lo=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=lN3dzddRBdZg/kW2vQGRewhaFK9/Kw+nulX4aX3AE9/bHLpGfokl5HzngCRzF+SaA
         //HKb+YLKQniCeKNMc6c6wcAqz5ITtZhfgVukW2JLEuYnJks256zFr1UzVE2k5E1W8
         Du8FnPs8qIoPVq6bJ120BOJQ+bjqa6FbD5+Lvq8ll4NhKC3WxAbVKLbJ+FVfeuqFXG
         9s6wQVQwJkEDbQCS1xhnzZ9E/gh2hcig42ulgvGgprkErNJ0Hub6GKFqkveoIFsxLe
         Fl+9dUUeUrSenbEfK/2Ud6iXI885rW6CXgFtljN+EsShFVqf/mUzJEG1SkGuyesJ7H
         g8+4JGZnDHWQw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/6/19 11:27 PM, Dmitry Osipenko wrote:
> 07.06.2019 8:37, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
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
>>   drivers/i2c/busses/i2c-tegra.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-teg=
ra.c
>> index ebaa78d..1dbba39 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -1687,7 +1687,31 @@ static int tegra_i2c_remove(struct platform_devic=
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
>> +	int err;
>> +
>> +	err =3D tegra_i2c_init(i2c_dev, false);
>> +	if (err)
>> +		return err;
>> +
>> +	i2c_mark_adapter_resumed(&i2c_dev->adapter);
>> +
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
>=20
> Thanks!
>=20
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>=20

Please get back if there is/are any further review comment(s) for below=20
patch.


http://patchwork.ozlabs.org/patch/1111570/

-Thanks,
  Bitan


