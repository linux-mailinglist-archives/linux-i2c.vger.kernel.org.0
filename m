Return-Path: <linux-i2c+bounces-14162-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9B9C6E63A
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 13:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A5C7838528D
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 12:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4434D357738;
	Wed, 19 Nov 2025 12:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="vuBbkI0c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6B7357726;
	Wed, 19 Nov 2025 12:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763554235; cv=none; b=i7LnGSLtXD2Ha/GunxUvhWU464aEL4VnTBfyUqiYE0Zp0EzD3/QW7gxaFR33rBJPDivgXEntEfQi6wksn9hKPAhCAB4/2fxCR5ftXkiD4750d/Ei16xWEfmbUQA8uiqoz2ZlXW+U2l/2HwZnSPIWwbODD0sf127PNGd9L8HahfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763554235; c=relaxed/simple;
	bh=gx7dfqtS0qKNDyQgFcv8bdsKEkYEWM2ISv6bq69Uo8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1bOk4n44QxUbUPiY53Aqs3Pf8UJWEmk2Nk2PSNFX9OaV/slACagWtC5TbX6+3khWBpDe8HXHviP/iPEn8aYz06K8dfR7A2gi/JMV6vWTDgp6ND21BiPebVU9Mnvsztvhsuur6gkuTusRL8UmqreeemWcM13cmQN060+IMKQLyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=vuBbkI0c; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763554129;
	bh=S7h+FU1LHdECY8e1Sl6WspAIu8Ya6oOxnRRIjO3o1OE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=vuBbkI0cnNYwopfj/0QYDEObcS3sfeHHrWCoxtpDpMPpesu2pyIdjsLrf1uflsXmy
	 s8BON9DgM0ZF/hBkhrkQJL3cVcZAxIj63VspfOdaKZ3EgjauZNNZkJzrhEk/XifAzl
	 tQ70ebDCIOL1sPhcxiFP1lFFH/OHTiV044egcUXM=
X-QQ-mid: zesmtpip2t1763554117t9482c6f6
X-QQ-Originating-IP: IK9N0AlKm0p8CM/IABJTzm7XNr6l+1k2JU3qct77bqo=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 19 Nov 2025 20:08:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12270866521218039204
EX-QQ-RecipientCnt: 18
Date: Wed, 19 Nov 2025 20:08:35 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Encrow Thorne <jyc0019@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: k1: add reset support
Message-ID: <2A293BCA6504D560+aR2zQzsDieMGOva5@troy-wujie14pro-arch>
References: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
 <20251119-i2c-k1_reset-support-v1-2-0e9e82bf9b65@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-i2c-k1_reset-support-v1-2-0e9e82bf9b65@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mk3pYwnXiIiD1/t9VxyfPdFlIsdTdYCLqw5i7RY5fjz6omcSQWqkIEvh
	jv1a2rhHbLdGy5aVDqurdJuJZv/i6I+oZh+levqFMEJn6pT+WuoE9ywpkxgTo9gTDNxXYpu
	Z9+htKga9sv8iPsYjAqboaXx4rYe7zrAXcvMKPTHKkzI4v9nDLsjbZXodu9jkUZhcBlq2NP
	piQ9mxramzyaqS+xEOELL4+gaJsMx75DMlOyb3xsSjXLBwm/XLXIh5oopr5+1vs/BdGmgRJ
	YvW5mfNzFufMdsh3DfKWn5zfOrWcMe2Esbt9sm5Ui6lT+3n5nPWvfJ55fT12EJ8rrrXKt9Y
	u4fOWhyZ6Oxyf99Eyl39axyjzY+Nu+F4R26Y+8hU/j9W4l1vVLPBhT22yRQXyu3H/nEDHoc
	mIb9la/S9MirXMhoHkDJtlEC946BpglvA6rh07DARc7oowQuxBKmk/pmN80LAM6qoykW/DU
	7S1Z/c5AktuoQvVjsFo1Ar3LDz35WkUWx3NdLKBR3wQ8Orbn06mm2TgX03uWxj4by9xFr3L
	GrScWvbaxfmCkUyZXQysz7duvxAm0wZZ05BmeXeZHzc8mg04OfTBuTS2U8BOIFwZDKpnXW5
	gW3lZ0mF5fM+DVx5vbXwpjin42KhQWFd6mp6+6qkD3fnYFZZpPnfgQZwpLFd/2EpZ+E3n4a
	ObYFcv40TadvdOC6Jvw1AEvfZMs9DX6gSLHoDiwGAQ8VfhncRFemuy+DPySDhOKBSI9f5jP
	w//I+C72LS0+m+EgLhE/2eb9VZR+bG/0e8B7lzaxwKqRMyjKuXd5Bqtk9r2I0y6WiKPANU7
	C/aZwnbDbI+JkARigAV/xbZyeVt7ZowAmUEKFJ94RUcn/wiuyOMBGNXGRxS5wQ5CnucEHJN
	YLyxx2wS/G2N5/x24BVxZQ7H8rTRRkDU1nP3t5lUQzCqMPZ/Jr6SeuQgtvO3f15GS7CkSv9
	FXyZfYntpBuOzWXXrDVTb+LOcqhnldABB3XTsAgWXnZP86gpFSEFOYTkJ5tHfet7AXeQLXG
	KTNZ9daYhFA21HmjTQbqh459zsiCKKtN/kFh1WH4yzEfqf44mt
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

Hi Encrow,

On Wed, Nov 19, 2025 at 07:46:44PM +0800, Encrow Thorne wrote:
> Add reset control handling to the K1 I2C driver.
> 
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 6b918770e612..64d817d8315d 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -10,6 +10,7 @@
>   #include <linux/module.h>
>   #include <linux/of_address.h>
>   #include <linux/platform_device.h>
> + #include <linux/reset.h>
>  
>  /* spacemit i2c registers */
>  #define SPACEMIT_ICR		 0x0		/* Control register */
> @@ -113,6 +114,7 @@ struct spacemit_i2c_dev {
>  	void __iomem *base;
>  	int irq;
>  	u32 clock_freq;
> +	struct reset_control *resets;
>  
>  	struct i2c_msg *msgs;
>  	u32 msg_num;
> @@ -571,6 +573,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>  	if (IS_ERR(clk))
>  		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
>  
> +	i2c->resets = devm_reset_control_get_optional(dev, NULL);
> +	if (IS_ERR(i2c->resets))
> +		return dev_err_probe(dev, PTR_ERR(i2c->resets),
> +				    "failed to get reset\n");
Please align.

> +
> +	reset_control_assert(i2c->resets);
> +	udelay(2);
This seems to be a very small value. If this
has been verified multiple times?

                        - Troy
> +	reset_control_deassert(i2c->resets);
> +
>  	spacemit_i2c_reset(i2c);
>  
>  	i2c_set_adapdata(&i2c->adapt, i2c);
> 
> -- 
> 2.25.1
> 
> 

