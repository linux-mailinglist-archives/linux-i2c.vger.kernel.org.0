Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10DB5222F11
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 01:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgGPXcu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 19:32:50 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:8511 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbgGPXcn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 19:32:43 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f10d8990000>; Thu, 16 Jul 2020 15:45:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 16 Jul 2020 15:46:44 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 16 Jul 2020 15:46:44 -0700
Received: from [10.2.163.115] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Jul
 2020 22:46:43 +0000
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <ce0c5ffb-f859-0eab-1ea5-044623dff221@nvidia.com>
Date:   Thu, 16 Jul 2020 15:49:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c4945c77-5de1-e9b1-9f4f-cdd78bca18c7@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594939545; bh=DBU7rkpSwcdm/T9Ofc9hoI63/nUNEGD1koFVXFhF+U4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=nFMORG0KBm13wQActfeNEGrE1zTfVIyfLJ//f9isZ71e/0m8pSHRFZfxn4Vch+PrK
         m467l/dCABGM7cypucxeKSO7ihOtmWx2RYRe7ASI+CVwCl89tYZv523OzYt7r+a/Gj
         QEQJ9pQrzdrWWDsMo1MpeBY8uEOrwGKZcACUvLn7z02tudMGWgEtwLcbDFGcxOxron
         CFiXdEhydMgbm3yuCd+qzK66L+0iuMRtQ6UtJWoqiN62PuoBS+T3mnls2EKz39D1Qk
         pXAhGvVOx+t5lirI3vJWIgYvdkLb16b8GqcnX8Mu2SazjFJC+gFicbqDU7WC+jQG0r
         SGZbpO91WJQdA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/16/20 2:18 PM, Dmitry Osipenko wrote:
> 17.07.2020 00:09, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 7/16/20 1:38 PM, Dmitry Osipenko wrote:
>>> 15.07.2020 07:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> SW can trigger MIPI pads calibration any time after power on
>>>> but calibration results will be latched and applied to the pads
>>>> by MIPI CAL unit only when the link is in LP-11 state and then
>>>> status register will be updated.
>>>>
>>>> For CSI, trigger of pads calibration happen during CSI stream
>>>> enable where CSI receiver is kept ready prior to sensor or CSI
>>>> transmitter stream start.
>>>>
>>>> So, pads may not be in LP-11 at this time and waiting for the
>>>> calibration to be done immediate after calibration start will
>>>> result in timeout.
>>>>
>>>> This patch splits tegra_mipi_calibrate() and tegra_mipi_wait()
>>>> so triggering for calibration and waiting for it to complete can
>>>> happen at different stages.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>> ...
>>>>  =C2=A0 int tegra_mipi_calibrate(struct tegra_mipi_device *device)
>>>>  =C2=A0 {
>>>> @@ -370,12 +381,10 @@ int tegra_mipi_calibrate(struct
>>>> tegra_mipi_device *device)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value |=3D MIPI_CAL_CTRL_START;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_mipi_writel(device->mipi, value,=
 MIPI_CAL_CTRL);
>>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 err =3D tegra_mipi_wait(device->mipi);
>>> Doesn't MIPI clock need to be enabled during of the calibration process=
?
>> MIPI clock is already enabled in tegra_mipi_calibrate
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&device->mipi->lock);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_disable(device->mipi->clk);
> What keeps MIPI clock enabled after completion of the
> tegra_mipi_calibrate() invocation?

MIPI clock is disabled at end of tegra_mipi_calibrate and is re-enabled=20
during tegra_mipi_wait.

I think I should fix this to keep the clock enabled till calibration=20
results are latched.

All consumers of tegra_mipi_calibrate() will call tegra_mipi_wait().

So will remove clk_disable mipi clk at end of tegra_mipi_calibrate() and=20
clk_enable mipi_clk at beginning of tegra_mipi_wait()

>
>>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 return err;
>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>  =C2=A0 }
>>>>  =C2=A0 EXPORT_SYMBOL(tegra_mipi_calibrate);
