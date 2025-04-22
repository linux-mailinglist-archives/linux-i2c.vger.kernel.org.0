Return-Path: <linux-i2c+bounces-10529-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEF0A97205
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 18:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1FA93A5EEA
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 16:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B3928FFE5;
	Tue, 22 Apr 2025 16:10:24 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD985283C9E
	for <linux-i2c@vger.kernel.org>; Tue, 22 Apr 2025 16:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338224; cv=none; b=i+LdSkCoF+1j2ba33HTPBZ4Z11ZPRMHOdbMpItE/wYqtXIHdDEaalS5mhgaU54pdrj1DY8tYKaUYJauNaHr1rR5egXuTRdDyYUQcwg3GRhcYm/tNBLwye6ZUj+ghXcwEXrCviXZb5UFyrsrHm5yAtyXLj8H13XTQwFN1OZ2pHpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338224; c=relaxed/simple;
	bh=nJevJKzYAzfxBEgFa8pg+lNR+fuS5jiwgYumveiDxJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cx/B0gOE/3gJUgTdKy5W13jjCaEj5VD4HBDocDbVhIotOPw3gqFkYGK/W+bCNecy6BLgrWsXXfNh2XJOeAlmT+jSL2MWPE+c4RoaCM4536DvlqWAQayB4dxZEetWWOuq9C9LhztVe9onT4NOewMvwIYnGk6p3BujsyX3pEiV9IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1u7GCK-0004il-Im; Tue, 22 Apr 2025 18:10:12 +0200
Message-ID: <4c195c2a-81c6-41c8-a134-1c7813904115@pengutronix.de>
Date: Tue, 22 Apr 2025 18:10:11 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: imx: drop master prefix
To: Troy Mitchell <troymitchell988@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Yongchao Jia <jyc0019@gmail.com>
References: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
 <20250421-i2c-imx-update-v1-2-1137f1f353d5@gmail.com>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250421-i2c-imx-update-v1-2-1137f1f353d5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On 4/21/25 07:36, Troy Mitchell wrote:
> In light of the recent updates to the i2c subsystem,
> drop master prefix.
> 
> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Please use a different cover letter title for your v2, adapting the
mainline doesn't tell the reader anything about what the series is about.

Perhaps something like i2c: imx: lock guards and cleanup

Thanks,
Ahmad

> ---
>  drivers/i2c/busses/i2c-imx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index cb96a57df4a0..dd07fde79632 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1690,8 +1690,8 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
>  }
>  
>  static const struct i2c_algorithm i2c_imx_algo = {
> -	.master_xfer = i2c_imx_xfer,
> -	.master_xfer_atomic = i2c_imx_xfer_atomic,
> +	.xfer = i2c_imx_xfer,
> +	.xfer_atomic = i2c_imx_xfer_atomic,
>  	.functionality = i2c_imx_func,
>  	.reg_slave	= i2c_imx_reg_slave,
>  	.unreg_slave	= i2c_imx_unreg_slave,
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


