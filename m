Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1D43895A
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 13:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbfFGLsm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 07:48:42 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:15843 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728576AbfFGLsm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 07:48:42 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cfa4f150000>; Fri, 07 Jun 2019 04:48:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 07 Jun 2019 04:48:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 07 Jun 2019 04:48:39 -0700
Received: from [10.19.65.14] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 11:48:35 +0000
Subject: Re: [PATCH V5] drivers: i2c: tegra: fix warning/check/error
To:     Dmitry Osipenko <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559885103-9113-1-git-send-email-bbiswas@nvidia.com>
 <dc8e32c7-811e-e422-816a-34cf5329856d@gmail.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <b1c55d39-b4d3-49c3-d9de-0f3a683e4190@nvidia.com>
Date:   Fri, 7 Jun 2019 04:48:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <dc8e32c7-811e-e422-816a-34cf5329856d@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559908117; bh=8B6OyIhbpjR5kkAtvY6qwQAdLdINpOU37ixN750jM70=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=rzb1Vy3woO88UUaic1g20DHLnD5hD7dH7t4GIVBYHXuTyq8gOhoSjbW/htT5qoARi
         LPBSOxrYHpCS/kxlkZEiMBAsck3kssmJCAelispG9Z44Dbm91XfgPUtvzM0Xm72Ejc
         zS/PN7/7CL/akHrA8uQiELOc023Mkf4ShEr6tvSTWtqsBv9zPkVDK1Yr2ux2AwTIbb
         iqc3IjejLZrwkOsXyyjLqIgOaGhxF8V1PgGf37zKmyZcqTPgE42hU07xOf63pPbboz
         1+Fc/oj0KUD09tVaPKZqS0J3sTGykZCndT/ZU+wIbA6jys0Gbyrwu6CqkdUcNcbcOV
         18pqXTVgLPl4g==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/6/19 11:05 PM, Dmitry Osipenko wrote:
> 07.06.2019 8:25, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
>>
>> Ignore checkpatch WARNING for 80 character line limit at
>> places where renaming fields compromises readability.
>>
>> Delay of approximately 1msec in flush i2c FIFO polling loop
>> achieved by usleep_range call as msleep can take 20msecs.
>>
>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>> as needed. Replace BUG() with error handling code.
>> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 61 ++++++++++++++++++++++------------=
--------
>>   1 file changed, 32 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-teg=
ra.c
>> index 1dbba39..161eb28 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -67,17 +67,18 @@
>>  =20
>>   #define DVC_CTRL_REG1				0x000
>>   #define DVC_CTRL_REG1_INTR_EN			BIT(10)
>> -#define DVC_CTRL_REG2				0x004
>> -#define DVC_CTRL_REG3				0x008
>> +#define DVC_CTRL_REG2				BIT(2)
>> +#define DVC_CTRL_REG3				BIT(3)
>=20
> This is incorrect change, register address should be kept as a hex value
> because it is not a bitmask.
I shall remove the modification.

>=20
> I'd also recommend to just remove the DVC_CTRL_REG2 since it's not used
> anywhere in the code. You may also check all of other #defines and
> remove everything unused.
I shall remove the unused macro DVC_CTRL_REG2 and remove other unused=20
macros.

>=20
> You can also check all of variables for a need to be initialized, like
> for example "ret" doesn't need to be init'ed in tegra_i2c_xfer() and
> some other places. That will be a good clean up as well.
I shall clean up the instances I can make out along and remove the ret=20
initialization in tegra_i2c_xfer function.

>=20
>>   #define DVC_CTRL_REG3_SW_PROG			BIT(26)
>>   #define DVC_CTRL_REG3_I2C_DONE_INTR_EN		BIT(30)
>>   #define DVC_STATUS				0x00c
>>   #define DVC_STATUS_I2C_DONE_INTR		BIT(30)
>>  =20
>> -#define I2C_ERR_NONE				0x00
>> -#define I2C_ERR_NO_ACK				0x01
>> -#define I2C_ERR_ARBITRATION_LOST		0x02
>> -#define I2C_ERR_UNKNOWN_INTERRUPT		0x04
>> +#define I2C_ERR_NONE				0x0
>> +#define I2C_ERR_NO_ACK				BIT(0)
>> +#define I2C_ERR_ARBITRATION_LOST		BIT(1)
>> +#define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
>> +#define I2C_ERR_UNEXPECTED_STATUS		BIT(3)
>>  =20
>>   #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>>   #define PACKET_HEADER0_PACKET_ID_SHIFT		16
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
>> +							I2C_CONFIG_LOAD_TIMEOUT);
>>   		else
>> -			err =3D readl_poll_timeout(addr, val, val =3D=3D 0,
>> -					1000, I2C_CONFIG_LOAD_TIMEOUT);
>> +			err =3D readl_poll_timeout(addr, val, val =3D=3D 0, 1000,
>> +						 I2C_CONFIG_LOAD_TIMEOUT);
>>  =20
>>   		if (err) {
>>   			dev_warn(i2c_dev->dev,
>> @@ -856,10 +856,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *de=
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
>> @@ -885,7 +888,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_=
id)
>>   	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>>   		if (i2c_dev->is_curr_dma_xfer)
>>   			i2c_dev->msg_buf_remaining =3D 0;
>> -		BUG_ON(i2c_dev->msg_buf_remaining);
>> +		WARN_ON_ONCE(i2c_dev->msg_buf_remaining);
>>   		complete(&i2c_dev->msg_complete);
>>   	}
>>   	goto done;
>> @@ -1024,7 +1027,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_ad=
apter *adap)
>>   }
>>  =20
>>   static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>> -	struct i2c_msg *msg, enum msg_end_type end_state)
>> +			      struct i2c_msg *msg, enum msg_end_type end_state)
>=20
> Probably won't hurt to carry the "enum msg_end_type end_state" to a new
> line.
OK

>=20
>>   {
>>   	u32 packet_header;
>>   	u32 int_mask;
>> @@ -1161,9 +1164,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev=
 *i2c_dev,
>>   		if (err)
>>   			return err;
>>  =20
>> -		time_left =3D wait_for_completion_timeout(
>> -						&i2c_dev->dma_complete,
>> -						msecs_to_jiffies(xfer_time));
>> +		time_left =3D wait_for_completion_timeout(&i2c_dev->dma_complete,
>> +							msecs_to_jiffies(xfer_time));
>>   		if (time_left =3D=3D 0) {
>>   			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
>>   			dmaengine_terminate_sync(i2c_dev->msg_read ?
>> @@ -1225,7 +1227,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev=
 *i2c_dev,
>>   }
>>  =20
>>   static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg=
s[],
>> -	int num)
>> +			  int num)
>>   {
>>   	struct tegra_i2c_dev *i2c_dev =3D i2c_get_adapdata(adap);
>>   	int i;
>> @@ -1273,12 +1275,12 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_=
dev *i2c_dev)
>>   	int ret;
>>  =20
>>   	ret =3D of_property_read_u32(np, "clock-frequency",
>> -			&i2c_dev->bus_clk_rate);
>> +				   &i2c_dev->bus_clk_rate);
>>   	if (ret)
>>   		i2c_dev->bus_clk_rate =3D 100000; /* default clock rate */
>>  =20
>>   	i2c_dev->is_multimaster_mode =3D of_property_read_bool(np,
>> -			"multi-master");
>> +							     "multi-master");
>=20
> You can avoid the line-split with something like this:
>=20
> 	ret =3D of_property_read_bool(np, "multi-master");
> 	i2c_dev->is_multimaster_mode =3D ret;
>=20
OK.

I shall share the patches next.

-Thanks,
  Bitan
