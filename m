Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6FD32F1F90
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 20:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391198AbhAKTeB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 14:34:01 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:5775 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387466AbhAKTeB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Jan 2021 14:34:01 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5ffca8000002>; Mon, 11 Jan 2021 11:33:20 -0800
Received: from [10.2.51.38] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 Jan
 2021 19:33:19 +0000
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
 <6373bc13-a53d-2bb2-98f5-f6f01b0b8b69@nvidia.com>
 <c961f8a4-17dd-f90a-53f5-e33196627fb3@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <adc54bc1-f124-94ec-f509-92208beacdfb@nvidia.com>
Date:   Mon, 11 Jan 2021 11:33:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c961f8a4-17dd-f90a-53f5-e33196627fb3@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1610393600; bh=kmV152yoB/XFGT7dFyaHgChbvfgY9wLwSMIDi83Ucoc=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=gsgti1GCGsGAzBeQFe/YmGS7+8KkrR0OoaRjHXvKaNczuYQMDOMltL9h8eoAXityV
         /O0m8ArI7WhwyE7nTuKpvHg0S7Df2mSUUx/FBEY4hyPXSIjfsf5HmcP+BdTa/IWQN/
         8wwbRiUpY89fY4LfW3P3f3qaQGH/ND4hUxJjjKCNZyD3k0nFloLBj//0qhSobzpKqD
         PRndDhqgg1b851CD4C2V/j0togKGdiPyJK2thbld2Z86ZOaZ/AKi/SoXtJCgyiYyGA
         +lFb/576PUWYJVAuSib6UXYQVqcqi36E8nkWbomcm7UARAjQ7w6N2cu9OP0Zj/Bib0
         WVT8PMeiY/54g==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 1/11/21 11:29 AM, Dmitry Osipenko wrote:
> 11.01.2021 20:38, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 1/11/21 4:09 AM, Dmitry Osipenko wrote:
>>> 11.01.2021 14:50, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> 20.10.2020 19:37, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> On 10/20/20 12:48 AM, Thierry Reding wrote:
>>>>>> On Mon, Oct 19, 2020 at 09:03:54PM -0700, Sowjanya Komatineni wrote:
>>>>>>> VI I2C don't have DMA support and uses PIO mode all the time.
>>>>>>>
>>>>>>> Current driver uses writesl() to fill TX FIFO based on available
>>>>>>> empty slots and with this seeing strange silent hang during any I2C
>>>>>>> register access after filling TX FIFO with 8 words.
>>>>>>>
>>>>>>> Using writel() followed by i2c_readl() in a loop to write all words
>>>>>>> to TX FIFO instead of using writesl() helps for large transfers in
>>>>>>> PIO mode.
>>>>>>>
>>>>>>> So, this patch updates i2c_writesl() API to use writel() in a loop
>>>>>>> instead of writesl().
>>>>>>>
>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>> ---
>>>>>>>  =C2=A0=C2=A0 drivers/i2c/busses/i2c-tegra.c | 9 ++++++---
>>>>>>>  =C2=A0=C2=A0 1 file changed, 6 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>>>>>> b/drivers/i2c/busses/i2c-tegra.c
>>>>>>> index 6f08c0c..274bf3a 100644
>>>>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>>>>> @@ -333,10 +333,13 @@ static u32 i2c_readl(struct tegra_i2c_dev
>>>>>>> *i2c_dev, unsigned int reg)
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return readl_relaxed(i2c_dev-=
>base +
>>>>>>> tegra_i2c_reg_addr(i2c_dev, reg));
>>>>>>>  =C2=A0=C2=A0 }
>>>>>>>  =C2=A0=C2=A0 -static void i2c_writesl(struct tegra_i2c_dev *i2c_de=
v, void
>>>>>>> *data,
>>>>>>> +static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, u32 *data,
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 unsigned int reg, unsigned int len)
>>>>>>>  =C2=A0=C2=A0 {
>>>>>>> -=C2=A0=C2=A0=C2=A0 writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_=
dev, reg), data,
>>>>>>> len);
>>>>>>> +=C2=A0=C2=A0=C2=A0 while (len--) {
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel(*data++, i2c_dev=
->base + tegra_i2c_reg_addr(i2c_dev,
>>>>>>> reg));
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_readl(i2c_dev, I2C_=
INT_STATUS);
>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>>  =C2=A0=C2=A0 }
>>>>>>>  =C2=A0=C2=A0 =C2=A0 static void i2c_readsl(struct tegra_i2c_dev *i=
2c_dev, void
>>>>>>> *data,
>>>>>>> @@ -811,7 +814,7 @@ static int tegra_i2c_fill_tx_fifo(struct
>>>>>>> tegra_i2c_dev *i2c_dev)
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_d=
ev->msg_buf_remaining =3D buf_remaining;
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_d=
ev->msg_buf =3D buf + words_to_transfer *
>>>>>>> BYTES_PER_FIFO_WORD;
>>>>>>>  =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_write=
sl(i2c_dev, buf, I2C_TX_FIFO,
>>>>>>> words_to_transfer);
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_writesl(i2c_dev, (u=
32 *)buf, I2C_TX_FIFO,
>>>>>>> words_to_transfer);
>>>>>> I've thought a bit more about this and I wonder if we're simply
>>>>>> reading
>>>>>> out the wrong value for tx_fifo_avail and therefore end up overflowi=
ng
>>>>>> the TX FIFO. Have you checked what the value is for tx_fifo_avail wh=
en
>>>>>> this silent hang occurs? Given that this is specific to the VI I2C I=
'm
>>>>>> wondering if this is perhaps a hardware bug where we read the wrong =
TX
>>>>>> FIFO available count.
>>>>>>
>>>>>> Thierry
>>>>> Yes FIFO status shows all 8 slots available.
>>>> Please explain how you checked that 8 slots are available, provide
>>>> example code.
>>>>
>>> Have you checked the FIFO overflow interrupt?
>> This is seen with VI I2C (which is under host1x) as we use PIO mode
>> always even for large transfers.
>> HW wise VI I2C is similar to other I2C and FIFO depth is also 8 words.
>>
>> tegra_i2c_fill_tx_fifo() reads I2C_FIFO_STATUS register field
>> TX_FIFO_EMPTY_CNT which tells empty slots available in TX_FIFO that can
>> be filled.
>> Added debug message to print empty count and, during beginning of
>> transfer when it executes tegra_i2c_fill_tx_fifo(), empty slots are 8
>>
>>
>> Using writesl() for filling TX_FIFO causing silent hang immediate on any
>> i2c register access after filling FIFO with 8 words and some times with
>> 6 words as well.
>>
>> So couldn't INTERRUPT_STATUS registers to check for TX FIFO Overflows
>> when this silent hang happens.
>>
>> Tried to read thru back-door (JTAG path) but could not connect to JTAG
>> either. Looks like Tegra chip is in some weird state.
>>
>> But using writel() followed by i2c_readl helps. Not sure if any thing
>> related to register access delay or some other issue.
>>
>>
> Does downstream kernel have this problem?
>
> If there is really no good alternative right now, then perhaps should be
> a bit cleaner to add i2c_writesl_vi(), which should contain explanatory
> comment telling why it's needed and then it should be used only for the
> VI I2C controller.

Yes downstream also has same issue when using writesl() and downstream=20
vi i2c driver uses writel() followed by i2c_readl()

OK. Will create separate i2c_writesl_vi() to use with vi i2c and will=20
add comment in the code.

