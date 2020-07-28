Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E53D2230E95
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 17:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730968AbgG1P6Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 11:58:16 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:7919 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730679AbgG1P6Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jul 2020 11:58:16 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f204abc0000>; Tue, 28 Jul 2020 08:56:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 Jul 2020 08:58:15 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 Jul 2020 08:58:15 -0700
Received: from [10.2.168.236] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 15:58:14 +0000
Subject: Re: [RFC PATCH v5 12/14] gpu: host1x: mipi: Keep MIPI clock enabled
 till calibration is done
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
 <1595883452-17343-13-git-send-email-skomatineni@nvidia.com>
 <b21e3227-d0d8-5b4a-ae69-aa29551a22c3@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <69903c67-8e5f-11c2-45ec-c76b97634aba@nvidia.com>
Date:   Tue, 28 Jul 2020 09:04:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b21e3227-d0d8-5b4a-ae69-aa29551a22c3@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595951804; bh=E9qcfOyB0qnDCOefOIeVTiKpwMclMLjRTPcAat91+Sc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=dE7J+3XfJ4cU+YTt6Cn8RnnadhwlC+HXdoGiaiDQbr6vbHSk7yyen9Slpi3VpIBWw
         4DG/o/HGEmkDEbCikU7kWE9As3Sge+6aCV6tx0mtEFc5hcjPX3m5FdtqXjqq9QzunQ
         /PZwjV3ZBqVnIYvZy8rfvXbNCAA0dyiUtzwQo6enoA6wJMBvXMzc0c7hQEWD5JR56M
         oaqxc4TEvWW8lHritYGCk/NZ35HE8twWuTgg1tz6aSwrXU+6FqXkWcgDBlv2i/9N4d
         zVW0doE8JwFSATCjG9xaA04SGjaTv/R/veXHj/S+/2cPkUsT13/W80JYg4squz/DTJ
         F8IaQ/nnYzb0Q==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/28/20 4:03 AM, Dmitry Osipenko wrote:
> 27.07.2020 23:57, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> With the split of MIPI calibration into tegra_mipi_calibrate() and
>> tegra_mipi_wait(), MIPI clock is not kept enabled till the calibration
>> is done.
>>
>> So, this patch skips disabling MIPI clock after triggering start of
>> calibration and disables it only after waiting for done status from
>> the calibration logic.
>>
>> This patch renames tegra_mipi_calibrate() as tegra_mipi_start_calibratio=
n()
>> and tegra_mipi_wait() as tegra_mipi_finish_calibration() to be inline
>> with their usage.
>>
>> As MIPI clock is left enabled and in case of any failures with CSI input
>> streaming tegra_mipi_finish_calibration() will not get invoked.
>> So added new API tegra_mipi_cancel_calibration() which disables MIPI clo=
ck
>> and consumer drivers can call this in such cases.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/gpu/drm/tegra/dsi.c |  4 ++--
>>   drivers/gpu/host1x/mipi.c   | 19 ++++++++++---------
>>   include/linux/host1x.h      |  5 +++--
>>   3 files changed, 15 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
>> index 3820e8d..a7864e9 100644
>> --- a/drivers/gpu/drm/tegra/dsi.c
>> +++ b/drivers/gpu/drm/tegra/dsi.c
>> @@ -694,11 +694,11 @@ static int tegra_dsi_pad_calibrate(struct tegra_ds=
i *dsi)
>>   		DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
>>   	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
>>  =20
>> -	err =3D tegra_mipi_calibrate(dsi->mipi);
>> +	err =3D tegra_mipi_start_calibration(dsi->mipi);
>>   	if (err < 0)
>>   		return err;
>>  =20
>> -	return tegra_mipi_wait(dsi->mipi);
>> +	return tegra_mipi_finish_calibration(dsi->mipi);
>>   }
>>  =20
>>   static void tegra_dsi_set_timeout(struct tegra_dsi *dsi, unsigned long=
 bclk,
>> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
>> index e606464..b15ab6e 100644
>> --- a/drivers/gpu/host1x/mipi.c
>> +++ b/drivers/gpu/host1x/mipi.c
>> @@ -293,17 +293,19 @@ int tegra_mipi_disable(struct tegra_mipi_device *d=
ev)
>>   }
>>   EXPORT_SYMBOL(tegra_mipi_disable);
>>  =20
>> -int tegra_mipi_wait(struct tegra_mipi_device *device)
>> +void tegra_mipi_cancel_calibration(struct tegra_mipi_device *device)
>> +{
> Doesn't MIPI_CAL need to be reset here?
No need to reset MIPI CAL
>
>> +	clk_disable(device->mipi->clk);
>> +}
>> +EXPORT_SYMBOL(tegra_mipi_cancel_calibration);
>> +
>> +int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
>>   {
>>   	struct tegra_mipi *mipi =3D device->mipi;
>>   	void __iomem *status_reg =3D mipi->regs + (MIPI_CAL_STATUS << 2);
>>   	u32 value;
>>   	int err;
>>  =20
>> -	err =3D clk_enable(device->mipi->clk);
>> -	if (err < 0)
>> -		return err;
>> -
>>   	mutex_lock(&device->mipi->lock);
>>  =20
>>   	err =3D readl_relaxed_poll_timeout(status_reg, value,
>> @@ -315,9 +317,9 @@ int tegra_mipi_wait(struct tegra_mipi_device *device=
)
>>  =20
>>   	return err;
>>   }
>> -EXPORT_SYMBOL(tegra_mipi_wait);
>> +EXPORT_SYMBOL(tegra_mipi_finish_calibration);
>>  =20
>> -int tegra_mipi_calibrate(struct tegra_mipi_device *device)
>> +int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
>>   {
>>   	const struct tegra_mipi_soc *soc =3D device->mipi->soc;
>>   	unsigned int i;
>> @@ -382,11 +384,10 @@ int tegra_mipi_calibrate(struct tegra_mipi_device =
*device)
>>   	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
> This function sets MIPI_CAL_CLKEN_OVR bit, does it mean that MIPI clock
> becomes always-ON?
>
> I don't see where MIPI_CAL_CLKEN_OVR is unset.

CLKEN_OVR was always kept enabled in the driver prior to my patch and I=20
was not touching that.

But as we are turning ON/OFF MIPI clock itself no need to unset CLKEN_OVR

>
>>   	mutex_unlock(&device->mipi->lock);
>> -	clk_disable(device->mipi->clk);
>>  =20
>>   	return 0;
>>   }
>> -EXPORT_SYMBOL(tegra_mipi_calibrate);
>> +EXPORT_SYMBOL(tegra_mipi_start_calibration);
>>  =20
>>   static const struct tegra_mipi_pad tegra114_mipi_pads[] =3D {
>>   	{ .data =3D MIPI_CAL_CONFIG_CSIA },
>> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
>> index 20c885d..b490dda 100644
>> --- a/include/linux/host1x.h
>> +++ b/include/linux/host1x.h
>> @@ -333,7 +333,8 @@ struct tegra_mipi_device *tegra_mipi_request(struct =
device *device,
>>   void tegra_mipi_free(struct tegra_mipi_device *device);
>>   int tegra_mipi_enable(struct tegra_mipi_device *device);
>>   int tegra_mipi_disable(struct tegra_mipi_device *device);
>> -int tegra_mipi_calibrate(struct tegra_mipi_device *device);
>> -int tegra_mipi_wait(struct tegra_mipi_device *device);
>> +int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
>> +int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
>> +void tegra_mipi_cancel_calibration(struct tegra_mipi_device *device);
>>  =20
>>   #endif
>>
