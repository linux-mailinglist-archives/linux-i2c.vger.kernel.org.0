Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A8A22940A8
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Oct 2020 18:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733265AbgJTQiY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Oct 2020 12:38:24 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:15942 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728837AbgJTQiY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Oct 2020 12:38:24 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f8f12220002>; Tue, 20 Oct 2020 09:36:50 -0700
Received: from [10.2.48.229] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct
 2020 16:38:23 +0000
Subject: Re: [PATCH v1] i2c: tegra: Fix i2c_writesl() to use writel() instead
 of writesl()
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <digetx@gmail.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <1603166634-13639-1-git-send-email-skomatineni@nvidia.com>
 <20201020074846.GA1877013@ulmo>
 <538d8436-260d-40a8-b0a3-a822a0f9c909@nvidia.com>
Message-ID: <d880a7b1-28e2-1bfc-2ba7-a7139455b890@nvidia.com>
Date:   Tue, 20 Oct 2020 09:39:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <538d8436-260d-40a8-b0a3-a822a0f9c909@nvidia.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603211811; bh=MtaU68vTjnAu/ibJOUXO8MYkZUIwYmMk+2uQWXcPQ7Q=;
        h=Subject:From:To:CC:References:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=MN02MJJdJkNwpkfm0GLLSESW9K1j0E8ulX5qcyky/TvE0/IVMkE32aQkYDFpFuJxO
         c0Syw232lnPLp6YLKOvPcW1Lw+xbTgxiXk8qity0OjS9o4+D/xvNCZjcNmGILDGj+G
         wOTaabW2c7KHaFE30LNUmLPgZDlKCCnwkls3L/EYjO4f92X6lZIFNhA3jrAKBJKrOn
         4rKSmMkY79Mp5uG9VEefJI8hdmj5iqOjGFVhPq4x6I5xqL/2chc5zb9qqNhza5iwZh
         YNd73hzd4ov2gdLT/Cg/4Ato7q8Ef+Ffm+ci6T5D7J2iEKf2caEOWLDPCzTqOj4Y70
         Gmw/YfiZ7j7cA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 10/20/20 9:37 AM, Sowjanya Komatineni wrote:
>
> On 10/20/20 12:48 AM, Thierry Reding wrote:
>> On Mon, Oct 19, 2020 at 09:03:54PM -0700, Sowjanya Komatineni wrote:
>>> VI I2C don't have DMA support and uses PIO mode all the time.
>>>
>>> Current driver uses writesl() to fill TX FIFO based on available
>>> empty slots and with this seeing strange silent hang during any I2C
>>> register access after filling TX FIFO with 8 words.
>>>
>>> Using writel() followed by i2c_readl() in a loop to write all words
>>> to TX FIFO instead of using writesl() helps for large transfers in
>>> PIO mode.
>>>
>>> So, this patch updates i2c_writesl() API to use writel() in a loop
>>> instead of writesl().
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>> =A0 drivers/i2c/busses/i2c-tegra.c | 9 ++++++---
>>> =A0 1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-tegra.c=20
>>> b/drivers/i2c/busses/i2c-tegra.c
>>> index 6f08c0c..274bf3a 100644
>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> @@ -333,10 +333,13 @@ static u32 i2c_readl(struct tegra_i2c_dev=20
>>> *i2c_dev, unsigned int reg)
>>> =A0=A0=A0=A0=A0 return readl_relaxed(i2c_dev->base +=20
>>> tegra_i2c_reg_addr(i2c_dev, reg));
>>> =A0 }
>>> =A0 -static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
>>> +static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, u32 *data,
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 unsigned int reg, unsigned int =
len)
>>> =A0 {
>>> -=A0=A0=A0 writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), da=
ta,=20
>>> len);
>>> +=A0=A0=A0 while (len--) {
>>> +=A0=A0=A0=A0=A0=A0=A0 writel(*data++, i2c_dev->base + tegra_i2c_reg_ad=
dr(i2c_dev,=20
>>> reg));
>>> +=A0=A0=A0=A0=A0=A0=A0 i2c_readl(i2c_dev, I2C_INT_STATUS);
>>> +=A0=A0=A0 }
>>> =A0 }
>>> =A0 =A0 static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *dat=
a,
>>> @@ -811,7 +814,7 @@ static int tegra_i2c_fill_tx_fifo(struct=20
>>> tegra_i2c_dev *i2c_dev)
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 i2c_dev->msg_buf_remaining =3D buf_remainin=
g;
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 i2c_dev->msg_buf =3D buf + words_to_transfe=
r *=20
>>> BYTES_PER_FIFO_WORD;
>>> =A0 -=A0=A0=A0=A0=A0=A0=A0 i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words=
_to_transfer);
>>> +=A0=A0=A0=A0=A0=A0=A0 i2c_writesl(i2c_dev, (u32 *)buf, I2C_TX_FIFO,=20
>>> words_to_transfer);
>> I've thought a bit more about this and I wonder if we're simply reading
>> out the wrong value for tx_fifo_avail and therefore end up overflowing
>> the TX FIFO. Have you checked what the value is for tx_fifo_avail when
>> this silent hang occurs? Given that this is specific to the VI I2C I'm
>> wondering if this is perhaps a hardware bug where we read the wrong TX
>> FIFO available count.
>>
>> Thierry
>
> Yes FIFO status shows all 8 slots available.

To be clear, TX slots availability in FIFO status before filling shows 8=20
words empty.

With writesl() when silent hang is seen, couldn't access any registers=20
and with debug messages I see silent hang happens immediate during=20
accessing any of i2c controller register after writesl() call

>
> Also, HW wise VI I2C is similar to other I2C and FIFO depth is also 8=20
> words. Confirmed from HW designers as well.
>
> Using writesl() causes silent hang after filling some words in FIFO=20
> and most of time after filling 8 words and sometime after filling it=20
> with around 6 words.
>
> I am not sure if this issue is specific to VI I2C alone as other I2C=20
> mostly use DMA for more than 8 words and I am not sure if we ever used=20
> other I2C in PIO mode for ~8 words transfer for slave devices we have=20
> on the platform.
>
>
> Thanks
>
> Sowjanya
>
