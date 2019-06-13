Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8CD843B4C
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 17:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729496AbfFMP1p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 11:27:45 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:9448 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728998AbfFMLd7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jun 2019 07:33:59 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0234a50000>; Thu, 13 Jun 2019 04:33:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 13 Jun 2019 04:33:57 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 13 Jun 2019 04:33:57 -0700
Received: from [10.19.65.14] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Jun
 2019 11:33:53 +0000
Subject: Re: [PATCH V4 6/6] i2c: tegra: remove BUG, BUG_ON
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
References: <1560186515-30797-1-git-send-email-bbiswas@nvidia.com>
 <1560186515-30797-6-git-send-email-bbiswas@nvidia.com>
 <06ab30b6-bf79-c628-0a04-d0307511a06f@gmail.com>
 <851d7837-5b98-228e-d8c9-3c41be1fb2e0@nvidia.com>
 <e733bcb0-ea8c-61d1-e6b5-cee8b7696c70@gmail.com>
 <fe0a0cb2-73e3-8f5c-8115-f99c150bd5df@nvidia.com>
 <d29804b9-d3be-9eb2-ba06-f4de2aad3764@gmail.com>
 <acb7970e-b1b2-ce14-d822-fc74ca7751fb@nvidia.com>
 <740f00e5-728a-e31d-28bb-193c7061753c@gmail.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <71e9eb84-2d40-7ab5-1667-782b4f071c07@nvidia.com>
Date:   Thu, 13 Jun 2019 04:33:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <740f00e5-728a-e31d-28bb-193c7061753c@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560425638; bh=jWPc8hDe9MexQqx03xl4xMiX9MXZbShAHv8g1nPRbxs=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=As2tnMMRFdLilgSDyFkuSo2BFzZdoKteXGZ2Vj9LGmtMngzbFwzKWvWgtMshyghfJ
         ZZgyF4RehdTWxIiPvd4Tooo/O/tF8Cblymq4aemgxZdycNjQCa8as7/L0fUQx0fro7
         GitDgbC7UV0Uk7aUtx0XE3xFwUL2yGO6sXvuMfY8yzHh2LKk/8iaj8xGGPYzGVVxjD
         JwQ3kDaHZZFAiYXI7efFbc44eqpExMTN3PNYsJy22pUwux84nLfWnwtfbzqVQ3laod
         Jwn+HKoMNxBSHoWeHIZ9zHXm8u+rxMjBoNUEiulml8QzLT5+vtxMmjuagfATtABg5k
         KWrvRlMbpIXrA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/12/19 6:33 AM, Dmitry Osipenko wrote:
> 11.06.2019 21:22, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>>
>> On 6/11/19 4:34 AM, Dmitry Osipenko wrote:
>>> 11.06.2019 10:38, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>
>>>>
>>>> On 6/10/19 2:00 PM, Dmitry Osipenko wrote:
>>>>> 10.06.2019 22:41, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>
>>>>>>
>>>>>> On 6/10/19 11:12 AM, Dmitry Osipenko wrote:
>>>>>>> 10.06.2019 20:08, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>>>>>>>> as needed. Remove BUG() and make Rx and Tx case handling
>>>>>>>> similar.
>>>>>>>>
>>>>>>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>>>>>>> ---
>>>>>>>>  =C2=A0=C2=A0=C2=A0 drivers/i2c/busses/i2c-tegra.c | 11 ++++++----=
-
>>>>>>>>  =C2=A0=C2=A0=C2=A0 1 file changed, 6 insertions(+), 5 deletions(-=
)
>>>>>>>
>>>>>>> Looks that this is still not correct. What if it transfer-complete
>>>>>>> flag
>>>>>>> is set and buffer is full on RX? In this case the transfer will
>>>>>>> succeed
>>>>>>> while it was a failure.
>>>>>>>
>>>>>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>>>>>>> b/drivers/i2c/busses/i2c-tegra.c
>>>>>>>> index 4dfb4c1..30619d6 100644
>>>>>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>>>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>>>>>> @@ -515,7 +515,6 @@ static int tegra_i2c_empty_rx_fifo(struct
>>>>>>>> tegra_i2c_dev *i2c_dev)
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * prevent overwr=
iting past the end of buf
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rx_fifo_avail > 0 =
&& buf_remaining > 0) {
>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(buf_remaining >=
 3);
>>>>>>>
>>>>>>> Actually error should be returned here since out-of-bounds memory
>>>>>>> accesses must be avoided, hence:
>>>>>>>
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (WARN_ON_ONCE(buf_remaining=
 > 3))
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIN=
VAL;
>>>>>> buf_remaining will be less than equal to 3 because of the expression
>>>>>> earlier
>>>>>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/=
i2c-tegra.c#L520
>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>> Ah yes, indeed!
>>>>>
>>>> I see that I am wrong and buf_remaining > 3 needs to be prevented at
>>>>
>>>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2=
c-tegra.c#L528
>>>>
>>>>
>>>>
>>>> because of word_to_transfer is limited to rx_fifo_avail:
>>>>
>>>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2=
c-tegra.c#L515
>>>>
>>>>
>>>>
>>>> I shall add the check for less than 3 in both RX and TX cases in a
>>>> separate patch in this series.
>>>
>>> When word_to_transfer is more than rx_fifo_avail, then the rx_fifo_avai=
l
>>> becomes zero and hence the nibbles won't be copied. Please take a close=
r
>>> look, the current code is correct, but the buf_remaining > 3 is unneede=
d
>>> because it can't ever happen.
>>>
>>> The code is structured the way that it's difficult to follow, apparentl=
y
>>> the person who added the BUG_ON check in the first place couldn't follo=
w
>>> it either. Maybe it's worth to invest some more effort into refactoring
>>> at least that part of the code. At minimum a clarifying comments would
>>> be helpful.
>>>
>> I shall try to add some comments near the BUG_ON check.
>>
>>> [snip]
>>>
>>>>>>> Then here:
>>>>>>>
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (WARN_ON_ONCE(!i2c_dev->msg=
_buf_remaining) ||
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_i2c_e=
mpty_rx_fifo(i2c_dev)) {
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_dev->ms=
g_err |=3D I2C_ERR_UNKNOWN_INTERRUPT;
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err;
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>>>>>>>
>>>>>> Can you please elaborate why the condition needs to be as follows
>>>>>> instead of " if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) " ?
>>>>>>
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (WARN_ON_ONCE(!i2c_dev->ms=
g_buf_remaining) ||
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra=
_i2c_empty_rx_fifo(i2c_dev)) {
>>>>>
>>>>> Because this is a "receive" transfer and hence it is a error conditio=
n
>>>>> if the data-message was already fully received and then there is
>>>>> another
>>>>> request from hardware to receive more data. So
>>>>> "!i2c_dev->msg_buf_remaining" is the error condition here because the=
re
>>>>> is no more space in the buffer.
>>>>>
>>>>> Looking at this again, seems checking for "if
>>>>> (WARN_ON_ONCE(rx_fifo_avail))" in the above hunk [1] will be already
>>>>> enough since a not fully drained RX FIFO means that there is no enoug=
h
>>>>> space in the buffer. Then it could be:
>>>>>
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tegra_i2c=
_empty_rx_fifo(i2c_dev)) {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_dev->msg_err |=3D I2C_ERR_UNKNOWN_=
INTERRUPT;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>>>>>
>>>> In the case "if (status & I2C_INT_PACKET_XFER_COMPLETE) {" , we do not
>>>> have any tegra_i2c_empty_rx_fifo call today. In this current driver I =
do
>>>> not see any code that checks for the buffer space and prevents RX FIFO
>>>> from being drained. The transfer complete when seen must have already
>>>> consumed all bytes of msg_buf_remaining in the call at the line
>>>>
>>>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2=
c-tegra.c#L860
>>>>
>>>>
>>>>
>>>> So we can put the "WARN_ON_ONCE(i2c_dev->msg_buf_remaining) with msg_e=
rr
>>>> assignment and goto err" to confirm if some corner case is not handled=
.
>>>>
>>>> Planning to share updated patch.
>>>
>>> There are two possible error conditions:
>>>
>>> 1) Underflow: the XFER_COMPLETE happens before message is fully sent.
>>>
>>> 2) Overflow: message is fully sent, but there is no XFER_COMPLETE and
>>> then hardware asks to transfer more.
>>>
>>> We are addressing the second case here, while you seems are confusing i=
t
>>> with the first case.
>>>
>> Is the Overflow case pointed above corresponding to when
>> msg_buf_remaining is zero?
>=20
> Yes!
>=20
OK.

>   If no, what indicates that message is fully
>> sent? I see that if msg_buf_remaining is already zero, the call
>> tegra_i2c_empty_rx_fifo will not do any copy of the bytes from FIFO to b=
uf.
>>
>> One more point that is not clear to me is are the above suggestions you
>> made is corresponding to replacing below line in linux-next ?
>>
>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-=
tegra.c#L888
>=20
> That addresses the "underflow" case. I'm not suggesting to replace it at
> all. I was talking about replacing this and nothing else:
>=20
> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-t=
egra.c#L862
I would update the patch for the Overflow case around the line 862 pointed.


>=20
>> Can you please also review the newly added patch "V5 6/7 "that was newly
>> posted? I think it is needed.
>=20
> Sure.
>=20
Thanks. Based on your review plan to abandon the patch "V5 6/7".

-regards,
  Bitan

