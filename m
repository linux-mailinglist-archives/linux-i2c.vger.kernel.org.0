Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D63522F9CDE
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 11:36:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389699AbhARK2t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 05:28:49 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:33269 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388308AbhARJ2h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 04:28:37 -0500
X-Greylist: delayed 341 seconds by postgrey-1.27 at vger.kernel.org; Mon, 18 Jan 2021 04:28:36 EST
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 1QjhlHYgEyutM1QjklY4Jd; Mon, 18 Jan 2021 10:22:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610961732; bh=nchNVY2zwVarn3ID4y2tb8ptH7cMG+u5nOJNfukDNFU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=en/vC/J40Czqt9qZbq9yItDkhHoE/I17g5MsZ1ykssk3lZSmS7MsTEPpnJ4iyQV9M
         YjHuPALCigRyJUS63vo0joY0OKh84SNKP077gzMfdwuAj+qEhhBwm7BiqUICS2li8j
         eeNSjmWb3+70QJXNL3nGK19f+54WVwIjLbqbNQ8CUuGPeVE1PDxeRxtB5DGUdiDQRI
         0wo0GslpFV90DR4TWo2vGgXOoQmd+PnEv+qn3wRhTixest/QgErVjQEiEswSmv0wbK
         rHb2ZH78QqY2Nmzga2tuJwRQv1XwZufdhkKdAxkFgsbqZvzlH0calSvQNo3OTjEOtB
         2vRwbgsBm4nwA==
Subject: Re: [PATCH RFC 2/3] media: i2c: adv7842: remove open coded version of
 SMBus block read
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210112164130.47895-1-wsa+renesas@sang-engineering.com>
 <20210112164130.47895-3-wsa+renesas@sang-engineering.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <62c10525-69c6-e681-feaa-5ec3a865c06c@xs4all.nl>
Date:   Mon, 18 Jan 2021 10:22:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112164130.47895-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDjiSTgtflMtk+wcszCsyAVFtHl0V0DjBtsTPPP2KY00Au46URGXe6sckKrvcQ9gTnRZtAxAPxdO8QjgA5Fz6FQ3wyzFoxbD2L+GdIYHT/yTI+11Yrty
 NWzp4r6OygrDH2KO9G0RB5ZEcSYGf0Lx1gxVE3HJPnXx8/rN85cw3WkU/LnEAXq6vBPwFYT/sD9gXpztwWcsY67egtjwIUxlyVKHX9jGLLtGy5vBOuFOvpFc
 rdxEY/M0zMDiA1tNtDtCApoDlAewwofRyCx2LeTHTSeg4end20cLTUQoiJWdwaQ9NrCGboQ9cdcpc+Fyp/mMRw9KFxy1pWYuiTR2mNLmCQooRqCT/4AVvfqY
 OiD8of8P
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 12/01/2021 17:41, Wolfram Sang wrote:
> The open coded version differs from the one in the core in one way: the
> buffer will be always copied back, even when the transfer failed. It
> looks like it is expected that the sanity check for a correct CRC and
> header will bail out later.

Nah, it's just a bug. It should have returned and checked the error code,
so your patch does the right thing.

Regards,

	Hans

> 
> Use the block read from the I2C core and propagate a potential errno
> further to the sanity check.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Note: we could now make the error checking even stronger by checking if
> the number of received bytes is I2C_SMBUS_BLOCK_MAX. But to avoid
> regressions, I kept the logic as is, i.e. only check for errno.
> 
>  drivers/media/i2c/adv7511-v4l2.c | 40 +++++++++++---------------------
>  1 file changed, 14 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
> index a3161d709015..0150f76dc6a6 100644
> --- a/drivers/media/i2c/adv7511-v4l2.c
> +++ b/drivers/media/i2c/adv7511-v4l2.c
> @@ -214,36 +214,24 @@ static inline void adv7511_wr_and_or(struct v4l2_subdev *sd, u8 reg, u8 clr_mask
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
> +	s32 len;
>  	int i;
> -	int err = 0;
>  
>  	v4l2_dbg(1, debug, sd, "%s:\n", __func__);
>  
> -	for (i = 0; !err && i < len; i += I2C_SMBUS_BLOCK_MAX)
> -		err = adv_smbus_read_i2c_block_data(state->i2c_edid, i,
> +	for (i = 0; i < len; i += I2C_SMBUS_BLOCK_MAX) {
> +		len = i2c_smbus_read_i2c_block_data(state->i2c_edid, i,
>  						    I2C_SMBUS_BLOCK_MAX, buf + i);
> -	if (err)
> -		v4l2_err(sd, "%s: i2c read error\n", __func__);
> +		if (len < 0) {
> +			v4l2_err(sd, "%s: i2c read error\n", __func__);
> +			return len;
> +		}
> +	}
> +
> +	return 0;
>  }
>  
>  static inline int adv7511_cec_read(struct v4l2_subdev *sd, u8 reg)
> @@ -1668,20 +1656,20 @@ static bool adv7511_check_edid_status(struct v4l2_subdev *sd)
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
>  		if (segment == 0) {
>  			state->edid.blocks = state->edid.data[0x7e] + 1;
>  			v4l2_dbg(1, debug, sd, "%s: %d blocks in total\n", __func__, state->edid.blocks);
>  		}
> -		if (!edid_verify_crc(sd, segment) ||
> -		    !edid_verify_header(sd, segment)) {
> +		if (err < 0 || !edid_verify_crc(sd, segment) || !edid_verify_header(sd, segment)) {
>  			/* edid crc error, force reread of edid segment */
>  			v4l2_err(sd, "%s: edid crc or header error\n", __func__);
>  			state->have_monitor = false;
> 

