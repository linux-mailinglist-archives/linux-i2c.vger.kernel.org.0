Return-Path: <linux-i2c+bounces-13244-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2ABBA5E0B
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 12:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 453282A7342
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 10:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A9C2DC359;
	Sat, 27 Sep 2025 10:56:25 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB5315B971;
	Sat, 27 Sep 2025 10:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758970585; cv=none; b=SD4Nh6t3LGm569WRquf8v8iXDWDfV1i1tPJh7uLLMGdEOvXL8zNrvYGMLq+LR2hL+sv+iV03bOIhM7vpiU1GAtkyeUtymBBRKk225Xo/vujDBnkRf9HtBGQ3o8igSm3PGO7LeixbPwbiOYVQbt7lvkdsMVfWepDqKF7PWa53kqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758970585; c=relaxed/simple;
	bh=I+ZlfiEFt+StkHEgrb6i6Dck7KEiUvRPWgotHmfoqsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTLupytruswxamk9+Ik4a2FGT/Is/Wx64hjPAVOBvxc6iCnR9etsxJ9kr2ahu6j4MKIM+j+wcanSbvIFTmAXZvHS+ZBM+AxWnN+XoqQ2O/FjepMYnZCm6T7WbR1EXuF3DXkxc6Y7bo8XJl1FgUN2wu4Ulq1bqG113mtjN4Vblhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 12DB133BEAD;
	Sat, 27 Sep 2025 10:56:21 +0000 (UTC)
Date: Sat, 27 Sep 2025 18:56:16 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <20250927105616-GYB1338789@gentoo.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>

On 10:02 Thu 25 Sep     , Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C with interrupts disabled.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 164 +++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 140 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 6b918770e612e098b8ad17418f420d87c94df166..e403eb7d6f329f4fe5c5242f94cc21094dff105c 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -97,6 +97,9 @@
>  
..
>  static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>  {
>  	unsigned long time_left;
> @@ -310,10 +368,28 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>  
>  		reinit_completion(&i2c->complete);
>  
> -		spacemit_i2c_start(i2c);
> +		if (i2c->is_pio) {
> +			/* We disable the interrupt to avoid unintended spurious triggers. */
the comment is suspicious, and seems wrong..
> +			disable_irq(i2c->irq);
> +
I guess this doesn't disable interrupt in the hardware layer, it will still
fire interrupt once enabled, so instead of calling disable_irq(), why not
dealing with ISR setting of the controller? I mean those "IE bits"(interrupt
enableing) of ICR REGISTER, disabling them should prevent the interrupt
triggered?

> +			/*
> +			 * The K1 I2C controller has a quirk:
> +			 * when doing PIO transfers, the status register must be cleared
> +			 * of all other bits before issuing a START.
> +			 * Failing to do so will prevent the transfer from working properly.
> +			 */
> +			spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
this also doesn't seem correct to me, the irq status bit should be cleared once
interrupt occur, not dealing it here before sending msg, this seems a
wrong procedure

> +
> +			spacemit_i2c_start(i2c);
> +			time_left = spacemit_i2c_wait_pio_xfer(i2c);
> +
> +			enable_irq(i2c->irq);
> +		} else {
> +			spacemit_i2c_start(i2c);
> +			time_left = wait_for_completion_timeout(&i2c->complete,
> +								i2c->adapt.timeout);
> +		}
>  
> -		time_left = wait_for_completion_timeout(&i2c->complete,
> -							i2c->adapt.timeout);
>  		if (!time_left) {
>  			dev_err(i2c->dev, "msg completion timeout\n");
>  			spacemit_i2c_conditionally_reset_bus(i2c);
> @@ -341,6 +417,9 @@ static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)

-- 
Yixun Lan (dlan)

