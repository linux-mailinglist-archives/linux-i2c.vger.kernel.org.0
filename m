Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7BC36BCA
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 07:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfFFFno (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 01:43:44 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:14040 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfFFFno (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 01:43:44 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf8a80d0000>; Wed, 05 Jun 2019 22:43:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 05 Jun 2019 22:43:42 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 05 Jun 2019 22:43:42 -0700
Received: from [10.19.65.14] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Jun
 2019 05:43:39 +0000
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
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <caa17a53-6f29-411b-9a84-58ff019752ff@nvidia.com>
Date:   Wed, 5 Jun 2019 22:43:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4f14a218-332c-0263-c6c5-73a13b2446f0@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559799821; bh=GE4p/vNNji/ezHHwZOaHDuH9S3e2H9hCagygywOKcME=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=gYqqAHLrmwQ5AEHYn1VMWyqe+igo0+6oE4x0eX43U88GDpI1+wRnq+DFvBMOceaFO
         lFvLPjv7qgng5rb8JZdByXhDvHcEr1jMbGIyYKNYUjfAtGjPC7KPFQIzyVgXkcMkp7
         PmEPTd4JbRacOsHdNC/EfsiLG4Zz4NuJjWhxSz1KtXk8VGRFg4eo7AGwEuFEAO65s6
         KH+w7DxWR/yOZ1Y0j14jvyNS91zpf5shU8SvtNzxbATvOgpfGJLAA7GrBGzCCQ8dGD
         b+iQpz4sLueC9HJ1UVLFfeHHQ5FvSD2seERCpM4hvCFdQfu1YRHVGIdEPbxOYSwSCv
         LvzNnTi13Txfw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 5/31/19 5:43 AM, Dmitry Osipenko wrote:
> 31.05.2019 11:50, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>>
>> On 5/30/19 4:27 AM, Dmitry Osipenko wrote:
>>> 30.05.2019 8:55, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> Post suspend I2C registers have power on reset values. Before any
>>>> transfer initialize I2C registers to prevent I2C transfer timeout
>>>> and implement suspend and resume callbacks needed. Fix below errors
>>>> post suspend:
>>>>
>>>> 1) Tegra I2C transfer timeout during jetson tx2 resume:
>>>>
>>>> [=C2=A0=C2=A0 27.520613] pca953x 1-0074: calling pca953x_resume+0x0/0x=
1b0 @
>>>> 2939, parent: i2c-1
>>>> [=C2=A0=C2=A0 27.633623] tegra-i2c 3160000.i2c: i2c transfer timed out
>>>> [=C2=A0=C2=A0 27.639162] pca953x 1-0074: Unable to sync registers 0x3-=
0x5. -110
>>>> [=C2=A0=C2=A0 27.645336] pca953x 1-0074: Failed to sync GPIO dir regis=
ters: -110
>>>> [=C2=A0=C2=A0 27.651596] PM: dpm_run_callback(): pca953x_resume+0x0/0x=
1b0
>>>> returns -110
>>>> [=C2=A0=C2=A0 27.658375] pca953x 1-0074: pca953x_resume+0x0/0x1b0 retu=
rned -110
>>>> after 127152 usecs
>>>> [=C2=A0=C2=A0 27.666194] PM: Device 1-0074 failed to resume: error -11=
0
>>>>
>>>> 2) Tegra I2C transfer timeout error on jetson Xavier post resume.
>>>>
>>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>>> ---
>>>>  =C2=A0 drivers/i2c/busses/i2c-tegra.c | 24 ++++++++++++++++++++++++
>>>>  =C2=A0 1 file changed, 24 insertions(+)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>>> b/drivers/i2c/busses/i2c-tegra.c
>>>> index ebaa78d..f6a377f 100644
>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>> @@ -1687,9 +1687,33 @@ static int tegra_i2c_remove(struct
>>>> platform_device *pdev)
>>>>  =C2=A0 }
>>>>  =C2=A0 =C2=A0 #ifdef CONFIG_PM_SLEEP
>>>> +static int tegra_i2c_suspend(struct device *dev)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(=
dev);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 i2c_mark_adapter_suspended(&i2c_dev->adapter);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>> +}
>>>> +
>>>> +static int tegra_i2c_resume(struct device *dev)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(=
dev);
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 i2c_lock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_ADAP=
TER);
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D tegra_i2c_init(i2c_dev, false);
>>>> +=C2=A0=C2=A0=C2=A0 i2c_unlock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_AD=
APTER);
>>>
>>> Why the locking is needed here?
>>
>> async resume could result in stress test issues if some client accesses
>> the i2c instance. This ensures the i2c instance is locked till the
>> initialization is complete.
>=20
> 1) This doesn't make much sense.. if client could access I2C during of
> tegra_i2c_init execution, then what stops it to perform the access
> before the lock is taken?
Client resumes will start after I2C instance resume because of driver=20
dependency. Since lock is the first call in i2c-tegra I believe I2C=20
calls of client will not start.

>=20
> 2) The whole point of the i2c_mark_adapter_* API is to catch those
> faulty clients that have a broken suspend-resume sequence. Client will
> get a -ESHUTDOWN on trying to issue I2C transfer while controller is
> marked as suspended.
i2c lock bus calls were used in the resume callback implementation that=20
was reverted few months back. Hence, these were added in this patch=20
which should be more like a revert-of-revert .

But I feel probably your point also makes sense. Old resume callback did=20
not have i2c_mark_adapter_* calls. Based on the i2c_adapter_mark_* API=20
documentation it should be taking care that core i2c calls from client=20
are not started. I plan to update the patch and remove the lock-unlock=20
guards in resume callback.


>=20
> 3) Please don't use async suspend-resume where it doesn't make sense.
This is a system wide setting. /sys/power/pm_async by default is 1 and=20
there is no driver specific change in this patch to choose async=20
suspend-resume.

>=20
> Corollary: you should drop the locking because it doesn't do anything
> useful.
>=20
I did some basic suspend resume tests and do not see any problems=20
removing the i2c_lock_bus call you pointed out.

-Thanks,
  Bitan

