Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECE7375F4
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 16:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbfFFOCb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 10:02:31 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:4080 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfFFOCb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 10:02:31 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf91cf30000>; Thu, 06 Jun 2019 07:02:27 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 06 Jun 2019 07:02:29 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 06 Jun 2019 07:02:29 -0700
Received: from [10.19.65.14] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Jun
 2019 14:02:25 +0000
Subject: Re: [PATCH V4] drivers: i2c: tegra: fix checkpatch defects
To:     Dmitry Osipenko <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559806523-1352-1-git-send-email-bbiswas@nvidia.com>
 <bbe8ef0e-fdef-613c-9758-6525b60e5992@gmail.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <e8c2f722-eeaa-7449-d4fb-6caf0466bcc8@nvidia.com>
Date:   Thu, 6 Jun 2019 07:02:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <bbe8ef0e-fdef-613c-9758-6525b60e5992@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559829747; bh=9ea4rzxE76TWibLae4YzTOSLjPkEepUFQEAB54hh5pg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=JDIkh50u1TPR5ZUoITIUxNIWjWF1pScVPIVNrxnybkCh52a/H0Ii4E88L7ptCceZy
         DNDAZNquRohErOllKAHYgayNDTtYBjdo8R9oif5PGZQwvLVlepn8rGL9tWZPHfTbPH
         w5hC/ZxXsumr9Ua7uqhggFq7vGoKxkQ91yzeiqqgIHdlsTc6VAYZmdrT2h4Th7Lc1P
         zz3/qIh21YeUZ0U/mPQKe6/mtBGCf+E9vs3HEk7tyUAwQHCeniUitNh7PiK/s8onNo
         xqNBVoc8qA5/Rq5OLwTw8qdrGFU9KUDayeIHfh/pnrkISIX/aSlJedefcAWyt+5etp
         IBLcE0GIRwnJg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/6/19 4:39 AM, Dmitry Osipenko wrote:
> 06.06.2019 10:35, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
>>
>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>> as needed. Replace BUG() with error handling code.
>> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 67 +++++++++++++++++++++++-----------=
--------
>>   1 file changed, 37 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-teg=
ra.c
>> index 76b7926..55a5d87 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -78,6 +78,7 @@
>>   #define I2C_ERR_NO_ACK				0x01
>>   #define I2C_ERR_ARBITRATION_LOST		0x02
>>   #define I2C_ERR_UNKNOWN_INTERRUPT		0x04
>> +#define I2C_ERR_UNEXPECTED_STATUS               0x08
>>  =20
>>   #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>>   #define PACKET_HEADER0_PACKET_ID_SHIFT		16
>> @@ -112,7 +113,7 @@
>>   #define I2C_CLKEN_OVERRIDE			0x090
>>   #define I2C_MST_CORE_CLKEN_OVR			BIT(0)
>>  =20
>> -#define I2C_CONFIG_LOAD_TIMEOUT			1000000
>> +#define I2C_CONFIG_LOAD_TMOUT			1000000
>>  =20
>>   #define I2C_MST_FIFO_CONTROL			0x0b4
>>   #define I2C_MST_FIFO_CONTROL_RX_FLUSH		BIT(0)
>> @@ -280,6 +281,7 @@ struct tegra_i2c_dev {
>>   	u32 bus_clk_rate;
>>   	u16 clk_divisor_non_hs_mode;
>>   	bool is_multimaster_mode;
>> +	/* xfer_lock: lock to serialize transfer submission and processing */
>>   	spinlock_t xfer_lock;
>>   	struct dma_chan *tx_dma_chan;
>>   	struct dma_chan *rx_dma_chan;
>> @@ -306,7 +308,7 @@ static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, =
unsigned long reg)
>>    * to the I2C block inside the DVC block
>>    */
>>   static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
>> -	unsigned long reg)
>> +					unsigned long reg)
>>   {
>>   	if (i2c_dev->is_dvc)
>>   		reg +=3D (reg >=3D I2C_TX_FIFO) ? 0x10 : 0x40;
>> @@ -314,7 +316,7 @@ static unsigned long tegra_i2c_reg_addr(struct tegra=
_i2c_dev *i2c_dev,
>>   }
>>  =20
>>   static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>> -	unsigned long reg)
>> +		       unsigned long reg)
>>   {
>>   	writel(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
>>  =20
>> @@ -329,13 +331,13 @@ static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev=
, unsigned long reg)
>>   }
>>  =20
>>   static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
>> -	unsigned long reg, int len)
>> +			unsigned long reg, int len)
>>   {
>>   	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
>>   }
>>  =20
>>   static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
>> -	unsigned long reg, int len)
>> +		       unsigned long reg, int len)
>>   {
>>   	readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
>>   }
>> @@ -486,7 +488,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_de=
v *i2c_dev)
>>   			dev_warn(i2c_dev->dev, "timeout waiting for fifo flush\n");
>>   			return -ETIMEDOUT;
>>   		}
>> -		msleep(1);
>> +		usleep_range(1000, 2000);
>>   	}
>>   	return 0;
>>   }
>> @@ -525,7 +527,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_=
dev *i2c_dev)
>>   	 * prevent overwriting past the end of buf
>>   	 */
>>   	if (rx_fifo_avail > 0 && buf_remaining > 0) {
>> -		BUG_ON(buf_remaining > 3);
>>   		val =3D i2c_readl(i2c_dev, I2C_RX_FIFO);
>>   		val =3D cpu_to_le32(val);
>>   		memcpy(buf, &val, buf_remaining);
>> @@ -533,7 +534,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_=
dev *i2c_dev)
>>   		rx_fifo_avail--;
>>   	}
>>  =20
>> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
>>   	i2c_dev->msg_buf_remaining =3D buf_remaining;
>>   	i2c_dev->msg_buf =3D buf;
>>  =20
>> @@ -591,7 +591,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_d=
ev *i2c_dev)
>>   	 * boundary and fault.
>>   	 */
>>   	if (tx_fifo_avail > 0 && buf_remaining > 0) {
>> -		BUG_ON(buf_remaining > 3);
>>   		memcpy(&val, buf, buf_remaining);
>>   		val =3D le32_to_cpu(val);
>>  =20
>> @@ -680,10 +679,11 @@ static int tegra_i2c_wait_for_config_load(struct t=
egra_i2c_dev *i2c_dev)
>>   		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
>>   		if (in_interrupt())
>>   			err =3D readl_poll_timeout_atomic(addr, val, val =3D=3D 0,
>> -					1000, I2C_CONFIG_LOAD_TIMEOUT);
>> +							1000,
>> +							I2C_CONFIG_LOAD_TMOUT);
>>   		else
>> -			err =3D readl_poll_timeout(addr, val, val =3D=3D 0,
>> -					1000, I2C_CONFIG_LOAD_TIMEOUT);
>> +			err =3D readl_poll_timeout(addr, val, val =3D=3D 0, 1000,
>> +						 I2C_CONFIG_LOAD_TMOUT);
>>  =20
>>   		if (err) {
>>   			dev_warn(i2c_dev->dev,
>> @@ -858,16 +858,21 @@ static irqreturn_t tegra_i2c_isr(int irq, void *de=
v_id)
>>   		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
>>   			if (i2c_dev->msg_buf_remaining)
>>   				tegra_i2c_empty_rx_fifo(i2c_dev);
>> -			else
>> -				BUG();
>> +			else {
>> +				dev_err(i2c_dev->dev, "unexpected rx data request\n");
>> +				i2c_dev->msg_err |=3D I2C_ERR_UNEXPECTED_STATUS;
>> +				goto err;
>> +			}
>>   		}
>>  =20
>>   		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
>> -			if (i2c_dev->msg_buf_remaining)
>> -				tegra_i2c_fill_tx_fifo(i2c_dev);
>> -			else
>> +			if (i2c_dev->msg_buf_remaining) {
>> +				if (tegra_i2c_fill_tx_fifo(i2c_dev))
>> +					goto err;
>> +			} else {
>>   				tegra_i2c_mask_irq(i2c_dev,
>>   						   I2C_INT_TX_FIFO_DATA_REQ);
>> +			}
>>   		}
>>   	}
>>  =20
>> @@ -885,7 +890,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_=
id)
>>   	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>>   		if (i2c_dev->is_curr_dma_xfer)
>>   			i2c_dev->msg_buf_remaining =3D 0;
>> -		BUG_ON(i2c_dev->msg_buf_remaining);
>> +		WARN_ON_ONCE(i2c_dev->msg_buf_remaining);
>>   		complete(&i2c_dev->msg_complete);
>>   	}
>>   	goto done;
>> @@ -1024,7 +1029,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_ad=
apter *adap)
>>   }
>>  =20
>>   static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>> -	struct i2c_msg *msg, enum msg_end_type end_state)
>> +			      struct i2c_msg *msg, enum msg_end_type end_state)
>>   {
>>   	u32 packet_header;
>>   	u32 int_mask;
>> @@ -1034,7 +1039,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev=
 *i2c_dev,
>>   	u32 *buffer =3D NULL;
>>   	int err =3D 0;
>>   	bool dma;
>> -	u16 xfer_time =3D 100;
>> +	u16 xfer_tm =3D 100;
>=20
> Why xfer_time is renamed? It is much more important to keep code
> readable rather than to satisfy checkpatch. You should *not* follow
> checkpatch recommendations where they do not make much sense. The
> xfer_tm is a less intuitive naming and hence it harms readability of the
> code. Hence it is better to have "lines over 80 chars" in this
> particular case.
Agreed. I shall share updated patch.

>=20
> Also, please don't skip review comments. I already pointed out the above
> in the answer to previous version of the patch.
>=20
I apologize for the oversight. I shall be more careful in future.

-regards,
  Bitan

