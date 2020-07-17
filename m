Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A80224276
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 19:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgGQRoz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 13:44:55 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:19537 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgGQRoy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jul 2020 13:44:54 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f11e3890002>; Fri, 17 Jul 2020 10:44:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 17 Jul 2020 10:44:53 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 17 Jul 2020 10:44:53 -0700
Received: from [10.2.163.115] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jul
 2020 17:44:53 +0000
Subject: Re: [RFC PATCH v3 00/18] Support for Tegra video capture from
 external sensor
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <sakari.ailus@iki.fi>,
        <robh+dt@kernel.org>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
 <f03bdb89-df7c-e9e8-1512-d57e5d2332bf@xs4all.nl>
 <d258fb56-14f6-a091-64e9-48294073c696@nvidia.com>
 <458db01d-3c9c-1aec-0d28-edcbf0265aa4@xs4all.nl>
 <5694f74a-be8e-7a95-1739-0a5fc9820597@nvidia.com>
 <9aa8be89-d181-2dca-36ca-ea118bd5b0a7@nvidia.com>
Message-ID: <2f9ecba7-3d05-8a68-f2ad-546470780642@nvidia.com>
Date:   Fri, 17 Jul 2020 10:48:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9aa8be89-d181-2dca-36ca-ea118bd5b0a7@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595007881; bh=n6QrGmC9D7cNE9122ABAT4aFauanMqDEWEJPqyLjKu4=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=sUZRCsmLLvZPYWBQGw2ncBUO2lLhMJlz8rSszyC25d054zYlTwsyhP27eHqcRyfYF
         +3FyKDKt2iQMigW9Y/H1qZGLjJFFiFWj80cGMfpa6tso2Xp40YpIv2vuCzHPlndRnp
         90CHozDSvF6vD5DTCf6C97sqf9dygW2OQaDPhyliSQGlFpwrgiGPVuoM5EOsk9tYsL
         DvMjL07bd5oR6jgpn+4a9ale3Icix+TP1JrDlHs1P/xR1NdIHdv1yfhcAJzmbJR63g
         wiFUsIoINtQfQhFKjkMgg6ZreFU2Se3UFdGsIjjO2MPpLtiBqa5CDU50nmoHGxZR8v
         dqSsmm7Bciffg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/17/20 10:38 AM, Sowjanya Komatineni wrote:
>
> On 7/17/20 10:23 AM, Sowjanya Komatineni wrote:
>>
>> On 7/17/20 10:08 AM, Hans Verkuil wrote:
>>> On 17/07/2020 18:34, Sowjanya Komatineni wrote:
>>>> On 7/17/20 3:54 AM, Hans Verkuil wrote:
>>>>> Hi Sowjanya,
>>>>>
>>>>> On 15/07/2020 06:20, Sowjanya Komatineni wrote:
>>>>>> This series adds support for video capture from external camera=20
>>>>>> sensor to
>>>>>> Tegra video driver.
>>>>>>
>>>>>> Jetson TX1 has camera expansion connector and supports custom=20
>>>>>> camera module
>>>>>> designed as per TX1 design specification.
>>>>>>
>>>>>> This series also enables camera capture support for Jetson Nano=20
>>>>>> which has
>>>>>> Raspberry PI camera header.
>>>>>>
>>>>>> This series is tested with IMX219 camera sensor.
>>>>>>
>>>>>> This series include,
>>>>>>
>>>>>> VI I2C related fixes
>>>>>> - Camera sensor programming happens through VI I2C which is on=20
>>>>>> host1x bus.
>>>>>> - These patches includes device tree and I2C driver fixes for VI=20
>>>>>> I2C.
>>>>>>
>>>>>> Tegra video driver updates
>>>>>> - TPG Vs Non-TPG based on Kconfig
>>>>>> - Support for external sensor video capture based on device graph=20
>>>>>> from DT.
>>>>>> - Support for selection ioctl operations
>>>>>> - Tegra MIPI CSI pads calibration
>>>>>> - CSI T-CLK and T-HS settle time computation based on clock rates.
>>>>>>
>>>>>> Host1x driver updates
>>>>>> - Adds API to allow creating mipi device for specific device node.
>>>>>> - Splits MIPI pads calibrate start and waiting for calibration to=20
>>>>>> be done.
>>>>>>
>>>>>> Device tree updates
>>>>>> - Adds camera connector 2V8, 1V8, 1V2 regulator supplies to=20
>>>>>> Jetson TX1 DT.
>>>>>> - Enabled VI and CSI support in Jetson Nano DT.
>>>>> I'm doing a bit of stress testing with:
>>>>>
>>>>> while true; do v4l2-ctl --stream-mmap --stream-count=3D1; done
>>>>>
>>>>> and I see that the imx274 has often streaming failures:
>>>>>
>>>>> [=C2=A0 172.025144] IMX274 8-001a: s_stream failed
>>>>> [=C2=A0 179.025192] IMX274 8-001a: imx274_write_mbreg : i2c bulk writ=
e=20
>>>>> failed, 3132 =3D 870 (2 bytes)
>>>>> [=C2=A0 179.033575] IMX274 8-001a: s_stream failed
>>>>> [=C2=A0 226.525378] IMX274 8-001a: imx274_write_mbreg : i2c bulk writ=
e=20
>>>>> failed, 3130 =3D 878 (2 bytes)
>>>>> [=C2=A0 226.533761] IMX274 8-001a: s_stream failed
>>>>> [=C2=A0 227.029325] IMX274 8-001a: imx274_write_mbreg : i2c bulk writ=
e=20
>>>>> failed, 30f6 =3D 107 (2 bytes)
>>>>> [=C2=A0 227.037758] IMX274 8-001a: s_stream failed
>>>>> [=C2=A0 247.025218] IMX274 8-001a: imx274_write_mbreg : i2c bulk writ=
e=20
>>>>> failed, 30f6 =3D 107 (2 bytes)
>>>>> [=C2=A0 247.033658] IMX274 8-001a: s_stream failed
>>>>> [=C2=A0 293.025517] IMX274 8-001a: s_stream failed
>>>>> [=C2=A0 309.024727] IMX274 8-001a: imx274_write_mbreg : i2c bulk writ=
e=20
>>>>> failed, 30e0 =3D 0 (2 bytes)
>>>>> [=C2=A0 309.032969] IMX274 8-001a: s_stream failed
>>>>> [=C2=A0 309.529506] IMX274 8-001a: imx274_write_mbreg : i2c bulk writ=
e=20
>>>>> failed, 30f8 =3D 11d2 (3 bytes)
>>>>> [=C2=A0 309.538103] IMX274 8-001a: imx274_set_frame_length error =3D =
-121
>>>>> [=C2=A0 309.544102] IMX274 8-001a: imx274_set_frame_interval error =
=3D -121
>>>>> [=C2=A0 309.550243] IMX274 8-001a: s_stream failed
>>>>> [=C2=A0 314.025561] IMX274 8-001a: s_stream failed
>>>>> [=C2=A0 329.025586] IMX274 8-001a: s_stream failed
>>>>> [=C2=A0 340.529567] IMX274 8-001a: imx274_write_mbreg : i2c bulk writ=
e=20
>>>>> failed, 303a =3D f0c (2 bytes)
>>>>> [=C2=A0 340.538009] IMX274 8-001a: s_stream failed
>>>>> [=C2=A0 347.525627] IMX274 8-001a: imx274_write_mbreg : i2c bulk writ=
e=20
>>>>> failed, 30f6 =3D 107 (2 bytes)
>>>>> [=C2=A0 347.534008] IMX274 8-001a: s_stream failed
>>>>> [=C2=A0 365.033640] IMX274 8-001a: s_stream failed
>>>>> [=C2=A0 437.525788] IMX274 8-001a: imx274_write_mbreg : i2c bulk writ=
e=20
>>>>> failed, 3038 =3D c (2 bytes)
>>>>> [=C2=A0 437.533997] IMX274 8-001a: s_stream failed
>>>>> [=C2=A0 456.029780] IMX274 8-001a: s_stream failed
>>>>> [=C2=A0 472.025862] IMX274 8-001a: s_stream failed
>>>>> [=C2=A0 498.025861] IMX274 8-001a: s_stream failed
>>>>> [=C2=A0 500.025905] IMX274 8-001a: s_stream failed
>>>>>
>>>>> where v4l2-ctl returns:
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VIDIOC_STREAMON returned -1 (Remote I/O e=
rror)
>>>>>
>>>>> I don't see this with the imx219.
>>>>>
>>>>> I also see this occasionally:
>>>>>
>>>>> [Fri Jul 17 12:51:42 2020] video4linux video1: failed to run=20
>>>>> capture start kthread: -4
>>>>>
>>>>> Something is not stable here.
>>>>>
>>>>> Regards,
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0Hans
>>>> Hi Hans,
>>>>
>>>> Running the same single frame continuous loop for more than 2 hours=20
>>>> now
>>>> and I don't see any failure.
>>>>
>>>> Above failure shows i2c bulk writes to IMX274 failure due to which
>>>> s_stream also failed.
>>>>
>>>> Not sure if its due to i2c mux in the path to sensor on your module
>>>> causing some issue when there is more i2c write traffic as we are=20
>>>> doing
>>>> single stream in continuous loop. Also IMX219 does not show on your=20
>>>> side
>>>> so something specific to IMX274 setup probably.
>>> I'll take a closer look next week. Good to know that it works fine=20
>>> for you.
>>>
>>>>
>>>> Regarding kthread_run failure where kthread_run() returned -EINTR=20
>>>> during
>>>> capture start thread, I always see this happen at the point of=20
>>>> stopping
>>>> the continuous single stream while loop by pressing ctrl+c after few
>>>> loops of execution.
>>> Hmm, if this is normal behavior, then should this message be a debug=20
>>> message
>>> only? Or perhaps only show the message if the error code !=3D EINTR.
>>
>> I believe its good to still show this as its reported by kthread_run=20
>> -> kthread_create_on_node.
>>
>> But not sure in real usecase we will ever use while true like this=20
>> and we should use script to also break while loop along with v4l2-ctl=20
>> termination when ctrl-c terminate request happens.
>>
> Hi Hans, As this happens only during this type of case, I can update=20
> to show message only when error code !=3D EINTR.
>
> Thanks
>
> Sowjanya


Sorry, Was thinking to not mask debug message for -EINTR in case if it=20
happens in any other valid scenarios. If you still want to mask, will=20
update in next version.

>
>>
>>>
>>> Regards,
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0Hans
>>>
>>>> while true; do v4l2-ctl --stream-mmap --stream-count=3D1; done
>>>>
>>>> when we stop loop with ctrl+c, v4l2-ctl terminates but loop does not
>>>> terminate immediately and probably SIGKILLed=C2=A0 is seen prior to=20
>>>> complete.
>>>>
>>>> Using below can help to terminate loop as well when we stop ctrl-c and
>>>> with this I don't see any repro of EINTR error from kthread_run=20
>>>> when run
>>>> in infinite loop.
>>>>
>>>> while true; do ./v4l2-ctl --stream-mmap --stream-count=3D1 || break;=20
>>>> done
>>>>
>>>>
>>>>
>>>>>> Delta between patch versions:
>>>>>>
>>>>>> [v3]:=C2=A0=C2=A0=C2=A0 Includes v2 feedback
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0- Uses separate helper function for retrievi=
ng remote csi=20
>>>>>> subdevice
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and source subdevice.
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0- Added check for presence of subdevice ops =
set/get_selection
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0- dropped vb2_queue_release from driver and =
using
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vb2_video_unregister_device instead o=
f=20
>>>>>> video_unregister_device.
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0- video device register should happen in the=
 last after all=20
>>>>>> video
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device related setup is done in the d=
river. This is being=20
>>>>>> addressed
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in below RFC patch. Once proper imple=
mentation of this is=20
>>>>>> available
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 will update Tegra video driver to use=
 split APIs and do all=20
>>>>>> setup
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prior to device register. Added this =
as TODO in the driver.
>>>>>> https://www.spinics.net/lists/linux-media/msg172761.html
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0Note:
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0Patch-0012 has compilation dependency on
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0https://patchwork.kernel.org/patch/11659521/
>>>>>>
>>>>>>
>>>>>> [v2]:=C2=A0=C2=A0=C2=A0 Includes below changes based on v1 feedback
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0- dt-binding document and the driver update =
for device graph=20
>>>>>> to use
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 separate ports for sink endpoint and =
source endpoint for csi.
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0- Use data-lanes endpoint property for csi.
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0- Update tegra_mipi_request() to take device=
 node pointer=20
>>>>>> argument
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rather than adding extra API.
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0- Remove checking for clk pointer before clk=
_disable.
>>>>>>
>>>>>>
>>>>>> Sowjanya Komatineni (18):
>>>>>> =C2=A0=C2=A0=C2=A0 dt-bindings: i2c: tegra: Document Tegra210 VI I2C=
 clocks and
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power-domains
>>>>>> =C2=A0=C2=A0=C2=A0 arm64: tegra: Add missing clocks and power-domain=
s to=20
>>>>>> Tegra210 VI I2C
>>>>>> =C2=A0=C2=A0=C2=A0 i2c: tegra: Don't mark VI I2C as IRQ safe runtime=
 PM
>>>>>> =C2=A0=C2=A0=C2=A0 i2c: tegra: Remove NULL pointer check before
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_enable/disable/prepare/unprepare
>>>>>> =C2=A0=C2=A0=C2=A0 i2c: tegra: Fix the error path in tegra_i2c_runti=
me_resume
>>>>>> =C2=A0=C2=A0=C2=A0 i2c: tegra: Fix runtime resume to re-init VI I2C
>>>>>> =C2=A0=C2=A0=C2=A0 i2c: tegra: Avoid tegra_i2c_init_dma() for Tegra2=
10 vi i2c
>>>>>> =C2=A0=C2=A0=C2=A0 media: tegra-video: Fix channel format alignment
>>>>>> =C2=A0=C2=A0=C2=A0 media: tegra-video: Enable TPG based on kernel co=
nfig
>>>>>> =C2=A0=C2=A0=C2=A0 media: tegra-video: Update format lookup to offse=
t based
>>>>>> =C2=A0=C2=A0=C2=A0 dt-bindings: tegra: Update VI and CSI bindings wi=
th port info
>>>>>> =C2=A0=C2=A0=C2=A0 media: tegra-video: Add support for external sens=
or capture
>>>>>> =C2=A0=C2=A0=C2=A0 media: tegra-video: Add support for selection ioc=
tl ops
>>>>>> =C2=A0=C2=A0=C2=A0 gpu: host1x: mipi: Update tegra_mipi_request() to=
 be node based
>>>>>> =C2=A0=C2=A0=C2=A0 gpu: host1x: mipi: Use readl_relaxed_poll_timeout=
 in=20
>>>>>> tegra_mipi_wait
>>>>>> =C2=A0=C2=A0=C2=A0 gpu: host1x: mipi: Split tegra_mipi_calibrate and=
=20
>>>>>> tegra_mipi_wait
>>>>>> =C2=A0=C2=A0=C2=A0 media: tegra-video: Add CSI MIPI pads calibration
>>>>>> =C2=A0=C2=A0=C2=A0 media: tegra-video: Compute settle times based on=
 the clock rate
>>>>>>
>>>>>> =C2=A0=C2=A0 .../display/tegra/nvidia,tegra20-host1x.txt=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 92 ++-
>>>>>> =C2=A0=C2=A0 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt | 19=
 +-
>>>>>> =C2=A0=C2=A0 arch/arm64/boot/dts/nvidia/tegra210.dtsi=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 +
>>>>>> =C2=A0=C2=A0 drivers/gpu/drm/tegra/dsi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9 +-
>>>>>> =C2=A0=C2=A0 drivers/gpu/host1x/mipi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37 +-
>>>>>> =C2=A0=C2=A0 drivers/i2c/busses/i2c-tegra.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 101 +--
>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra-video/Kconfig=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7 +
>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra-video/csi.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 247 ++++++-
>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra-video/csi.h=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 8 +
>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra-video/tegra210.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 25 +-
>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra-video/vi.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 793=20
>>>>>> +++++++++++++++++++--
>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra-video/vi.h=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 25 +-
>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra-video/video.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 23 +-
>>>>>> =C2=A0=C2=A0 include/linux/host1x.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 +-
>>>>>> =C2=A0=C2=A0 14 files changed, 1242 insertions(+), 154 deletions(-)
>>>>>>
