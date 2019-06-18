Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41E42498FE
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2019 08:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbfFRGm2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jun 2019 02:42:28 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:16185 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbfFRGm0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jun 2019 02:42:26 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0874fc0000>; Mon, 17 Jun 2019 22:22:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 17 Jun 2019 22:22:03 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 17 Jun 2019 22:22:03 -0700
Received: from [10.19.65.14] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 05:22:00 +0000
Subject: Re: [PATCH V5 6/7] i2c: tegra: fix PIO rx/tx residual transfer check
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
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
 <1560250274-18499-6-git-send-email-bbiswas@nvidia.com>
 <42ce2523-dab9-0cdf-e8ff-42631dd161b7@gmail.com>
 <78140337-dca0-e340-a501-9e37eca6cc87@nvidia.com>
 <9cb7123a-1ebd-3a93-60dc-c8f57f60270b@gmail.com>
 <e795ddcf-dd11-4e39-2a94-b663e5ecb35b@nvidia.com>
 <d2c97291-6392-d614-5cd9-1490a816548c@gmail.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <87b38915-3b2d-9484-e33e-eeacb3746c75@nvidia.com>
Date:   Mon, 17 Jun 2019 22:21:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <d2c97291-6392-d614-5cd9-1490a816548c@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560835324; bh=woogEWFYrC0moysa3wzNl7oK1UHsHbN3eH7N+d7q6yc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=k96W7kFdznyim8y9BZ+rdxtP39YESejnbdafkvCuu7Ay90MxdbkGEvR77jTmwo9R1
         cojCXySqv0/fTYfaX/pZ9lApqe2EUdz0Gun1VTlDbZCmXo0mlJFv9niAbLGXBCyn6y
         qiW9EKcJS+nTZsrrCseaikMYwiTIvdsg2eWgqCbnA5S8uA9uV5oY98BC/j0GgkYt9b
         9s/T0CITT9laDnS5DiDWr4SjA2xgVAY0Yg9z6BMgdqMTLuKcJsVxmg6rJdhX1M5nfc
         GGt1DfGSt2gFXaotO+9jk8ynXz6/EkV5ghftpc4wE3rHwVT1gs1/I3uvuWe1/yMd91
         qrCzfuM485vzA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/14/19 6:02 AM, Dmitry Osipenko wrote:
> 14.06.2019 12:50, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>>
>> On 6/13/19 5:28 AM, Dmitry Osipenko wrote:
>>> 13.06.2019 14:30, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>
>>>>
>>>> On 6/12/19 7:30 AM, Dmitry Osipenko wrote:
>>>>> 11.06.2019 13:51, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>> Fix expression for residual bytes(less than word) transfer
>>>>>> in I2C PIO mode RX/TX.
>>>>>>
>>>>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>>>>> ---
>>>>>
>>>>> [snip]
>>>>>
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Update state bef=
ore writing to FIFO.=C2=A0 If this casues us
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Update state bef=
ore writing to FIFO.=C2=A0 If this causes us
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
* to finish writing all bytes (AKA buf_remaining goes to
>>>>>> 0) we
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
* have a potential for an interrupt (PACKET_XFER_COMPLETE is
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * not maskable).=
=C2=A0 We need to make sure that the isr sees
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * buf_remaining as=
 0 and doesn't call us back re-entrantly.
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * not maskable).
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
*/
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf_re=
maining -=3D words_to_transfer * BYTES_PER_FIFO_WORD;
>>>>>
>>>>> Looks like the comment could be removed altogether because it doesn't
>>>>> make sense since interrupt handler is under xfer_lock which is kept
>>>>> locked during of tegra_i2c_xfer_msg().
>>>> I would push a separate patch to remove this comment because of
>>>> xfer_lock in ISR now.
>>>>
>>>>>
>>>>> Moreover the comment says that "PACKET_XFER_COMPLETE is not maskable"=
,
>>>>> but then what I2C_INT_PACKET_XFER_COMPLETE masking does?
>>>>>
>>>> I2C_INT_PACKET_XFER_COMPLETE masking support available in Tegra chips
>>>> newer than Tegra30 allows one to not see interrupt after Packet transf=
er
>>>> complete. With the xfer_lock in ISR the scenario discussed in comment
>>>> can be ignored.
>>>
>>> Also note that xfer_lock could be removed and replaced with a just
>>> irq_enable/disable() calls in tegra_i2c_xfer_msg() because we only care
>>> about IRQ not firing during of the preparation process.
>> This should need sufficient testing hence let us do it in a different se=
ries.
>=20
> I don't think that there is much to test here since obviously it should w=
ork.
>=20
I shall push a patch for this as basic i2c read write test passed.

>>>
>>> It also looks like tegra_i2c_[un]nmask_irq isn't really needed and all
>>> IRQ's could be simply unmasked during the driver's probe, in that case
>>> it may worth to add a kind of "in-progress" flag to catch erroneous
>>> interrupts.
>>>
>> TX interrupt needs special handling if this change is done. Hence I thin=
k it should be
>> taken up after sufficient testing in a separate patch.
>=20
> This one is indeed a bit more trickier. Probably another alternative coul=
d be to keep GIC
> interrupt disabled while no transfer is performed, then you'll have to re=
quest interrupt
> in a disabled state using IRQ_NOAUTOEN flag.
>=20
> And yes, that all should be a separate changes if you're going to impleme=
nt them.
>=20
OK

-Thanks,
  Bitan

