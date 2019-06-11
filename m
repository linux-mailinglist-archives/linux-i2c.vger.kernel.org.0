Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71BAE3C549
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 09:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404013AbfFKHiN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 03:38:13 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:8895 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404480AbfFKHiN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jun 2019 03:38:13 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cff5a600000>; Tue, 11 Jun 2019 00:38:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 11 Jun 2019 00:38:10 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 11 Jun 2019 00:38:10 -0700
Received: from [10.19.65.14] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 11 Jun
 2019 07:38:06 +0000
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
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <fe0a0cb2-73e3-8f5c-8115-f99c150bd5df@nvidia.com>
Date:   Tue, 11 Jun 2019 00:38:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e733bcb0-ea8c-61d1-e6b5-cee8b7696c70@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560238688; bh=ZyPPJDNvO7cDnmdl/kTHgbcR7ae41C4gpQR83a0/vbo=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=V6rSEtASgNvCDYQjA/C42XVGp4xyB2wrxjw0xtgho6fRT/uAaDZVrweDBmT7C7kjc
         7/V2AW7CJa1PLj7McltTf17W2u5n5RNlKs+Cjh8AhLGRHq5Q4cDxkbqXbybrv1Tck0
         T67ghYqDLV6bpM2q785jsxkguhgZH4RTAIy9u8Ql1wfpBy3vNhq2gJTGiUqHW5ikKS
         c85XzF7EjIIfad8OT/D/DExWhdBBMjOej+cnj9AFc7CgKDKq5lAWZcs+NJTQsKcT0O
         soEjoyH1S/HQf6Y59kg6tW0b6EdBka1JfmdXPnc3GWKGzsSr2J8lqgdSfZCjbrh+w3
         uyL3Lxo8fTJqw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/10/19 2:00 PM, Dmitry Osipenko wrote:
> 10.06.2019 22:41, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>>
>> On 6/10/19 11:12 AM, Dmitry Osipenko wrote:
>>> 10.06.2019 20:08, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>>>> as needed. Remove BUG() and make Rx and Tx case handling
>>>> similar.
>>>>
>>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>>> ---
>>>>  =C2=A0 drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
>>>>  =C2=A0 1 file changed, 6 insertions(+), 5 deletions(-)
>>>
>>> Looks that this is still not correct. What if it transfer-complete flag
>>> is set and buffer is full on RX? In this case the transfer will succeed
>>> while it was a failure.
>>>
>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>>> b/drivers/i2c/busses/i2c-tegra.c
>>>> index 4dfb4c1..30619d6 100644
>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>> @@ -515,7 +515,6 @@ static int tegra_i2c_empty_rx_fifo(struct
>>>> tegra_i2c_dev *i2c_dev)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * prevent overwriting past the e=
nd of buf
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rx_fifo_avail > 0 && buf_remaining=
 > 0) {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(buf_remaining > 3);
>>>
>>> Actually error should be returned here since out-of-bounds memory
>>> accesses must be avoided, hence:
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0if (WARN_ON_ONCE(buf_remaining > 3))
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> buf_remaining will be less than equal to 3 because of the expression
>> earlier
>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-=
tegra.c#L520
>>
>=20
> Ah yes, indeed!
>=20
I see that I am wrong and buf_remaining > 3 needs to be prevented at

https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-teg=
ra.c#L528

because of word_to_transfer is limited to rx_fifo_avail:

https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-teg=
ra.c#L515

I shall add the check for less than 3 in both RX and TX cases in a=20
separate patch in this series.

>>
>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D i2c_re=
adl(i2c_dev, I2C_RX_FIFO);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D cpu_to=
_le32(val);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(buf, &v=
al, buf_remaining);
>>>> @@ -523,7 +522,6 @@ static int tegra_i2c_empty_rx_fifo(struct
>>>> tegra_i2c_dev *i2c_dev)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rx_fifo_avail-=
-;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 BUG_ON(rx_fifo_avail > 0 && buf_remaining =
> 0);
>>>
>>> Better not to ignore this as well:
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0if (WARN_ON_ONCE(rx_fifo_avail > 0 &&
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 buf_remaining > 0))
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>>
>> Please check below line.
>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-=
tegra.c#L532
>>
>>
>> It ensures that buf_remaining will be 0 and we never hit the BUG_ON as
>> follows:
>=20
> [1] Okay, but it doesn't ensure about rx_fifo_avail. So it could be:
>=20
> 	if (WARN_ON_ONCE(rx_fifo_avail))
> 		return -EINVAL;
I shall add the WARN_ON_ONCE.


>=20
>>>> -=C2=A0=C2=A0=C2=A0 BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_dev->msg_buf_remaining =3D buf_rem=
aining;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_dev->msg_buf =3D buf;
>>>>  =C2=A0 @@ -581,7 +579,6 @@ static int tegra_i2c_fill_tx_fifo(struct
>>>> tegra_i2c_dev *i2c_dev)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * boundary and fault.
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tx_fifo_avail > 0 && buf_remaining=
 > 0) {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(buf_remaining > 3);
>>>
>>> And here, cause this will corrupt stack:
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (WARN_ON_ONCE(buf_remain=
ing > 3))
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn -EINVAL;
>>>
>> Please check the line
>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-=
tegra.c#L576
>>
>>
>> It ensures buf_remaining will be less or equal to 3.
>=20
> Okay, agree here.
>=20
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(&val, b=
uf, buf_remaining);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D le32_t=
o_cpu(val);
>>>>  =C2=A0 @@ -850,7 +847,8 @@ static irqreturn_t tegra_i2c_isr(int irq, =
void
>>>> *dev_id)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (i2c_dev->msg_buf_remaining)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_i2c_empty_rx_fifo(i2c_dev);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 else
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BUG();
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 tegra_i2c_mask_irq(i2c_dev,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 I2C_INT_RX_FIFO_DATA_REQ);
>>>
>>> Then here:
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0if (WARN_ON_ONCE(!i2c_dev->msg_buf_remaining) =
||
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_i2c_empty_rx_fifo(i2c=
_dev)) {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_dev->msg_err |=3D I2C_E=
RR_UNKNOWN_INTERRUPT;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0}
>>>
>> Can you please elaborate why the condition needs to be as follows
>> instead of " if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) " ?
>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 if (WARN_ON_ONCE(!i2c_dev->msg_buf_remaining)=
 ||
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_i2c_empty_rx_fi=
fo(i2c_dev)) {
>=20
> Because this is a "receive" transfer and hence it is a error condition
> if the data-message was already fully received and then there is another
> request from hardware to receive more data. So
> "!i2c_dev->msg_buf_remaining" is the error condition here because there
> is no more space in the buffer.
>=20
> Looking at this again, seems checking for "if
> (WARN_ON_ONCE(rx_fifo_avail))" in the above hunk [1] will be already
> enough since a not fully drained RX FIFO means that there is no enough
> space in the buffer. Then it could be:
>=20
>          if (tegra_i2c_empty_rx_fifo(i2c_dev)) {
>                  i2c_dev->msg_err |=3D I2C_ERR_UNKNOWN_INTERRUPT;
>                  goto err;
> 	}
>=20
In the case "if (status & I2C_INT_PACKET_XFER_COMPLETE) {" , we do not=20
have any tegra_i2c_empty_rx_fifo call today. In this current driver I do=20
not see any code that checks for the buffer space and prevents RX FIFO=20
from being drained. The transfer complete when seen must have already=20
consumed all bytes of msg_buf_remaining in the call at the line

https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-teg=
ra.c#L860

So we can put the "WARN_ON_ONCE(i2c_dev->msg_buf_remaining) with msg_err=20
assignment and goto err" to confirm if some corner case is not handled.

Planning to share updated patch.

-Thanks,
  Bitan
