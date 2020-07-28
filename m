Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83DF0230E74
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 17:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731131AbgG1Pxb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 11:53:31 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:8930 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730977AbgG1Pxa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jul 2020 11:53:30 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2049cc0002>; Tue, 28 Jul 2020 08:52:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 Jul 2020 08:53:29 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 Jul 2020 08:53:29 -0700
Received: from [10.2.168.236] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 15:53:28 +0000
Subject: Re: [RFC PATCH v5 13/14] media: tegra-video: Add CSI MIPI pads
 calibration
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
 <1595883452-17343-14-git-send-email-skomatineni@nvidia.com>
 <c3d40261-9d77-3634-3e04-f20efad9d3d8@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <01ee0805-3d57-d857-48e3-5c2245cd4500@nvidia.com>
Date:   Tue, 28 Jul 2020 08:59:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c3d40261-9d77-3634-3e04-f20efad9d3d8@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595951565; bh=dy2t0B7LwKbfdaFYXF9gxiIzVP9k/n0JG2Pdshzxfes=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=eZPa3gzaXoQU4D7PkllVd2p9CmxuA/FKrg1jRf7Knrp7YRV86s5NP0dkkCMJ7C757
         wZ/OJWjnDR6YGapN9QehD7fdOBHdzS72Ov+r6TgLgNseQiYGeKvAsx0KziEGCuwXry
         T/k+91RfZod8SF63NW4bYGIDiYf4DxdcxTqjMMhPDZwIi00MveDBSF45RmEZXwrLJX
         AeoK4SbSjXG4AvTK+xhhxTj+4AnXpDO+QkRukuY6NtnhEuAK1DVnV3ApMWRQ7atiA+
         Ktc8kLgWZSJJ9cRg5vvSdBBz3D/qlmi2v384yHePcBa47rLbSRsSmCOD/rYRUbDzZc
         3YEQ566fNk3rw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/28/20 3:30 AM, Dmitry Osipenko wrote:
> 27.07.2020 23:57, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> +	/*
>> +	 * TRM has incorrectly documented to wait for done status from
>> +	 * calibration logic after CSI interface power on.
>> +	 * As per the design, calibration results are latched and applied
>> +	 * to the pads only when the link is in LP11 state which will happen
>> +	 * during the sensor stream-on.
>> +	 * CSI subdev stream-on triggers start of MIPI pads calibration.
>> +	 * Wait for calibration to finish here after sensor subdev stream-on
>> +	 * and in case of sensor stream-on failure, cancel the calibration.
>> +	 */
>>   	subdev =3D on ? src_subdev : csi_subdev;
>>   	ret =3D v4l2_subdev_call(subdev, video, s_stream, on);
>> -	if (ret < 0 && ret !=3D -ENOIOCTLCMD)
>> +	if (ret < 0 && ret !=3D -ENOIOCTLCMD) {
> I assume -ENOIOCTLCMD means that camera wasn't turned ON, so why
> -ENOIOCTLCMD is special?
No -ENOIOCTLCMD mean subdev don't have s_stream ops
>
>> +		if (on && csi_chan->mipi)
>> +			tegra_mipi_cancel_calibration(csi_chan->mipi);
>>   		return ret;
>> +	}
>> +
>> +	if (on && csi_chan->mipi) {
> Does finish_calibration() really need to be called for ret=3D-ENOIOCTLCMD=
?
>
> Shouldn't it be cancel_calibration( for the -ENOIOCTLCMD?

start calibration happens during csi sensor streaming which happens=20
prior to this point.

In case if sensor subdev does not have s_stream ops, then either=20
finish/cancel calibration should happen to disable the clock.

>
>> +		ret =3D tegra_mipi_finish_calibration(csi_chan->mipi);
>> +		if (ret < 0)
>> +			dev_err(csi_chan->csi->dev,
>> +				"MIPI calibration failed: %d\n", ret);
> Doesn't v4l2_subdev_call(OFF) need to be invoked here on error?

Not required as on error streaming fails and runtime PM will turn off=20
power anyway.

Also we only did csi subdev s_stream on and during sensor subdev=20
s_stream on fail, actual stream dont happen and on tegra side frame=20
capture by HW happens only when kthreads run.
>> +		return ret;
>> +	}
>>  =20
>>   	return 0;
>>   }
