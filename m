Return-Path: <linux-i2c+bounces-6015-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F139697CF
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 10:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 327651F23718
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 08:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31FC1C7669;
	Tue,  3 Sep 2024 08:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Fkadgr2z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861271C7662;
	Tue,  3 Sep 2024 08:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725353385; cv=none; b=FoM3/kdeXLlr6DkVpSmTC2O+0N220h8m70iw+RJ7gbZZDC0vnKKFLQnkxfwyV/TpAsXGbHIySihPT8VjE4gfP/VE83ioQ4JQcUrqIUdVIqcpJ0AcZz4+0NGWYqJmH3TCYkGmF3IVv0dFZWs8O7P0x3meSsoVt8PUdrphT6+kGNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725353385; c=relaxed/simple;
	bh=XX9z8YCDy27CoDZtJF/sIR8V50PVNzRI4OMkqgjKb8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHRFE15Iz/SwjNlxHJgOEjguo99swHeHWgS0W6V9S6bA3iNSNZcIcL7MUtUwzCGChIh8bGgwNwZCUG1A6lY1B5EZG/5Jan8aMgHJAoEI9wO2uzgPvbZ12yjYZK6iwlC4H5AWk82K8GtEjlbuTD/wB/IzvBV4PsoxbfUzH+m5XKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Fkadgr2z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960F1C4CEC4;
	Tue,  3 Sep 2024 08:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725353385;
	bh=XX9z8YCDy27CoDZtJF/sIR8V50PVNzRI4OMkqgjKb8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fkadgr2zXJn6wfmFpEQneqHH+x4JJBcVPgAY0VFviigUYFNIoNejwMAzZrhMusPKW
	 JJFDkb5EbxCosyUieY2TQpR7B2upbrkU+7cRpM5+vhK6vMar/MHrNpDOgx/gN8y9us
	 8EK8K7dl4aBwEaClo/EJAR0yBCXD7yEAS8jEA/v8=
Date: Tue, 3 Sep 2024 10:49:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: core: Switch I2C_COMPAT to default n
Message-ID: <2024090319-subsystem-quack-27a1@gregkh>
References: <4660a46b-9128-4407-8baa-f257245784a3@gmail.com>
 <8e618f52-413c-41c1-9ac2-0260a1904792@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e618f52-413c-41c1-9ac2-0260a1904792@gmail.com>

On Mon, Sep 02, 2024 at 09:01:18PM +0200, Heiner Kallweit wrote:
> I2C_COMPAT has been considered deprecated for 15 years now.
> Therefore make it default n, before we remove support for it
> in the near future.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
> index 44710267d..e5721cebb 100644
> --- a/drivers/i2c/Kconfig
> +++ b/drivers/i2c/Kconfig
> @@ -42,11 +42,11 @@ config I2C_BOARDINFO
>  
>  config I2C_COMPAT
>  	bool "Enable compatibility bits for old user-space"
> -	default y
> +	default n

Just remove the default line, that way it will default to 'n'.

thanks,

greg k-h

