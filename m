Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5A2B1B3097
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Apr 2020 21:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgDUTmq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Apr 2020 15:42:46 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:3074 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgDUTmp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Apr 2020 15:42:45 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e9f4ca80001>; Tue, 21 Apr 2020 12:42:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 21 Apr 2020 12:42:45 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 21 Apr 2020 12:42:45 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Apr
 2020 19:42:45 +0000
Received: from [10.26.73.24] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Apr
 2020 19:42:42 +0000
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
 <bba0a93a-8ec4-eda6-97f3-fb2ab0b9b503@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <6f07e5c8-7916-7ea2-2fe7-d05f8f011471@nvidia.com>
Date:   Tue, 21 Apr 2020 20:42:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <bba0a93a-8ec4-eda6-97f3-fb2ab0b9b503@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587498152; bh=/6J0M2JR25SBCbaG9GKcmtfg56nuGtX/szS0WdPB7Dw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=h3wxWueIYlEZ7hhNyhqUm9JbuIRN/F2x1dKrVbcl0sxRU+KCmbEgEJ9/C0uNdv0iS
         pwqWjkDCPp2MzEZHchdlI2jT9H2XwFGujBqGsex3PPsBqNa2s4GX+qOi9g4Hkmgm2Y
         FdZkMPLT76Ik3Irrq5SoVLHCRjwFtAYV1qZduaJyVoqL9PgRJOMv+QvjgxH5JAuuyg
         vD8hQ2JuivuFlKNSlBjlBQXC6s/irwY1cUDjOzrpMq5J+a2PLdMX1HLHOpiWbf/Z42
         FArtF+dvmbMDhCTYfyQZNESjaKVuVappgpKmgrjqw/fXkKXzUqjvmV6UC3Ko9TcEnQ
         huJmuQbfQXoqQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 21/04/2020 16:08, Dmitry Osipenko wrote:
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
> Perhaps the RPM's -EACCES is returned from here:
>=20
> https://elixir.free-electrons.com/linux/v5.7-rc2/source/drivers/base/powe=
r/runtime.c#L723
>=20
> Which suggests that I2C is accessed after being suspended. I guess the
> PCIe driver suspends after the I2C and somehow my change affected the
> suspension order, although not sure how.
>=20
> Jon, could you please try to enable PM logging and post the log? Please
> also post log of the working kernel version, so that we could compare
> the PM sequence.
>=20
> Something like this should enable the logging: "echo 1 >
> /sys/power/pm_trace" + there is RPM tracing.

Unfortunately, after enabling that I don't any output and so no help there.

Jon

--=20
nvpublic
