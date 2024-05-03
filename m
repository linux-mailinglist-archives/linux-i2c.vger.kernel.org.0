Return-Path: <linux-i2c+bounces-3409-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 503E38BB3A3
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 21:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81BAEB23931
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 19:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40923158877;
	Fri,  3 May 2024 19:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJwQoM2R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AED19470;
	Fri,  3 May 2024 19:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714763003; cv=none; b=a2hhQxBQW1gtTjXnbKb8TlIIkTWi6EsCnUsQKzEV32XGgDDx4J2sOdrHUiUQxpTU6b3HO0YRT2fIoNeoBETZUWpodEUAEV4dtuZjdCH71wAmLhTNG1EY+Mv7L69l3jPyhg4jjB4jb9Po+ZDCu5BI9jngYZuQyAWJXSkbfSglSx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714763003; c=relaxed/simple;
	bh=pJM8i96ujPL/T4zAJrJuNpEQ+W+V/MxYLMvJEqYmBvg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l2vXJt7J6P0g/6pe7lIigS0kCnoLcdf3FnLWmtgyVVKEEtwszIZjxNQbFGbO3cXQjLl0FnuiKTrwB20vSDbNSXHpF5eMt/6EINPvlibMg2jptR3sq9yuY6fksJUgUS5umT3pNT94F3TkFMY2WUSE49741j6xiMr0h5u+twZdw2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJwQoM2R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6EDC116B1;
	Fri,  3 May 2024 19:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714763002;
	bh=pJM8i96ujPL/T4zAJrJuNpEQ+W+V/MxYLMvJEqYmBvg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nJwQoM2R038ROrePBZmLBa9LYRKlWHdPcGcYai07pnFJYM6UTHODQtRliqexPCOgg
	 WyQenZ6EGL6INqEuQpZnvuyV5VrXQkVxgu74DZj4mKJs4LRaGTYwzIsNSmCZMTrvwZ
	 AUXClks0NGxZ0OY3IItj4fPXk/lqFMVEPDE771iQqnaGMB3uQmEjnOz0KCG/IFR60O
	 own53ZbY1D1FjeQObRwkIrGaVe0hJC8+m+TOnlN7L5tjp+ohRqe+SAjcjAt7CrKDh0
	 Elyj8osbsh3KXPBnBAL9C3QOyL3fEJVeH9a0hjbk8fgnvV8hCcO7v0AbQ1+m679Nsi
	 GrNG8hEtpghEA==
Date: Fri, 3 May 2024 20:03:14 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
 (V4L/DVB)), linux-kernel@vger.kernel.org (open list), Wolfram Sang
 <wsa+renesas@sang-engineering.com>, amd-gfx@lists.freedesktop.org (open
 list:RADEON and AMDGPU DRM DRIVERS), dri-devel@lists.freedesktop.org (open
 list:DRM DRIVERS), intel-gfx@lists.freedesktop.org (open list:INTEL DRM
 DISPLAY FOR XE AND I915 DRIVERS), intel-xe@lists.freedesktop.org (open
 list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS), linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM
 HOST DRIVERS), linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER)
Subject: Re: [PATCH v0 04/14] media: au0828: Make I2C terminology more
 inclusive
Message-ID: <20240503200314.51e8439a@sal.lan>
In-Reply-To: <20240329170038.3863998-5-eahariha@linux.microsoft.com>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
	<20240329170038.3863998-5-eahariha@linux.microsoft.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 29 Mar 2024 17:00:28 +0000
Easwar Hariharan <eahariha@linux.microsoft.com> escreveu:

> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
> with more appropriate terms. Inspired by and following on to Wolfram's
> series to fix drivers/i2c/[1], fix the terminology for users of
> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> in the specification.
> 
> Compile tested, no functionality changes intended

Current media drivers are perfectly fine with the current terminology. 
None of them implement the above new standards.

Please drop patches for current stuff under drivers/media.

Regards,
Mauro

> 
> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  drivers/media/usb/au0828/au0828-i2c.c   | 4 ++--
>  drivers/media/usb/au0828/au0828-input.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/au0828/au0828-i2c.c b/drivers/media/usb/au0828/au0828-i2c.c
> index 749f90d73b5b..3e66d42bf134 100644
> --- a/drivers/media/usb/au0828/au0828-i2c.c
> +++ b/drivers/media/usb/au0828/au0828-i2c.c
> @@ -23,7 +23,7 @@ MODULE_PARM_DESC(i2c_scan, "scan i2c bus at insmod time");
>  #define I2C_WAIT_DELAY 25
>  #define I2C_WAIT_RETRY 1000
>  
> -static inline int i2c_slave_did_read_ack(struct i2c_adapter *i2c_adap)
> +static inline int i2c_client_did_read_ack(struct i2c_adapter *i2c_adap)
>  {
>  	struct au0828_dev *dev = i2c_adap->algo_data;
>  	return au0828_read(dev, AU0828_I2C_STATUS_201) &
> @@ -35,7 +35,7 @@ static int i2c_wait_read_ack(struct i2c_adapter *i2c_adap)
>  	int count;
>  
>  	for (count = 0; count < I2C_WAIT_RETRY; count++) {
> -		if (!i2c_slave_did_read_ack(i2c_adap))
> +		if (!i2c_client_did_read_ack(i2c_adap))
>  			break;
>  		udelay(I2C_WAIT_DELAY);
>  	}
> diff --git a/drivers/media/usb/au0828/au0828-input.c b/drivers/media/usb/au0828/au0828-input.c
> index 3d3368202cd0..98a57b6e02e2 100644
> --- a/drivers/media/usb/au0828/au0828-input.c
> +++ b/drivers/media/usb/au0828/au0828-input.c
> @@ -30,7 +30,7 @@ struct au0828_rc {
>  	int polling;
>  	struct delayed_work work;
>  
> -	/* i2c slave address of external device (if used) */
> +	/* i2c client address of external device (if used) */
>  	u16 i2c_dev_addr;
>  
>  	int  (*get_key_i2c)(struct au0828_rc *ir);

