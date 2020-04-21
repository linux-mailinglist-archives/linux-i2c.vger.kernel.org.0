Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC4761B2644
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Apr 2020 14:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbgDUMj6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Apr 2020 08:39:58 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9916 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728422AbgDUMj5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Apr 2020 08:39:57 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e9ee92a0000>; Tue, 21 Apr 2020 05:38:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 21 Apr 2020 05:39:57 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 21 Apr 2020 05:39:57 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Apr
 2020 12:39:57 +0000
Received: from [10.40.201.173] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Apr
 2020 12:39:51 +0000
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Vidya Sagar <vidyas@nvidia.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
 <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
 <f59ba318-8e99-c486-fa4d-1ee28a7b203d@gmail.com>
 <b01cec76-bb39-9fb5-8f6e-4023c075e6b3@gmail.com>
 <8cd085e1-f9fd-6ec0-9f7a-d5463f176a63@nvidia.com>
X-Nvconfidentiality: public
From:   Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <2e99c2f0-4bba-2ea6-dada-3190c0303dcf@nvidia.com>
Date:   Tue, 21 Apr 2020 18:09:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8cd085e1-f9fd-6ec0-9f7a-d5463f176a63@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587472682; bh=jpQJhxznkwdF5wraZB2dN5lqYhMy98eo9ytcoOL9yiE=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:
         Content-Transfer-Encoding:Content-Language;
        b=VF7E9qyMAJ83Za9iiAKFuwlMOGrygozzSeP/stn6lq8M3tc8t0z3Xpu2C/YM181NI
         KkpfNdLkcOPZd7a6m03pm5X/e6uXxtZnSOOg3IRLOMpnwPLms9zZ/bsx/g+u5KGG+D
         i3Xem1OPug+KMbZcdi0wt4uCmrY6rJ7jg+E1FKPaJyBnUdIeLXC4T1k1M8fK9qg53F
         3ywPmVlXZMZhUCoB2Rl0rqqtdp2MnxGKDS7cDuaIIYq7utgoLxfH2M/QVXDDV2JnRE
         pWbFxuxOiqObX4LnAPUY2groPF+8P1tC1lSO6vjok7FX4JvXTCIDWgRhBr/MLZujAi
         5/AatM9gHA3pg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 21-Apr-20 3:19 PM, Jon Hunter wrote:
> Hi Dmitry,
>
> On 21/04/2020 01:32, Dmitry Osipenko wrote:
>> 21.04.2020 01:11, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> Hello Jon,
>>>
>>> 20.04.2020 22:53, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> Hi Dmitry,
>>>>
>>>> On 24/03/2020 19:12, Dmitry Osipenko wrote:
>>>>> Boot CPU0 always handle I2C interrupt and under some rare circumstanc=
es
>>>>> (like running KASAN + NFS root) it may stuck in uninterruptible state=
 for
>>>>> a significant time. In this case we will get timeout if I2C transfer =
is
>>>>> running on a sibling CPU, despite of IRQ being raised. In order to ha=
ndle
>>>>> this rare condition, the IRQ status needs to be checked after complet=
ion
>>>>> timeout.
>>>>>
>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>> ---
>>>>>  drivers/i2c/busses/i2c-tegra.c | 27 +++++++++++++++------------
>>>>>  1 file changed, 15 insertions(+), 12 deletions(-)
>>>>
>>>> I have noticed a regression on tegra30-cardhu-a04 when testing system
>>>> suspend. Git bisect is pointing to this commit and reverting it fixes
>>>> the problem. In the below console log I2C fails to resume ...
>>>>
>>> ...
>>>> [   60.690035] PM: Device 3000.pcie failed to resume noirq: error -16
>>> ...
>>>> [   60.696859] tegra-mc 7000f000.memory-controller: fdcdwr2: write @0x=
877e8400: EMEM address decode error (SMMU translation error [--S])
>>>>
>>>> [   60.708876] tegra-mc 7000f000.memory-controller: fdcdwr2: write @0x=
877e8400: Page fault (SMMU translation error [--S])
>>> This looks very wrong, the error tells that 3d hardware is active and
>>> doing something odd. Are you running some 3d tests?
> I am not running any GFX tests. However, I am not sure if the above is
> unrelated.
>
>>>> Have you seen this?
>>> No, I haven't seen that. I'm not using PCIE and it looks like it's the
>>> problem.
>>>
>>> Looking at the PCIE driver code, seems it's not syncing the RPM state o=
n
>>> suspend/resume.
>>>
>>> Please try this change:
>>>
>>> --- >8 ---
>>> diff --git a/drivers/pci/controller/pci-tegra.c
>>> b/drivers/pci/controller/pci-tegra.c
>>> index 3e64ba6a36a8..b1fcbae4109c 100644
>>> --- a/drivers/pci/controller/pci-tegra.c
>>> +++ b/drivers/pci/controller/pci-tegra.c
>>> @@ -2870,8 +2870,8 @@ static int __maybe_unused
>>> tegra_pcie_pm_resume(struct device *dev)
>>>
>>>  static const struct dev_pm_ops tegra_pcie_pm_ops =3D {
>>>  	SET_RUNTIME_PM_OPS(tegra_pcie_pm_suspend, tegra_pcie_pm_resume, NULL)
>>> -	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_pcie_pm_suspend,
>>> -				      tegra_pcie_pm_resume)
>>> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>>> +				      pm_runtime_force_resume)
>>>  };
>>>
>>>
>>>  static struct platform_driver tegra_pcie_driver =3D {
>>> --- >8 ---
>>>
>>> Secondly, I2C driver suspends on NOIRQ level, while APBDMA driver
>>> suspends on default level. This is also wrong, please try to apply this
>>> hunk as well:
>>>
>>> --- >8 ---
>>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dm=
a.c
>>> index f6a2f42ffc51..e682ac86bd27 100644
>>> --- a/drivers/dma/tegra20-apb-dma.c
>>> +++ b/drivers/dma/tegra20-apb-dma.c
>>> @@ -1653,7 +1653,7 @@ static int __maybe_unused
>>> tegra_dma_dev_resume(struct device *dev)
>>>  static const struct dev_pm_ops tegra_dma_dev_pm_ops =3D {
>>>  	SET_RUNTIME_PM_OPS(tegra_dma_runtime_suspend, tegra_dma_runtime_resum=
e,
>>>  			   NULL)
>>> -	SET_SYSTEM_SLEEP_PM_OPS(tegra_dma_dev_suspend, tegra_dma_dev_resume)
>>> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_dma_dev_suspend, tegra_dma_dev_re=
sume)
>>>  };
>>>
>>>  static const struct of_device_id tegra_dma_of_match[] =3D {
>>> --- >8 ---
>>>
>> Although, I'm now having a second though about the APBDMA change... I'm
>> recalling that there are some complications in regards to PCIE driver
>> suspending, requiring it to be at NOIRQ level, but this should be wrong
>> because PCIE driver uses voltage regulator driver at NOIRQ level, while
>> regulator drivers suspend on default level. The current behavior of the
>> PCIE driver should be wrong, I think it needs to be moved to the default
>> suspend-resume level somehow.
> I can try the above, but I agree it would be best to avoid messing with
> the suspend levels if possible.
>
> I am adding Manikanta to get some feedback on why we moved the PCI
> suspend to the NOIRQ phase because it is not clear to me if we need to
> do this here.
>
> Manikanta, can you comment on whether we really need to suspend Tegra
> PCI during the noirq phase?

PCIe subsystem driver implemented noirq PM callbacks, it will save & restor=
e
endpoint config space in these PM callbacks. PCIe controller should be
available during this time, so noirq PM callbacks are implemented in Tegra
PCIe driver.

file: drivers/pci/pci-driver.c
static const struct dev_pm_ops pci_dev_pm_ops =3D {
	...
        .suspend_noirq =3D pci_pm_suspend_noirq,
        .resume_noirq =3D pci_pm_resume_noirq,
        ...
};

Thanks,
Manikanta

>  =09
> Cheers
> Jon
>

