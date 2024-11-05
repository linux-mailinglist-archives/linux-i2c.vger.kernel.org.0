Return-Path: <linux-i2c+bounces-7777-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E7E9BCED0
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 15:13:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 464F81C2242E
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 14:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36281D8DF6;
	Tue,  5 Nov 2024 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="of0sFt/w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFD61D8DE4;
	Tue,  5 Nov 2024 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730815984; cv=none; b=fB/35g6RcRWH6eo4vbQ84u/IiTgn/Wfj0FjMNQUnD11Z1j7dOaajPW4PxDy5fpBQ57+4Ey6McAM0lnatlEnykIGVNX509wRMAZC79MQEZ/8hSFxTXkh0nZgSpYLzmLtGtkNLflzhyIMQ0X2ySUiFjTCY9kxvlP/4uzekfTHxByQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730815984; c=relaxed/simple;
	bh=o6Aw4cLXm/9l1y3eKvOCg9DO8JdisefQjjjqhLByyZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etU8+QsZt7YaukUGHah+a/is+QojXUMUiMhq4NM5/37LVnxG/68KJTvtclMEdijp9941DaX/+eARFfCBv+JIgyoc5i/UwSaBToexWsJ0x4WxdtBgoF0TJlaOhIZRfXU97nVsWRolHeV/EnHYAcpBwjtmt/Zmnfxfs+c1H9DRlac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=of0sFt/w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC80EC4CECF;
	Tue,  5 Nov 2024 14:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730815984;
	bh=o6Aw4cLXm/9l1y3eKvOCg9DO8JdisefQjjjqhLByyZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=of0sFt/wAowGigdCPNv+Qea29vcJbSjXU1qgp5ubsj1sJS6/DQVQ+8QGa+TB1Pvcj
	 3KHR91v+HxumeQaBEK7eNhyAE/cEfVyZnKYq1uRRStbXwuprBPPeqvifajQoLfTYcb
	 wzFnE5jb/xi84kZQ4d8JziHC1yP9uv51JVP6dXhE8wF4lBr5CUnw/IF2XCCUyYfHXt
	 amKoZpY00RwnEyxZWIYoMlhl1iB22FCEufEBNZZsLdu4hU68Xax0WtDgROIhhUwhk4
	 HORpbbOBekQGbYrXFpPyneK8ZeFZFm/0fCkUXvAwH1GWTBsvlrLn2pS4MLwLToCslW
	 vKbz2bcZ0L43A==
Date: Tue, 5 Nov 2024 15:13:00 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: rmk@dyn-67.arm.linux.org.uk, max.schwarz@online.de, 
	dianders@chromium.org, david.wu@rock-chips.com, heiko@sntech.de, vz@mleia.com, 
	wsa@kernel.org, manabian@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: pxa: Add check for clk_enable() and
 clk_prepare_enable()
Message-ID: <pyutqiut5yascxkwrv5ozrwdbmb4k4n2vu5jiia3fpgkra4up2@u7nvqpdscb4n>
References: <20241104214310.6048-1-jiashengjiangcool@gmail.com>
 <20241104214310.6048-2-jiashengjiangcool@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104214310.6048-2-jiashengjiangcool@gmail.com>

Hi Jiasheng,

On Mon, Nov 04, 2024 at 09:43:09PM +0000, Jiasheng Jiang wrote:
> Add check for the return values of clk_enable() and clk_prepare_enable()
> in order to catch the potential exceptions.
> 
> Fixes: e7d48fa2b5fb ("[I2C] pxa: provide late suspend and early resume hooks")
> Fixes: c3cef3f3c07b ("[ARM] pxa: update pxa i2c driver to use clk support")

I don't think we need the fixes tag here and nowhere else in this
series.

> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
>  drivers/i2c/busses/i2c-pxa.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
> index 4d76e71cdd4b..1118a7f5c6bf 100644
> --- a/drivers/i2c/busses/i2c-pxa.c
> +++ b/drivers/i2c/busses/i2c-pxa.c
> @@ -1503,7 +1503,11 @@ static int i2c_pxa_probe(struct platform_device *dev)
>  				i2c->adap.name);
>  	}
>  
> -	clk_prepare_enable(i2c->clk);
> +	ret = clk_prepare_enable(i2c->clk);
> +	if (ret) {
> +		dev_err(&dev->dev, "failed to enable clock: %d\n", ret);

please use dev_err_probe here.

Thanks for your patch.

Andi

