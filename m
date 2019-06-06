Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45B78375C6
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 15:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbfFFNzw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 09:55:52 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:3797 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbfFFNzv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 09:55:51 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf91b640000>; Thu, 06 Jun 2019 06:55:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 06 Jun 2019 06:55:50 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 06 Jun 2019 06:55:50 -0700
Received: from [10.19.65.14] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Jun
 2019 13:55:47 +0000
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
 <9142282b-ab76-53a0-13ce-c43b8adc575f@nvidia.com>
 <4f14a218-332c-0263-c6c5-73a13b2446f0@gmail.com>
 <caa17a53-6f29-411b-9a84-58ff019752ff@nvidia.com>
 <d5803f1d-0895-08b8-4851-cd8afad830c6@gmail.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <c88b736e-47e0-43ca-b859-900936f94715@nvidia.com>
Date:   Thu, 6 Jun 2019 06:55:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <d5803f1d-0895-08b8-4851-cd8afad830c6@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559829348; bh=6e3s0THa4zvwhgtfqAaZTr8O5dOGC++3FEJrroJDDAM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=JRbyl06CrpDeo4FzGqcdZpCzNspp06hfus947iu9KFcuwYOQb3f0J1gO2h/AsyISV
         1HeUcOzb9gQF8QP5tE0ElsWfqN4nq+ipSyuJw8b+hvmHdCsfyThebGDWeCzIRk2kpq
         HUpvN+czSs4p0uj7yFvhL+JFYqieAW73aodH7C/RdFQK/N+tt1zCk9ebNyqj7PebXS
         V8N5glHmXbOenkrt5ZkwlIO+YCsDEMeqz48lXvZh3M0wzcigme8XIB+Hz/iYA0iiif
         FKBLFojrFDRs8plNGLBUJuyVzMcWis6knxxIkP3Omc+p1J0/Wls1gLaa6HeQBV0XtW
         jdBgZTDVUi0sw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/6/19 4:52 AM, Dmitry Osipenko wrote:
> 06.06.2019 8:43, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>>
>> On 5/31/19 5:43 AM, Dmitry Osipenko wrote:
>>> 31.05.2019 11:50, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>
>>>>
>>>> On 5/30/19 4:27 AM, Dmitry Osipenko wrote:
>>>>> 30.05.2019 8:55, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>> Post suspend I2C registers have power on reset values. Before any
>>>>>> transfer initialize I2C registers to prevent I2C transfer timeout
>>>>>> and implement suspend and resume callbacks needed. Fix below errors
>>>>>> post suspend:
>>>>>>
>>>>>> 1) Tegra I2C transfer timeout during jetson tx2 resume:
>>>>>>
>>>>>> [=C2=A0=C2=A0 27.520613] pca953x 1-0074: calling pca953x_resume+0x0/=
0x1b0 @
>>>>>> 2939, parent: i2c-1
>>>>>> [=C2=A0=C2=A0 27.633623] tegra-i2c 3160000.i2c: i2c transfer timed o=
ut
>>>>>> [=C2=A0=C2=A0 27.639162] pca953x 1-0074: Unable to sync registers 0x=
3-0x5. -110
>>>>>> [=C2=A0=C2=A0 27.645336] pca953x 1-0074: Failed to sync GPIO dir reg=
isters: -110
>>>>>> [=C2=A0=C2=A0 27.651596] PM: dpm_run_callback(): pca953x_resume+0x0/=
0x1b0
>>>>>> returns -110
>>>>>> [=C2=A0=C2=A0 27.658375] pca953x 1-0074: pca953x_resume+0x0/0x1b0 re=
turned -110
>>>>>> after 127152 usecs
>>>>>> [=C2=A0=C2=A0 27.666194] PM: Device 1-0074 failed to resume: error -=
110
>>>>>>
>>>>>> 2) Tegra I2C transfer timeout error on jetson Xavier post resume.
>>>>>>
>>>>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>>>>> ---
>>>>>>  =C2=A0=C2=A0 drivers/i2c/busses/i2c-tegra.c | 24 ++++++++++++++++++=
++++++
>>>>>>  =C2=A0=C2=A0 1 file changed, 24 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>>>>> b/drivers/i2c/busses/i2c-tegra.c
>>>>>> index ebaa78d..f6a377f 100644
>>>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>>>> @@ -1687,9 +1687,33 @@ static int tegra_i2c_remove(struct
>>>>>> platform_device *pdev)
>>>>>>  =C2=A0=C2=A0 }
>>>>>>  =C2=A0=C2=A0 =C2=A0 #ifdef CONFIG_PM_SLEEP
>>>>>> +static int tegra_i2c_suspend(struct device *dev)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdat=
a(dev);
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 i2c_mark_adapter_suspended(&i2c_dev->adapter);
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static int tegra_i2c_resume(struct device *dev)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdat=
a(dev);
>>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 i2c_lock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_AD=
APTER);
>>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D tegra_i2c_init(i2c_dev, false);
>>>>>> +=C2=A0=C2=A0=C2=A0 i2c_unlock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_=
ADAPTER);
>>>>>
>>>>> Why the locking is needed here?
>>>>
>>>> async resume could result in stress test issues if some client accesse=
s
>>>> the i2c instance. This ensures the i2c instance is locked till the
>>>> initialization is complete.
>>>
>>> 1) This doesn't make much sense.. if client could access I2C during of
>>> tegra_i2c_init execution, then what stops it to perform the access
>>> before the lock is taken?
>> Client resumes will start after I2C instance resume because of driver
>> dependency. Since lock is the first call in i2c-tegra I believe I2C
>> calls of client will not start.
>=20
> You're incorrectly assuming that client can start resuming in the middle
> of the controller's resume process. I2C client's resume won't start
> until tegra_i2c_resume() is finished completely. That is because child
> drivers are resumed only after theirs parent is ready and this is
> guaranteed by the drivers core.
>=20
Agreed.

-regards,
  Bitan
