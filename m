Return-Path: <linux-i2c+bounces-1351-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C33878306ED
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 14:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E91591C24705
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 13:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACE71F19D;
	Wed, 17 Jan 2024 13:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6hDhC3X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2734E1EB51;
	Wed, 17 Jan 2024 13:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705497604; cv=none; b=uU3fqMKcRZdYeTCULw3Sl5TpOXtvY5CVI4cm3Mt22xBclGa+PIwE112NknDFSJ9kKILYhD2WrLMBK3khHHLgVCr90uFmrJxuqooeurNkQKfOjb0htVGCfPQla+/ugroKNpkl6Ej7DBJVpwW5WBDTh4/PkVi/5aWE1Px+GUKH46w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705497604; c=relaxed/simple;
	bh=3HJjddTb9x25iVPLA3FFl8X1AxowEc5UH1z2TvlPNp4=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=KfJ2HYDNtkB/xsQ4JK/zC41lU3WgPPpsBbdXz5HFOpMJMpLbLEH+LW2bPaCajjAFEqqUA1tgKSjn1MgU6Vji5Z5gnLa+4QVvfKbLXbWdFVjMfWdfw+P6JiF8daUmpiVVt490igHDMOXxi/eZs0ZI1GoyxhfRPjw1PshNQNW6XxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6hDhC3X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243D0C433F1;
	Wed, 17 Jan 2024 13:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705497602;
	bh=3HJjddTb9x25iVPLA3FFl8X1AxowEc5UH1z2TvlPNp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A6hDhC3XeU6kWuAYuAjXrY4xHQLZLIsRAyqf/KEMGh4Nvcg++xwJZN8vfgQxQP8xP
	 OPR9sYBXzK6xcqAencr0katYgWM/jyda9PyE+/8F20/1edH+GKiV/5BPBhH/8uAVRA
	 uofK6EplFMNRlho7doylGIHN5FzuL2Z4vyzy8iwPZw12fv/YLjiRFRvOQUk5jmKL8H
	 qFictchEY/ESWGfbQwJI8c6cDd2Gy5ALlyUx2oP7DalZXOPkO56Tx6ZhpsSiyw0e7g
	 r1KZSeZPcjVJpsfTkWaq3nf7OwcMV3kY61b3SHL0tz2Cfq7xoeli08TLPv/+sFEB5F
	 wnCscJi+xyI4w==
Date: Wed, 17 Jan 2024 14:19:56 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Michal Simek <michal.simek@amd.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] i2c: cadence: Avoid fifo clear after start
Message-ID: <lzvb6oyinlmdrbaat6ayxioca5r2qf7wi3kt63lzorbjytmmbn@wfuz63znrzbr>
References: <20240105125258.2470397-1-sai.pavan.boddu@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240105125258.2470397-1-sai.pavan.boddu@amd.com>

Hi Sai,

sorry, but I'm not really understanding the issue here.
On Fri, Jan 05, 2024 at 06:22:58PM +0530, Sai Pavan Boddu wrote:
> Driver unintentionally programs ctrl reg to clear fifo which is
> happening after start of transaction

what does it mean "unintentionally"?

> this was not the case previously
> as it was read-modified-write. This issue breaks i2c reads on QEMU as
> i2c-read is done before guest starts programming ctrl register.

this log can be improved. How about something like

The driver unintentionally programs the control register to clear
the FIFO, which occurs after the start of the transaction.
Previously, this was not an issue as it involved
read-modify-write operations. However, this current issue
disrupts I2C reads on QEMU, as the I2C read is executed before
the guest starts programming the control register.

> Fixes: ff0cf7bca6309 ("i2c: cadence: Remove unnecessary register reads")
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
> ---
>  drivers/i2c/busses/i2c-cadence.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index de3f58b60dce..6f7d753a8197 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -633,6 +633,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
>  
>  	if (hold_clear) {
>  		ctrl_reg &= ~CDNS_I2C_CR_HOLD;
> +		ctrl_reg &= ~CDNS_I2C_CR_CLR_FIFO;

I'm wondering whether the whole ctrl_reg should be reset after
the first write.

Andi

>  		/*
>  		 * In case of Xilinx Zynq SOC, clear the HOLD bit before transfer size
>  		 * register reaches '0'. This is an IP bug which causes transfer size
> -- 
> 2.25.1
> 

