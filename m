Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15DA732D132
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Mar 2021 11:53:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234972AbhCDKwr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Mar 2021 05:52:47 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:51057 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239060AbhCDKwi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 4 Mar 2021 05:52:38 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id HlaDlZiViOruFHlaGlFLCU; Thu, 04 Mar 2021 11:51:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614855116; bh=Wkecd4VwZCDslytU0HlU9xUDkLjYHX8Tjk/u14Rdlq0=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=VEstxt8+/RPxi28WRLW3zpKkJx0u8YL9U72fbT6u6+3n2RIetRAgZ+2Qtl0WzWnUN
         rapjSMbxTROp50cX35IGR04OkzTSu3gIMV45ed5yFMbhqKjhKYcdvZ1Zs+8k6AQxwB
         tXFCWOHiW8ZFSp3/ZP8uC2Xf8/d5TfsP5Ypgrm3a8UcedIulXw/i72kdks5qE+IEBG
         Z1tMFdQ6O4yoZRlQKIc2T0n5p1Ve3fJXvk3CPDcKb5nypuYprRJQtMem9rBnaTgh3S
         I/E8fV6ya1FWDAkujyx2d0M6DgDGXj0M+dIbpiOKMZ6l42Ss3yQkCgECP5A7GvjkYk
         rRhJbDT67TlvQ==
Subject: Re: [PATCH v2] media: i2c: adv7511: remove open coded version of
 SMBus block read
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-media@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20210127103357.5045-1-wsa+renesas@sang-engineering.com>
 <bea536b1-9d81-3f41-8ca5-7fb075422290@xs4all.nl>
Message-ID: <cadc7e6e-377f-db65-514e-7b2e6a40a0ae@xs4all.nl>
Date:   Thu, 4 Mar 2021 11:51:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <bea536b1-9d81-3f41-8ca5-7fb075422290@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCe+EB9+Iz4bvtP3GrDHH8PHByDsM0sKWi6CSKlOIjXOMZMUG/9fmOvboqEBEh113yLKV3sDQ3lQ+EYgah18zVeL0NHy/rOcE8wPP+Clo2yLJiO9s16J
 R2y99ncbB3MCplG5jW14MTSBSVjnUh61qMSgJUMpk0SH7T0/tDUHZwZCBiJX2K6SuOFYBIWM7SJEH6QOW9qZvez97FBrNdkYTzXtW0w9cWqtXrmUsG3Ko8s1
 4MqRYtyRbM9t2cvcTuYfmoKU/qYMcWQgkVvSEa9wknyt1SZk8oFcLbK34pxeDfVToEpbHpmz8vnEVS66PKUa0Bhz6cX6hab9qUevxem5X1g=
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 23/02/2021 13:01, Hans Verkuil wrote:
> Hi Wolfram,
> 
> On 27/01/2021 11:33, Wolfram Sang wrote:
>> The open coded version differs from the one in the core in one way: the
>> buffer will be always copied back, even when the transfer failed. Be
>> more robust: use the block read from the I2C core and propagate a
>> potential errno further to the sanity checks.
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> This looks good.
> 
> If you want to merge this, then you can add my:
> 
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> If you want me to take it, then just let me know and I'll queue it up for 5.13.

I didn't hear back from you, so I'll pick it up for 5.13.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>> ---
>>
>> Changes since v1:
>> * respect 'err' in more code paths
>> * updated comment
>>
>>  drivers/media/i2c/adv7511-v4l2.c | 58 ++++++++++++++------------------
>>  1 file changed, 26 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
>> index a3161d709015..9183003ae22d 100644
>> --- a/drivers/media/i2c/adv7511-v4l2.c
>> +++ b/drivers/media/i2c/adv7511-v4l2.c
>> @@ -214,36 +214,25 @@ static inline void adv7511_wr_and_or(struct v4l2_subdev *sd, u8 reg, u8 clr_mask
>>  	adv7511_wr(sd, reg, (adv7511_rd(sd, reg) & clr_mask) | val_mask);
>>  }
>>  
>> -static int adv_smbus_read_i2c_block_data(struct i2c_client *client,
>> -					 u8 command, unsigned length, u8 *values)
>> -{
>> -	union i2c_smbus_data data;
>> -	int ret;
>> -
>> -	if (length > I2C_SMBUS_BLOCK_MAX)
>> -		length = I2C_SMBUS_BLOCK_MAX;
>> -	data.block[0] = length;
>> -
>> -	ret = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
>> -			     I2C_SMBUS_READ, command,
>> -			     I2C_SMBUS_I2C_BLOCK_DATA, &data);
>> -	memcpy(values, data.block + 1, length);
>> -	return ret;
>> -}
>> -
>> -static void adv7511_edid_rd(struct v4l2_subdev *sd, uint16_t len, uint8_t *buf)
>> +static int adv7511_edid_rd(struct v4l2_subdev *sd, uint16_t len, uint8_t *buf)
>>  {
>>  	struct adv7511_state *state = get_adv7511_state(sd);
>>  	int i;
>> -	int err = 0;
>>  
>>  	v4l2_dbg(1, debug, sd, "%s:\n", __func__);
>>  
>> -	for (i = 0; !err && i < len; i += I2C_SMBUS_BLOCK_MAX)
>> -		err = adv_smbus_read_i2c_block_data(state->i2c_edid, i,
>> +	for (i = 0; i < len; i += I2C_SMBUS_BLOCK_MAX) {
>> +		s32 ret;
>> +
>> +		ret = i2c_smbus_read_i2c_block_data(state->i2c_edid, i,
>>  						    I2C_SMBUS_BLOCK_MAX, buf + i);
>> -	if (err)
>> -		v4l2_err(sd, "%s: i2c read error\n", __func__);
>> +		if (ret < 0) {
>> +			v4l2_err(sd, "%s: i2c read error\n", __func__);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>>  }
>>  
>>  static inline int adv7511_cec_read(struct v4l2_subdev *sd, u8 reg)
>> @@ -1668,22 +1657,27 @@ static bool adv7511_check_edid_status(struct v4l2_subdev *sd)
>>  	if (edidRdy & MASK_ADV7511_EDID_RDY) {
>>  		int segment = adv7511_rd(sd, 0xc4);
>>  		struct adv7511_edid_detect ed;
>> +		int err;
>>  
>>  		if (segment >= EDID_MAX_SEGM) {
>>  			v4l2_err(sd, "edid segment number too big\n");
>>  			return false;
>>  		}
>>  		v4l2_dbg(1, debug, sd, "%s: got segment %d\n", __func__, segment);
>> -		adv7511_edid_rd(sd, 256, &state->edid.data[segment * 256]);
>> -		adv7511_dbg_dump_edid(2, debug, sd, segment, &state->edid.data[segment * 256]);
>> -		if (segment == 0) {
>> -			state->edid.blocks = state->edid.data[0x7e] + 1;
>> -			v4l2_dbg(1, debug, sd, "%s: %d blocks in total\n", __func__, state->edid.blocks);
>> +		err = adv7511_edid_rd(sd, 256, &state->edid.data[segment * 256]);
>> +		if (!err) {
>> +			adv7511_dbg_dump_edid(2, debug, sd, segment, &state->edid.data[segment * 256]);
>> +			if (segment == 0) {
>> +				state->edid.blocks = state->edid.data[0x7e] + 1;
>> +				v4l2_dbg(1, debug, sd, "%s: %d blocks in total\n",
>> +					 __func__, state->edid.blocks);
>> +			}
>>  		}
>> -		if (!edid_verify_crc(sd, segment) ||
>> -		    !edid_verify_header(sd, segment)) {
>> -			/* edid crc error, force reread of edid segment */
>> -			v4l2_err(sd, "%s: edid crc or header error\n", __func__);
>> +
>> +		if (err || !edid_verify_crc(sd, segment) || !edid_verify_header(sd, segment)) {
>> +			/* Couldn't read EDID or EDID is invalid. Force retry! */
>> +			if (!err)
>> +				v4l2_err(sd, "%s: edid crc or header error\n", __func__);
>>  			state->have_monitor = false;
>>  			adv7511_s_power(sd, false);
>>  			adv7511_s_power(sd, true);
>>
> 

