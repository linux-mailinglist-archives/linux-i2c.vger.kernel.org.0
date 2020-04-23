Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72FD61B59BC
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Apr 2020 12:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727914AbgDWK4U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Apr 2020 06:56:20 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:1154 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727911AbgDWK4S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Apr 2020 06:56:18 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea173dd0000>; Thu, 23 Apr 2020 03:54:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 23 Apr 2020 03:56:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 23 Apr 2020 03:56:18 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Apr
 2020 10:56:18 +0000
Received: from [10.26.73.193] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Apr
 2020 10:56:15 +0000
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
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
Date:   Thu, 23 Apr 2020 11:56:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587639261; bh=WJzV1Jv0Ce9gv3BZE2UoDPJdOFk4EzrOQ7ddtDD0IpQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Ta7B/bt77dEvbces/XxV6IU4FQh26/tXcAY+s0a6HoRsYoUFgLQPdJ1iUgUnkG6qh
         59dwFvLfpdY5/akeYk1yAvgHKsmO8FF72rXcIUEMfMJm5bL+VFaHxGn+uggWde9vRV
         xZ98JrcqdRWxvrEie1pyeoAJXaANRUB98c1JB+L0r045gnxV6h+aoyd+5PAx/1dm5S
         9G7++0Vc3lEfyfNUefaBeaTPM1uqwv0x+sJaAbOKv+varrIR2xE5G8NkIk//MY2kaa
         7SDI6q0MHo/mRXTwKggeNmgsDfTX++qNVxWXnS5iz773Ec31sel+n9zOlwvq0xR4X/
         I3EjyobghTudA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 22/04/2020 15:07, Dmitry Osipenko wrote:

...

>> So I think that part of the problem already existed prior to these
>> patches. Without your patches I see ...
>>
>> [   59.543528] tegra-i2c 7000d000.i2c: i2c transfer timed out
> 
> Does this I2C timeout happen with my patches? Could you please post full
> logs of an older and the recent kernel versions?

I believe that it does, but I need to check.

>> [   59.549036] vdd_sata,avdd_plle: failed to disable
>>
>> [   59.553778] Failed to disable avdd-plle: -110
>>
>> [   59.558150] tegra-pcie 3000.pcie: failed to disable regulators: -110
>>
>>
>> However, now with your patches the i2c is failing to resume and this
>> breaks system suspend completely for Tegra30. So far this is the only
>> board that appears to break.
>>
>> So the above issue needs to be fixed and I will chat to Thierry about this.
> 
> Okay

So I have been looking at this some more and this starting to all look a
bit of a mess :-(

Firstly, the Tegra PCI driver suspends late (noirq) as we know. The PCI
driver will warn if it cannot disable the regulators when suspending but
does not actually fail suspend. So this warning is just indicating that
we were unable to disable the regulators.

Now I don't see that we can ever disable the PCI regulators currently
when entering suspend because ...

1. We are in the noirq phase and so we will not get the completion
   interrupt for the I2C transfer. I know that you recently added the
   atomic I2C transfer support, but we can get the regulator framework
   to use this (I have not looked in much detail so far).

2. Even if the regulator framework supported atomic I2C transfers, we
   also have the problem that the I2C controller could be runtime-
   suspended and pm_runtime_get_sync() will not work during during this
   phase to resume it correctly. This is a problem that needs to be
   fixed indeed!

3. Then we also have the possible dependency on the DMA driver that is
   suspended during the noirq phase.

It could be argued that if the PCI regulators are never turned off
(currently) then we should not even bother and this will likely resolve
this for now. However, really we should try to fix that correctly.

What I still don't understand is why your patch breaks resume. Even if
the I2C transfer fails, and is deemed harmless by the client driver, we
should still be able to suspend and resume correctly.

Cheers
Jon

-- 
nvpublic
