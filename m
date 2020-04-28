Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEAC1BB857
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Apr 2020 10:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgD1ICC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Apr 2020 04:02:02 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:2687 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgD1ICC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Apr 2020 04:02:02 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea7e2ed0001>; Tue, 28 Apr 2020 01:01:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 Apr 2020 01:02:02 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 Apr 2020 01:02:02 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Apr
 2020 08:02:01 +0000
Received: from [10.26.73.101] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Apr
 2020 08:01:58 +0000
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, <linux-i2c@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427110033.GC3464906@ulmo>
 <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c@gmail.com>
 <20200427151234.GE3464906@ulmo>
 <1ab276cf-c2b0-e085-49d8-b8ce3dba8fbe@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <4981d7eb-b41e-c597-04ff-3d3295804d5a@nvidia.com>
Date:   Tue, 28 Apr 2020 09:01:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1ab276cf-c2b0-e085-49d8-b8ce3dba8fbe@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588060909; bh=SuOXM9i4Bv7u14fQMgKhs9vk/w2mcphzL5YP92I8jGc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=KYA62r0YlSY/jqHyhpkjNwQMXSQLFYubtlQED9pjrixh+PGnXztC7H7f9ux5+2ZfQ
         6vwgwNt66bl46LbEyhpbSZFHFxp0npztDppZ7uCvA1szvMlQEh57se7ZXDArObKIDc
         Vppw8AHfXO2qi8gBxzG/Bd+Xam8OWVY0JmmrAb1fwntkMu9o9oCO4jGN6Hqzf7CE2g
         LD8XZHqc38+XYTkTWy6ZS4cMuvuWlkiVKBAujfqfrB6/wRicZlv0cwJN2s/sCuw2Vl
         4KHeHxcG1B/I4LBUg12OcUkB9HenjH/hac7W2oNWpeEzIyH6EHKU0+H8/NfnPefkpi
         q6gphXJnEZESw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 27/04/2020 16:18, Dmitry Osipenko wrote:
> 27.04.2020 18:12, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On Mon, Apr 27, 2020 at 05:21:30PM +0300, Dmitry Osipenko wrote:
>>> 27.04.2020 14:00, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On Mon, Apr 27, 2020 at 12:52:10PM +0300, Dmitry Osipenko wrote:
>>>>> 27.04.2020 10:48, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> ...
>>>>>>> Maybe but all these other problems appear to have existed for somet=
ime
>>>>>>> now. We need to fix all, but for the moment we need to figure out w=
hat's
>>>>>>> best for v5.7.
>>>>>>
>>>>>> To me it doesn't sound like we have a good handle on what exactly is
>>>>>> going on here and we're mostly just poking around.
>>>>>>
>>>>>> And even if things weren't working quite properly before, it sounds =
to
>>>>>> me like this patch actually made things worse.
>>>>>
>>>>> There is a plenty of time to work on the proper fix now. To me it sou=
nds
>>>>> like you're giving up on fixing the root of the problem, sorry.
>>>>
>>>> We're at -rc3 now and I haven't seen any promising progress in the las=
t
>>>> week. All the while suspend/resume is now broken on at least one board
>>>> and that may end up hiding any other issues that could creep in in the
>>>> meantime.
>>>>
>>>> Furthermore we seem to have a preexisting issue that may very well
>>>> interfere with this patch, so I think the cautious thing is to revert
>>>> for now and then fix the original issue first. We can always come back
>>>> to this once everything is back to normal.
>>>>
>>>> Also, people are now looking at backporting this to v5.6. Unless we
>>>> revert this from v5.7 it may get picked up for backports to other
>>>> kernels and then I have to notify stable kernel maintainers that they
>>>> shouldn't and they have to back things out again. That's going to caus=
e
>>>> a lot of wasted time for a lot of people.
>>>>
>>>> So, sorry, I disagree. I don't think we have "plenty of time".
>>>
>>> There is about a month now before the 5.7 release. It's a bit too early
>>> to start the panic, IMO :)
>>
>> There's no panic. A patch got merged and it broken something, so we
>> revert it and try again. It's very much standard procedure.
>>
>>> Jon already proposed a reasonable simple solution: to keep PCIe
>>> regulators always-ON. In a longer run we may want to have I2C atomic
>>> transfers supported for a late suspend phase.
>>
>> That's not really a solution, though, is it? It's just papering over
>> an issue that this patch introduced or uncovered. I'm much more in
>> favour of fixing problems at the root rather than keep papering over
>> until we loose track of what the actual problems are.
>=20
> It's not "papering over an issue". The bug can't be fixed properly
> without introducing I2C atomic transfers support for a late suspend
> phase, I don't see any other solutions for now. Stable kernels do not
> support atomic transfers at all, that proper solution won't be backportab=
le.


There are a few issues here, but the issue Thierry and I are referring
to is the regression introduced by this change. Yes this exposes other
problems, but we first need to understand why this breaks resume in
general, regardless of what the PCIe driver is doing. I will look at
this a bit more later this week.

Cheers
Jon

--=20
nvpublic
