Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0CA2F9CDF
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 11:36:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389793AbhARK3I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 05:29:08 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:57459 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388465AbhARJ3i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 04:29:38 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 1QlhlHZKUyutM1QlllY4ib; Mon, 18 Jan 2021 10:24:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610961857; bh=V5bzydSc1ZPnrXdRrL7lpMkhwVWP+yxudlc0NqzwcLg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=LjJb1da7PwQrrOvK5VTjsAIIdL/2W1i8CEhWeaH9Ix6vOJ8Hn8PB9MRjCeOaNd4ry
         YA182xXHotUlSJjffHY3yKwRiNCzqASrIu1mIQWLbD5/xDDC+wJa6ovgxDMBkUrf4+
         NHMl8GXZpYcUJcqeGBggLnKmI/UJmAMq0x1lqsOHGcFrDaa/gtyMLfIxLzRRwswE1j
         mT35pqh184U24tZmc5+IP7oYK0GQzSjiB1E1Tp3saxUfpPOHA1XsGp/nyMWjC8Ag7L
         4uzRIyFWsd4X0cVj/cWCpHPkmn4TYGhPe+Xf5kuYcMNyot0iLBVmFcwwUzKSz3BkRQ
         gjwVHZfv6XXNw==
Subject: Re: [PATCH RFC 1/3] media: i2c: adv7842: remove open coded version of
 SMBus block write
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210112164130.47895-1-wsa+renesas@sang-engineering.com>
 <20210112164130.47895-2-wsa+renesas@sang-engineering.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <f1c17eaf-1ab8-2665-54bb-6df69ab1f067@xs4all.nl>
Date:   Mon, 18 Jan 2021 10:24:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112164130.47895-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfD1sq2GXDgXiWy3ydMcspguHtQRpAB/EUYMeOPjI4hMIZCkDG1Eg+FVk/5Vp+eTSl3dy2NcDoizSgqVF0td9G5eZdBwnZhc9LMOMPjKbxgNfPCoyMOyK
 HNMZC/dwrWgJHeOAsFDYd7skt8DeuCeHQXRf5bg0JVqHxyiItaZ6XqvZ02Am7jpjCl8iA0ydtjF6hnxTdXQi7LP1pPwEXmQ9u9fTvzCQmZSFXa2cgCAziQTq
 zQPaphxns3l7XlcNMloEnVMApVHO8NR66QR9aYfM2+HdYPRtvtPnncjkM84q/Gb1nGcyZ/WwYfQhFiQ7EDb8ScwXrhYbN4gxNhT/toE9XqLe8um3/B1EYAyD
 xNHiYUIf
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/01/2021 17:41, Wolfram Sang wrote:
> The version here is identical to the one in the I2C core, so use a
> define to keep the original name within the driver but call the I2C core
> function instead.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/media/i2c/adv7842.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
> index 0855f648416d..6ed6bcd1d64d 100644
> --- a/drivers/media/i2c/adv7842.c
> +++ b/drivers/media/i2c/adv7842.c
> @@ -343,19 +343,7 @@ static void adv_smbus_write_byte_no_check(struct i2c_client *client,
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
> +#define adv_smbus_write_i2c_block_data i2c_smbus_write_i2c_block_data

I would prefer it if the driver just uses i2c_smbus_write_i2c_block_data
directly instead of relying on this define. It's used only 5 times, so
it should be a trivial change.

Regards,

	Hans

>  
>  /* ----------------------------------------------------------------------- */
>  
> 

