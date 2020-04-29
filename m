Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA48A1BDFC2
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 15:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgD2N57 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Apr 2020 09:57:59 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:15811 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726948AbgD2N56 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Apr 2020 09:57:58 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea9876b0000>; Wed, 29 Apr 2020 06:55:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 29 Apr 2020 06:57:58 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 29 Apr 2020 06:57:58 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Apr
 2020 13:57:58 +0000
Received: from [10.26.73.139] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Apr
 2020 13:57:56 +0000
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, <linux-i2c@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427110033.GC3464906@ulmo>
 <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c@gmail.com>
 <20200427151234.GE3464906@ulmo>
 <1ab276cf-c2b0-e085-49d8-b8ce3dba8fbe@gmail.com>
 <20200429081448.GA2345465@ulmo> <20200429085502.GB2345465@ulmo>
 <9e36c4ec-ca02-bd15-d765-15635f09db4b@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <7442f4cd-6406-41f6-5c9b-932bff8ad5b2@nvidia.com>
Date:   Wed, 29 Apr 2020 14:57:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9e36c4ec-ca02-bd15-d765-15635f09db4b@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588168555; bh=WwxbsSS15NCrITtXPPngnki2MjBPnDYjFM5z5nJZgeM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Pa53bR205F4LjkoRmYoj4tJO4IMvE4BSd3+5sTMBjDdE5mlDfdO4OSGbOMKBWTB5H
         mbZt5cVglP+YMRIQd8FuLRSzcYx2bm+VDGnwSGLcxVRMRME31dSIup3WRmtbjvVCh/
         L67QpB706EHnfLP9qsAHJsAfn2IcKLBur69rhIMtAl+g2UdfVAP9ml1GE8btmjXC0+
         pJRjSKEMCAe/XEd3QXA3jR0vpuuuwH9k7YR8w8UBR1fgCrDRsAZqq192tXH9s3Tpc5
         1+ajhNiInnnq2MKjCnmBqynsEBQtWaUdL+BJTV8NfyPjYReGEH/uHrhXcDlzp58bAb
         UwVHN+GLzKm7Q==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 29/04/2020 13:35, Dmitry Osipenko wrote:
> 29.04.2020 11:55, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>>>> It's not "papering over an issue". The bug can't be fixed properly
>>>> without introducing I2C atomic transfers support for a late suspend
>>>> phase, I don't see any other solutions for now. Stable kernels do not
>>>> support atomic transfers at all, that proper solution won't be backpor=
table.
>>>
>>> Hm... on a hunch I tried something and, lo and behold, it worked. I can
>>> get Cardhu to properly suspend/resume on top of v5.7-rc3 with the
>>> following sequence:
>>>
>>> 	revert 9f42de8d4ec2 i2c: tegra: Fix suspending in active runtime PM st=
ate
>>> 	apply http://patchwork.ozlabs.org/project/linux-tegra/patch/2019121313=
4417.222720-1-thierry.reding@gmail.com/
>>>
>>> I also ran that through our test farm and I don't see any other issues.
>>> At the time I was already skeptical about pm_runtime_force_suspend() an=
d
>>> pm_runtime_force_resume() and while I'm not fully certain why exactly i=
t
>>> doesn't work, the above on top of v5.7-rc3 seems like a good option.
>>>
>>> I'll try to do some digging if I can find out why exactly force suspend
>>> and resume doesn't work.
>>
>> Ah... so it looks like pm_runtime_force_resume() never actually does
>> anything in this case and then disable_depth remains at 1 and the first
>> tegra_i2c_xfer() will then fail to runtime resume the controller.
>=20
> That's the exactly expected behaviour of the RPM force suspend/resume.
> The only unexpected part for me is that the tegra_i2c_xfer() runtime
> resume then fails in the NOIRQ phase.

From reading the changelog for commit 1e2ef05bb8cf ("PM: Limit race
conditions between runtime PM and system sleep (v2))", this is the
expected behaviour for runtime resume in the noirq phase.

Jon

--=20
nvpublic
