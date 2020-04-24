Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFEF81B794F
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Apr 2020 17:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbgDXPTb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Apr 2020 11:19:31 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:12145 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgDXPTa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Apr 2020 11:19:30 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea303760000>; Fri, 24 Apr 2020 08:19:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 24 Apr 2020 08:19:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 24 Apr 2020 08:19:30 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Apr
 2020 15:19:30 +0000
Received: from [10.26.73.231] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Apr
 2020 15:19:27 +0000
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
 <6f07e5c8-7916-7ea2-2fe7-d05f8f011471@nvidia.com>
 <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
 <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
Date:   Fri, 24 Apr 2020 16:19:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587741558; bh=6EvpFp10VeCDVx1lp61rQp1uS7/tMoIZMqDEb+agf+I=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=ah4+pULA1j3bd4sv6xF57BpM40y/gqIdTIObBUAAVJHhrv1ei9bZQHEGKduTQCOEc
         vU1sPRZZkH2FbeBn9JodzAd7Xdx51ldXdm02fDKkNL4DZRxltcWEi9yYWlRMyncwYZ
         kcvRlT2TQgbUDYiG1BYgDqIdhqmeJwCeFn2ElQWFpE2CH4Zr0SVXGbMxcPAVp7Zf5D
         rFuU5pJwqkGzkH3tqYJMegxbtQmA3fTPNeOaQWViFNfeacO4DB3jxIsAE4FG+lKX/i
         VfkXqf1CLMpvZF4oncwWkSMbyo17t93XNfQOXdmj4b5XuljMg5SV2rszA0ZjE/Kw38
         iU3QH1yKibVdA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 24/04/2020 15:45, Dmitry Osipenko wrote:
> 24.04.2020 10:10, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>>> Could you please clarify why pm_runtime_get_sync() can't be used by the
>>> I2C driver's in NOIRQ phase?
>>
>> Yes take a look at commit 1e2ef05bb8cf ("PM: Limit race conditions
>> between runtime PM and system sleep (v2)").
>=20
> I2C driver now uses irq-safe RPM since ede2299f7 ("i2c: tegra: Support
> atomic transfers"), and thus, the RPM's workqueue shouldn't be a
> problem. I guess RPM should work fine in this case, don't you think so?

I was testing, and I did not see it using atomic transfers. I can
confirm if the RPM callbacks are called or not, but I did not think so.
However, let me confirm.

>>> Yes, keeping PCI regulators always-enabled should be a good immediate
>>> solution.
>>
>> I was thinking about that, and I am not sure it is. I don't think that
>> the failure to send the I2C command should break suspend.
>=20
> It shouldn't, but looks like it should be a separate problem.

Maybe but all these other problems appear to have existed for sometime
now. We need to fix all, but for the moment we need to figure out what's
best for v5.7.

>> So I confirmed that DMA is not the issue in this case. I tested this by
>> ensuring that DMA is never used. However, it is a potential problem
>> indeed.
>>
>>> Could you please try to apply this hunk and see if it makes any
>>> difference (I'll probably make it as proper patch):
>>
>> Per my tests, I don't believe that it will as disabling DMA does not
>> resolve the problem.
>>
>>> It also could be that there is more than the suspend ordering problem,
>>> but for now it is hard to tell without having a detailed log which
>>> includes I2C/DMA/RPM traces.
>>
>> I have taken a look and I don't see any issues with ordering. I2C is
>> suspended after PCI. This did not change.
>=20
> Do you see a "completion done after timeout" messages in the KMSG log of
> the v5.6 kernel?
>=20
> Could you please try this hunk? Although, I'll be surprised if it
> changes anything.

Yes I can test.

Cheers
Jon

--=20
nvpublic
