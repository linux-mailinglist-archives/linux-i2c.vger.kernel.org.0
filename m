Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE8E123291F
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jul 2020 02:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbgG3Ase (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jul 2020 20:48:34 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3711 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbgG3Ase (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jul 2020 20:48:34 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2218b40000>; Wed, 29 Jul 2020 17:47:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 29 Jul 2020 17:48:34 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 29 Jul 2020 17:48:34 -0700
Received: from [10.2.160.194] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jul
 2020 00:48:32 +0000
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
 <de2d6117-b1e5-14c0-52ca-ff46b444c866@nvidia.com>
 <ca18b93e-1f1c-50ae-e0c1-11758935ee89@gmail.com>
 <42f25a49-ad2b-4e52-fd99-cb0f52037988@nvidia.com>
Message-ID: <f5440f57-3653-7cf0-9efe-e9a0c276f7cf@nvidia.com>
Date:   Wed, 29 Jul 2020 17:55:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <42f25a49-ad2b-4e52-fd99-cb0f52037988@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596070068; bh=0B8OKLEcLbPcdelMmV/5zmb0K63KthRXZnJxCSQVz3c=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=jJdFFerufxuJNZYaOn/R/58bR9z5n33YZvGgyCxVvQfFZAId0jL8NHg4nMdGqTVXB
         Mgg1Nhi49hNUr1gHjebnSdU9y2Gb6xOafnRsAOThNK5QBzHHGb9TWjr7h7oC2nA3FB
         37Ud46fw7XE3kmXE8DIZm+uiHRRl/CSyjY6DhkvkbenWxgIHy6jFeG0tiFrPVo7pCH
         3YtXktzvxfP2DxEMa2knzOIuK1Vfr7Ho+uM9NT3Y/8JQ2dI/vdB52x7vVkT2wIBfwC
         CMotzYdwhw48NF7PmZtG79n2LNm838GgtfB/HwIZwbNyGsvEoXNXZXbq1qUQmdxT7t
         xEK7L0GjR5xcQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/29/20 5:52 PM, Sowjanya Komatineni wrote:
>
> On 7/29/20 5:43 PM, Dmitry Osipenko wrote:
>> 30.07.2020 03:27, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> ...
>>>>> Secondly, perhaps a failed calibration isn't a very critical error?
>>>>> Hence just printing a warning message should be enough.
>>>> Using dev_err to report calibration failure. Are you suggesting to use
>>>> dev_warn instead of dev_err?
>> I meant that failing s_stream might be unnecessary.
>>
>> The dev_warn should be more appropriate for a non-critical errors.
>>
>>>>> Could you please make a patch that factors all ON/OFF code paths=20
>>>>> into a
>>>>> separate functions? It's a bit difficult to follow the combined code,
>>>>> especially partial changes in the patches. Thanks in advance!
>>>> what do you mean by partial changes in patches?
>>>>
>>>> Can you please be more clear?
>>> Also please specify what ON/OFF code paths you are referring to when=20
>>> you
>>> say to move into separate functions?
>> I meant to change all the code like this:
>>
>> set(on) {
>> =C2=A0=C2=A0=C2=A0=C2=A0 if (on) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 if (!on)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 return;
>> }
>>
>> to somewhat like this:
>>
>> set(on) {
>> =C2=A0=C2=A0=C2=A0=C2=A0 if (on)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D enable();
>> =C2=A0=C2=A0=C2=A0=C2=A0 else
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D disable();
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> }
>
> You mean to change tegra_channel_set_stream() ?
changing tegra_channel_set_stream() to have like below will have=20
redundant calls as most of the code b/w enable and disable is same=20
except calling them in reverse order based on on/off and doing MIPI=20
calibration only during ON


if (on)
 =C2=A0=C2=A0=C2=A0 ret =3D enable()
else
 =C2=A0=C2=A0=C2=A0 ret =3D disable()
return ret;

>
>
