Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2529C304782
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Jan 2021 20:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbhAZGAh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Jan 2021 01:00:37 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:57459 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727345AbhAYKLi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Jan 2021 05:11:38 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 3yk4lT13qiWRg3yk8lfn4z; Mon, 25 Jan 2021 11:05:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611569108; bh=EZyY6OPIKTmAZ+Lle54XD0ZsxAcxpAxlvB7rjzdjVd4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=oMO9CZwr20DeRa4YZWnS6BtEHG/ND2RKd8bKl81jP+CIqmn2+rqRTGxhgub/ur0qa
         Nt1Akk3KeLpZqrIUsHDR1+enTuCd1CEQwfotY4VZ0YvbNcrzLzXtOS1yNy7wWGkp5x
         vxuRkSM8ca58opmz8iaQ+9gHhJhsi2jFGclHdJaal1O6LbUS1QgoUQuyeJUv+wMgz8
         8YH4W6FLMxqi6vfOfTQKtL8XO0y12f8maR5QWQqrRjVE7SUlqJwc1GZK+aMPiZa/T8
         z0T9HgmuX1cWv3PInzcxsrpaBME0q42y4b+A0YOhFh2B7LlNpLe6pnn00PoP9stsyQ
         4B679wPMa0YRg==
Subject: Re: [PATCH 2/3] media: i2c: adv7511: remove open coded version of
 SMBus block read
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210119093912.1838-1-wsa+renesas@sang-engineering.com>
 <20210119093912.1838-3-wsa+renesas@sang-engineering.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1b3f4451-20e5-4f73-acab-d0deaa7ba63d@xs4all.nl>
Date:   Mon, 25 Jan 2021 11:05:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119093912.1838-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHecP3iwuKNUGb27eJui5/FTNoELVuxuRsE0+jCAVCwbLK6sFmVr6DJCYGyAdS4t0W8wlePeCtUNCypOhMVvhakmA474jhTxjHMg+q+fAhYk4whjFcjq
 za4lHtra6jw9vJPgbGjQDdrSqWp4eNLAXZuDXurENgAKlP8dErhZyQg9I3gGBjfNGtS0ffG96K3djByKUjjKKFfrc1TM+n5womFdwGPmkVb/65PQyt9d7Qaf
 9+6FZwFXymCWFZ5tBXf4Oa5vo+7tiMFrX6oe4XG5EEKv97GsKnCSxVqukA2fHKbmcGoy/tAJ2XxQZ57pc/5OB5vG9nWR9/SLT/46NfwvDQRWPxf3Jg+VfPSM
 wW0xpgFf6bx/I0T+9LVcPa6EASjevH9AbqtokpG3uNzkZKB5O79tTEXIWmdqYct08w0bzZ47
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19/01/2021 10:39, Wolfram Sang wrote:
> The open coded version differs from the one in the core in one way: the
> buffer will be always copied back, even when the transfer failed. Be
> more robust: use the block read from the I2C core and propagate a
> potential errno further to the sanity checks.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Changes since RFC:
> * removed wrong assumption from the commit message
> 
>  drivers/media/i2c/adv7511-v4l2.c | 41 ++++++++++++--------------------
>  1 file changed, 15 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
> index a3161d709015..441bafa743a6 100644
> --- a/drivers/media/i2c/adv7511-v4l2.c
> +++ b/drivers/media/i2c/adv7511-v4l2.c
> @@ -214,36 +214,25 @@ static inline void adv7511_wr_and_or(struct v4l2_subdev *sd, u8 reg, u8 clr_mask
>  	adv7511_wr(sd, reg, (adv7511_rd(sd, reg) & clr_mask) | val_mask);
>  }
>  
> -static int adv_smbus_read_i2c_block_data(struct i2c_client *client,
> -					 u8 command, unsigned length, u8 *values)
> -{
> -	union i2c_smbus_data data;
> -	int ret;
> -
> -	if (length > I2C_SMBUS_BLOCK_MAX)
> -		length = I2C_SMBUS_BLOCK_MAX;
> -	data.block[0] = length;
> -
> -	ret = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
> -			     I2C_SMBUS_READ, command,
> -			     I2C_SMBUS_I2C_BLOCK_DATA, &data);
> -	memcpy(values, data.block + 1, length);
> -	return ret;
> -}
> -
> -static void adv7511_edid_rd(struct v4l2_subdev *sd, uint16_t len, uint8_t *buf)
> +static int adv7511_edid_rd(struct v4l2_subdev *sd, uint16_t len, uint8_t *buf)
>  {
>  	struct adv7511_state *state = get_adv7511_state(sd);
>  	int i;
> -	int err = 0;
>  
>  	v4l2_dbg(1, debug, sd, "%s:\n", __func__);
>  
> -	for (i = 0; !err && i < len; i += I2C_SMBUS_BLOCK_MAX)
> -		err = adv_smbus_read_i2c_block_data(state->i2c_edid, i,
> +	for (i = 0; i < len; i += I2C_SMBUS_BLOCK_MAX) {
> +		s32 ret;
> +
> +		ret = i2c_smbus_read_i2c_block_data(state->i2c_edid, i,
>  						    I2C_SMBUS_BLOCK_MAX, buf + i);
> -	if (err)
> -		v4l2_err(sd, "%s: i2c read error\n", __func__);
> +		if (ret < 0) {
> +			v4l2_err(sd, "%s: i2c read error\n", __func__);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
>  }
>  
>  static inline int adv7511_cec_read(struct v4l2_subdev *sd, u8 reg)
> @@ -1668,20 +1657,20 @@ static bool adv7511_check_edid_status(struct v4l2_subdev *sd)
>  	if (edidRdy & MASK_ADV7511_EDID_RDY) {
>  		int segment = adv7511_rd(sd, 0xc4);
>  		struct adv7511_edid_detect ed;
> +		int err;
>  
>  		if (segment >= EDID_MAX_SEGM) {
>  			v4l2_err(sd, "edid segment number too big\n");
>  			return false;
>  		}
>  		v4l2_dbg(1, debug, sd, "%s: got segment %d\n", __func__, segment);
> -		adv7511_edid_rd(sd, 256, &state->edid.data[segment * 256]);
> +		err = adv7511_edid_rd(sd, 256, &state->edid.data[segment * 256]);
>  		adv7511_dbg_dump_edid(2, debug, sd, segment, &state->edid.data[segment * 256]);

Only call adv7511_dbg_dump_edid if err >= 0.

>  		if (segment == 0) {

Change condition to: err >= 0 && segment == 0

>  			state->edid.blocks = state->edid.data[0x7e] + 1;
>  			v4l2_dbg(1, debug, sd, "%s: %d blocks in total\n", __func__, state->edid.blocks);
>  		}
> -		if (!edid_verify_crc(sd, segment) ||
> -		    !edid_verify_header(sd, segment)) {
> +		if (err < 0 || !edid_verify_crc(sd, segment) || !edid_verify_header(sd, segment)) {
>  			/* edid crc error, force reread of edid segment */

Hmm, this comment is a bit out of date. Change to:

			/*
			 * Couldn't read EDID or EDID has invalid content.
			 * Force reread of EDID segment.
			 */

>  			v4l2_err(sd, "%s: edid crc or header error\n", __func__);

Only show this message if err >= 0. For err < 0 the adv7511_edid_rd() already
logs an error.

>  			state->have_monitor = false;
> 

Regards,

	Hans
