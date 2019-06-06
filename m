Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5D836C2D
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 08:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbfFFGYq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 02:24:46 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:18829 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFGYq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 02:24:46 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf8b1ad0000>; Wed, 05 Jun 2019 23:24:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 05 Jun 2019 23:24:45 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 05 Jun 2019 23:24:45 -0700
Received: from [10.19.65.14] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Jun
 2019 06:24:42 +0000
Subject: Re: [PATCH V2] drivers: i2c: tegra: fix checkpatch defects
To:     Dmitry Osipenko <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559196850-7007-1-git-send-email-bbiswas@nvidia.com>
 <e9e3d8b0-a76a-81a9-1110-2d07ba1c787f@gmail.com>
 <911e52ed-8f3c-583a-7610-e38723219eca@gmail.com>
 <b86b9104-1754-531f-70b9-3c1a5d347b9b@nvidia.com>
 <2d83ad21-b012-1b3e-fc9a-741972ee3ba9@gmail.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <89488516-a064-a1a0-9e3d-8234043201be@nvidia.com>
Date:   Wed, 5 Jun 2019 23:24:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <2d83ad21-b012-1b3e-fc9a-741972ee3ba9@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559802285; bh=A0EKOpcxSf6jypGXzxSbsk+o5ChWWgKynVYpvDClFmY=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=pwQVtciofapmmfptkDK4v975iSl9dM6h1y9B6e99JI3ft/ReUACHg7zVsbkQlQUOF
         rFcOSvvvQSqRz04KQaQ44YA7aWqGlS9dqO4c+mT970umX6oKsYT3h6HsNQaS0QNYyE
         ue+0SlkOnl+Mlxz5j4+zawMjMp5g0Y1Q15NK066KkCPs4AvUzp7adq8KV0+fhsWr2r
         wWdVOxr0K0lhr3BG73noS1zpBIM82jQkHNxM3j0MjGr2Km906NLqxIjzFj8YYvcluy
         qcE2OP79mcjOy8TlAx6gPnw2SzUBC86eLyT1L8Fal1T5pXI+QsFSIfZh4eS6+8SdII
         igWnHISZCrYFg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 5/31/19 5:45 AM, Dmitry Osipenko wrote:
> 31.05.2019 12:04, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>>
>> On 5/30/19 4:43 AM, Dmitry Osipenko wrote:
>>> 30.05.2019 14:36, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> 30.05.2019 9:14, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
>>>>> except for BUG/BUG_ON checks
>>>>
>>>> Please turn the BUG_ON's into WARN_ON's. The machine won't go on fire,
>>>> hence there is absolutely no good reason in making system unusable on =
a
>>>> software bug. BUG_ON may be more useful for development, but not for a
>>>> casual daily usage.
>> I shall update the patch to remove the BUG/BUG_ON calls.
>=20
> Please replace them with WARN_ON_ONCE.
>=20
Based on review of the BUG_ON some were found redundant calls and hence=20
planned to be removed. Non-trivial BUG_ON planned to be replaced with=20
WARN_ON_ONCE call.

-regards,
  Bitan

