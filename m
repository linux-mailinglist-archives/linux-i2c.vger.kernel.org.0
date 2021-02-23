Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1BB2322A3A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Feb 2021 13:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232464AbhBWMFO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Feb 2021 07:05:14 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:36431 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232817AbhBWMCE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Feb 2021 07:02:04 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id EWNHlxmb0fIMiEWNLluGpF; Tue, 23 Feb 2021 13:01:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614081671; bh=1hLmo70e6QdzywjzHOXuJ1hUlzuPjRX05cJRBwMEB6I=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FMCaBCmqpEBnU3Q9S/jXlcwisFIRrO1n6dtWcMQai0POjdZLnNfVQ+L9melF6apPF
         fdTAJtLb1mG3bftbGTR1PL6HW5ghoRIsi6SJQaARvtoaAwU5K4eb3kg1tNWluwe5G7
         iyK400JCQaCqA2SLekAe3Lqk5XOSK8gDBfbUaAztPwKTOczWVB9L2Lb+HaWbo/n00G
         S4JR25FDp0hixtQwPX+SliWlolYnrZJsUxY5hFKibpC/dcjywWZqgf6T7OPqXOgID6
         mtUc/o6IdN4HebQc3vQqL5kY8l9oIodDWB/lfRQ1l6j5/Ylrxb5hx/Gf6ExJmsgXk5
         Q3cKPeWgG/E7Q==
Subject: Re: [PATCH v2] media: i2c: adv7511: remove open coded version of
 SMBus block read
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-media@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20210127103357.5045-1-wsa+renesas@sang-engineering.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <bea536b1-9d81-3f41-8ca5-7fb075422290@xs4all.nl>
Date:   Tue, 23 Feb 2021 13:01:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210127103357.5045-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKR18NfCtNTh2IebkSTudHoupJrjs8VOfJOF0Z3JLTiColv51DxZ8YAvJGv1w9wJqios3z5H6MotvoHhHMT+UJnj70vDYYbaT0GTm1gC9tEpsFeq5l27
 hufbUMuV245wzUpQXHGwCY0gohgtJhK0K/VxEzbUcTJi4DnBOq4SfD4wtGhV3bELmiwmwjeLjKgN6+Eh+l0K1RahuV6HKl6UX1K1VU6bbqi0CcDl/KU1JJ5u
 rdQnkNLnbohvBBhg3BIjDsghIHYZYEFV7YOL/BAV+IInTl8Ez5vQPJfEJ5GRuvb+FZFy0RTNtcD1qKUnl9YX58XCZkp2wuJMH1cHlZKd4f4=
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 27/01/2021 11:33, Wolfram Sang wrote:
> The open coded version differs from the one in the core in one way: the
> buffer will be always copied back, even when the transfer failed. Be
> more robust: use the block read from the I2C core and propagate a
> potential errno further to the sanity checks.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

This looks good.

If you want to merge this, then you can add my:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

If you want me to take it, then just let me know and I'll queue it up for 5.13.

Regards,

	Hans

> ---
> 
> Changes since v1:
> * respect 'err' in more code paths
> * updated comment
> 
>  drivers/media/i2c/adv7511-v4l2.c | 58 ++++++++++++++------------------
>  1 file changed, 26 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
> index a3161d709015..9183003ae22d 100644
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
> @@ -1668,22 +1657,27 @@ static bool adv7511_check_edid_status(struct v4l2_subdev *sd)
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
> -		adv7511_dbg_dump_edid(2, debug, sd, segment, &state->edid.data[segment * 256]);
> -		if (segment == 0) {
> -			state->edid.blocks = state->edid.data[0x7e] + 1;
> -			v4l2_dbg(1, debug, sd, "%s: %d blocks in total\n", __func__, state->edid.blocks);
> +		err = adv7511_edid_rd(sd, 256, &state->edid.data[segment * 256]);
> +		if (!err) {
> +			adv7511_dbg_dump_edid(2, debug, sd, segment, &state->edid.data[segment * 256]);
> +			if (segment == 0) {
> +				state->edid.blocks = state->edid.data[0x7e] + 1;
> +				v4l2_dbg(1, debug, sd, "%s: %d blocks in total\n",
> +					 __func__, state->edid.blocks);
> +			}
>  		}
> -		if (!edid_verify_crc(sd, segment) ||
> -		    !edid_verify_header(sd, segment)) {
> -			/* edid crc error, force reread of edid segment */
> -			v4l2_err(sd, "%s: edid crc or header error\n", __func__);
> +
> +		if (err || !edid_verify_crc(sd, segment) || !edid_verify_header(sd, segment)) {
> +			/* Couldn't read EDID or EDID is invalid. Force retry! */
> +			if (!err)
> +				v4l2_err(sd, "%s: edid crc or header error\n", __func__);
>  			state->have_monitor = false;
>  			adv7511_s_power(sd, false);
>  			adv7511_s_power(sd, true);
> 

