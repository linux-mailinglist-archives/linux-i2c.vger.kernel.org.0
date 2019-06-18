Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9825A49857
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2019 06:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbfFRE33 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jun 2019 00:29:29 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:9676 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfFRE33 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jun 2019 00:29:29 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0868a70000>; Mon, 17 Jun 2019 21:29:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 17 Jun 2019 21:29:27 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 17 Jun 2019 21:29:27 -0700
Received: from [10.19.65.14] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 04:29:23 +0000
Subject: Re: [PATCH V7] i2c: tegra: remove BUG, BUG_ON
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
References: <1560748152-6575-1-git-send-email-bbiswas@nvidia.com>
 <5a8ad23f-33c8-5140-cef8-f9cef70764b1@gmail.com>
 <43a3fae8-dd3e-c7d3-42a7-493210e601e2@nvidia.com>
 <070ee927-be5a-327f-36d7-e6395c898574@gmail.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <6ff6c8c8-7978-2662-266c-6122c5e2969b@nvidia.com>
Date:   Mon, 17 Jun 2019 21:29:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <070ee927-be5a-327f-36d7-e6395c898574@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560832168; bh=+nNlYKr643t5w63TkytxJdKwNydrIe2wDqhHK0Tp4tg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=e6Tkq5WmOo4FewQZKH2L985ZI1MZ57QMovhkmTx17tsGtpVTuqhGYKQ9Wu41USJ0a
         WGNLyccxFPnaOo/xXdYDMy2JwFi9w5iULZ3RliQHWSUVqD7XNOxJrINzJmn/twkjot
         K+sF6K0aujEghUTdmHB5kRDKuQBgFG8hMj8wmRtJ5MziiKBCSe8TOGJjfRbu9XC66D
         vi0Hm4b6b3k74jJamiwTU5GuX1oMG8TLoCUwHtsut1u4hQeCAd6PZB4JbFIxEzvBBE
         mdIx0WPmHkORUp2n7djhFrTklNPM0C017Wfu2Xu0VF45PT6YYiu1vTZUUMDBRdV8BZ
         wge+CbzHKge5A==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/17/19 12:28 PM, Dmitry Osipenko wrote:
> 17.06.2019 21:41, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>>
>> On 6/17/19 5:13 AM, Dmitry Osipenko wrote:
>>> 17.06.2019 8:09, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> Remove BUG, BUG_ON as it makes system usable:
>>>>  =C2=A0 - Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>>>>  =C2=A0=C2=A0=C2=A0 as needed.
>>>>  =C2=A0 - Remove BUG() and mask Rx interrupt similar as Tx
>>>>  =C2=A0=C2=A0=C2=A0 for message fully sent case.
>>>>  =C2=A0 - Add caller error handling and WARN_ON_ONCE check for non-zer=
o
>>>>  =C2=A0=C2=A0=C2=A0 rx_fifo_avail in tegra_i2c_empty_rx_fifo() after a=
ll processing.
>>>
>>> The commit message should describe motivation of the change and not the=
 change itself,
>>> unless it's some additional information which is required for better un=
derstanding of
>>> the code.
>>>
>>> In yours case it could be something like that:
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 The usage of BUG() macro is generally discour=
aged in kernel, unless
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 it's a problem that results in a physical dam=
age or loss of data.
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 This patch removes unnecessary BUG() macros a=
nd replaces the rest
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 with a warnings.
>> I shall update as per above comments.
>>
>>>
>>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>>> ---
>>>>  =C2=A0 drivers/i2c/busses/i2c-tegra.c | 45 ++++++++++++++++++++++++++=
++++++++--------
>>>>  =C2=A0 1 file changed, 37 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-t=
egra.c
>>>> index 4dfb4c1..b155b61 100644
>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>> @@ -73,6 +73,7 @@
>>>>  =C2=A0 #define I2C_ERR_NO_ACK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>>>>  =C2=A0 #define I2C_ERR_ARBITRATION_LOST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(1)
>>>>  =C2=A0 #define I2C_ERR_UNKNOWN_INTERRUPT=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(2)
>>>> +#define I2C_ERR_RX_BUFFER_OVERFLOW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 BIT(3)
>>>>  =C2=A0 =C2=A0 #define PACKET_HEADER0_HEADER_SIZE_SHIFT=C2=A0=C2=A0=C2=
=A0 28
>>>>  =C2=A0 #define PACKET_HEADER0_PACKET_ID_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 16
>>>> @@ -515,7 +516,11 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i=
2c_dev *i2c_dev)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * prevent overwriting past the e=
nd of buf
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rx_fifo_avail > 0 && buf_remaining=
 > 0) {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(buf_remaining > 3);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * buf_remaining > 3 =
check not needed as rx_fifo_avail =3D=3D 0
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * when (words_to_tra=
nsfer was > rx_fifo_avail) earlier
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * in this function.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D i2c_re=
adl(i2c_dev, I2C_RX_FIFO);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D cpu_to=
_le32(val);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(buf, &v=
al, buf_remaining);
>>>> @@ -523,7 +528,15 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i=
2c_dev *i2c_dev)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rx_fifo_avail-=
-;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 BUG_ON(rx_fifo_avail > 0 && buf_remaining =
> 0);
>>>> +=C2=A0=C2=A0=C2=A0 if ((!(i2c_dev->msg_buf_remaining)) &&
>>>
>>> The RX FIFO shall be drained completely no matter what.
>>>
>>> Hence why the "i2c_dev->msg_buf_remaining" checking is needed here?
>> I moved the part of below condition in Patch V6 to function tegra_i2c_em=
pty_rx_fifo:
>>
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 er=
r_val =3D tegra_i2c_empty_rx_fifo(i2c_dev);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 ((!(i2c_dev->msg_buf_remaining)) &&
>>
>>> Let's move this check into tegra_i2c_empty_rx_fifo() and return -EINVAL=
 for that case.
>>> This will make code to look cleaner.
>>
>> Is above condition not needed?
>=20
> Let's put it at the very beginning. This may give a bit more information =
about the
> problem by knowing if the offending overflow happens after or during of t=
he buffer's
> fill up.
>=20
> static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
> {
> 	u32 val;
> 	int rx_fifo_avail;
> 	u8 *buf =3D i2c_dev->msg_buf;
> 	size_t buf_remaining =3D i2c_dev->msg_buf_remaining;
> 	int words_to_transfer;
>=20
> 	if (WARN_ON(!i2c_dev->msg_buf_remaining))
> 		return -EINVAL;
> ...
>=20
OK

> In general, the original logic should be preserved during of refactoring.=
 In this case
> we are keeping the original check and then also making it a bit more info=
rmative.
>=20
I feel the msg_buf_remaining check was not there in original code. The=20
corresponding line was probably the following checking for error when=20
(buf_remaining > 0) after all work in the function tegra_i2c_empty_rx_fifo(=
)

https://elixir.bootlin.com/linux/v5.2-rc5/source/drivers/i2c/busses/i2c-teg=
ra.c#L536



>>
>>>
>>> Secondly, in the future please don't add parens where they are not need=
ed. In this
>>> case parens around !i2c_dev->msg_buf_remaining are not needed at all.
>>>
>> I shall look out for similar unnecessary parentheses and update the patc=
h.
>=20
> Yes, please clean up all the occurrences in the code if there are any. An=
d please do
> it in a separate patch.
>=20
I reviewed the source for unnecessary parentheses and do not find any.=20
Hence not planning to push any patch. Let me know if I missed a case.

-Thanks,
  Bitan
