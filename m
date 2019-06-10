Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF1F3ADC4
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 05:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387504AbfFJDwq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Jun 2019 23:52:46 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:12303 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387475AbfFJDwq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Jun 2019 23:52:46 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cfdd40c0000>; Sun, 09 Jun 2019 20:52:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 09 Jun 2019 20:52:44 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 09 Jun 2019 20:52:44 -0700
Received: from [10.19.65.14] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Jun
 2019 03:52:40 +0000
Subject: Re: [PATCH V2 6/6] i2c: tegra: remove BUG, BUG_ON
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
References: <1559935826-25812-1-git-send-email-bbiswas@nvidia.com>
 <1559935826-25812-6-git-send-email-bbiswas@nvidia.com>
 <dfe5e3a7-a761-0633-8da6-32f94aae171f@gmail.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <8daef4be-f841-bb9a-3865-9cc6bf9c51c5@nvidia.com>
Date:   Sun, 9 Jun 2019 20:52:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <dfe5e3a7-a761-0633-8da6-32f94aae171f@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560138764; bh=yXIQhZiuDrR39F7erbT77tNotRwn9PKTJ9/szEqbqKs=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Wz15GGOzLuwvcRXS8qIzANRXAHRvn9QmSRcaQB3/ObxKnP/UhQauKR27H6rvDPdM+
         JLNtZRghnwL/UVUUWEzp6I8P3kZ9Z2ETCZPdSB+pZuO8NX4/yz29q97qbdzUGeF9Kq
         M1XHXfNL/TrnduU9Jx6NPZ1ag+YcBtuxn5s3tRwi/xUmlD0tpq8rLg85lOUdEvS2qF
         1T05m9aDA1dD0yXR4pZg9ZYLDfIq1XoXWDVxB06/sc4iQj0K1PxEOORejokKJvURMT
         5xM1m4wWkQV8JuPDJwAkrfV2CcmvCbUS84ZJBBeum3rkLcB8Pfxh6zOAv0kzfivefE
         A4hO/x8nFZoHg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/7/19 12:47 PM, Dmitry Osipenko wrote:
> 07.06.2019 22:30, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>> as needed. Replace BUG() with error handling code.
>> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 16 +++++++++-------
>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-teg=
ra.c
>> index 4dfb4c1..c89d0ee 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -73,6 +73,7 @@
>>   #define I2C_ERR_NO_ACK				BIT(0)
>>   #define I2C_ERR_ARBITRATION_LOST		BIT(1)
>>   #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
>> +#define I2C_ERR_UNEXPECTED_STATUS		BIT(3)
>>  =20
>>   #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>>   #define PACKET_HEADER0_PACKET_ID_SHIFT		16
>> @@ -515,7 +516,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_=
dev *i2c_dev)
>>   	 * prevent overwriting past the end of buf
>>   	 */
>>   	if (rx_fifo_avail > 0 && buf_remaining > 0) {
>> -		BUG_ON(buf_remaining > 3);
>>   		val =3D i2c_readl(i2c_dev, I2C_RX_FIFO);
>>   		val =3D cpu_to_le32(val);
>>   		memcpy(buf, &val, buf_remaining);
>> @@ -523,7 +523,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_=
dev *i2c_dev)
>>   		rx_fifo_avail--;
>>   	}
>>  =20
>> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
>>   	i2c_dev->msg_buf_remaining =3D buf_remaining;
>>   	i2c_dev->msg_buf =3D buf;
>>  =20
>> @@ -581,7 +580,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_d=
ev *i2c_dev)
>>   	 * boundary and fault.
>>   	 */
>>   	if (tx_fifo_avail > 0 && buf_remaining > 0) {
>> -		BUG_ON(buf_remaining > 3);
>>   		memcpy(&val, buf, buf_remaining);
>>   		val =3D le32_to_cpu(val);
>>  =20
>> @@ -847,10 +845,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *de=
v_id)
>>  =20
>>   	if (!i2c_dev->is_curr_dma_xfer) {
>>   		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
>> -			if (i2c_dev->msg_buf_remaining)
>> +			if (i2c_dev->msg_buf_remaining) {
>>   				tegra_i2c_empty_rx_fifo(i2c_dev);
>> -			else
>> -				BUG();
>> +			} else {
>> +				dev_err(i2c_dev->dev, "unexpected rx data request\n");
>> +				i2c_dev->msg_err |=3D I2C_ERR_UNEXPECTED_STATUS;
>> +				goto err;
>> +			}
>>   		}
>>  =20
>>   		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
>> @@ -876,7 +877,8 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_=
id)
>>   	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>>   		if (i2c_dev->is_curr_dma_xfer)
>>   			i2c_dev->msg_buf_remaining =3D 0;
>> -		BUG_ON(i2c_dev->msg_buf_remaining);
>> +		if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining))
>> +			goto err;
>>   		complete(&i2c_dev->msg_complete);
>>   	}
>>   	goto done;
>>
>=20
> Unfortunately that's not enough because the indicator of the error is
> the i2c_dev->msg_err and no error is set in yours case, hence no
> hardware reset will be performed. It should be at least somewhat like thi=
s:
>=20
> 	if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) {
> 		i2c_dev->msg_err |=3D I2C_ERR_UNKNOWN_INTERRUPT;
> 		goto err;
> 	}
>=20
Fine. I shall set msg_err as I2C_ERR_UNKNOWN_INTERRUPT instead of=20
I2C_ERR_UNEXPECTED_STATUS for condition of non-zero msg_bug_remaining in=20
PIO mode with transfer complete interrupt.


-Thanks,
  Bitan

