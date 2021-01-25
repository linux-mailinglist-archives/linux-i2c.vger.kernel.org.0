Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE3A302377
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Jan 2021 11:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbhAYKGS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Jan 2021 05:06:18 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:37129 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726614AbhAYKC4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Jan 2021 05:02:56 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 3ybylSxZYiWRg3yc1lfkwc; Mon, 25 Jan 2021 10:56:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611568605; bh=d1oH/dg1c5hhev2gtzREZqY4fF4dPmvsBxp3g3Tqro8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bux89eyFprXyWlWsSl9sUDGSz5Ky77ppK+K5B5ZUNwpioOcY+VMMrZCztl+qX8+fl
         pnnJ7SvrZZukM8ckUclq1Cf9gYDj0hj9IfW0ZNcKrNS9F6WIim5iQ2VvJmNqeXFDuc
         vl+esb01CifwdvL3K41MAI7GceWTbYbZ6+1sZSLYUqymtYtCxXbUejUv7qj6SwdHjC
         xgs1TDsyqpeXFSH68tegT1VIhfriz012XeJfcwKZQRKNrHYrVxVlWEgF9AqeapWn1k
         C702m3tGV4nMhKcUYm7HUVSjFxC20qVl5ZztEBNmCvTR2ykYAY7OEXxhi4X1Wx6KUR
         VoMUejT25x/yw==
Subject: Re: [PATCH 1/3] media: i2c: adv7842: remove open coded version of
 SMBus block write
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210119093912.1838-1-wsa+renesas@sang-engineering.com>
 <20210119093912.1838-2-wsa+renesas@sang-engineering.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <df22c72d-cbae-0e87-8448-9dbcabbc5823@xs4all.nl>
Date:   Mon, 25 Jan 2021 10:56:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119093912.1838-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfD9+Q/+bx9WBtEmKNst4heavMkDzpVddMvSyjurw+8jq6sMwFNAsxPcZYjneEbP2g+ED3R8MXYWavoSXhlHzOBd8+E8NkS4pjmoeVhbiAq+ninDLC9CA
 R27uvEu3NZDPCicsKfV0uoF+NLQPV4i5ncRgcfUh9qVl+qi0a+EpKk3LaD04chSOgHfqEH5RjiHgAuAI+Qm9r2CPXuFYwi0Wh1tkCGmkq/Yx1ePUzadDG7kZ
 EUCmYErPgqrB0MHXgMr9m8njMP6TuM+cB+P6uaDXNub3QrHO5Ka1ADyHOiGnWtK0FmDaPaHS9KpoH7n8cs/aJbICfe8dbjf0tSkWfzRbu7sBH6liZoveMcoW
 Zxyn1L+OhcuFTBJS8ToiBBqQgWIKx2X9+R45maODAiynyNUMlLvYhU/I2YMNLJPEephgdzmX
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19/01/2021 10:39, Wolfram Sang wrote:
> The version here is identical to the one in the I2C core, so use the
> latter version directly.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Looks good to me!

	Hans

> ---
> 
> Changes since RFC:
> * skip define, use i2c_smbus_write_i2c_block_data directly
> 
>  drivers/media/i2c/adv7842.c | 24 +++++-------------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
> index 0855f648416d..e0629d5ef17b 100644
> --- a/drivers/media/i2c/adv7842.c
> +++ b/drivers/media/i2c/adv7842.c
> @@ -343,20 +343,6 @@ static void adv_smbus_write_byte_no_check(struct i2c_client *client,
>  		       I2C_SMBUS_BYTE_DATA, &data);
>  }
>  
> -static s32 adv_smbus_write_i2c_block_data(struct i2c_client *client,
> -				  u8 command, unsigned length, const u8 *values)
> -{
> -	union i2c_smbus_data data;
> -
> -	if (length > I2C_SMBUS_BLOCK_MAX)
> -		length = I2C_SMBUS_BLOCK_MAX;
> -	data.block[0] = length;
> -	memcpy(data.block + 1, values, length);
> -	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
> -			      I2C_SMBUS_WRITE, command,
> -			      I2C_SMBUS_I2C_BLOCK_DATA, &data);
> -}
> -
>  /* ----------------------------------------------------------------------- */
>  
>  static inline int io_read(struct v4l2_subdev *sd, u8 reg)
> @@ -741,7 +727,7 @@ static int edid_write_vga_segment(struct v4l2_subdev *sd)
>  	rep_write_and_or(sd, 0x77, 0xef, 0x10);
>  
>  	for (i = 0; !err && i < 256; i += I2C_SMBUS_BLOCK_MAX)
> -		err = adv_smbus_write_i2c_block_data(state->i2c_edid, i,
> +		err = i2c_smbus_write_i2c_block_data(state->i2c_edid, i,
>  					     I2C_SMBUS_BLOCK_MAX, val + i);
>  	if (err)
>  		return err;
> @@ -807,7 +793,7 @@ static int edid_write_hdmi_segment(struct v4l2_subdev *sd, u8 port)
>  	rep_write_and_or(sd, 0x77, 0xef, 0x00);
>  
>  	for (i = 0; !err && i < 256; i += I2C_SMBUS_BLOCK_MAX)
> -		err = adv_smbus_write_i2c_block_data(state->i2c_edid, i,
> +		err = i2c_smbus_write_i2c_block_data(state->i2c_edid, i,
>  						     I2C_SMBUS_BLOCK_MAX, edid + i);
>  	if (err)
>  		return err;
> @@ -1079,7 +1065,7 @@ static void configure_custom_video_timings(struct v4l2_subdev *sd,
>  		/* Should only be set in auto-graphics mode [REF_02, p. 91-92] */
>  		/* setup PLL_DIV_MAN_EN and PLL_DIV_RATIO */
>  		/* IO-map reg. 0x16 and 0x17 should be written in sequence */
> -		if (adv_smbus_write_i2c_block_data(client, 0x16, 2, pll)) {
> +		if (i2c_smbus_write_i2c_block_data(client, 0x16, 2, pll)) {
>  			v4l2_err(sd, "writing to reg 0x16 and 0x17 failed\n");
>  			break;
>  		}
> @@ -1135,7 +1121,7 @@ static void adv7842_set_offset(struct v4l2_subdev *sd, bool auto_offset, u16 off
>  	offset_buf[3] = offset_c & 0x0ff;
>  
>  	/* Registers must be written in this order with no i2c access in between */
> -	if (adv_smbus_write_i2c_block_data(state->i2c_cp, 0x77, 4, offset_buf))
> +	if (i2c_smbus_write_i2c_block_data(state->i2c_cp, 0x77, 4, offset_buf))
>  		v4l2_err(sd, "%s: i2c error writing to CP reg 0x77, 0x78, 0x79, 0x7a\n", __func__);
>  }
>  
> @@ -1164,7 +1150,7 @@ static void adv7842_set_gain(struct v4l2_subdev *sd, bool auto_gain, u16 gain_a,
>  	gain_buf[3] = ((gain_c & 0x0ff));
>  
>  	/* Registers must be written in this order with no i2c access in between */
> -	if (adv_smbus_write_i2c_block_data(state->i2c_cp, 0x73, 4, gain_buf))
> +	if (i2c_smbus_write_i2c_block_data(state->i2c_cp, 0x73, 4, gain_buf))
>  		v4l2_err(sd, "%s: i2c error writing to CP reg 0x73, 0x74, 0x75, 0x76\n", __func__);
>  }
>  
> 

