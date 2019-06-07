Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0E3F394EC
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 20:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732319AbfFGS4C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 14:56:02 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:15695 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732313AbfFGS4B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 14:56:01 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cfab33e0000>; Fri, 07 Jun 2019 11:55:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Jun 2019 11:56:00 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 07 Jun 2019 11:56:00 -0700
Received: from [10.19.65.14] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 18:55:57 +0000
Subject: Re: [PATCH V1 6/6] i2c: tegra: remove BUG, BUG_ON
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
References: <1559908507-31192-1-git-send-email-bbiswas@nvidia.com>
 <1559908507-31192-6-git-send-email-bbiswas@nvidia.com>
 <4aec6d7a-0dea-18c9-efde-96cc1a54b945@gmail.com>
 <2281ef29-6e69-78e7-4d07-77f33c2f2d5a@gmail.com>
 <9adcde41-2450-27dc-36a0-b3b99022b43d@gmail.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <75a7f16f-5d54-797d-fb72-445411f20424@nvidia.com>
Date:   Fri, 7 Jun 2019 11:55:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9adcde41-2450-27dc-36a0-b3b99022b43d@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559933758; bh=uCIuy8rH6YJsc+yfcuZuDGYINzs4oKq/K+wz218dMQY=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=M4arfBVACmw1/pC2JeZFWgiz8tnHqrKaAdWNoIHxOKemsUv+YfBPsmCrmeFLH5MLA
         cfg83/NLK5j8NvXYO5rA2zArplHXysMUKSxB+Nw0Ru7MUbswLOCvyCtVLYfCftQdHw
         3mnodvVhLEGbw4cK9g0QSg1F5GhtM5sKqM7jJZAZpmW0Jl+a3tqm+cbtVHnK788k7P
         O5HvvpUcdLGguNTjB88UJr5FcNIF5ZrAfmpzkSb9/XyUNI/5q8rIgDAn78qvVFxoUh
         lLITiVRD0Za1AbRyGSV2+e3WAjd9masCdBhM1ultRq20Ir9jjK0OL10CCzmLS9APS5
         XfZtRe420ANbg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/7/19 5:18 AM, Dmitry Osipenko wrote:
> 07.06.2019 15:12, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 07.06.2019 15:08, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> 07.06.2019 14:55, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>>>> as needed. Replace BUG() with error handling code.
>>>> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
>>>>
>>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>>> ---
>>>>   drivers/i2c/busses/i2c-tegra.c | 15 ++++++++-------
>>>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-t=
egra.c
>>>> index 4dfb4c1..c407bd7 100644
>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>> @@ -73,6 +73,7 @@
>>>>   #define I2C_ERR_NO_ACK				BIT(0)
>>>>   #define I2C_ERR_ARBITRATION_LOST		BIT(1)
>>>>   #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
>>>> +#define I2C_ERR_UNEXPECTED_STATUS		BIT(3)
>>>>  =20
>>>>   #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>>>>   #define PACKET_HEADER0_PACKET_ID_SHIFT		16
>>>> @@ -515,7 +516,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2=
c_dev *i2c_dev)
>>>>   	 * prevent overwriting past the end of buf
>>>>   	 */
>>>>   	if (rx_fifo_avail > 0 && buf_remaining > 0) {
>>>> -		BUG_ON(buf_remaining > 3);
>>>>   		val =3D i2c_readl(i2c_dev, I2C_RX_FIFO);
>>>>   		val =3D cpu_to_le32(val);
>>>>   		memcpy(buf, &val, buf_remaining);
>>>> @@ -523,7 +523,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2=
c_dev *i2c_dev)
>>>>   		rx_fifo_avail--;
>>>>   	}
>>>>  =20
>>>> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
>>>>   	i2c_dev->msg_buf_remaining =3D buf_remaining;
>>>>   	i2c_dev->msg_buf =3D buf;
>>>>  =20
>>>> @@ -581,7 +580,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c=
_dev *i2c_dev)
>>>>   	 * boundary and fault.
>>>>   	 */
>>>>   	if (tx_fifo_avail > 0 && buf_remaining > 0) {
>>>> -		BUG_ON(buf_remaining > 3);
>>>>   		memcpy(&val, buf, buf_remaining);
>>>>   		val =3D le32_to_cpu(val);
>>>>  =20
>>>> @@ -847,10 +845,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *=
dev_id)
>>>>  =20
>>>>   	if (!i2c_dev->is_curr_dma_xfer) {
>>>>   		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
>>>> -			if (i2c_dev->msg_buf_remaining)
>>>> +			if (i2c_dev->msg_buf_remaining) {
>>>>   				tegra_i2c_empty_rx_fifo(i2c_dev);
>>>> -			else
>>>> -				BUG();
>>>> +			} else {
>>>> +				dev_err(i2c_dev->dev, "unexpected rx data request\n");
>>>> +				i2c_dev->msg_err |=3D I2C_ERR_UNEXPECTED_STATUS;
>>>> +				goto err;
>>>> +			}
>>>>   		}
>>>>  =20
>>>>   		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
>>>> @@ -876,7 +877,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *de=
v_id)
>>>>   	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>>>>   		if (i2c_dev->is_curr_dma_xfer)
>>>>   			i2c_dev->msg_buf_remaining =3D 0;
>>>> -		BUG_ON(i2c_dev->msg_buf_remaining);
>>>> +		WARN_ON_ONCE(i2c_dev->msg_buf_remaining);
>>>>   		complete(&i2c_dev->msg_complete);
>>>>   	}
>>>>   	goto done;
>>>>
>>>
>>> Very nice, thank you very much! BTW, I think it may worth to add anothe=
r
>>> patch that will reset hardware state in a case of the warning since we
>>> know that something gone wrong.
>>>
>>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>>>
>>
>> Something like that:
>>
>>   	complete(&i2c_dev->msg_complete);
>>
>> 	if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining))
>> 		goto err;
>>
>=20
> Ah, that's inside the ISR, so maybe will make sense to just not complete
> the transfer and let it timeout:
>=20
> 	if (!WARN_ON_ONCE(i2c_dev->msg_buf_remaining))
> 		complete(&i2c_dev->msg_complete);
OK. I shall send the updated patch.

-Thanks,
  Bitan

