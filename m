Return-Path: <linux-i2c+bounces-2954-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E18008A5D44
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 23:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B30CB22662
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 21:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA27157491;
	Mon, 15 Apr 2024 21:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grqdb+Fa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567241EF1A;
	Mon, 15 Apr 2024 21:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713218379; cv=none; b=RwNZnS196OfYyRPRDGFjsl82ZcN6bgmZl9ZaiM7MdeKT9idHCHE28KGaFNi7qJMRwxtn2dEpo5lxxF5AOkyBR8L5ARRO1yhSZSA8HNe3PIJ2AYT7kGvgj7jFcve0Z2v3dL3FwpssVkJ2VzXGR8d8IcrTfgQJz7zO75JU93KTEDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713218379; c=relaxed/simple;
	bh=P2PnYeUn+vbm0CIXRKVAZ7T5IeYl3SuSLmZ5NH9CDU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaoIK250IlkLFMALCP7UCyhVOkOIAdmBnkG3fQdUqYyfaLq6w7CRZYxR475vv8do1jO9QTo8fvxB3B8Ogo85RaIKmYU2/1hjCUKNbieFxBshAeWcNaeUw7pFuM+byyMEZ2+KtSDOaVD8/Nl/z6AcPSbSk/00dmsOZE0zcah2e80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grqdb+Fa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A955BC113CC;
	Mon, 15 Apr 2024 21:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713218379;
	bh=P2PnYeUn+vbm0CIXRKVAZ7T5IeYl3SuSLmZ5NH9CDU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=grqdb+Fa95j2Tp1eo5VUC+A7hm54mtQrEJiRFN8VWY8O1SHi7yxWSBEYn8GcMepbN
	 4tTjJcK3utrhXbr+vxBG4WkHCG66HHEmcoW7oW8ueZ22quURAJryTaXmlmqhyu3Z8S
	 NIQkQ5gD5zGCJ4XtA0lwkhlFPkLNxlwxdSoI5Lqdx6PsrS6puHqe6PXSw5pNzEujYX
	 mjlmx2QKuFy+05GezrDxf4EUuH8fVuuJ1cYSvygeuKsNjgQgJAbDoqpbxrgLR9CnaC
	 +nfGQrdWfXL6EPoMNM+zn90AC4x0y06nsIAxQGT+arhAktKiGQRuTWvWIk/BF5fmjD
	 AHaiBlO5Bx3pw==
Date: Mon, 15 Apr 2024 23:59:35 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: octeon: Add block-mode r/w
Message-ID: <o6xuyvunkceihtx4aifryfwviedx26scmlahygw5blijodmtge@c5cyhfoez5qq>
References: <20230905102234.nlaeskxbbvu74co2@zenone.zhora.eu>
 <20240415005213.3477671-1-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415005213.3477671-1-aryan.srivastava@alliedtelesis.co.nz>

Hi Aryan,

On Mon, Apr 15, 2024 at 12:52:13PM +1200, Aryan Srivastava wrote:
> Add support for block mode read/write operations on
> Thunderx chips.
> 
> When attempting r/w operations of greater then 8 bytes
> block mode is used, instead of performing a series of
> 8 byte reads.

Can you please add some more description of your patch here.

How did you do it? Which modes have you added? What are these
modes doing and how they work?

The patch is not the easiest itself and with little description
is very challenging to review. Please make my life easier :-)

> Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>

...

> +static void octeon_i2c_block_enable(struct octeon_i2c *i2c)
> +{
> +	if (i2c->block_enabled || !TWSI_BLOCK_CTL(i2c))

does the block_ctl register stores the length of the message?
If it goes '0' does it mean that it's ready for a block transfer?
(same question for the disable function).

> +		return;
> +
> +	i2c->block_enabled = true;
> +	octeon_i2c_writeq_flush(TWSI_MODE_STRETCH
> +		| TWSI_MODE_BLOCK_MODE, i2c->twsi_base + TWSI_MODE(i2c));
> +}

...

> @@ -579,10 +612,7 @@ static int octeon_i2c_hlc_comp_write(struct octeon_i2c *i2c, struct i2c_msg *msg
>  	if (set_ext)
>  		octeon_i2c_writeq_flush(ext, i2c->twsi_base + SW_TWSI_EXT(i2c));
>  
> -	octeon_i2c_hlc_int_clear(i2c);
> -	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + SW_TWSI(i2c));
> -
> -	ret = octeon_i2c_hlc_wait(i2c);
> +	ret = octeon_i2c_hlc_cmd_send(i2c, cmd);
>  	if (ret)
>  		goto err;

Can you put the octeon_i2c_hlc_comp_read/octeon_i2c_hlc_comp_write
refactoring in a different patch as a preparatory to this one?
It's easier to review.

Please, remember to keep patches logically separated in smaller
chunks.

>  
> @@ -594,6 +624,106 @@ static int octeon_i2c_hlc_comp_write(struct octeon_i2c *i2c, struct i2c_msg *msg
>  	return ret;
>  }
>  
> +/**
> + * high-level-controller composite block write+read, msg0=addr, msg1=data

This message doesn't mean much. Please check the DOC formatting
and the other functions, as well.

Remember good comments are highly appreciated.

> + * Used in the case where the i2c xfer is for greater than 8 bytes of read data.
> + */

...

> +	/* read data in FIFO */
> +	octeon_i2c_writeq_flush(TWSI_BLOCK_STS_RESET_PTR, i2c->twsi_base + TWSI_BLOCK_STS(i2c));
> +	for (int i = 0; i < len; i += 8) {
> +		u64 rd = __raw_readq(i2c->twsi_base + TWSI_BLOCK_FIFO(i2c));
> +		for (int j = 7; j >= 0; j--)
> +			msgs[1].buf[i + (7 - j)] = (rd >> (8 * j)) & 0xff;

Looks good, but do you mind a comment here?

> +	}
> +
> +	octeon_i2c_block_disable(i2c);
> +	return ret;
> +}

...

> +	/* Write msg into FIFO buffer */
> +	octeon_i2c_writeq_flush(TWSI_BLOCK_STS_RESET_PTR, i2c->twsi_base + TWSI_BLOCK_STS(i2c));
> +	for (int i = 0; i < len; i += 8) {
> +		u64 buf = 0;
> +		for (int j = 7; j >= 0; j--)
> +			buf |= (msgs[1].buf[i + (7 - j)] << (8 * j));

a comment here?

> +		octeon_i2c_writeq_flush(buf, i2c->twsi_base + TWSI_BLOCK_FIFO(i2c));
> +	}
> +	if (set_ext)
> +		octeon_i2c_writeq_flush(ext, i2c->twsi_base + SW_TWSI_EXT(i2c));
> +
> +	/* Send command to core (send data in FIFO) */
> +	ret = octeon_i2c_hlc_cmd_send(i2c, cmd);
> +	if (ret)
> +		return ret;

do we need to disable anything here?

Thanks for your patch,
Andi

> +
> +	cmd = __raw_readq(i2c->twsi_base + SW_TWSI(i2c));
> +	if ((cmd & SW_TWSI_R) == 0)
> +		return octeon_i2c_check_status(i2c, false);
> +
> +	octeon_i2c_block_disable(i2c);
> +	return ret;
> +}

...

