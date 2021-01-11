Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18D5B2F1CA4
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 18:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389801AbhAKRjH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 12:39:07 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6674 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728222AbhAKRjG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Jan 2021 12:39:06 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5ffc8d120001>; Mon, 11 Jan 2021 09:38:26 -0800
Received: from [10.2.51.38] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 Jan
 2021 17:38:25 +0000
Subject: Re: [PATCH v1] i2c: tegra: Fix i2c_writesl() to use writel() instead
 of writesl()
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
References: <1603166634-13639-1-git-send-email-skomatineni@nvidia.com>
 <20201020074846.GA1877013@ulmo>
 <538d8436-260d-40a8-b0a3-a822a0f9c909@nvidia.com>
 <c37f8618-5100-4087-3bc3-fe421d40f3b8@gmail.com>
 <2212a21b-7dff-4ba0-a193-badd5a1770c8@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <6373bc13-a53d-2bb2-98f5-f6f01b0b8b69@nvidia.com>
Date:   Mon, 11 Jan 2021 09:38:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2212a21b-7dff-4ba0-a193-badd5a1770c8@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1610386706; bh=MSUbQcdtbYvVnN/kvsd5vBI0hvqwlEgPoy2ZjaKkqeM=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=Q14YgeYeBiQjf7c0AK9pN/oWtK7gj1MRhs1be99WyE5XB54wtoAHNsHNrkGp9MI+X
         8DO3l/6PsEGOfg6WFoF2P69nIyewVYZaTWMMVGhzxiUlAxOZ89RrJ70rIG0uELvxZ3
         +a7WJ/4pzqswveRxdwwTkAkDz0t4PrEzOovdmOShNy94IieU4DKgXibmC1ioXILfKE
         CSWbWUCbJ2ivb2HzT4NpzPvzobFd9KgXyF3vjcXsoshyaza/igKTpigQKvm3YchrIH
         2VU61bplILlikosMr0hJ3ji+bmtf1TB7DySM/eBgCnd4EydavKZGGfc+6jqD4AEMfg
         9su69UVNMd9Fw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 1/11/21 4:09 AM, Dmitry Osipenko wrote:
> 11.01.2021 14:50, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 20.10.2020 19:37, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 10/20/20 12:48 AM, Thierry Reding wrote:
>>>> On Mon, Oct 19, 2020 at 09:03:54PM -0700, Sowjanya Komatineni wrote:
>>>>> VI I2C don't have DMA support and uses PIO mode all the time.
>>>>>
>>>>> Current driver uses writesl() to fill TX FIFO based on available
>>>>> empty slots and with this seeing strange silent hang during any I2C
>>>>> register access after filling TX FIFO with 8 words.
>>>>>
>>>>> Using writel() followed by i2c_readl() in a loop to write all words
>>>>> to TX FIFO instead of using writesl() helps for large transfers in
>>>>> PIO mode.
>>>>>
>>>>> So, this patch updates i2c_writesl() API to use writel() in a loop
>>>>> instead of writesl().
>>>>>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>>  =C2=A0 drivers/i2c/busses/i2c-tegra.c | 9 ++++++---
>>>>>  =C2=A0 1 file changed, 6 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>>>> b/drivers/i2c/busses/i2c-tegra.c
>>>>> index 6f08c0c..274bf3a 100644
>>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>>> @@ -333,10 +333,13 @@ static u32 i2c_readl(struct tegra_i2c_dev
>>>>> *i2c_dev, unsigned int reg)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return readl_relaxed(i2c_dev->base +
>>>>> tegra_i2c_reg_addr(i2c_dev, reg));
>>>>>  =C2=A0 }
>>>>>  =C2=A0 -static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void =
*data,
>>>>> +static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, u32 *data,
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned int reg, unsigned int len)
>>>>>  =C2=A0 {
>>>>> -=C2=A0=C2=A0=C2=A0 writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_de=
v, reg), data,
>>>>> len);
>>>>> +=C2=A0=C2=A0=C2=A0 while (len--) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel(*data++, i2c_dev->=
base + tegra_i2c_reg_addr(i2c_dev,
>>>>> reg));
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_readl(i2c_dev, I2C_IN=
T_STATUS);
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>  =C2=A0 }
>>>>>  =C2=A0 =C2=A0 static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, =
void *data,
>>>>> @@ -811,7 +814,7 @@ static int tegra_i2c_fill_tx_fifo(struct
>>>>> tegra_i2c_dev *i2c_dev)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_dev->msg_=
buf_remaining =3D buf_remaining;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_dev->msg_=
buf =3D buf + words_to_transfer *
>>>>> BYTES_PER_FIFO_WORD;
>>>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_writesl(i2c_d=
ev, buf, I2C_TX_FIFO, words_to_transfer);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_writesl(i2c_dev, (u32=
 *)buf, I2C_TX_FIFO,
>>>>> words_to_transfer);
>>>> I've thought a bit more about this and I wonder if we're simply readin=
g
>>>> out the wrong value for tx_fifo_avail and therefore end up overflowing
>>>> the TX FIFO. Have you checked what the value is for tx_fifo_avail when
>>>> this silent hang occurs? Given that this is specific to the VI I2C I'm
>>>> wondering if this is perhaps a hardware bug where we read the wrong TX
>>>> FIFO available count.
>>>>
>>>> Thierry
>>> Yes FIFO status shows all 8 slots available.
>> Please explain how you checked that 8 slots are available, provide
>> example code.
>>
> Have you checked the FIFO overflow interrupt?

This is seen with VI I2C (which is under host1x) as we use PIO mode=20
always even for large transfers.
HW wise VI I2C is similar to other I2C and FIFO depth is also 8 words.

tegra_i2c_fill_tx_fifo() reads I2C_FIFO_STATUS register field=20
TX_FIFO_EMPTY_CNT which tells empty slots available in TX_FIFO that can=20
be filled.
Added debug message to print empty count and, during beginning of=20
transfer when it executes tegra_i2c_fill_tx_fifo(), empty slots are 8


Using writesl() for filling TX_FIFO causing silent hang immediate on any=20
i2c register access after filling FIFO with 8 words and some times with=20
6 words as well.

So couldn't INTERRUPT_STATUS registers to check for TX FIFO Overflows=20
when this silent hang happens.

Tried to read thru back-door (JTAG path) but could not connect to JTAG=20
either. Looks like Tegra chip is in some weird state.

But using writel() followed by i2c_readl helps. Not sure if any thing=20
related to register access delay or some other issue.


