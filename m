Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CAB71B6EA9
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Apr 2020 09:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgDXHKd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Apr 2020 03:10:33 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:4799 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbgDXHKc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Apr 2020 03:10:32 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea290720001>; Fri, 24 Apr 2020 00:08:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 24 Apr 2020 00:10:32 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 24 Apr 2020 00:10:32 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Apr
 2020 07:10:32 +0000
Received: from [10.26.73.231] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Apr
 2020 07:10:29 +0000
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "Wolfram Sang" <wsa@the-dreams.de>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
 <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
 <f59ba318-8e99-c486-fa4d-1ee28a7b203d@gmail.com>
 <b01cec76-bb39-9fb5-8f6e-4023c075e6b3@gmail.com>
 <8cd085e1-f9fd-6ec0-9f7a-d5463f176a63@nvidia.com>
 <db1132ce-53a8-371c-98e0-cb7cd91d5c7d@gmail.com>
 <fa344989-4cce-0d2c-dc93-4ca546823160@nvidia.com>
 <bba0a93a-8ec4-eda6-97f3-fb2ab0b9b503@gmail.com>
 <6f07e5c8-7916-7ea2-2fe7-d05f8f011471@nvidia.com>
 <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
 <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
Date:   Fri, 24 Apr 2020 08:10:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587712115; bh=Vue2wSpWKstn9zp8TZY8tWYSPrb8qcAXPds/zrgMX3A=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=rUq9ByqWHrbIT8vZKHE3BWZXjB7b/gBRr9zQrjvZc6KYIgHNLUZWIWIp01BDAX6VD
         ot9pXd7OpP74fC1qjrPZQrjcsC2Bu0QujWBGBeY/KCHlgL+4hFcn+Pauyxh9SGZig5
         p8/5VDhBtSVXRJ0TIHMasHcxP0c+acBVrPXlfSBxm3d0Hi2gxym9yLU7JiT+i1DsCQ
         eA/QIGbGEHRv40J5ATRCR5hmVAC4g3WWk8OSVG9fgbFjb74ajawnfCQCAdBrps19wl
         okCE32wqG1rSqme1L3OCiePIxMT3wQ7P7IpnMPuqoik3JF6U4wlhSWNK9brKvJaqsK
         Y/yRHxEP8RIqQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 23/04/2020 17:33, Dmitry Osipenko wrote:
> 23.04.2020 13:56, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>> On 22/04/2020 15:07, Dmitry Osipenko wrote:
>>
>> ...
>>
>>>> So I think that part of the problem already existed prior to these
>>>> patches. Without your patches I see ...
>>>>
>>>> [   59.543528] tegra-i2c 7000d000.i2c: i2c transfer timed out
>>>
>>> Does this I2C timeout happen with my patches? Could you please post ful=
l
>>> logs of an older and the recent kernel versions?
>>
>> I believe that it does, but I need to check.
>>
>>>> [   59.549036] vdd_sata,avdd_plle: failed to disable
>>>>
>>>> [   59.553778] Failed to disable avdd-plle: -110
>>>>
>>>> [   59.558150] tegra-pcie 3000.pcie: failed to disable regulators: -11=
0
>>>>
>>>>
>>>> However, now with your patches the i2c is failing to resume and this
>>>> breaks system suspend completely for Tegra30. So far this is the only
>>>> board that appears to break.
>>>>
>>>> So the above issue needs to be fixed and I will chat to Thierry about =
this.
>>>
>>> Okay
>>
>> So I have been looking at this some more and this starting to all look a
>> bit of a mess :-(
>>
>> Firstly, the Tegra PCI driver suspends late (noirq) as we know. The PCI
>> driver will warn if it cannot disable the regulators when suspending but
>> does not actually fail suspend. So this warning is just indicating that
>> we were unable to disable the regulators.
>>
>> Now I don't see that we can ever disable the PCI regulators currently
>> when entering suspend because ...
>>
>> 1. We are in the noirq phase and so we will not get the completion
>>    interrupt for the I2C transfer. I know that you recently added the
>>    atomic I2C transfer support, but we can get the regulator framework
>>    to use this (I have not looked in much detail so far).
>=20
> That's not good :) I didn't realize that *all* interrupts of every
> device are disabled before .noirq is invoked. It appeared to me that the
> IRQs disabling and .noirq invocation is performed for the drivers one
> after another, but now I see that it's not true.
>=20
> https://elixir.bootlin.com/linux/v5.7-rc2/source/drivers/base/power/main.=
c#L1446
>=20
>> 2. Even if the regulator framework supported atomic I2C transfers, we
>>    also have the problem that the I2C controller could be runtime-
>>    suspended and pm_runtime_get_sync() will not work during during this
>>    phase to resume it correctly. This is a problem that needs to be
>>    fixed indeed!
>=20
> Could you please clarify why pm_runtime_get_sync() can't be used by the
> I2C driver's in NOIRQ phase?

Yes take a look at commit 1e2ef05bb8cf ("PM: Limit race conditions
between runtime PM and system sleep (v2)").

>> 3. Then we also have the possible dependency on the DMA driver that is
>>    suspended during the noirq phase.
>=20
> Yes, this is correct.
>=20
> Again, some regulator drivers may do something on suspend too, although
> looks like the current upstream Tegra devices are not affected by this
> potential problem.
>=20
>> It could be argued that if the PCI regulators are never turned off
>> (currently) then we should not even bother and this will likely resolve
>> this for now. However, really we should try to fix that correctly.
>=20
> Yes, keeping PCI regulators always-enabled should be a good immediate
> solution.

I was thinking about that, and I am not sure it is. I don't think that
the failure to send the I2C command should break suspend.

> Also, the RPM's system suspend/resume needs to fixed for the pci-tegra
> driver, like I already suggested before.

Yes but I don't think that is the cause of the issue in this particular
case.

>> What I still don't understand is why your patch breaks resume. Even if
>> the I2C transfer fails, and is deemed harmless by the client driver, we
>> should still be able to suspend and resume correctly.
>=20
> If DMA is getting synchronized after DMA driver being suspended, then it
> could be a problem.

So I confirmed that DMA is not the issue in this case. I tested this by
ensuring that DMA is never used. However, it is a potential problem
indeed.

> Could you please try to apply this hunk and see if it makes any
> difference (I'll probably make it as proper patch):

Per my tests, I don't believe that it will as disabling DMA does not
resolve the problem.

> It also could be that there is more than the suspend ordering problem,
> but for now it is hard to tell without having a detailed log which
> includes I2C/DMA/RPM traces.

I have taken a look and I don't see any issues with ordering. I2C is
suspended after PCI. This did not change.

Cheers
Jon

--=20
nvpublic
