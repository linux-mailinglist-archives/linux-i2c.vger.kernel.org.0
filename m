Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62E8DF8D66
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2019 11:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbfKLK7n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Nov 2019 05:59:43 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:34170 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725887AbfKLK7n (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Nov 2019 05:59:43 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id DE34055BB9C1E56D07BD;
        Tue, 12 Nov 2019 18:59:39 +0800 (CST)
Received: from localhost (10.202.226.61) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Tue, 12 Nov 2019
 18:59:37 +0800
Date:   Tue, 12 Nov 2019 10:59:30 +0000
From:   Jonathan Cameron <jonathan.cameron@huawei.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        "Peter Meerwald-Stadler" <pmeerw@pmeerw.net>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: use void pointers for supplying data for reads
 and writes
Message-ID: <20191112105930.000059e3@huawei.com>
In-Reply-To: <20191112005826.GA96746@dtor-ws>
References: <20191112005826.GA96746@dtor-ws>
Organization: Huawei
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.61]
X-CFilter-Loop: Reflected
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 11 Nov 2019 16:58:26 -0800
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> There is no need to force users of i2c_master_send()/i2c_master_recv()
> and other i2c read/write bulk data API to cast everything into u8
> pointers.  While everything can be considered byte stream, the drivers
> are usually work with more structured data.
> 
> Let's switch the APIs to accept [const] void pointers to cut amount of
> casting needed.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
> 
> Changes in v2:
> 
> - adjusted max1363 to the new i2c_master_send/recv signatures
> 
> I sent the previous version of this patch 04/01/17 and kbuild promptly
> noticed that it broke max1363. And it took me only 2.5 years to get back
> to it ;)
> 
> Given that it is only one IIO driver that is affected I hope it can go
> through Wolfram's tree and we do not need to go through staged API
> rollout.
> 
>  drivers/i2c/i2c-core-base.c  |  2 +-
>  drivers/i2c/i2c-core-smbus.c | 16 ++++++++--------
>  drivers/iio/adc/max1363.c    | 14 ++++++++------
>  include/linux/i2c.h          | 28 +++++++++++++++-------------
>  4 files changed, 32 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 6a5183cffdfc3..aeb4201ef55e4 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2065,7 +2065,7 @@ EXPORT_SYMBOL(i2c_transfer);
>   *
>   * Returns negative errno, or else the number of bytes transferred.
>   */
> -int i2c_transfer_buffer_flags(const struct i2c_client *client, char *buf,
> +int i2c_transfer_buffer_flags(const struct i2c_client *client, void *buf,
>  			      int count, u16 flags)
>  {
>  	int ret;
> diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
> index 3ac426a8ab5ab..4172f8e647f81 100644
> --- a/drivers/i2c/i2c-core-smbus.c
> +++ b/drivers/i2c/i2c-core-smbus.c
> @@ -15,6 +15,7 @@
>  #include <linux/i2c.h>
>  #include <linux/i2c-smbus.h>
>  #include <linux/slab.h>
> +#include <asm/unaligned.h>
>  
>  #include "i2c-core.h"
>  
> @@ -213,7 +214,7 @@ EXPORT_SYMBOL(i2c_smbus_write_word_data);
>   * mechanism (I2C_M_RECV_LEN) which may not be implemented.
>   */
>  s32 i2c_smbus_read_block_data(const struct i2c_client *client, u8 command,
> -			      u8 *values)
> +			      void *values)
>  {
>  	union i2c_smbus_data data;
>  	int status;
> @@ -240,7 +241,7 @@ EXPORT_SYMBOL(i2c_smbus_read_block_data);
>   * else zero on success.
>   */
>  s32 i2c_smbus_write_block_data(const struct i2c_client *client, u8 command,
> -			       u8 length, const u8 *values)
> +			       u8 length, const void *values)
>  {
>  	union i2c_smbus_data data;
>  
> @@ -256,7 +257,7 @@ EXPORT_SYMBOL(i2c_smbus_write_block_data);
>  
>  /* Returns the number of read bytes */
>  s32 i2c_smbus_read_i2c_block_data(const struct i2c_client *client, u8 command,
> -				  u8 length, u8 *values)
> +				  u8 length, void *values)
>  {
>  	union i2c_smbus_data data;
>  	int status;
> @@ -276,7 +277,7 @@ s32 i2c_smbus_read_i2c_block_data(const struct i2c_client *client, u8 command,
>  EXPORT_SYMBOL(i2c_smbus_read_i2c_block_data);
>  
>  s32 i2c_smbus_write_i2c_block_data(const struct i2c_client *client, u8 command,
> -				   u8 length, const u8 *values)
> +				   u8 length, const void *values)
>  {
>  	union i2c_smbus_data data;
>  
> @@ -628,7 +629,7 @@ EXPORT_SYMBOL(__i2c_smbus_xfer);
>   * transfer.
>   */
>  s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
> -					      u8 command, u8 length, u8 *values)
> +					      u8 command, u8 length, void *values)
>  {
>  	u8 i = 0;
>  	int status;
> @@ -647,8 +648,7 @@ s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
>  			status = i2c_smbus_read_word_data(client, command + i);
>  			if (status < 0)
>  				return status;
> -			values[i] = status & 0xff;
> -			values[i + 1] = status >> 8;
> +			put_unaligned_le16(status, values + i);
>  			i += 2;
>  		}
>  	}
> @@ -657,7 +657,7 @@ s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
>  		status = i2c_smbus_read_byte_data(client, command + i);
>  		if (status < 0)
>  			return status;
> -		values[i] = status;
> +		*(u8 *)(values + i) = status;
>  		i++;
>  	}
>  
> diff --git a/drivers/iio/adc/max1363.c b/drivers/iio/adc/max1363.c
> index 5c2cc61b666e7..48ed76a0e83d4 100644
> --- a/drivers/iio/adc/max1363.c
> +++ b/drivers/iio/adc/max1363.c
> @@ -182,9 +182,9 @@ struct max1363_state {
>  	struct regulator		*vref;
>  	u32				vref_uv;
>  	int				(*send)(const struct i2c_client *client,
> -						const char *buf, int count);
> +						const void *buf, int count);
>  	int				(*recv)(const struct i2c_client *client,
> -						char *buf, int count);
> +						void *buf, int count);
>  };
>  
>  #define MAX1363_MODE_SINGLE(_num, _mask) {				\
> @@ -310,27 +310,29 @@ static const struct max1363_mode
>  	return NULL;
>  }
>  
> -static int max1363_smbus_send(const struct i2c_client *client, const char *buf,
> +static int max1363_smbus_send(const struct i2c_client *client, const void *buf,
>  		int count)
>  {
> +	const u8 *data = buf;
>  	int i, err;
>  
>  	for (i = err = 0; err == 0 && i < count; ++i)
> -		err = i2c_smbus_write_byte(client, buf[i]);
> +		err = i2c_smbus_write_byte(client, data[i]);
>  
>  	return err ? err : count;
>  }
>  
> -static int max1363_smbus_recv(const struct i2c_client *client, char *buf,
> +static int max1363_smbus_recv(const struct i2c_client *client, void *buf,
>  		int count)
>  {
> +	u8 *data = buf;
>  	int i, ret;
>  
>  	for (i = 0; i < count; ++i) {
>  		ret = i2c_smbus_read_byte(client);
>  		if (ret < 0)
>  			return ret;
> -		buf[i] = ret;
> +		data[i] = ret;
>  	}
>  
>  	return count;
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index aaf57d9b41dbb..64cf92e191aa8 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -51,7 +51,7 @@ struct property_entry;
>   * @count must be be less than 64k since msg.len is u16.
>   */
>  extern int i2c_transfer_buffer_flags(const struct i2c_client *client,
> -				     char *buf, int count, u16 flags);
> +				     void *buf, int count, u16 flags);
>  
>  /**
>   * i2c_master_recv - issue a single I2C message in master receive mode
> @@ -62,7 +62,7 @@ extern int i2c_transfer_buffer_flags(const struct i2c_client *client,
>   * Returns negative errno, or else the number of bytes read.
>   */
>  static inline int i2c_master_recv(const struct i2c_client *client,
> -				  char *buf, int count)
> +				  void *buf, int count)
>  {
>  	return i2c_transfer_buffer_flags(client, buf, count, I2C_M_RD);
>  };
> @@ -77,7 +77,7 @@ static inline int i2c_master_recv(const struct i2c_client *client,
>   * Returns negative errno, or else the number of bytes read.
>   */
>  static inline int i2c_master_recv_dmasafe(const struct i2c_client *client,
> -					  char *buf, int count)
> +					  void *buf, int count)
>  {
>  	return i2c_transfer_buffer_flags(client, buf, count,
>  					 I2C_M_RD | I2C_M_DMA_SAFE);
> @@ -92,9 +92,10 @@ static inline int i2c_master_recv_dmasafe(const struct i2c_client *client,
>   * Returns negative errno, or else the number of bytes written.
>   */
>  static inline int i2c_master_send(const struct i2c_client *client,
> -				  const char *buf, int count)
> +				  const void *buf, int count)
>  {
> -	return i2c_transfer_buffer_flags(client, (char *)buf, count, 0);
> +	return i2c_transfer_buffer_flags(client, (void *)buf /* const cast */,
> +					 count, 0);
>  };
>  
>  /**
> @@ -107,10 +108,10 @@ static inline int i2c_master_send(const struct i2c_client *client,
>   * Returns negative errno, or else the number of bytes written.
>   */
>  static inline int i2c_master_send_dmasafe(const struct i2c_client *client,
> -					  const char *buf, int count)
> +					  const void *buf, int count)
>  {
> -	return i2c_transfer_buffer_flags(client, (char *)buf, count,
> -					 I2C_M_DMA_SAFE);
> +	return i2c_transfer_buffer_flags(client, (void *)buf /* const cast */,
> +					 count, I2C_M_DMA_SAFE);
>  };
>  
>  /* Transfer num messages.
> @@ -166,18 +167,19 @@ i2c_smbus_write_word_swapped(const struct i2c_client *client,
>  
>  /* Returns the number of read bytes */
>  extern s32 i2c_smbus_read_block_data(const struct i2c_client *client,
> -				     u8 command, u8 *values);
> +				     u8 command, void *values);
>  extern s32 i2c_smbus_write_block_data(const struct i2c_client *client,
> -				      u8 command, u8 length, const u8 *values);
> +				      u8 command, u8 length,
> +				      const void *values);
>  /* Returns the number of read bytes */
>  extern s32 i2c_smbus_read_i2c_block_data(const struct i2c_client *client,
> -					 u8 command, u8 length, u8 *values);
> +					 u8 command, u8 length, void *values);
>  extern s32 i2c_smbus_write_i2c_block_data(const struct i2c_client *client,
>  					  u8 command, u8 length,
> -					  const u8 *values);
> +					  const void *values);
>  extern s32
>  i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
> -					  u8 command, u8 length, u8 *values);
> +					  u8 command, u8 length, void *values);
>  int i2c_get_device_id(const struct i2c_client *client,
>  		      struct i2c_device_identity *id);
>  #endif /* I2C */


