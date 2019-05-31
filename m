Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A120D30B05
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2019 11:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbfEaJEY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 May 2019 05:04:24 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:9171 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbfEaJEY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 May 2019 05:04:24 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf0ee0d0000>; Fri, 31 May 2019 02:04:13 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 31 May 2019 02:04:23 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 31 May 2019 02:04:23 -0700
Received: from [10.19.65.14] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 May
 2019 09:04:20 +0000
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
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <b86b9104-1754-531f-70b9-3c1a5d347b9b@nvidia.com>
Date:   Fri, 31 May 2019 02:04:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <911e52ed-8f3c-583a-7610-e38723219eca@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559293453; bh=SOqJI+EZ5Db2ZI9zhzesDEizdcdTJUo9u2vKd2K8Ybc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=VUwuo3eubu7zXKhOddS0+xUHK+pIZqRk1ytHUuVta019Jlps/++VHCOZulHeCNoXR
         ty6lcK/T6zxbkrPUk2p9thjjgTECf1jrmcw9tSZ7z78+avkfj+LtDUAYQhLf//vYqo
         Zu1QTNa55JHcvrv2pxj18VHSqe6L3zR/j4bH84EMz7MxlcEv2ZcOyuv9fwak7fx5g1
         ukYurq8rqZ+HcVroE5VMO+a1OHXt6Fu2neMPYqqco+7LyxQjSeuAP+xCnIoLKylRiI
         E5G9w4WTX8AEybdu6ZF0DnbW4BKh9XWjXuUtwkeua5MeU5JoupWFx9YAFHA7GemwTP
         2N9WZHWU6cShg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 5/30/19 4:43 AM, Dmitry Osipenko wrote:
> 30.05.2019 14:36, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 30.05.2019 9:14, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
>>> except for BUG/BUG_ON checks
>>
>> Please turn the BUG_ON's into WARN_ON's. The machine won't go on fire,
>> hence there is absolutely no good reason in making system unusable on a
>> software bug. BUG_ON may be more useful for development, but not for a
>> casual daily usage.
I shall update the patch to remove the BUG/BUG_ON calls.

>>
>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>> ---
>>
>>> @@ -1034,7 +1038,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_de=
v *i2c_dev,
>>>   	u32 *buffer =3D NULL;
>>>   	int err =3D 0;
>>>   	bool dma;
>>> -	u16 xfer_time =3D 100;
>>> +	u16 xfer_tm =3D 100;
>>
>> What's wrong with the "time"? I'm finding the "xfer_tm" as a very
>> unintuitive naming.
>>
>=20
> Also, please don't version patch as v2 if v1 was never sent out.
>=20
I marked the patch version as V2 incorrectly. Sorry. I shall be careful=20
about the patch version sequence from now on.

-regards,
  Bitan

