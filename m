Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F4D2328A8
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jul 2020 02:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgG3AUC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jul 2020 20:20:02 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2464 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbgG3AUC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jul 2020 20:20:02 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2212040003>; Wed, 29 Jul 2020 17:19:16 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 29 Jul 2020 17:20:02 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 29 Jul 2020 17:20:02 -0700
Received: from [10.2.160.194] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jul
 2020 00:20:01 +0000
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
 <2ec535c9-55e8-8834-6002-36c75aeb097c@gmail.com>
 <021707b9-5f72-6f8b-d125-43627ef64a6d@nvidia.com>
Message-ID: <de2d6117-b1e5-14c0-52ca-ff46b444c866@nvidia.com>
Date:   Wed, 29 Jul 2020 17:27:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <021707b9-5f72-6f8b-d125-43627ef64a6d@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596068356; bh=hV+Rb57UmhCj8pm6WTLYiOwES0CnuMuyE+cAvTI8bYU=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=dyQEfSToFkFK5Ao+j9IJdx52QAx74A1w4Knhlb63k2k+/PBa19roLzwO7B7GvfEfV
         /xE4nmXQmaIa8c+cE3GPby4Hb45lL2K7IV2+KAgr8qGTQ0xB93afvae0yrNnnWwc89
         yYB4JBzGngaKMtnHg/3JzF6CaCbCKjbA5BenBmL7WTnMXrn73TD4IT6Kc92g01Mi8q
         WDWqWhMsxSm7z8N3H6/wL5BNdHDQL5p8rFqg7zYQdNPlhi6hHMs8+q3M0DqcjLoEyy
         pfdy2oo3ejbKUIc3FlRGx3DoGjEIp7kgNMwrJchlx72Mf6jhoJPV2HPAdZ9RLN66ld
         pLqtjXbxgWHVQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/29/20 4:59 PM, Sowjanya Komatineni wrote:
>
> On 7/29/20 4:25 PM, Dmitry Osipenko wrote:
>> 28.07.2020 18:59, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> ...
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D tegra_mipi_finish=
_calibration(csi_chan->mipi);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d=
ev_err(csi_chan->csi->dev,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 "MIPI calibration failed: %d\n", ret);
>>>> Doesn't v4l2_subdev_call(OFF) need to be invoked here on error?
>>> Not required as on error streaming fails and runtime PM will turn off
>>> power anyway.
>> I see that camera drivers bump theirs RPM on s_stream=3D1, and thus,
>> s_stream=3D0 should be invoked in order to balance the RPM. What am I=20
>> missing?
>>
>> https://elixir.bootlin.com/linux/v5.8-rc4/source/drivers/media/i2c/ov274=
0.c#L634=20
>>
>
> Sensor drivers take care of RPM put when any failure happens during=20
> s_stream.
>
> So bridge driver don't have to call v4l2_subdev_call s_stream off=20
> incase if sensor subdev stream on fails.
>
>>> Also we only did csi subdev s_stream on and during sensor subdev
>>> s_stream on fail, actual stream dont happen and on tegra side frame
>>> capture by HW happens only when kthreads run.
>> Secondly, perhaps a failed calibration isn't a very critical error?
>> Hence just printing a warning message should be enough.
>
> Using dev_err to report calibration failure. Are you suggesting to use=20
> dev_warn instead of dev_err?
>
>>
>> Could you please make a patch that factors all ON/OFF code paths into a
>> separate functions? It's a bit difficult to follow the combined code,
>> especially partial changes in the patches. Thanks in advance!
>
> what do you mean by partial changes in patches?
>
> Can you please be more clear?

Also please specify what ON/OFF code paths you are referring to when you=20
say to move into separate functions?

>
> Thanks
>
> Sowjanya
>
