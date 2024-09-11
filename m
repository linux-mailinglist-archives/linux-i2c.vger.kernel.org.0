Return-Path: <linux-i2c+bounces-6534-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5849974E62
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 11:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D81F11C21989
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 09:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1574F154434;
	Wed, 11 Sep 2024 09:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZ7lhHnY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56F245C18;
	Wed, 11 Sep 2024 09:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726046391; cv=none; b=cLQ173CvUJyZCPcLGMSd3ihG+9rHr8yXjbvkhpPxC9YSON+EEI+2/RnCxp5nixXGGfrex2J9o4c1Ig/PVKuuFLI2U2Ae/OkZ2Mmd46FhRGBPik0nnZsQggrHmYRGe/3tDs7Xy1Pvuqs+r9mcv2/7KBPoU9EbRExIwhTriFxxBf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726046391; c=relaxed/simple;
	bh=YIPXFHme4bb0LyUF6DXb594WmeqHfsWlheFR9Mb1vKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sH657NQwJ1dKzuhLg+O9n1m4rL/nyLIgselpyklyHjMTy13D4P+bDgaMrz0ixeHstNO7dCpD2lY0rPb1oUpzChfYOX5TdPWcYPKj+c3i24RhG/gVaPqLv4xEDXmGhwViRAA90Yv2fseatKeZNEFNr8Zrwyf5xvsDNB7xwKbpAig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZ7lhHnY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E65C4CEC5;
	Wed, 11 Sep 2024 09:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726046391;
	bh=YIPXFHme4bb0LyUF6DXb594WmeqHfsWlheFR9Mb1vKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZ7lhHnYuj6Oc9oHUmyP/6O2rq2J9TWxatpLyhsYsyA7wh2VjZcUG/xYtyuWyNj2J
	 1DBbj7J8tnqZlqCQIccsoPdZzKF1Esqre+azlwWyErUif7ZufNeE287JFLgiGdkFbE
	 X7iCJyJXjEFxr4cozpiMtdw0Nw8+oXsl1sA5l91B6UD66EBvpoPRcGcjefcxymiNFS
	 KV95UWav+BMht5vk5bfUPo7865h+7j4u/l5FCxyAgstQfEbXhHd8OtjKaBQIqD3BQz
	 A5uLCAGqh1ND5IwsvEXIGcSdbqWu9FOGrJtFjrwmVBjTzophths4GfISNILUDlmx50
	 bH7eIx4N23cvQ==
Date: Wed, 11 Sep 2024 11:19:47 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Robert Richter <rric@kernel.org>
Subject: Re: [PATCH v7 1/2] i2c: octeon: refactor common i2c operations
Message-ID: <5qafqlqdcm5jsynyqumzfhzqpkaog55muytcdwqlhebcnt5rgg@oxdv6yfid42a>
References: <20240620041746.3315255-1-aryan.srivastava@alliedtelesis.co.nz>
 <20240620041746.3315255-2-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620041746.3315255-2-aryan.srivastava@alliedtelesis.co.nz>

Hi Aryan,

...

> +/* Construct and send i2c transaction core cmd for read ops */
> +static int octeon_i2c_hlc_read_cmd(struct octeon_i2c *i2c, struct i2c_msg msg, u64 cmd)
> +{
> +	u64 ext = 0;
> +
> +	if (octeon_i2c_hlc_ext(i2c, msg, &cmd, &ext))
> +		octeon_i2c_writeq_flush(ext, i2c->twsi_base + SW_TWSI_EXT(i2c));
> +

What I meant last time is that there is still a change here. I
understand the common parts you addressed in my previous review,
but you're still missing this...

> +	return octeon_i2c_hlc_cmd_send(i2c, cmd);
> +}
> +
>  /* high-level-controller composite write+read, msg0=addr, msg1=data */
>  static int octeon_i2c_hlc_comp_read(struct octeon_i2c *i2c, struct i2c_msg *msgs)
>  {
> @@ -499,26 +543,8 @@ static int octeon_i2c_hlc_comp_read(struct octeon_i2c *i2c, struct i2c_msg *msgs
>  	/* A */
>  	cmd |= (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
>  
> -	if (msgs[0].flags & I2C_M_TEN)
> -		cmd |= SW_TWSI_OP_10_IA;
> -	else
> -		cmd |= SW_TWSI_OP_7_IA;
> -
> -	if (msgs[0].len == 2) {
> -		u64 ext = 0;
> -
> -		cmd |= SW_TWSI_EIA;
> -		ext = (u64)msgs[0].buf[0] << SW_TWSI_IA_SHIFT;
> -		cmd |= (u64)msgs[0].buf[1] << SW_TWSI_IA_SHIFT;
> -		octeon_i2c_writeq_flush(ext, i2c->twsi_base + SW_TWSI_EXT(i2c));
> -	} else {
> -		cmd |= (u64)msgs[0].buf[0] << SW_TWSI_IA_SHIFT;
> -	}
> -
> -	octeon_i2c_hlc_int_clear(i2c);
> -	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + SW_TWSI(i2c));

... this! While I don’t know the hardware internals, this is a
logical change that requires justification, especially when
compared to what you’ve described in the commit message.

Andi

> -	ret = octeon_i2c_hlc_wait(i2c);
> +	/* Send core command */
> +	ret = octeon_i2c_hlc_read_cmd(i2c, msgs[0], cmd);
>  	if (ret)
>  		goto err;

