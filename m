Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE73B223284
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 06:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgGQEnO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 00:43:14 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4767 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgGQEnN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jul 2020 00:43:13 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f112c250000>; Thu, 16 Jul 2020 21:42:13 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 16 Jul 2020 21:43:12 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 16 Jul 2020 21:43:12 -0700
Received: from [10.2.163.115] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jul
 2020 04:43:11 +0000
Subject: Re: [RFC PATCH v3 16/18] gpu: host1x: mipi: Split
 tegra_mipi_calibrate and tegra_mipi_wait
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
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
 <550f1796-67ca-5856-223d-c68360243954@nvidia.com>
Message-ID: <ca8f2184-de30-03ec-9caf-e20a22d96a77@nvidia.com>
Date:   Thu, 16 Jul 2020 21:46:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <550f1796-67ca-5856-223d-c68360243954@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594960933; bh=zrJPrkEaMilEsiEvCxFcP2qbAQOtnirImXULU2ZGxhw=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=royn2/PPV0tG+o3uz3podazpaSg+TPlkllbRFPolMwQkBGDlcwzbqOPcUlvl6bpUu
         VW92u//W+t9T+V5jjotKTA3QnS+R+qe+DDZ7NZxmMtZc7CGa4GPchtE+V5g7cHNRd1
         XA6ZKE+tkkAfQuGk7P4CnaSBOcTpuEVRLxAIyKUWgd32J7DNdgAC17TEw1ElcHLsD2
         TBxxCZ6eSTN/eQdCdMWeT64mo77pSxVZ3S0k8yvfnzkB3IEBAnEF679u1HObAcSImA
         fsoM/ZtUwjFZ7V582xtQHiNYnJJkN+azdHxpMn/QgnhyOyCh5w8hr2PPFLYl1ll5bL
         e/7PfBjBNmoyQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/16/20 5:16 PM, Sowjanya Komatineni wrote:
>
> On 7/16/20 4:47 PM, Dmitry Osipenko wrote:
>> 17.07.2020 02:09, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 7/16/20 4:06 PM, Sowjanya Komatineni wrote:
>>>> On 7/16/20 4:01 PM, Dmitry Osipenko wrote:
>>>>> 17.07.2020 01:49, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>> What keeps MIPI clock enabled after completion of the
>>>>>>> tegra_mipi_calibrate() invocation?
>>>>>> MIPI clock is disabled at end of tegra_mipi_calibrate and is=20
>>>>>> re-enabled
>>>>>> during tegra_mipi_wait.
>>>>>>
>>>>>> I think I should fix this to keep the clock enabled till calibration
>>>>>> results are latched.
>>>>>>
>>>>>> All consumers of tegra_mipi_calibrate() will call tegra_mipi_wait().
>>>>>>
>>>>>> So will remove clk_disable mipi clk at end of tegra_mipi_calibrate()
>>>>>> and
>>>>>> clk_enable mipi_clk at beginning of tegra_mipi_wait()
>>>>> Isn't it possible to perform the calibration after enabling CSI and
>>>>> before of starting the sensor streaming?
>>>> Currently this is what I am doing. Triggering calibration start during
>>>> CSI receiver being ready and then sensor streaming will happen where
>>>> internal MIPI CAL detects for LP -> HS transition and applies results
>>>> to pads. So checking for calibration results after sensor stream is
>>>> enabled
>>> 1. Calling tegra_mipi_calibrate() during CSI streaming where CSI pads
>>> are enabled and receiver is kept ready
>>>
>>> 2. Start Sensor stream
>>>
>>> 3. Calling tegra_mipi_wait() to check for MIPI Cal status.
>>>
>>> So as mipi cal clk need to be kept enabled till 3rd step, we can enable
>>> clock during tegra_mipi_calibrate() and leave it enabled and disable it
>>> in tegra_mipi_wait after status check.
>> =C2=A0From TRM:
>>
>> The following sequence is recommended for capturing a single frame:
>>
>> 1. Set up CSI registers for use case such as number of lanes, virtual
>> channel, etc.
>> 2. Initialize and power up CSI interface
>> 3. Wait for initialization time or done signal from calibration logic
>> 4. Power up camera through the I2C interface
>> 5. All CSI data and clock lanes are in stop state, LP11
>> 6. Initiate frame capture through the I2C
>> 7. Frame done, CSI goes back to stop state, LP11
>>
>> Hence, is it really necessary to perform the manual calibration?
>
> done signal from calibration logic will happen only when it sees LP to=20
> HS transition as thats when calibration results are applied to pads=20
> and then done signal is set.
>
> Also MIPI Pads calibration need to be done on every power off/on. So=20
> need to do calibration and trigger it along with CSI receiver=20
> programming to keep it ready and then need to check/wait for status=20
> only after sensor stream happens as thats where LP->HS transition happen.
>
Looks like sequence posted in TRM need to be updated clearly for proper=20
MIPI CAL start and wait.

Correct steps should be like below

1. Set up CSI registers for use case such as number of lanes, virtual=C2=A0=
=20
channel, etc.
2. Initialize and power up CSI CIL interface
3. Program MIPI CAL bias pads, cal configs, cal control registers and=20
enable calibration start
4. Power up camera through the I2C interface and start sensor streaming=20
through the I2C

Note: All sensors might not leave pads in LP-11 state as sensor may be=20
power down when not in use.

So start streaming prior to checking for calibration done status as=20
LP-11 -> HS transition happens during sensor stream and calibration=20
logic can apply results to pads and update done status,

5. Wait for done signal from calibration logic

6. perform frame capture thru VI
7. Frame done, CSI goes back to stop state, LP11

Will work internally to correct sequence in TRM ...


In mipi driver will update as below to have mipi clk enabled till=20
calibration status check is done.

Always tegra_mipi_wait() followes tegra_mipi_calibrate() in both DSI and=20
CSI. So below sequence should work good.

tegra_mipi_calibrate()

- clk_enable mipi cal
- program mipi cal registers (bias pads cfgs, mipi cal ctrl and trigger=20
calibration start)

tegra_mipi_wait()
- read mipi cal status and wait for active and done bits
- clk_disable mipi cal

Thanks

Sowjanya

