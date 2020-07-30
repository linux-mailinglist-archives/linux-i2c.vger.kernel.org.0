Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 904B7232941
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jul 2020 02:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbgG3A7Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jul 2020 20:59:25 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2609 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726859AbgG3A7Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jul 2020 20:59:25 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f221b100000>; Wed, 29 Jul 2020 17:57:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 29 Jul 2020 17:59:24 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 29 Jul 2020 17:59:24 -0700
Received: from [10.2.160.194] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jul
 2020 00:59:24 +0000
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
 <021707b9-5f72-6f8b-d125-43627ef64a6d@nvidia.com>
 <de2d6117-b1e5-14c0-52ca-ff46b444c866@nvidia.com>
 <ca18b93e-1f1c-50ae-e0c1-11758935ee89@gmail.com>
 <42f25a49-ad2b-4e52-fd99-cb0f52037988@nvidia.com>
 <f5440f57-3653-7cf0-9efe-e9a0c276f7cf@nvidia.com>
 <6ae07f82-53f7-33fc-5892-340b0d9f12cf@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <887d51fb-4292-c251-6568-32b884e8db67@nvidia.com>
Date:   Wed, 29 Jul 2020 18:06:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6ae07f82-53f7-33fc-5892-340b0d9f12cf@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596070672; bh=F9EN8UAgMwigtLNy+JI+iiitzedOW3ZVlLVEoOqUjG0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=d8sFH9K6xPDZyiCkaFZriGF4SjXdoqKjDomj3H/TvH+AWqvSXuZ5txhqXm2EO9wv9
         0DZDOyw7w0ktujUnVaEqJxN2wHi8n7z4KupEJEGvkfN+l42AQuGuzZyXjVFBv2OjB6
         NJiAZs1Sbs2Q1gpx161WutaEGbz55QcsZqzO5FizQ91kKuSwrEb+u5kKq7GETg4M9x
         3FjbZssns/DFAzToQTw+c8qQC2sttJ3Ypdzg65RnT8P56tRKNoJXhUxifwSVzbAaq8
         L52YKTuaQG/ES1v0ksxsAi76uPku5ZjlAMTA/5YdLQ8+wZcpCRZfzXMbhtobpmLxRZ
         4kXfbiE2e05jQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/29/20 5:53 PM, Dmitry Osipenko wrote:
> 30.07.2020 03:55, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 7/29/20 5:52 PM, Sowjanya Komatineni wrote:
>>> On 7/29/20 5:43 PM, Dmitry Osipenko wrote:
>>>> 30.07.2020 03:27, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> ...
>>>>>>> Secondly, perhaps a failed calibration isn't a very critical error?
>>>>>>> Hence just printing a warning message should be enough.
>>>>>> Using dev_err to report calibration failure. Are you suggesting to u=
se
>>>>>> dev_warn instead of dev_err?
>>>> I meant that failing s_stream might be unnecessary.
>>>>
>>>> The dev_warn should be more appropriate for a non-critical errors.
>>>>
>>>>>>> Could you please make a patch that factors all ON/OFF code paths
>>>>>>> into a
>>>>>>> separate functions? It's a bit difficult to follow the combined cod=
e,
>>>>>>> especially partial changes in the patches. Thanks in advance!
>>>>>> what do you mean by partial changes in patches?
>>>>>>
>>>>>> Can you please be more clear?
>>>>> Also please specify what ON/OFF code paths you are referring to when
>>>>> you
>>>>> say to move into separate functions?
>>>> I meant to change all the code like this:
>>>>
>>>> set(on) {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 if (on) {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 if (!on)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
>>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>> }
>>>>
>>>> to somewhat like this:
>>>>
>>>> set(on) {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 if (on)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D enable();
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 else
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D disable();
>>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> }
>>> You mean to change tegra_channel_set_stream() ?
> Yes, and tegra_csi_s_stream().
>
>> changing tegra_channel_set_stream() to have like below will have
>> redundant calls as most of the code b/w enable and disable is same
>> except calling them in reverse order based on on/off and doing MIPI
>> calibration only during ON
>>
>>
>> if (on)
>>  =C2=A0=C2=A0=C2=A0 ret =3D enable()
>> else
>>  =C2=A0=C2=A0=C2=A0 ret =3D disable()
>> return ret;
> Readability should be more important than number of lines.

Will have v6 and add additional patch at the end to do enable/disable=20
separately.

Separating this out with additional patch before adding sensor support=20
patch requires all patches to be updated.

So I am ok either ways. Please let me know if adding additional patch at=20
the end to split tegra_channel_set_stream() and tegra_csi_s_stream()=20
separately is ok?


