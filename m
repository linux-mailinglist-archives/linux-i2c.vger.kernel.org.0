Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F06B13B390
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 12:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388714AbfFJK6Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 06:58:25 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:13975 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388100AbfFJK6Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 06:58:24 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cfe37cf0000>; Mon, 10 Jun 2019 03:58:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 10 Jun 2019 03:58:23 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 10 Jun 2019 03:58:23 -0700
Received: from [10.19.65.14] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Jun
 2019 10:58:20 +0000
Subject: Re: [PATCH V3 6/6] i2c: tegra: remove BUG, BUG_ON
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
References: <1560143324-21754-1-git-send-email-bbiswas@nvidia.com>
 <1560143324-21754-6-git-send-email-bbiswas@nvidia.com>
 <89190a56-bc79-7c07-9b21-ebdfb532df30@gmail.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <4f151ae7-423b-1938-39a8-7ec4ae3632df@nvidia.com>
Date:   Mon, 10 Jun 2019 03:58:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <89190a56-bc79-7c07-9b21-ebdfb532df30@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560164303; bh=lYjgI1UWPoZLXbIUed6fb+EDt6VdZ6jGT7Re5zlKS3Y=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Rf8Qb0SN4ovj+Qp1dEQHo0zSmrebV8dGXtEUfkLyi2rlV4SUO06NZmDfPGyuAUdU0
         rbjfrYsMMAJWemr+Fi8Dxdq5ehPEuuljFwgf+ZSdNy/e41n/ZmhzHtNPPJIcQI3xvj
         tUACYmUiHsQaUu9/2lj31PufPHzdTU64EDbR7ZyP17KdVZMhsLGpM825G7QYWRZNIg
         /UIZPI7RXI0Fm70pvXa9dolXt29FH2T2AkPIFjlQU3BfVHcTYJefu2FmhnEm4vtOc5
         MsMBnweoZrTtYlHGIPsBsALFty+moxaAGBe5qcXH2bhKuX6ecvExHcVxlG6IOkf+Ez
         dnNYZuVlUGY2A==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/10/19 3:30 AM, Dmitry Osipenko wrote:
> 10.06.2019 8:08, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>> as needed. Replace BUG() with error handling code.
>> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 18 +++++++++++-------
>>   1 file changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-teg=
ra.c
>> index 4dfb4c1..d9e99b4 100644
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
>> @@ -876,7 +877,10 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev=
_id)
>>   	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>>   		if (i2c_dev->is_curr_dma_xfer)
>>   			i2c_dev->msg_buf_remaining =3D 0;
>> -		BUG_ON(i2c_dev->msg_buf_remaining);
>> +		if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) {
>> +			i2c_dev->msg_err |=3D I2C_ERR_UNKNOWN_INTERRUPT;
>> +			goto err;
>> +		}
>>   		complete(&i2c_dev->msg_complete);
>>   	}
>>   	goto done;
>>
>=20
> It looks nearly ideal now, although there is still one thing that could
> be improved. We're going to print a error message in a case of RX and
> spew a warning on a similar case of TX, this makes code inconsistent.
> Let's switch to either a error message or just a warning in both places.
>=20
Agree. I shall share the updated patch.

-Thanks,
  Bitan
