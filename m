Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 676F748D88
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 21:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbfFQTIP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 15:08:15 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14905 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfFQTIP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jun 2019 15:08:15 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d07e51d0000>; Mon, 17 Jun 2019 12:08:13 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 17 Jun 2019 12:08:13 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 17 Jun 2019 12:08:13 -0700
Received: from [10.19.65.14] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 17 Jun
 2019 19:08:09 +0000
Subject: Re: [PATCH V6] i2c: tegra: remove BUG, BUG_ON
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
References: <1560527438-30150-1-git-send-email-bbiswas@nvidia.com>
 <504e19d0-05dd-dc80-3aaf-cdab8f88002d@gmail.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <fee98b4f-630e-1685-05e3-e8dae0f412bd@nvidia.com>
Date:   Mon, 17 Jun 2019 12:08:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <504e19d0-05dd-dc80-3aaf-cdab8f88002d@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560798493; bh=eyxJf+dx2mtt05DGw6ZX0kEJdfvsEaJPAavQRRRHozY=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=lzop/cRgR67d5mwTjR58du+qm3a4lz6RDPRb4xFWM5/A4grCvMSwMa88qVArSUNwR
         oWmEEgqPATLBOgj22rUQ2C7/YyxSP5hgqnhC+emU3je88yyCHbT3Dqm6XsGZp5VW/u
         wZ3xBM7TPGRIS/pezY/3klBVfy/ZmJpxmw9xh/FxhGAgXk43Aw0OkJ5nlnRuB65slE
         AxpFKEkthtY2aDmuF+OjZYFhmRiaLXrAJSQ40zLifapNN9MIPm2w41dzSN/pWgfyMq
         Nh4seq1Pcnt+w3gAaS/eQyub3Yte6WO5WktYVW2Cit12Fq3A1VyI3c4bzuLKS17qrr
         gWsrZ86yyAyEA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/14/19 10:51 AM, Dmitry Osipenko wrote:
> 14.06.2019 18:50, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>> as needed. Remove BUG() and mask Rx interrupt similar as Tx
>> for message fully sent case. Add WARN_ON_ONCE check
>> for non-zero rx_fifo_avail in tegra_i2c_empty_rx_fifo()
>> after all processing. Error handling in tegra_i2c_empty_rx_fifo
>> caller is also added.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 46 ++++++++++++++++++++++++++++++++++=
--------
>>   1 file changed, 38 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-teg=
ra.c
>> index 4dfb4c1..26a7c8c 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -73,6 +73,7 @@
>>   #define I2C_ERR_NO_ACK				BIT(0)
>>   #define I2C_ERR_ARBITRATION_LOST		BIT(1)
>>   #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
>> +#define I2C_ERR_UNEXPECTED_STATUS		BIT(3)
>=20
> What about I2C_ERR_RX_BUFFER_OVERFLOW?
OK.

>=20
>>   #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>>   #define PACKET_HEADER0_PACKET_ID_SHIFT		16
>> @@ -515,15 +516,23 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2=
c_dev *i2c_dev)
>>   	 * prevent overwriting past the end of buf
>>   	 */
>>   	if (rx_fifo_avail > 0 && buf_remaining > 0) {
>> -		BUG_ON(buf_remaining > 3);
>> +		/* buf_remaining > 3 check not needed as rx_fifo_avail =3D=3D 0
>> +		 * when (words_to_transfer was > rx_fifo_avail) earlier
>> +		 * in this function
>> +		 */
>=20
> Please start all multiline comments with an empty "/*", it should be the =
correct
> style. There are some places in the kernel where style like yours is used=
, but I
> assume they are not very correct. Besides, yours variant is not consisten=
t with the
> style of the rest of comments in this source file. And put a dot in the e=
nd for
> completeness. Same for the other comments in this patch.
>=20
OK

>>   		val =3D i2c_readl(i2c_dev, I2C_RX_FIFO);
>>   		val =3D cpu_to_le32(val);
>>   		memcpy(buf, &val, buf_remaining);
>>   		buf_remaining =3D 0;
>>   		rx_fifo_avail--;
>>   	}
>=20
> Please add a newline here. All logical parts of the code should be separa=
ted to ease
> reading and following.
OK

>=20
>> +	if (WARN_ON_ONCE(rx_fifo_avail))
>> +		return -EINVAL;
>>  =20
>> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
>> +	/* buf_remaining > 0 at this point can only have rx_fifo_avail =3D=3D =
0
>> +	 * as this corresponds to (words_to_transfer was > rx_fifo_avail)
>> +	 * case earlier in this function
>> +	 */
>>   	i2c_dev->msg_buf_remaining =3D buf_remaining;
>>   	i2c_dev->msg_buf =3D buf;
>>  =20
>> @@ -581,7 +590,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_=
dev *i2c_dev)
>>   	 * boundary and fault.
>>   	 */
>>   	if (tx_fifo_avail > 0 && buf_remaining > 0) {
>> -		BUG_ON(buf_remaining > 3);
>> +		/* buf_remaining > 3 check not needed as tx_fifo_avail =3D=3D 0
>> +		 * when (words_to_transfer was > tx_fifo_avail) earlier
>> +		 * in this function for non-zero words_to_transfer
>> +		 */
>>   		memcpy(&val, buf, buf_remaining);
>>   		val =3D le32_to_cpu(val);
>>  =20
>> @@ -811,6 +823,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_=
id)
>>   	u32 status;
>>   	const u32 status_err =3D I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
>>   	struct tegra_i2c_dev *i2c_dev =3D dev_id;
>> +	int err_val;
>>  =20
>>   	status =3D i2c_readl(i2c_dev, I2C_INT_STATUS);
>>  =20
>> @@ -847,10 +860,21 @@ static irqreturn_t tegra_i2c_isr(int irq, void *de=
v_id)
>>  =20
>>   	if (!i2c_dev->is_curr_dma_xfer) {
>>   		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
>> -			if (i2c_dev->msg_buf_remaining)
>> -				tegra_i2c_empty_rx_fifo(i2c_dev);
>> -			else
>> -				BUG();
>> +			err_val =3D tegra_i2c_empty_rx_fifo(i2c_dev);
>> +			if ((!(i2c_dev->msg_buf_remaining)) &&
>=20
> Let's move this check into tegra_i2c_empty_rx_fifo() and return -EINVAL f=
or that case.
> This will make code to look cleaner.
OK.


>=20
>> +			    (!(status & I2C_INT_PACKET_XFER_COMPLETE)) &&
>=20
> It shouldn't matter that XFER_COMPLETE is set if RX FIFO isn't fully empt=
ied because
> it always shall be emptied. Hence this check is not needed and we should =
error out
> regardless.
OK

>=20
>> +			    err_val) {
>> +				/*
>> +				 * Overflow error condition: message fully sent,
>> +				 * with no XFER_COMPLETE interrupt but hardware
>> +				 * asks to transfer more.
>> +				 */
>> +				tegra_i2c_mask_irq(i2c_dev,
>> +						   I2C_INT_RX_FIFO_DATA_REQ);
>=20
> No need to mask RX_FIFO_DATA_REQ here because all interrupts are masked o=
n "goto
> err:", hence just remove the tegra_i2c_mask_irq().
>=20
>> +				i2c_dev->msg_err |=3D
>> +					I2C_ERR_UNEXPECTED_STATUS;
>=20
> No need to split this into two lines because it's less than 80 chars, wri=
te this in a
> single line.
OK

>=20
>> +				goto err;
>> +			}
>>   		}
>>  =20
>>   		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
>> @@ -876,7 +900,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev=
_id)
>>   	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>>   		if (i2c_dev->is_curr_dma_xfer)
>>   			i2c_dev->msg_buf_remaining =3D 0;
>> -		BUG_ON(i2c_dev->msg_buf_remaining);
>> +		/* Underflow error condition: XFER_COMPLETE before message
>> +		 * fully sent.
>> +		 */
>> +		if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) {
>> +			i2c_dev->msg_err |=3D I2C_ERR_UNKNOWN_INTERRUPT;
>> +			goto err;
>> +		}
>>   		complete(&i2c_dev->msg_complete);
>>   	}
>>   	goto done;
>>
>=20
> Please address comments in the next revision.
>=20

Sorry for the delayed reply. I shared Patch V7 with above changes=20
earlier today.

-regards,
  Bitan

