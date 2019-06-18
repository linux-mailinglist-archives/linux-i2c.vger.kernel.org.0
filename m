Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABE8649FBC
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2019 13:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729781AbfFRLwq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jun 2019 07:52:46 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:12449 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729775AbfFRLwq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jun 2019 07:52:46 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d08d08d0000>; Tue, 18 Jun 2019 04:52:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Jun 2019 04:52:45 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Jun 2019 04:52:45 -0700
Received: from [10.19.65.14] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 11:52:42 +0000
Subject: Re: [PATCH V9] i2c: tegra: remove BUG() macro
To:     Dmitry Osipenko <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1560856182-26072-1-git-send-email-bbiswas@nvidia.com>
 <e1bf5aac-5528-3e54-0f41-5a1bbabce419@gmail.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <2724f809-fe0b-810c-6236-d94a1efc2112@nvidia.com>
Date:   Tue, 18 Jun 2019 04:52:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e1bf5aac-5528-3e54-0f41-5a1bbabce419@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560858765; bh=e1tSso8N3GCOauwbmbeeod/T6BaFIk3wbGNaptwkfqo=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=nXI/Gx44H5Pc1Wl65W+eH9mEscbbjjtHYht1M4aTe1qwaM58xgatN5HlVNQY3dxjv
         SSAIHxycH7rjhiO2sIjGNeib6gQ9RWvVWCLNs+ynDnHFVD+4jLQVIovU5eFoyLLjOb
         K1zKjXveIvOGM12myYcw3c5gCsreI5B5LDaM1Jy40DjWwZuAMZYv2dcRUXk8gZdQ4h
         QR1xA6PVa16XuVrKBb0iPdHTN0C2r+NBGLrBEd1FSAYt+mG6B9s+TUAqVGw8Aiyc01
         k52jm7kCyA4o6KxG+3VTPKtvDIzFqDC8RI76taws+TG9/D3k0bked0fObQR5UYujap
         aeE0h5sFLPiEg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/18/19 4:29 AM, Dmitry Osipenko wrote:
> 18.06.2019 14:09, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> The usage of BUG() macro is generally discouraged in kernel, unless
>> it's a problem that results in a physical damage or loss of data.
>> This patch removes unnecessary BUG() macros and replaces the rest
>> with warning.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 47 ++++++++++++++++++++++++++++++++++=
+-------
>>   1 file changed, 39 insertions(+), 8 deletions(-)
>=20
> Thank you very much! Please keep applying all the advises that were given=
 to you
> during the reviews in the future patches.
Thank you Dmitry for the review inputs and patience. I shall try to keep=20
the advices in mind for future reviews.


>=20
> I made a quick test and no problems spotted, all warning spots are silent=
.
>=20
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
>=20
Also, Thank you for help in testing the patch at your end.

-regards,
  Bitan

