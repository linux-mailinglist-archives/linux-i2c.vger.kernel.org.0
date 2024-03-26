Return-Path: <linux-i2c+bounces-2600-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAB388CCEF
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 20:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF449B25C1B
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 19:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3331F13D24C;
	Tue, 26 Mar 2024 19:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WjkalfX6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E464813CF8C;
	Tue, 26 Mar 2024 19:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711480700; cv=none; b=K60Ab5HMUpLPXfKjeabcNCNpIiPOAsxAuNujuJotYMok0vI0I3wmwgbhtk07YVvBOBW1+rwqfxBZm5fVNXDiNHfCRQGrql+KVxz17wmDYMeU7H/sVm8F5DXI3KE3jSm/HNzzkzbvoe+Yazbv0CAcoZsN0PVVHIAPmfTYKAaz7wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711480700; c=relaxed/simple;
	bh=nzPz1r4uhvpU/bB8HWtMns4axd/UbBU3+LcwC3N2YbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JX0/NyHK0DATkhOeAxMNBiApWQK4Pa9yg7rfPfCGH8ZbInUlDCnd7Pv473X66JAmETQbZT9YL7Qs1ZC3hyXx9CrOoZd/ifS1vlBw50ZwPARJoMC82Yi9uA/D7CK3zbu/MM7zl1PYlTTuD+Pxon1/tVw/6ZJfgm2ORYBm0N1x9O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WjkalfX6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9732C43394;
	Tue, 26 Mar 2024 19:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711480699;
	bh=nzPz1r4uhvpU/bB8HWtMns4axd/UbBU3+LcwC3N2YbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WjkalfX6hxl+ebXRe++5YDNFXtbUr5b3DMbbJ8sRm9xYXQz9T9s3F7NcC1fqNGXC3
	 1APBNZCk9XtfNFXcv7PgyOr6H+wpWWM7U1JWXIPWHxttvAx7PykN6BmOOG18a2d7lu
	 dB/qQmmQAP+gtbk0ZZsAF2jXBG2gjsfaKO1mmcbLCS3Q13fkdA94FoMjp76wrovD1l
	 QAi6kKlMPUwzNtV1+mjT2D2+lJuoo32BjzUBn047CQ7smPqlzegy9yv3VbUZ9YoyTX
	 aQT7zcxodhMgMf3FS8sLUgsbnHkWQqJyeAY3h2CJDhamMTDSH2FQwQR1uwNjVv3BQs
	 0Yh9YZ7bedGAg==
Date: Tue, 26 Mar 2024 20:18:15 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/64] i2c: eg20t: reword according to newest
 specification
Message-ID: <nvidlggoxqy5u5rzned3irryncmnnodkkcgcsknjvct72qjy7d@fsezkdxxokq4>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-19-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-19-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Fri, Mar 22, 2024 at 02:25:11PM +0100, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-eg20t.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
> index 4914bfbee2a9..e95793036f5d 100644
> --- a/drivers/i2c/busses/i2c-eg20t.c
> +++ b/drivers/i2c/busses/i2c-eg20t.c
> @@ -337,7 +337,7 @@ static int pch_i2c_wait_for_check_xfer(struct i2c_algo_pch_data *adap)
>  	adap->pch_event_flag = 0;
>  
>  	if (ioread32(p + PCH_I2CSR) & PCH_GETACK) {
> -		pch_dbg(adap, "Receive NACK for slave address setting\n");
> +		pch_dbg(adap, "Receive NACK for client address setting\n");
>  		return -ENXIO;
>  	}
>  
> @@ -382,7 +382,7 @@ static s32 pch_i2c_writebytes(struct i2c_adapter *i2c_adap,
>  	buf = msgs->buf;
>  	addr = msgs->addr;
>  
> -	/* enable master tx */
> +	/* enable host tx */

maybe we should also specify that we are using both host and
client for master in the commit message.

In any case,

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

