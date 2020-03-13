Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD32018508B
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 21:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbgCMUsJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 16:48:09 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:64647 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727385AbgCMUsJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Mar 2020 16:48:09 -0400
X-Originating-IP: 87.231.134.186
Received: from localhost (87-231-134-186.rev.numericable.fr [87.231.134.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0C1B140007;
        Fri, 13 Mar 2020 20:48:06 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Federico Fuga <fuga@studiofuga.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mv64xxx: Implement I2C_M_RECV_LEN and I2C_FUNC_SMBUS_READ_BLOCK_DATA
In-Reply-To: <20200222124805.GJ1716@kunai>
References: <20200118115820.9080-1-fuga@studiofuga.com> <20200222124805.GJ1716@kunai>
Date:   Fri, 13 Mar 2020 21:48:06 +0100
Message-ID: <87k13ox9q1.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Wolfram,

> On Sat, Jan 18, 2020 at 12:58:20PM +0100, Federico Fuga wrote:
>> The i2c_mv64xxx driver doesn't implement the I2C_M_REC_LEN function
>> essential to allow blocks with variable length to be read from an i2c
>>  slave.
>> This is needed to implement the SMBus Read Block Data function.
>> 
>> This patch implements the function by changing the bytes_left and
>> msg len on the fly if the flag is specified.
>> 
>> It has been successfully tested on Allwinner A33 with a special
>> i2c chip that returns variable length blocks on reading.
>> 
>> Signed-off-by: Federico Fuga <fuga@studiofuga.com>
>> ---
>
> Gregory, any comment? I can't say much about the implementation. In
> general, this is a nice feature to have...

I thought I was already sent a reviewed by, as I reviewed this patch
before Frederico actually sent it.

So you can even add a

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory


>
>>  drivers/i2c/busses/i2c-mv64xxx.c | 67 +++++++++++++++++++++++++-------
>>  1 file changed, 53 insertions(+), 14 deletions(-)
>> 
>> diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
>> index a5a95ea5b81a..cff9cb20bcc9 100644
>> --- a/drivers/i2c/busses/i2c-mv64xxx.c
>> +++ b/drivers/i2c/busses/i2c-mv64xxx.c
>> @@ -128,6 +128,7 @@ struct mv64xxx_i2c_data {
>>  	u32			addr1;
>>  	u32			addr2;
>>  	u32			bytes_left;
>> +	u32         effective_length;
>>  	u32			byte_posn;
>>  	u32			send_stop;
>>  	u32			block;
>> @@ -333,7 +334,18 @@ static void mv64xxx_i2c_send_start(struct mv64xxx_i2c_data *drv_data)
>>  {
>>  	drv_data->msg = drv_data->msgs;
>>  	drv_data->byte_posn = 0;
>> -	drv_data->bytes_left = drv_data->msg->len;
>> +
>> +    /* If we should retrieve the length from the buffer, make sure */
>> +	/* to read enough bytes to avoid sending the */
>> +	/* STOP bit after the read if the first byte */
>> +	if (drv_data->msg->flags & I2C_M_RECV_LEN) {
>> +		drv_data->effective_length = -1;
>> +		drv_data->bytes_left = 3;
>> +	} else {
>> +		drv_data->effective_length = drv_data->msg->len;
>> +		drv_data->bytes_left = drv_data->msg->len;
>> +	}
>> +
>>  	drv_data->aborting = 0;
>>  	drv_data->rc = 0;
>>  
>> @@ -342,6 +354,42 @@ static void mv64xxx_i2c_send_start(struct mv64xxx_i2c_data *drv_data)
>>  	       drv_data->reg_base + drv_data->reg_offsets.control);
>>  }
>>  
>> +static void
>> +mv64xxx_i2c_do_send_stop(struct mv64xxx_i2c_data *drv_data)
>> +{
>> +	drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_INTEN;
>> +	writel(drv_data->cntl_bits | MV64XXX_I2C_REG_CONTROL_STOP,
>> +		drv_data->reg_base + drv_data->reg_offsets.control);
>> +	drv_data->block = 0;
>> +	if (drv_data->errata_delay)
>> +		udelay(5);
>> +
>> +	wake_up(&drv_data->waitq);
>> +}
>> +
>> +static void
>> +mv64xxx_i2c_do_read_data(struct mv64xxx_i2c_data *drv_data)
>> +{
>> +	u8 data;
>> +
>> +	data = readl(drv_data->reg_base + drv_data->reg_offsets.data);
>> +	drv_data->msg->buf[drv_data->byte_posn++] = data;
>> +
>> +	if (drv_data->effective_length == -1) {
>> +		/* length=0 should not be allowed, but is indeed possible.
>> +		 * To avoid locking the chip, we keep reading at least 2 bytes
>> +		 */
>> +		if (data < 1)
>> +			data = 1;
>> +		drv_data->effective_length = data+1;
>> +		drv_data->bytes_left = data+1;
>> +		drv_data->msg->len = data+1;
>> +	}
>> +
>> +	writel(drv_data->cntl_bits,
>> +		drv_data->reg_base + drv_data->reg_offsets.control);
>> +}
>> +
>>  static void
>>  mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
>>  {
>> @@ -392,23 +440,13 @@ mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
>>  		break;
>>  
>>  	case MV64XXX_I2C_ACTION_RCV_DATA:
>> -		drv_data->msg->buf[drv_data->byte_posn++] =
>> -			readl(drv_data->reg_base + drv_data->reg_offsets.data);
>> -		writel(drv_data->cntl_bits,
>> -			drv_data->reg_base + drv_data->reg_offsets.control);
>> +	    mv64xxx_i2c_do_read_data(drv_data);
>>  		break;
>>  
>>  	case MV64XXX_I2C_ACTION_RCV_DATA_STOP:
>>  		drv_data->msg->buf[drv_data->byte_posn++] =
>>  			readl(drv_data->reg_base + drv_data->reg_offsets.data);
>> -		drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_INTEN;
>> -		writel(drv_data->cntl_bits | MV64XXX_I2C_REG_CONTROL_STOP,
>> -			drv_data->reg_base + drv_data->reg_offsets.control);
>> -		drv_data->block = 0;
>> -		if (drv_data->errata_delay)
>> -			udelay(5);
>> -
>> -		wake_up(&drv_data->waitq);
>> +	    mv64xxx_i2c_do_send_stop(drv_data);
>>  		break;
>>  
>>  	case MV64XXX_I2C_ACTION_INVALID:
>> @@ -706,7 +744,8 @@ mv64xxx_i2c_can_offload(struct mv64xxx_i2c_data *drv_data)
>>  static u32
>>  mv64xxx_i2c_functionality(struct i2c_adapter *adap)
>>  {
>> -	return I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR | I2C_FUNC_SMBUS_EMUL;
>> +	return I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR |
>> +		I2C_FUNC_SMBUS_READ_BLOCK_DATA | I2C_FUNC_SMBUS_EMUL;
>>  }
>>  
>>  static int
>> -- 
>> 2.17.1
>> 

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
