Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65F77222D67
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 23:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgGPVGt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 17:06:49 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:7866 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgGPVGt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 17:06:49 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f10c0f50001>; Thu, 16 Jul 2020 14:04:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 16 Jul 2020 14:06:48 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 16 Jul 2020 14:06:48 -0700
Received: from [10.2.163.115] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Jul
 2020 21:06:47 +0000
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <20d63eca-4b2b-584e-a391-a4fb64a16b40@nvidia.com>
Date:   Thu, 16 Jul 2020 14:09:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a06dec8f-7042-767b-545b-048685a7683d@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594933493; bh=AAPKxFt5fJIy4hDie/eGSzrLnjZIrg6aRoQ5thNyQYU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=kVzg0pWyX5OuICnQ5i0v2jjaCwYzNimLG+F4rqniMJ19yEuJgPgqyTGjlxd//NJd0
         Pq5/w/MKPPOTtV6/Q8pBJQaTNqatoo/GoLCVsFogFnPAtTGdbPOXcfrZsMGb9iHP48
         PvmwB0OJYOY/3C556SnrZQQjW3bdMvSatIkh85iB1PVMMugyd0AIaa7HrM9FaJruzA
         HT8qpsjRSUHk6iRmlwb1hsRz5wkBka0+qQaqTkKsS8aZ3doKKUH2XvfXk9FlfMgvLK
         bglAXpUQljIfxx5cJsJzEeBfk1AtDFvA/60wK59fTSinGwomhxdv6MN+2Sjl1RiDRC
         P2st65XYUZJjg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/16/20 1:38 PM, Dmitry Osipenko wrote:
> 15.07.2020 07:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> SW can trigger MIPI pads calibration any time after power on
>> but calibration results will be latched and applied to the pads
>> by MIPI CAL unit only when the link is in LP-11 state and then
>> status register will be updated.
>>
>> For CSI, trigger of pads calibration happen during CSI stream
>> enable where CSI receiver is kept ready prior to sensor or CSI
>> transmitter stream start.
>>
>> So, pads may not be in LP-11 at this time and waiting for the
>> calibration to be done immediate after calibration start will
>> result in timeout.
>>
>> This patch splits tegra_mipi_calibrate() and tegra_mipi_wait()
>> so triggering for calibration and waiting for it to complete can
>> happen at different stages.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
> ...
>>   int tegra_mipi_calibrate(struct tegra_mipi_device *device)
>>   {
>> @@ -370,12 +381,10 @@ int tegra_mipi_calibrate(struct tegra_mipi_device =
*device)
>>   	value |=3D MIPI_CAL_CTRL_START;
>>   	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
>>  =20
>> -	err =3D tegra_mipi_wait(device->mipi);
> Doesn't MIPI clock need to be enabled during of the calibration process?
MIPI clock is already enabled in tegra_mipi_calibrate
>
>>   	mutex_unlock(&device->mipi->lock);
>>   	clk_disable(device->mipi->clk);
>>  =20
>> -	return err;
>> +	return 0;
>>   }
>>   EXPORT_SYMBOL(tegra_mipi_calibrate);
