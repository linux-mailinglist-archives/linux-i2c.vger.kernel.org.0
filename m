Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA543223FBB
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 17:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbgGQPii (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 11:38:38 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4423 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgGQPih (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jul 2020 11:38:37 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f11c5c10001>; Fri, 17 Jul 2020 08:37:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 17 Jul 2020 08:38:37 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 17 Jul 2020 08:38:37 -0700
Received: from [10.2.163.115] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jul
 2020 15:38:36 +0000
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
 <550f1796-67ca-5856-223d-c68360243954@nvidia.com>
 <ca8f2184-de30-03ec-9caf-e20a22d96a77@nvidia.com>
 <080b30c7-1dce-dd2f-dd96-40f6e25da4d6@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <b125deab-7900-6266-d405-4d7f029089b4@nvidia.com>
Date:   Fri, 17 Jul 2020 08:41:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <080b30c7-1dce-dd2f-dd96-40f6e25da4d6@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595000257; bh=BwQ54mkMiNyfXprqWjplx8huez0ofYFZmAj/V7xmfOg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=MmFR4hMIZLpNgjGiHyv/ZezFZqR2R973bwrM7NbK947LTpR87DZCHpQ4IAVIJzpye
         WkiP6wYzl9Z2M8OJTAeJdzO5oCwk7zqrNZN3lf1zqGGpO6kGBw2S69xdTV5W0FulN3
         G4VUQpKP/NJgaVFeuV3hscuu+1h0IOz75tsMrgiuZwKNwXcY7eWBuovgj4oCyfYJLg
         /roJVJVnudOOpuC/ceTL/73FEIduJboJtIngXdd6Gmzfou57zcBRmggwbgiuNI3uXN
         0HOd4HdPcCb8HKhNpjHl1xyeb+lCJrhIFKVmq9stGs7qSK3N19jxxHL+BgRZwrtDy1
         EfoT6jLaO3WrA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/17/20 8:01 AM, Dmitry Osipenko wrote:
> 17.07.2020 07:46, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> Looks like sequence posted in TRM need to be updated clearly for proper
>> MIPI CAL start and wait.
>>
>> Correct steps should be like below
>>
>> 1. Set up CSI registers for use case such as number of lanes, virtual
>> channel, etc.
>> 2. Initialize and power up CSI CIL interface
>> 3. Program MIPI CAL bias pads, cal configs, cal control registers and
>> enable calibration start
>> 4. Power up camera through the I2C interface and start sensor streaming
>> through the I2C
>>
>> Note: All sensors might not leave pads in LP-11 state as sensor may be
>> power down when not in use.
>>
>> So start streaming prior to checking for calibration done status as
>> LP-11 -> HS transition happens during sensor stream and calibration
>> logic can apply results to pads and update done status,
>>
>> 5. Wait for done signal from calibration logic
>>
>> 6. perform frame capture thru VI
>> 7. Frame done, CSI goes back to stop state, LP11
>>
>> Will work internally to correct sequence in TRM ...
> Will be nice to have an updated TRM, thank you!
>
> Also, what about the auto-calibration? Isn't it needed to be enabled for
> CSI?
STARTCAL does one time calibration and with AUTOCAL calibration will be=20
triggered periodically.

For pads PULLUP/PULLDN/TERM impedance calibration, we only need one-time=20
calibration on pads power up.

We always use one time pads calibration for CSI.

>
>> In mipi driver will update as below to have mipi clk enabled till
>> calibration status check is done.
>>
>> Always tegra_mipi_wait() followes tegra_mipi_calibrate() in both DSI and
>> CSI. So below sequence should work good.
>>
>> tegra_mipi_calibrate()
>>
>> - clk_enable mipi cal
>> - program mipi cal registers (bias pads cfgs, mipi cal ctrl and trigger
>> calibration start)
>>
>> tegra_mipi_wait()
>> - read mipi cal status and wait for active and done bits
>> - clk_disable mipi cal
>
> Maybe then it should be better to rename the functions like this:
>
> tegra_mipi_calibrate() -> tegra_mipi_start_calibration()
> tegra_mipi_wait()      -> tegra_mipi_finish_calibration().
>
> and there also should be tegra_mipi_cancel_calibration().
>
>
> Example:
>
> 	tegra_mipi_start_calibration();
>
> 	ret =3D v4l2_subdev_call(subdev, video, s_stream, on);
> 	if (ret < 0) {
> 		tegra_mipi_cancel_calibration();
> 		goto err;
> 	}
>
> 	tegra_mipi_finish_calibration();
>
>
