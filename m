Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BACE1B2B3A
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Apr 2020 17:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbgDUPec (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Apr 2020 11:34:32 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6461 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgDUPec (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Apr 2020 11:34:32 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e9f127b0000>; Tue, 21 Apr 2020 08:34:19 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 21 Apr 2020 08:34:31 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 21 Apr 2020 08:34:31 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Apr
 2020 15:34:31 +0000
Received: from [10.26.73.24] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Apr
 2020 15:34:29 +0000
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "Wolfram Sang" <wsa@the-dreams.de>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
 <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
 <f59ba318-8e99-c486-fa4d-1ee28a7b203d@gmail.com>
 <b01cec76-bb39-9fb5-8f6e-4023c075e6b3@gmail.com>
 <8cd085e1-f9fd-6ec0-9f7a-d5463f176a63@nvidia.com>
 <db1132ce-53a8-371c-98e0-cb7cd91d5c7d@gmail.com>
 <fa344989-4cce-0d2c-dc93-4ca546823160@nvidia.com>
 <93b738f2-ccf2-68ed-3ca5-30945bd40521@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <61c9f5a7-3a48-8200-1cfe-d5d0524511f7@nvidia.com>
Date:   Tue, 21 Apr 2020 16:34:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <93b738f2-ccf2-68ed-3ca5-30945bd40521@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587483259; bh=dfH21pJMGp2TfX6zyXnZ+Ik+c16DfCdxRpvDYe/WEyU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=ItEbQCybEuWHLbIyZf8BYqAPDXF32uVlv2cta+J6vli0ktZqDrjdwCNNXYv/uF4qU
         5BmmNgBl6izQFyGbBOUL61SdocrNvO6rfuHCvhxU8/DAVFBmWtQKcunrG8fsqnCKi6
         apa33hYEBldvy0ZtEpot6JM7k/Qqegxc2VFSWiUCDL3drJNBfnqYn4yd+YScWa5Jgk
         L/1b7G51DiKlZomIMwYWSDetpQM0X54wWIsyYEYv3qEg9bl3zr38tfpOh/Cgi+qyFp
         poaK2TRvTKoKcnc3KgOcthB1g/d/RSaXMgkT29z0isVG0Y5Hl8O1ucBupdDC68NiTo
         G6RBqYts4CNRw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 21/04/2020 16:18, Dmitry Osipenko wrote:
> 21.04.2020 17:40, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>> On 21/04/2020 14:25, Dmitry Osipenko wrote:
>>> 21.04.2020 12:49, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> ...
>>>> I can try the above, but I agree it would be best to avoid messing wit=
h
>>>> the suspend levels if possible.
>>>
>>> Will be awesome if you could try it and report back the result.
>>>
>>
>> I gave it a try but suspend still fails.
>=20
> Is this regulator error gone with my changes?
>=20
> [   60.450346] WARNING: CPU: 0 PID: 653 at
> /home/jonathanh/workdir/tegra/mlt-linux_next/kernel/drivers/regulator/cor=
e.c:2603
> _regulator_disable+0xb8/0x1b4
> [   60.463959] unbalanced disables for vdd_pexa,vdd_pexb

The above is still there with your changes.

Jon

--=20
nvpublic
