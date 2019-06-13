Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C70A43D02
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 17:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbfFMPic (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 11:38:32 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:1466 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731949AbfFMJ7d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jun 2019 05:59:33 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d021e840000>; Thu, 13 Jun 2019 02:59:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 13 Jun 2019 02:59:31 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 13 Jun 2019 02:59:31 -0700
Received: from [10.19.65.14] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Jun
 2019 09:59:28 +0000
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
 <b6b24358-36a0-af98-1b29-9a622baa9600@gmail.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <3899af9b-07b0-8a76-e343-82871d3eb19a@nvidia.com>
Date:   Thu, 13 Jun 2019 02:59:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <b6b24358-36a0-af98-1b29-9a622baa9600@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560419972; bh=bu6PFhdzRuGZwYqZ+hVK3B1DLO4p//ihuWYhcH3V6uw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Ybzhhpu+/qkKOpkhN12f+D5btArqQfhaBZ/NT8YiFVEknM8QPYJzXABGQso5KeMYH
         0iOwme7ANbGZMFZObYeWEpglsYSRsbeLnumsArQpDkAQ6UXgCb9hF6JKROYa+kFXkb
         b2UtUbkVF9Ew+1DS3bhv+sVY1LtfoiWOFrH+92QcJ2KLycR2syLOD5egBs8auYtJma
         i4zFRQJwh4cAfJkKUlzm7epqW0UcvmTkWkwzpLhe08ekTtb0TRJAr/wFlkr4DcZgFK
         OityH7PHsuV14P0GoLQ/WkH6own9A3xKx8124ro4422HZDGQNcCMFGkFjlXtY8oJtx
         JemuZbJ1yR9jQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/12/19 6:55 AM, Dmitry Osipenko wrote:
> 11.06.2019 13:51, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Fix expression for residual bytes(less than word) transfer
>> in I2C PIO mode RX/TX.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-teg=
ra.c
>> index 4dfb4c1..0596c12 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -514,7 +514,8 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_=
dev *i2c_dev)
>>   	 * If there is a partial word at the end of buf, handle it manually t=
o
>>   	 * prevent overwriting past the end of buf
>>   	 */
>> -	if (rx_fifo_avail > 0 && buf_remaining > 0) {
>> +	if (rx_fifo_avail > 0 &&
>> +	    (buf_remaining > 0 && buf_remaining < BYTES_PER_FIFO_WORD)) {
>=20
> The buf_remaining >=3D BYTES_PER_FIFO_WORD is not possible to happen
> because there are three possible cases:
>=20
> 1) buf_remaining > rx_fifo_avail * 4:
>=20
> 	In this case rx_fifo_avail =3D 0
>=20
> 2) buf_remaining < rx_fifo_avail * 4;
>=20
> 	In this case buf_remaining is always < 4 because
> 	words_to_transfer is a buf_remaining rounded down to 4
> 	and then divided by 4. Hence:
>=20
> 	buf_remaining -=3D (buf_remaining / 4) * 4 always results
> 	into buf_remaining < 4.
>=20
> 3) buf_remaining =3D=3D rx_fifo_avail * 4:
>=20
> 	In this case rx_fifo_avail =3D 0 and buf_remaining =3D 0.
>=20
> Case 2 should never happen and means that something gone wrong.
>=20
Yes I now agree with you. The first condition "rx_fifo_avail > 0"=20
failure will take care and prevent need for additional checks.

>>   		BUG_ON(buf_remaining > 3);
>>   		val =3D i2c_readl(i2c_dev, I2C_RX_FIFO);
>>   		val =3D cpu_to_le32(val);
>> @@ -557,11 +558,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c=
_dev *i2c_dev)
>>   			words_to_transfer =3D tx_fifo_avail;
>>  =20
>>   		/*
>> -		 * Update state before writing to FIFO.  If this casues us
>> +		 * Update state before writing to FIFO.  If this causes us
>>   		 * to finish writing all bytes (AKA buf_remaining goes to 0) we
>>   		 * have a potential for an interrupt (PACKET_XFER_COMPLETE is
>> -		 * not maskable).  We need to make sure that the isr sees
>> -		 * buf_remaining as 0 and doesn't call us back re-entrantly.
>> +		 * not maskable).
>>   		 */
>>   		buf_remaining -=3D words_to_transfer * BYTES_PER_FIFO_WORD;
>>   		tx_fifo_avail -=3D words_to_transfer;
>> @@ -580,7 +580,8 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_d=
ev *i2c_dev)
>>   	 * prevent reading past the end of buf, which could cross a page
>>   	 * boundary and fault.
>>   	 */
>> -	if (tx_fifo_avail > 0 && buf_remaining > 0) {
>> +	if (tx_fifo_avail > 0 &&
>> +	    (buf_remaining > 0 && buf_remaining < BYTES_PER_FIFO_WORD)) {
>>   		BUG_ON(buf_remaining > 3);
>>   		memcpy(&val, buf, buf_remaining);
>>   		val =3D le32_to_cpu(val);
>>
>=20
> Same as for RX.
>=20
Yes shall discard this patch from the next update.

-Thanks,
  Bitan

