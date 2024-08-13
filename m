Return-Path: <linux-i2c+bounces-5360-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 052B19510A5
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 01:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 341491C20D41
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 23:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7CA1AC421;
	Tue, 13 Aug 2024 23:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qlBv+lWj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF2D1A3BCA
	for <linux-i2c@vger.kernel.org>; Tue, 13 Aug 2024 23:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723592141; cv=none; b=oYP4cIiY7+HfTGqqJte61X5tZoySEj3jVnym62lviNCXwQc0D54yaPuzwl1+I+Dtk6KS0I0WLdC4+C//JzCMZVFygv86tHyZUozcySYNR5FQfiGKG2OQVS09wmOmAZCqFiY4oRDzUk9pl7XHNchA/tRYFdb0OwVnvO/5Rl5fqco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723592141; c=relaxed/simple;
	bh=BbQiplGTeEyuPYeTgG23nt7yYYLaw3qrVIz73Puf6No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XF+0ydKegUJkgo5VUkGMbT895QLNqc0+j/z4/b2rmCdFqvkX9exXouOSxFH9Q8uLMzzn0favLquFzGKet++DAs/a0oDdWJNrjpn9WRnzX1seuq6s8dcfXXRIiTinucgJyQQ7dvjd+qHgTyohn8UthBGR9OoMo19qFM3JVyBNhGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qlBv+lWj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550B6C32782;
	Tue, 13 Aug 2024 23:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723592140;
	bh=BbQiplGTeEyuPYeTgG23nt7yYYLaw3qrVIz73Puf6No=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qlBv+lWjTC9YVgQBnYL74ZBnltRMpwME21OIPL9WpVID7VFrZgzFMndTrXSWdLS9v
	 VZyOQ4bp8MfaAzgiygOPae0B3pHpfZxqd/X/QDGxs/dtW4vrO/l1yrJ/uxpFWAONXY
	 JfFr0FAxAhx7GVvLiEtk4JS+1w+iYeFf0BKBSjBERM2EpZoeaYtgfq5GWjSLCD13rI
	 +wRPGSleiD4iHqVx4SogdKhwjS/xNhjQGO6uNkZlBcsAu1OHgbOL1YSH2TnHS8yvuE
	 48aKL/S7gKtXEtZgtX3xZ/8A0us7l8oPuX2em3OaZFxWGObOpLvkBw27YLsPLRpj7U
	 cECep12sxYzKw==
Date: Wed, 14 Aug 2024 00:35:37 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] pca954x: Reset if channel select fails
Message-ID: <htbbicu2tfag5vza6fiem67jvoxvstxyws345ghjlug5cpouhl@ig5air5zhfp2>
References: <DB6PR07MB3509F48523F601D4F6429D069DBA2@DB6PR07MB3509.eurprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB6PR07MB3509F48523F601D4F6429D069DBA2@DB6PR07MB3509.eurprd07.prod.outlook.com>

Hi Wojciech,

On Fri, Aug 09, 2024 at 08:17:52AM GMT, Wojciech Siudy (Nokia) wrote:
> From da1630ee3ed664df8fbd74c4063ab130c4e98c5d Mon Sep 17 00:00:00 2001
> From: Wojciech Siudy <wojciech.siudy@nokia.com>

Nice to see patches from Nokia :-)

> Date: Fri, 9 Aug 2024 09:59:27 +0200
> Subject: [PATCH] pca954x: Reset if channel select fails

please remove the mail header from the commit log.

If you want your name to appear without the "... (Nokia)" part
you can simply add:

From: Wojciech Siudy <wojciech.siudy@nokia.com>

> Channel selection that has timed out is a symptom of mux'es I2C
> subsystem failure. Without sending reset pulse the POR of entire
> system would be needed to restore the communication.
> 
> Signed-off-by: siudy <wojciech.siudy@nokia.com>

siudy?

...

> @@ -329,6 +345,12 @@ static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
>  		ret = pca954x_reg_write(muxc->parent, client, regval);
>  		data->last_chan = ret < 0 ? 0 : regval;
>  	}
> +	if (ret == -ETIMEDOUT && (data->reset_cont || data->reset_gpio)) {
> +		dev_warn(&client->dev, "channel select failed, resetting...\n");
> +		pca954x_reset_assert(data);
> +		udelay(10);

Why 10?

Andi

