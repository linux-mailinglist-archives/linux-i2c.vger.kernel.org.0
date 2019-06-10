Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68FA43BD06
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 21:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389099AbfFJTlM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 15:41:12 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:4037 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388843AbfFJTlM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 15:41:12 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cfeb2560000>; Mon, 10 Jun 2019 12:41:10 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 10 Jun 2019 12:41:10 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 10 Jun 2019 12:41:10 -0700
Received: from [10.19.65.14] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Jun
 2019 19:41:07 +0000
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
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <851d7837-5b98-228e-d8c9-3c41be1fb2e0@nvidia.com>
Date:   Mon, 10 Jun 2019 12:41:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <06ab30b6-bf79-c628-0a04-d0307511a06f@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560195670; bh=JyK/p2hqLXboqisgBAqPIy3Mdy8LlNVYdBjpebqVJIY=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=O2WBtoUyUH1swTwYr1h7CefLuJAxiWBgyeBLPVsr3jTC2AcNMgxWB3gMesP7s+f0N
         fCpjGh1kuoth4PjvQ0BvOh4w2Et3IkhRMkzNrVIXHkQfF120onInDHXmPNGDBWBZIX
         wdQsI40WJmpHjq8YAzZzOAra0CMDrYQ9IapOPm3uvFTVJewdGhc6Vn+CeSdnPKKYII
         fAI9anU2BtlxsRJMXovQrh4On76+0ifQNTCg8BCEKPFsKNAteZsGrCesZEpQBEHbJc
         aIeY6ky7RiJ6jBJjzDZ/8ALC2ImfCKqP61Z4IJ8Sj9atviSvOtYENquZ89n3YuuJ6U
         F41YtYrSVkw5A==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/10/19 11:12 AM, Dmitry Osipenko wrote:
> 10.06.2019 20:08, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>> as needed. Remove BUG() and make Rx and Tx case handling
>> similar.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> Looks that this is still not correct. What if it transfer-complete flag
> is set and buffer is full on RX? In this case the transfer will succeed
> while it was a failure.
>=20
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-teg=
ra.c
>> index 4dfb4c1..30619d6 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -515,7 +515,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_=
dev *i2c_dev)
>>   	 * prevent overwriting past the end of buf
>>   	 */
>>   	if (rx_fifo_avail > 0 && buf_remaining > 0) {
>> -		BUG_ON(buf_remaining > 3);
>=20
> Actually error should be returned here since out-of-bounds memory
> accesses must be avoided, hence:
>=20
> 	if (WARN_ON_ONCE(buf_remaining > 3))
> 		return -EINVAL;
buf_remaining will be less than equal to 3 because of the expression=20
earlier
https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-teg=
ra.c#L520

>=20
>>   		val =3D i2c_readl(i2c_dev, I2C_RX_FIFO);
>>   		val =3D cpu_to_le32(val);
>>   		memcpy(buf, &val, buf_remaining);
>> @@ -523,7 +522,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_=
dev *i2c_dev)
>>   		rx_fifo_avail--;
>>   	}
>>  =20
>> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
>=20
> Better not to ignore this as well:
>=20
> 	if (WARN_ON_ONCE(rx_fifo_avail > 0 &&
> 			 buf_remaining > 0))
> 		return -EINVAL;
>=20
Please check below line.
https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-teg=
ra.c#L532=20


It ensures that buf_remaining will be 0 and we never hit the BUG_ON as=20
follows:

 >> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);

>>   	i2c_dev->msg_buf_remaining =3D buf_remaining;
>>   	i2c_dev->msg_buf =3D buf;
>>  =20
>> @@ -581,7 +579,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_d=
ev *i2c_dev)
>>   	 * boundary and fault.
>>   	 */
>>   	if (tx_fifo_avail > 0 && buf_remaining > 0) {
>> -		BUG_ON(buf_remaining > 3);
>=20
> And here, cause this will corrupt stack:
>=20
> 		if (WARN_ON_ONCE(buf_remaining > 3))
> 			return -EINVAL;
>=20
Please check the line
https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-teg=
ra.c#L576

It ensures buf_remaining will be less or equal to 3.

>>   		memcpy(&val, buf, buf_remaining);
>>   		val =3D le32_to_cpu(val);
>>  =20
>> @@ -850,7 +847,8 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_=
id)
>>   			if (i2c_dev->msg_buf_remaining)
>>   				tegra_i2c_empty_rx_fifo(i2c_dev);
>>   			else
>> -				BUG();
>> +				tegra_i2c_mask_irq(i2c_dev,
>> +						   I2C_INT_RX_FIFO_DATA_REQ);
>=20
> Then here:
>=20
> 	if (WARN_ON_ONCE(!i2c_dev->msg_buf_remaining) ||
> 	    tegra_i2c_empty_rx_fifo(i2c_dev)) {
> 		i2c_dev->msg_err |=3D I2C_ERR_UNKNOWN_INTERRUPT;
> 		goto err;
> 	}
>=20
Can you please elaborate why the condition needs to be as follows=20
instead of " if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) " ?

 > 	if (WARN_ON_ONCE(!i2c_dev->msg_buf_remaining) ||
 > 	    tegra_i2c_empty_rx_fifo(i2c_dev)) {


-regards,
  Bitan

