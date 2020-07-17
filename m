Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFDF222FBE
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 02:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbgGQANo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 20:13:44 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:17694 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgGQANn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 20:13:43 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f10ed2a0000>; Thu, 16 Jul 2020 17:13:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 16 Jul 2020 17:13:42 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 16 Jul 2020 17:13:42 -0700
Received: from [10.2.163.115] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jul
 2020 00:13:42 +0000
Subject: Re: [RFC PATCH v3 16/18] gpu: host1x: mipi: Split
 tegra_mipi_calibrate and tegra_mipi_wait
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
 <1594786855-26506-17-git-send-email-skomatineni@nvidia.com>
 <a06dec8f-7042-767b-545b-048685a7683d@gmail.com>
 <20d63eca-4b2b-584e-a391-a4fb64a16b40@nvidia.com>
 <c4945c77-5de1-e9b1-9f4f-cdd78bca18c7@gmail.com>
 <ce0c5ffb-f859-0eab-1ea5-044623dff221@nvidia.com>
 <a2b8169c-c4a3-4862-cd27-8c1a51ddc558@gmail.com>
 <4690e682-8495-2327-87c7-c2f06a7a479d@nvidia.com>
 <66812127-38cf-2af3-51c0-50edbe446e73@nvidia.com>
 <9b4fbf9d-d651-aa35-c0a6-b8f16aeb0900@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <550f1796-67ca-5856-223d-c68360243954@nvidia.com>
Date:   Thu, 16 Jul 2020 17:16:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9b4fbf9d-d651-aa35-c0a6-b8f16aeb0900@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594944810; bh=e7ciQ4M92aTObzkBjwwPlQaDpWhA7HRPJ/6w40ZehNc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=WHizPbkQ+yVcMQTr9kKLr6aNEkD238+xGSp8HgIi2sSnVUg9MxaoGtbDY8fIbNvyS
         RhV/V/OuY0b+wfxVAH0zmHdnfwRJdKBiyxlHnYtfEEMQTUZSidNuv6x1Ugs8hQcIsq
         NX1386HljzoK/AfSty9dRp0E9ximbjLg5IIAvkLtAZBjG5Pq2FCbZ8vXWC2raC35yr
         sFtLuvF22WBtFhabnEl2FgkllXC/VkWdhMi0a+FryT7/YyXG42esC0HIURzHZTLHjB
         iJT58Xat81wJz70tf0o2AiSKcX0HWgL3tdU15n3KmvQT0FKFiHWFpnLi2gMYF0thIZ
         q1U02be5hzP1A==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/16/20 4:47 PM, Dmitry Osipenko wrote:
> 17.07.2020 02:09, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 7/16/20 4:06 PM, Sowjanya Komatineni wrote:
>>> On 7/16/20 4:01 PM, Dmitry Osipenko wrote:
>>>> 17.07.2020 01:49, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>> What keeps MIPI clock enabled after completion of the
>>>>>> tegra_mipi_calibrate() invocation?
>>>>> MIPI clock is disabled at end of tegra_mipi_calibrate and is re-enabl=
ed
>>>>> during tegra_mipi_wait.
>>>>>
>>>>> I think I should fix this to keep the clock enabled till calibration
>>>>> results are latched.
>>>>>
>>>>> All consumers of tegra_mipi_calibrate() will call tegra_mipi_wait().
>>>>>
>>>>> So will remove clk_disable mipi clk at end of tegra_mipi_calibrate()
>>>>> and
>>>>> clk_enable mipi_clk at beginning of tegra_mipi_wait()
>>>> Isn't it possible to perform the calibration after enabling CSI and
>>>> before of starting the sensor streaming?
>>> Currently this is what I am doing. Triggering calibration start during
>>> CSI receiver being ready and then sensor streaming will happen where
>>> internal MIPI CAL detects for LP -> HS transition and applies results
>>> to pads. So checking for calibration results after sensor stream is
>>> enabled
>> 1. Calling tegra_mipi_calibrate() during CSI streaming where CSI pads
>> are enabled and receiver is kept ready
>>
>> 2. Start Sensor stream
>>
>> 3. Calling tegra_mipi_wait() to check for MIPI Cal status.
>>
>> So as mipi cal clk need to be kept enabled till 3rd step, we can enable
>> clock during tegra_mipi_calibrate() and leave it enabled and disable it
>> in tegra_mipi_wait after status check.
>  From TRM:
>
> The following sequence is recommended for capturing a single frame:
>
> 1. Set up CSI registers for use case such as number of lanes, virtual
> channel, etc.
> 2. Initialize and power up CSI interface
> 3. Wait for initialization time or done signal from calibration logic
> 4. Power up camera through the I2C interface
> 5. All CSI data and clock lanes are in stop state, LP11
> 6. Initiate frame capture through the I2C
> 7. Frame done, CSI goes back to stop state, LP11
>
> Hence, is it really necessary to perform the manual calibration?

done signal from calibration logic will happen only when it sees LP to=20
HS transition as thats when calibration results are applied to pads and=20
then done signal is set.

Also MIPI Pads calibration need to be done on every power off/on. So=20
need to do calibration and trigger it along with CSI receiver=20
programming to keep it ready and then need to check/wait for status only=20
after sensor stream happens as thats where LP->HS transition happen.

