Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D09C62F3649
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 17:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbhALQ5y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 11:57:54 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:10954 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726113AbhALQ5y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jan 2021 11:57:54 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5ffdd4ea0004>; Tue, 12 Jan 2021 08:57:14 -0800
Received: from [10.2.51.38] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Jan
 2021 16:57:13 +0000
Subject: Re: [PATCH v2] i2c: tegra: Create i2c_writesl_vi() to use with VI I2C
 for filling TX FIFO
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <wsa@the-dreams.de>
CC:     <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <1610424379-23653-1-git-send-email-skomatineni@nvidia.com>
 <1610424379-23653-2-git-send-email-skomatineni@nvidia.com>
 <ae886d28-ef6c-63d3-2cc7-90752ddb8b21@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <c250dd2d-85fd-75a6-cdae-71e4300007de@nvidia.com>
Date:   Tue, 12 Jan 2021 08:57:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ae886d28-ef6c-63d3-2cc7-90752ddb8b21@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1610470634; bh=eTsq80xvHErNCHX7oY25e8Oek6tJ43yPX5zb7qFCFq0=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=esOA5kfG7JAnxbwMQhG7wOs4EfHquzIq8cfnMvwOB4fRMSwcioVHJexiz6J66RqXi
         bjkQxi/j+keQwoD9HQI6ABfXBviURbvjqjTtSFEs/Sh8w7EOVVAdOarQ3mtZUCKMGd
         IPAr4q4ycG+5OBBdfSo/t+MWAiOb/7YbpfaauLilYALJpR2HS3RLKBAJ5FHz6L799O
         sKwDm0bpXltHK7JIh1Kat9iFYGmPHRwQWKyzLA8lSDMEx8CuFS68pqhfpbfWRS3Ozc
         DjPqqzcxuLlVEuaxgmah0/pNP3LOec0I6vV0IqDosCsk36zZeqNJ2J1iIL5btAA6bZ
         LUwhbceWmcLOw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 1/11/21 9:56 PM, Dmitry Osipenko wrote:
> 12.01.2021 07:06, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> VI I2C don't have DMA support and uses PIO mode all the time.
>>
>> Current driver uses writesl() to fill TX FIFO based on available
>> empty slots and with this seeing strange silent hang during any I2C
>> register access after filling TX FIFO with 8 words.
>>
>> Using writel() followed by i2c_readl() in a loop to write all words
>> to TX FIFO instead of using writesl() helps for large transfers in
>> PIO mode.
>>
>> So, this patch creates i2c_writesl_vi() API to use with VI I2C for
>> filling TX FIFO.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 20 +++++++++++++++++++-
>>   1 file changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-teg=
ra.c
>> index 6f08c0c..e2b7503 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -339,6 +339,21 @@ static void i2c_writesl(struct tegra_i2c_dev *i2c_d=
ev, void *data,
>>   	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
>>   }
>>  =20
>> +static void i2c_writesl_vi(struct tegra_i2c_dev *i2c_dev, u32 *data,
>> +			   unsigned int reg, unsigned int len)
>> +{
>> +	/*
>> +	 * Using writesl() to fill VI I2C TX FIFO for transfers more than
>> +	 * 6 words is causing a silent hang on any VI I2C register access
>> +	 * after TX FIFO writes.
>> +	 * So using writel() followed by i2c_readl().
>> +	 */
>> +	while (len--) {
>> +		writel(*data++, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
>> +		i2c_readl(i2c_dev, I2C_INT_STATUS);
>> +	}
>> +}
>> +
>>   static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
>>   		       unsigned int reg, unsigned int len)
>>   {
>> @@ -811,7 +826,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_=
dev *i2c_dev)
>>   		i2c_dev->msg_buf_remaining =3D buf_remaining;
>>   		i2c_dev->msg_buf =3D buf + words_to_transfer * BYTES_PER_FIFO_WORD;
>>  =20
>> -		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
>> +		if (i2c_dev->is_vi)
>> +			i2c_writesl_vi(i2c_dev, (u32 *)buf, I2C_TX_FIFO, words_to_transfer);
>> +		else
>> +			i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
>>  =20
>>   		buf +=3D words_to_transfer * BYTES_PER_FIFO_WORD;
>>   	}
>>
> Looks almost good, could we please use a relaxed writel and avoid the cas=
ting in the code?
>
> Like this:
>
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 6f08c0c3238d..4f843b423d83 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -326,6 +326,8 @@ static void i2c_writel(struct tegra_i2c_dev *i2c_dev,=
 u32 val, unsigned int reg)
>   	/* read back register to make sure that register writes completed */
>   	if (reg !=3D I2C_TX_FIFO)
>   		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
> +	else
> +		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, I2C_INT_STAT=
US));
>   }
>  =20
>   static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
> @@ -339,6 +341,21 @@ static void i2c_writesl(struct tegra_i2c_dev *i2c_de=
v, void *data,
>   	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
>   }
>  =20
> +static void i2c_writesl_vi(struct tegra_i2c_dev *i2c_dev, void *data,
> +			   unsigned int reg, unsigned int len)
> +{
> +	u32 *data32 =3D data;
> +
> +	/*
> +	 * Using writesl() to fill VI I2C TX FIFO for transfers more than
> +	 * 6 words is causing a silent hang on any VI I2C register access
> +	 * after TX FIFO writes. Each write to FIFO should follow by a read
> +	 * of any I2C register in order to work around the problem.
> +	 */
> +	while (len--)
> +		i2c_writel(i2c_dev, *data32++, reg);
> +}
> +
>   static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
>   		       unsigned int reg, unsigned int len)
>   {
> @@ -811,7 +828,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_d=
ev *i2c_dev)
>   		i2c_dev->msg_buf_remaining =3D buf_remaining;
>   		i2c_dev->msg_buf =3D buf + words_to_transfer * BYTES_PER_FIFO_WORD;
>  =20
> -		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
> +		if (i2c_dev->is_vi)
> +			i2c_writesl_vi(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
> +		else
> +			i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
>  =20
>   		buf +=3D words_to_transfer * BYTES_PER_FIFO_WORD;
>   	}


Will have v3.

