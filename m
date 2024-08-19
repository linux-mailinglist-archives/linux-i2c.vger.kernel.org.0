Return-Path: <linux-i2c+bounces-5550-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA65B95758C
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 22:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75CAB1F22DC9
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 20:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0CC158A12;
	Mon, 19 Aug 2024 20:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9IuJ8UQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6E8156C70;
	Mon, 19 Aug 2024 20:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724098820; cv=none; b=Bipha16g3u8zKZCzbwSx6HoskWt9QkqGCcNS2lof3JxQ53AV+K2neWWDQObfIO9lt0FsgCOL2ZuNe2VLnNj+VSqBB+PQI4+v3Ap8vbXQx9n7JjnL37J3uVKU27HhkORn4FO2RGO40Eh+iMGmrYS3qz0WHYOAaa4cU5v8aYEJV0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724098820; c=relaxed/simple;
	bh=xMl3KF1I77LcsYpUwuHdMfjHTgdWQ2Kk5sNZNCi9t7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fx/RTmDY5Pl1jT7IQcILekiU35nNv6ZbNprXXf6fRhA8TfYmqHzE8QKTFCoECSIS+ZuhksEwd2Zh27qCp5Ii/3gQVba+qsGNGTmMcEh7v5oowSgjZHxAPXCciwpv+8ISgk4leuG52euc58nX1OzCSRdn344qzkRIOtIb6DWVY3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9IuJ8UQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78EAC32782;
	Mon, 19 Aug 2024 20:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724098819;
	bh=xMl3KF1I77LcsYpUwuHdMfjHTgdWQ2Kk5sNZNCi9t7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9IuJ8UQe+UACGdbnqMEngscWzivAdHtTbMfltUUElolcVIyU/Jq1vAbUw6JFM0+d
	 a6pnLy7w/L8hXxwKTqhx7Zqpyeu8sXwdpJ0brjNFj+tPuY+azGBuk3ppk3M8+2LcfH
	 JEf2qB2joyZqY97fHhpWYI1KldTDvnQqFCbKqLzm2w2M08Fc5NRq7FJ/1EhyctES9R
	 nQv3Qfp5nn/AX9DQ0J23zb6N7dzq3Q1/sJpK3ATXvbr6atAUGfKqFZnnqNQr7CVoEc
	 GuiCSuUBICwg4rGUlMdvOjDm4w+oh8txKvZJME3qt5F4SoHgPV0P6COha6yeHlxVzU
	 X1v4K+jXzO+Ng==
Date: Mon, 19 Aug 2024 22:20:13 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
	p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 06/11] i2c: riic: Define individual arrays to describe
 the register offsets
Message-ID: <vjtfwuxkkml2d6jf7sela2oocdme3s27qgymsgk5vosdkrzvxc@wckgz35siylj>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
 <20240819102348.1592171-7-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819102348.1592171-7-claudiu.beznea.uj@bp.renesas.com>

Geert,

do you have any comment here?

Thanks,
Andi

On Mon, Aug 19, 2024 at 01:23:43PM GMT, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Define individual arrays to describe the register offsets. In this way
> we can describe different IP variants that share the same register offsets
> but have differences in other characteristics. Commit prepares for the
> addition of fast mode plus.
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v4:
> - collected tags
> 
> Changes in v3:
> - none
> 
> Changes in v2:
> - none
> 
>  drivers/i2c/busses/i2c-riic.c | 58 +++++++++++++++++++----------------
>  1 file changed, 31 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
> index f863b367fb85..cc2452853d19 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -91,7 +91,7 @@ enum riic_reg_list {
>  };
>  
>  struct riic_of_data {
> -	u8 regs[RIIC_REG_END];
> +	const u8 *regs;
>  };
>  
>  struct riic_dev {
> @@ -522,36 +522,40 @@ static void riic_i2c_remove(struct platform_device *pdev)
>  	pm_runtime_dont_use_autosuspend(dev);
>  }
>  
> +static const u8 riic_rz_a_regs[RIIC_REG_END] = {
> +	[RIIC_ICCR1] = 0x00,
> +	[RIIC_ICCR2] = 0x04,
> +	[RIIC_ICMR1] = 0x08,
> +	[RIIC_ICMR3] = 0x10,
> +	[RIIC_ICSER] = 0x18,
> +	[RIIC_ICIER] = 0x1c,
> +	[RIIC_ICSR2] = 0x24,
> +	[RIIC_ICBRL] = 0x34,
> +	[RIIC_ICBRH] = 0x38,
> +	[RIIC_ICDRT] = 0x3c,
> +	[RIIC_ICDRR] = 0x40,
> +};
> +
>  static const struct riic_of_data riic_rz_a_info = {
> -	.regs = {
> -		[RIIC_ICCR1] = 0x00,
> -		[RIIC_ICCR2] = 0x04,
> -		[RIIC_ICMR1] = 0x08,
> -		[RIIC_ICMR3] = 0x10,
> -		[RIIC_ICSER] = 0x18,
> -		[RIIC_ICIER] = 0x1c,
> -		[RIIC_ICSR2] = 0x24,
> -		[RIIC_ICBRL] = 0x34,
> -		[RIIC_ICBRH] = 0x38,
> -		[RIIC_ICDRT] = 0x3c,
> -		[RIIC_ICDRR] = 0x40,
> -	},
> +	.regs = riic_rz_a_regs,
> +};
> +
> +static const u8 riic_rz_v2h_regs[RIIC_REG_END] = {
> +	[RIIC_ICCR1] = 0x00,
> +	[RIIC_ICCR2] = 0x01,
> +	[RIIC_ICMR1] = 0x02,
> +	[RIIC_ICMR3] = 0x04,
> +	[RIIC_ICSER] = 0x06,
> +	[RIIC_ICIER] = 0x07,
> +	[RIIC_ICSR2] = 0x09,
> +	[RIIC_ICBRL] = 0x10,
> +	[RIIC_ICBRH] = 0x11,
> +	[RIIC_ICDRT] = 0x12,
> +	[RIIC_ICDRR] = 0x13,
>  };
>  
>  static const struct riic_of_data riic_rz_v2h_info = {
> -	.regs = {
> -		[RIIC_ICCR1] = 0x00,
> -		[RIIC_ICCR2] = 0x01,
> -		[RIIC_ICMR1] = 0x02,
> -		[RIIC_ICMR3] = 0x04,
> -		[RIIC_ICSER] = 0x06,
> -		[RIIC_ICIER] = 0x07,
> -		[RIIC_ICSR2] = 0x09,
> -		[RIIC_ICBRL] = 0x10,
> -		[RIIC_ICBRH] = 0x11,
> -		[RIIC_ICDRT] = 0x12,
> -		[RIIC_ICDRR] = 0x13,
> -	},
> +	.regs = riic_rz_v2h_regs,
>  };
>  
>  static int riic_i2c_suspend(struct device *dev)
> -- 
> 2.39.2
> 

