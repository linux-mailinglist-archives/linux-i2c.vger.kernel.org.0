Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24A5058B61C
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Aug 2022 16:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbiHFOd5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 6 Aug 2022 10:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231322AbiHFOd4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 6 Aug 2022 10:33:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202C0DF4B;
        Sat,  6 Aug 2022 07:33:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B1F7F61083;
        Sat,  6 Aug 2022 14:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE48C433C1;
        Sat,  6 Aug 2022 14:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659796434;
        bh=9fiTg8lNS3hGnstVONUZi+Slu960suCrCuosPk+E2AU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=S8e5yiA1cR3Zawf/MhHO7jIauSbmWf66F6USk1BCRwR5BtpVeBzqv4bM0e5vfE5YY
         MZwLHxqSG1Tqmh/Qnxe8WRgimUcsabbspvOxjXnvhe0WHlyk7Qwf4nHFQJl7U81Knx
         g+XdXx4quEhLjbi/TZ8JtB2Io/Bd/qzKGvLD65qPPPTkyiRp3o21/hR8rbgTS7TJC/
         Wx9Glu+jqJWWO2RV/O8H0ElvVaEKl0eg+l8OyTU/8tIeaPH5POgbx0Zlct+sRshMdz
         n8KeCNQLruMU509tXoZH+4CBlZDSeN1RwsQqgE4uhfne9KWpb7lWTcCXPvbo9hywuf
         yhcHxp7Plj7MQ==
Date:   Sat, 6 Aug 2022 15:44:12 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Jason Gerecke <killertofu@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-iio <linux-iio@vger.kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Subject: Re: [PATCH v2] i2c: Use u8 type in i2c transfer calls
Message-ID: <20220806154412.581a4f83@jic23-huawei>
In-Reply-To: <20220803145937.698603-1-jason.gerecke@wacom.com>
References: <20220718153448.173652-1-jason.gerecke@wacom.com>
        <20220803145937.698603-1-jason.gerecke@wacom.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed,  3 Aug 2022 07:59:37 -0700
Jason Gerecke <killertofu@gmail.com> wrote:

> The 'i2c_transfer_buffer_flags' function (and related inlines) defines its
> 'buf' argument to be of type 'char*'. This is a poor choice of type given
> that most callers actually pass a 'u8*' and that the function itself ends
> up just storing the variable to a 'u8*'-typed member of 'struct i2c_msg'
> anyway.
> 
> Changing the type of the 'buf' argument to 'u8*' vastly reduces the number
> of (admittedly usually-silent) Wpointer-sign warnings that are generated
> as the types get needlessly juggled back and forth.
> 
> At the same time, update the max1363 driver to match the new interface so
> we don't introduce a new Wincompatible-function-pointer-types warning.
> 
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> Reviewed-by: Ping Cheng <ping.cheng@wacom.com>

With the minor stuff Andy raised tidied up I'm fine with this change.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

I'd forgotten all about the oddities of the max1363 :) That brings
back some memories!

Jonathan


> ---
> Changes in v2:
>   - Added modifications to the max1363 driver required to avoid warnings
> 
>  drivers/i2c/i2c-core-base.c |  2 +-
>  drivers/iio/adc/max1363.c   |  8 ++++----
>  include/linux/i2c.h         | 14 +++++++-------
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 10f35f942066a..2925507e8626d 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2184,7 +2184,7 @@ EXPORT_SYMBOL(i2c_transfer);
>   *
>   * Returns negative errno, or else the number of bytes transferred.
>   */
> -int i2c_transfer_buffer_flags(const struct i2c_client *client, char *buf,
> +int i2c_transfer_buffer_flags(const struct i2c_client *client, u8 *buf,
>  			      int count, u16 flags)
>  {
>  	int ret;
> diff --git a/drivers/iio/adc/max1363.c b/drivers/iio/adc/max1363.c
> index eef55ed4814a6..ebe6eb99583da 100644
> --- a/drivers/iio/adc/max1363.c
> +++ b/drivers/iio/adc/max1363.c
> @@ -184,9 +184,9 @@ struct max1363_state {
>  	struct regulator		*vref;
>  	u32				vref_uv;
>  	int				(*send)(const struct i2c_client *client,
> -						const char *buf, int count);
> +						const u8 *buf, int count);
>  	int				(*recv)(const struct i2c_client *client,
> -						char *buf, int count);
> +						u8 *buf, int count);
>  };
>  
>  #define MAX1363_MODE_SINGLE(_num, _mask) {				\
> @@ -312,7 +312,7 @@ static const struct max1363_mode
>  	return NULL;
>  }
>  
> -static int max1363_smbus_send(const struct i2c_client *client, const char *buf,
> +static int max1363_smbus_send(const struct i2c_client *client, const u8 *buf,
>  		int count)
>  {
>  	int i, err;
> @@ -323,7 +323,7 @@ static int max1363_smbus_send(const struct i2c_client *client, const char *buf,
>  	return err ? err : count;
>  }
>  
> -static int max1363_smbus_recv(const struct i2c_client *client, char *buf,
> +static int max1363_smbus_recv(const struct i2c_client *client, u8 *buf,
>  		int count)
>  {
>  	int i, ret;
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 8eab5017bff30..3a94385f4642c 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -64,7 +64,7 @@ const char *i2c_freq_mode_string(u32 bus_freq_hz);
>   * @count must be less than 64k since msg.len is u16.
>   */
>  int i2c_transfer_buffer_flags(const struct i2c_client *client,
> -			      char *buf, int count, u16 flags);
> +			      u8 *buf, int count, u16 flags);
>  
>  /**
>   * i2c_master_recv - issue a single I2C message in master receive mode
> @@ -75,7 +75,7 @@ int i2c_transfer_buffer_flags(const struct i2c_client *client,
>   * Returns negative errno, or else the number of bytes read.
>   */
>  static inline int i2c_master_recv(const struct i2c_client *client,
> -				  char *buf, int count)
> +				  u8 *buf, int count)
>  {
>  	return i2c_transfer_buffer_flags(client, buf, count, I2C_M_RD);
>  };
> @@ -90,7 +90,7 @@ static inline int i2c_master_recv(const struct i2c_client *client,
>   * Returns negative errno, or else the number of bytes read.
>   */
>  static inline int i2c_master_recv_dmasafe(const struct i2c_client *client,
> -					  char *buf, int count)
> +					  u8 *buf, int count)
>  {
>  	return i2c_transfer_buffer_flags(client, buf, count,
>  					 I2C_M_RD | I2C_M_DMA_SAFE);
> @@ -105,9 +105,9 @@ static inline int i2c_master_recv_dmasafe(const struct i2c_client *client,
>   * Returns negative errno, or else the number of bytes written.
>   */
>  static inline int i2c_master_send(const struct i2c_client *client,
> -				  const char *buf, int count)
> +				  const u8 *buf, int count)
>  {
> -	return i2c_transfer_buffer_flags(client, (char *)buf, count, 0);
> +	return i2c_transfer_buffer_flags(client, (u8 *)buf, count, 0);
>  };
>  
>  /**
> @@ -120,9 +120,9 @@ static inline int i2c_master_send(const struct i2c_client *client,
>   * Returns negative errno, or else the number of bytes written.
>   */
>  static inline int i2c_master_send_dmasafe(const struct i2c_client *client,
> -					  const char *buf, int count)
> +					  const u8 *buf, int count)
>  {
> -	return i2c_transfer_buffer_flags(client, (char *)buf, count,
> +	return i2c_transfer_buffer_flags(client, (u8 *)buf, count,
>  					 I2C_M_DMA_SAFE);
>  };
>  

