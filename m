Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3D592312D4
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 21:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732870AbgG1Thb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 15:37:31 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:7219 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729846AbgG1Thb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jul 2020 15:37:31 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f207e6c0003>; Tue, 28 Jul 2020 12:37:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 Jul 2020 12:37:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 Jul 2020 12:37:30 -0700
Received: from [10.2.168.236] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 19:37:29 +0000
Subject: Re: [RFC PATCH v5 13/14] media: tegra-video: Add CSI MIPI pads
 calibration
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
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
 <01ee0805-3d57-d857-48e3-5c2245cd4500@nvidia.com>
Message-ID: <edefa3b1-e0fe-0f34-80b7-8729551ee2ea@nvidia.com>
Date:   Tue, 28 Jul 2020 12:43:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <01ee0805-3d57-d857-48e3-5c2245cd4500@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595965037; bh=IGHiL01+pCfxDUBGk+J+sS1IuAeLkaTPJTReY8Unf3o=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=ZaUisKhK7xpa5/nsUXCO6YY8CpuPQooaZftXiY0f5x1hzdGX8Ydeo5+t9p/YDhmx3
         JBJl8mCZ8+1JWQfHVHNN75IIEt4jT0jwhkymKwxyGKtZKVBRDuHrBI+RuIVPPbDk8r
         HyiYRQuy1BBGZSJfNFDEpz7IU+IPOP6hCczxh1wvGe9hNqDNhHFWKwMzJ+JG4WcLRg
         dC3jOKKxGQEzdhiP/e0PCS9JESowb/eYiqiNv1Pgv4OzBHIOGj8FEnDYxT1HAwpux9
         KECGIYPuccFVjKY5TN367n78kg49ExbTSJbVsQr++FHA1HMZVbsE6i/3RnS95ojadu
         VepW6NSKlefXA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/28/20 8:59 AM, Sowjanya Komatineni wrote:
>
> On 7/28/20 3:30 AM, Dmitry Osipenko wrote:
>> 27.07.2020 23:57, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * TRM has incorrectly documented to wait for =
done status from
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * calibration logic after CSI interface power=
 on.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * As per the design, calibration results are =
latched and applied
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * to the pads only when the link is in LP11 s=
tate which will=20
>>> happen
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * during the sensor stream-on.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * CSI subdev stream-on triggers start of MIPI=
 pads calibration.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Wait for calibration to finish here after s=
ensor subdev=20
>>> stream-on
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * and in case of sensor stream-on failure, ca=
ncel the=20
>>> calibration.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 subdev =3D on ? src_subdev : csi_subdev;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D v4l2_subdev_call(subdev, video, =
s_stream, on);
>>> -=C2=A0=C2=A0=C2=A0 if (ret < 0 && ret !=3D -ENOIOCTLCMD)
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0 && ret !=3D -ENOIOCTLCMD) {
>> I assume -ENOIOCTLCMD means that camera wasn't turned ON, so why
>> -ENOIOCTLCMD is special?
> No -ENOIOCTLCMD mean subdev don't have s_stream ops
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (on && csi_chan->mipi)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 teg=
ra_mipi_cancel_calibration(csi_chan->mipi);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (on && csi_chan->mipi) {
>> Does finish_calibration() really need to be called for ret=3D-ENOIOCTLCM=
D?
>>
>> Shouldn't it be cancel_calibration( for the -ENOIOCTLCMD?
>
> start calibration happens during csi sensor streaming which happens=20
> prior to this point.
>
> In case if sensor subdev does not have s_stream ops, then either=20
> finish/cancel calibration should happen to disable the clock.

For -ENOIOCTLCMD, calling finish calibration as some sensors might keep=20
pads in LP-11 on power up and for such sensors calibration logic will=20
apply results to pads and done bit will be set.

Also avoiding additional check to specifically call cancel calibration=20
on ENOIOCTLCMD and making it fall into finish calibration as both does=20
disable clock except finish will wait for done bit to be set.

Also, most sensor subdev have s_stream ops implemented.

>
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D tegra_mipi_finish_c=
alibration(csi_chan->mipi);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev=
_err(csi_chan->csi->dev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "MIPI calibration failed: %d\n", ret);
>> Doesn't v4l2_subdev_call(OFF) need to be invoked here on error?
>
> Not required as on error streaming fails and runtime PM will turn off=20
> power anyway.
>
> Also we only did csi subdev s_stream on and during sensor subdev=20
> s_stream on fail, actual stream dont happen and on tegra side frame=20
> capture by HW happens only when kthreads run.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 }
