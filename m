Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9215B1BB863
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Apr 2020 10:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgD1ICn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Apr 2020 04:02:43 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:2712 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgD1ICm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Apr 2020 04:02:42 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea7e3150000>; Tue, 28 Apr 2020 01:02:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 Apr 2020 01:02:42 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 Apr 2020 01:02:42 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Apr
 2020 08:02:42 +0000
Received: from [10.26.73.101] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Apr
 2020 08:02:39 +0000
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "Wolfram Sang" <wsa@the-dreams.de>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
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
 <da5985f4-44b3-336d-207d-4c0388806f95@gmail.com>
 <5fc71168-e4ac-11f6-dbf1-e80f4fae8d1a@gmail.com>
 <090241c4-e026-aea4-e1e9-a2a661b2c27e@gmail.com>
 <9a3d283c-d4ff-c55a-3ebf-4e08d35792ec@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <f78bb10c-0744-4a23-c584-0212dd9fb491@nvidia.com>
Date:   Tue, 28 Apr 2020 09:02:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9a3d283c-d4ff-c55a-3ebf-4e08d35792ec@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588060949; bh=cs1RNBnpWaKHsxJ2zVYobPJtuZEqLrQg7l0V07UM/DQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Ts7bsldutGOcpt00XXFlWXq8wow2vksLNocXXZrAJLO98TCQw9z/rcMoxs+9vBN87
         NjhKpnRo8qppvvVIFHUCDA5xPoli9cSxGU+hW6c4eU/v0NYZH7HGMAiWJsJXTApuog
         THuUyDCgeCch+q2zPRUnuJT115hfJgNoN/e+XyTqzTMtIaweILW8qi8MEIEoeX0MG+
         9+SXJumCpx0F/A2xa+vOAcZjz+LnpB+Ww5gy+f/1WsMiipiSKsfftmSwPQ16iSg/bn
         fKfObu38ncJ0BE0i3vBBnIPY0NzNm/d/yR6zjrksXy9rgJkT1nYS6Kwwqb5Z8XkGDX
         T2YiaqTIhI39A==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 27/04/2020 16:38, Dmitry Osipenko wrote:
> 27.04.2020 17:45, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 27.04.2020 17:13, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> 27.04.2020 15:46, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> 23.04.2020 13:56, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>> So I think that part of the problem already existed prior to these
>>>>>>> patches. Without your patches I see ...
>>>>>>>
>>>>>>> [   59.543528] tegra-i2c 7000d000.i2c: i2c transfer timed out
>>>>>>> [   59.549036] vdd_sata,avdd_plle: failed to disable
>>>>>>> [   59.553778] Failed to disable avdd-plle: -110
>>>>>>> [   59.558150] tegra-pcie 3000.pcie: failed to disable regulators: =
-110
>>>>>> Does this I2C timeout happen with my patches? Could you please post =
full
>>>>>> logs of an older and the recent kernel versions?
>>>>> I believe that it does, but I need to check.
>>>>>
>>>>
>>>> Jon, could you please confirm that you're seeing those regulator-disab=
le
>>>> errors with my patch? I don't see those errors in yours original log [=
1].
>>>>
>>>> [1]
>>>> https://lore.kernel.org/lkml/1e259e22-c300-663a-e537-18d854e0f478@nvid=
ia.com/
>>>>
>>>> Again, could you please post the *full* logs?
>>>>
>>>> If regulator's disabling was "failing" before without my patch because
>>>> of the I2C interrupt being force-disabled during of NOIRQ phase, and n=
ow
>>>> regulator's disabling succeeds with my patch because IRQ is manually
>>>> handled after the timeout, then this could be bad. It means that
>>>> regulator was actually getting disabled, but I2C driver was timing out
>>>> because interrupt couldn't be handled in NOIRQ phase, which should
>>>> result in a dead PCIe on a resume from suspend since regulator's core
>>>> thinks that regulator is enabled (I2C said it failed to disable), whil=
e
>>>> it is actually disabled.
>>>>
>>>> Do you have anything plugged into the PCIe slot in yours testing farm?
>>>> It wouldn't surprise me if the plugged card isn't functional after
>>>> resume from suspend on a stable kernels.
>>>>
>>>
>>> I actually now see that interrupt is not allowed to be enabled during
>>> the NOIRQ phase:
>>>
>>> https://elixir.bootlin.com/linux/v5.7-rc3/source/kernel/irq/manage.c#L6=
40
>>>
>>> it should be worthwhile to turn it into a WARN_ON.
>>>
>>
>> Oh, wait! There is already a warning there.. hmm.
>>
>=20
> Aha, the disable depth for the I2C interrupt is 2 after
> suspend_device_irq(), that's why there is no warning.
>=20
> This should catch the bug and trigger the warning:
>=20
> --- >8 ---
> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> index 453a8a0f4804..fe25104d8b22 100644
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -653,6 +653,8 @@ void __enable_irq(struct irq_desc *desc)
>  		break;
>  	}
>  	default:
> +		if (desc->istate & IRQS_SUSPENDED)
> +			goto err_out;
>  		desc->depth--;
>  	}
>  }
> --- >8 ---
>=20
> Jon could you please give it a try? Will this change produce a warning
> for the I2C driver on a PCIe suspend for the v5.6 kernel?


Yes I can test, but I still want to know why resume is currently broken.

Jon

--=20
nvpublic
