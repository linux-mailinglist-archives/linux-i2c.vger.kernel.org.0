Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78C24232862
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jul 2020 01:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbgG2Xwk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jul 2020 19:52:40 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:19594 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbgG2Xwj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jul 2020 19:52:39 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f220b9a0000>; Wed, 29 Jul 2020 16:51:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 29 Jul 2020 16:52:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 29 Jul 2020 16:52:39 -0700
Received: from [10.2.160.194] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Jul
 2020 23:52:38 +0000
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
 <01ee0805-3d57-d857-48e3-5c2245cd4500@nvidia.com>
 <2ec535c9-55e8-8834-6002-36c75aeb097c@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <021707b9-5f72-6f8b-d125-43627ef64a6d@nvidia.com>
Date:   Wed, 29 Jul 2020 16:59:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2ec535c9-55e8-8834-6002-36c75aeb097c@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596066714; bh=8gKx96ZxGbTkzIEXNq+3dTM3ARK7fkFh8clOyr8UQHo=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=Z6F7TVrwwS3VFsrO7KGvWCaDYORsn8Vio4yhchS73jORXy6QVIqvTbkCl23bUX492
         PwlbTBkttSbCkY/hKIJxPqBcuQisDhl78EJfrBaveoGrwXV0kY/k/kE8kFYqFA5Tsa
         znB75rrjJ25FwKmp/IpYEAhkd4oahuoc8/cJrZL+Kwlo8ibJFg7t6JPVe5fm9kJj9L
         pvyUK4b5duAwDVZNyLbc17EMKEW3EmOHkZAmPdD6eIBP/G1xz5/yarXewYhBftnkjX
         DtwfiuJxwW0xcR1HDR5DvheiGC/atXp33waToiT0VATMPka24c0iqCA1UIOtYAWHr5
         UV3Iexg+x0R1Q==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/29/20 4:25 PM, Dmitry Osipenko wrote:
> 28.07.2020 18:59, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D tegra_mipi_finish_=
calibration(csi_chan->mipi);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
v_err(csi_chan->csi->dev,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "MIPI calibration failed: %d\n", ret);
>>> Doesn't v4l2_subdev_call(OFF) need to be invoked here on error?
>> Not required as on error streaming fails and runtime PM will turn off
>> power anyway.
> I see that camera drivers bump theirs RPM on s_stream=3D1, and thus,
> s_stream=3D0 should be invoked in order to balance the RPM. What am I mis=
sing?
>
> https://elixir.bootlin.com/linux/v5.8-rc4/source/drivers/media/i2c/ov2740=
.c#L634

Sensor drivers take care of RPM put when any failure happens during=20
s_stream.

So bridge driver don't have to call v4l2_subdev_call s_stream off incase=20
if sensor subdev stream on fails.

>> Also we only did csi subdev s_stream on and during sensor subdev
>> s_stream on fail, actual stream dont happen and on tegra side frame
>> capture by HW happens only when kthreads run.
> Secondly, perhaps a failed calibration isn't a very critical error?
> Hence just printing a warning message should be enough.

Using dev_err to report calibration failure. Are you suggesting to use=20
dev_warn instead of dev_err?

>
> Could you please make a patch that factors all ON/OFF code paths into a
> separate functions? It's a bit difficult to follow the combined code,
> especially partial changes in the patches. Thanks in advance!

what do you mean by partial changes in patches?

Can you please be more clear?

Thanks

Sowjanya

