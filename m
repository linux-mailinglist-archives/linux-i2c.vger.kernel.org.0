Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E53001B46B7
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Apr 2020 15:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgDVN7K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Apr 2020 09:59:10 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10823 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgDVN7J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Apr 2020 09:59:09 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea04d6f0000>; Wed, 22 Apr 2020 06:58:07 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 22 Apr 2020 06:59:09 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 22 Apr 2020 06:59:09 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Apr
 2020 13:59:09 +0000
Received: from [10.26.73.30] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Apr
 2020 13:59:07 +0000
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
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
Date:   Wed, 22 Apr 2020 14:59:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587563887; bh=fWrKCLj9iaz+8wlINxzCYk7VKT8PLOADjgGAMWhadjQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Aav5j/91u/Hn43+kuqWsf7ApNeYW4z7fEq1rlto8KNoZ+W9Rx6pPuB3DjAwaaZG+h
         L/qLlxfTUF398U9+ai+SX5Clc25ww9csCGU6d3IIVfJyqL1z664PZOjL01yT9wqIiy
         U3SvQUfQK/q72GU/QrX/mDzxpgNzm6Pp2VcGB/cDtlBggJW8wXHNat1QIuk3GtSVgy
         Wp+CuLqXmb7wPbeP7WAUO6F29baoV8/AF2Tww52TtapGmgkTiYfOknsWlgs5jrHRmg
         RfGnmpu/fbFAjh3RRT43loaSaViPVKlpxZFLvqSXkptsAvY56ggbroQ/OmYpVhQyk1
         qNPJwRXuvQqYw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 22/04/2020 14:40, Dmitry Osipenko wrote:
> 21.04.2020 22:42, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>> On 21/04/2020 16:08, Dmitry Osipenko wrote:
>>> 21.04.2020 17:40, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>
>>>> On 21/04/2020 14:25, Dmitry Osipenko wrote:
>>>>> 21.04.2020 12:49, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> ...
>>>>>> I can try the above, but I agree it would be best to avoid messing w=
ith
>>>>>> the suspend levels if possible.
>>>>>
>>>>> Will be awesome if you could try it and report back the result.
>>>>>
>>>>
>>>> I gave it a try but suspend still fails.
>>>
>>> Perhaps the RPM's -EACCES is returned from here:
>>>
>>> https://elixir.free-electrons.com/linux/v5.7-rc2/source/drivers/base/po=
wer/runtime.c#L723
>>>
>>> Which suggests that I2C is accessed after being suspended. I guess the
>>> PCIe driver suspends after the I2C and somehow my change affected the
>>> suspension order, although not sure how.
>>>
>>> Jon, could you please try to enable PM logging and post the log? Please
>>> also post log of the working kernel version, so that we could compare
>>> the PM sequence.
>>>
>>> Something like this should enable the logging: "echo 1 >
>>> /sys/power/pm_trace" + there is RPM tracing.
>>
>> Unfortunately, after enabling that I don't any output and so no help the=
re.
>=20
> 1. I now tried to check the pm_trace myself and found that it's
> available only on X86, my bad.
>=20
> 2. Jon, could you please clarify what exactly you were trying to test?
>=20
> 3. Is it only the Cardhu board that is affected by this problem?
>=20
> 4. Could you please try to add this to the kernel's cmdline and post the
> logs:
>=20
> tp_printk
> trace_event=3Drpm_suspend,rpm_resume,rpm_usage,rpm_idle,rpm_return_int


So I think that part of the problem already existed prior to these
patches. Without your patches I see ...

[   59.543528] tegra-i2c 7000d000.i2c: i2c transfer timed out

[   59.549036] vdd_sata,avdd_plle: failed to disable

[   59.553778] Failed to disable avdd-plle: -110

[   59.558150] tegra-pcie 3000.pcie: failed to disable regulators: -110


However, now with your patches the i2c is failing to resume and this
breaks system suspend completely for Tegra30. So far this is the only
board that appears to break.

So the above issue needs to be fixed and I will chat to Thierry about this.

Jon

--=20
nvpublic
