Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 441232348A1
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jul 2020 17:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbgGaPqi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jul 2020 11:46:38 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:17452 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbgGaPqi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Jul 2020 11:46:38 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f243cd00000>; Fri, 31 Jul 2020 08:46:25 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 31 Jul 2020 08:46:38 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 31 Jul 2020 08:46:38 -0700
Received: from [10.2.167.221] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul
 2020 15:46:37 +0000
Subject: Re: [RFC PATCH v6 09/10] media: tegra-video: Add CSI MIPI pads
 calibration
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <1596186169-18729-1-git-send-email-skomatineni@nvidia.com>
 <1596186169-18729-10-git-send-email-skomatineni@nvidia.com>
 <3ac158c4-7df7-e3c1-f0e1-33e7ef017762@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <f483329d-b5fe-fda5-e235-b8edb5fce440@nvidia.com>
Date:   Fri, 31 Jul 2020 08:46:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3ac158c4-7df7-e3c1-f0e1-33e7ef017762@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596210385; bh=LT7Rum+TVQ8i+yg00HUXL4JpRxYnF2QyXbgXIWuPmeU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=lFNkPzZP4nsuT2DXNN2EEOT0x95rCZEZVWQhkkOPFwtAjVPdHvlgRLpjZkE6WQ2bm
         2008IJ0xIH2P1z1nNG/29TvpGL5sAhfjtMcaeE3QP+NlNHhF6Bwy7Xay7VbiyRSuMb
         unl5Wlgq6K7JaLQJGIj0hyL6Yin09OycAu/1Bxw5j6G8RbL9nyqQ5TYyjP6TGQiOX9
         Qs+wtOhLYsATerUT9trZ76xuTL+DweM+PsDpdHdbM5h4ksTQ2HrtOE1yr61fm+HOXU
         IKQN0jjnGNDOSEreOeoo93WFnk7EWwj7Z0eKLg4P3EZGcBajuDTDZC61MMbvWgFGx1
         aTt+jHx0VNctg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/31/20 4:39 AM, Dmitry Osipenko wrote:
> 31.07.2020 12:02, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> @@ -249,13 +249,47 @@ static int tegra_csi_enable_stream(struct v4l2_sub=
dev *subdev)
>>   		return ret;
>>   	}
>>  =20
>> +	if (csi_chan->mipi) {
>> +		ret =3D tegra_mipi_enable(csi_chan->mipi);
>> +		if (ret < 0) {
>> +			dev_err(csi->dev,
>> +				"failed to enable MIPI pads: %d\n", ret);
>> +			goto rpm_put;
>> +		}
>> +
>> +		/*
>> +		 * CSI MIPI pads PULLUP, PULLDN and TERM impedances need to
>> +		 * be calibrated after power on.
>> +		 * So, trigger the calibration start here and results will
>> +		 * be latched and applied to the pads when link is in LP11
>> +		 * state during start of sensor streaming.
>> +		 */
>> +		ret =3D tegra_mipi_start_calibration(csi_chan->mipi);
>> +		if (ret < 0) {
>> +			dev_err(csi->dev,
>> +				"failed to start MIPI calibration: %d\n", ret);
>> +			goto disable_mipi;
>> +		}
> What would happen if CSI stream is enabled and then immediately disabled
> without enabling camera sensor?

Nothing will happen as during stream enable csi receiver is kept ready.

But actual capture will not happen during that point.

>
>> +	}
>> +
> ...
>>   static int tegra_channel_enable_stream(struct tegra_vi_channel *chan)
>>   {
>>   	struct v4l2_subdev *csi_subdev, *src_subdev;
>> +	struct tegra_csi_channel *csi_chan;
>>   	int ret;
>>  =20
>>   	/*
>> @@ -206,13 +207,30 @@ static int tegra_channel_enable_stream(struct tegr=
a_vi_channel *chan)
>>   	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
>>   		return 0;
>>  =20
>> +	csi_chan =3D v4l2_get_subdevdata(csi_subdev);
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
>>   	src_subdev =3D tegra_channel_get_remote_source_subdev(chan);
> Is it possible to move the start_calibration() here?

I think we can do start here as well I guess but currently I am=20
following steps order as per design document.

This is the reason I have updated in above comment as well.

>
>>   	ret =3D v4l2_subdev_call(src_subdev, video, s_stream, true);
>>   	if (ret < 0 && ret !=3D -ENOIOCTLCMD) {
>> +		tegra_mipi_cancel_calibration(csi_chan->mipi);
>>   		v4l2_subdev_call(csi_subdev, video, s_stream, false);
>>   		return ret;
>>   	}
>>  =20
>> +	ret =3D tegra_mipi_finish_calibration(csi_chan->mipi);
>> +	if (ret < 0)
>> +		dev_warn(csi_chan->csi->dev,
>> +			 "MIPI calibration failed: %d\n", ret);
>> +
>>   	return 0;
>>   }
>>  =20
>>
