Return-Path: <linux-i2c+bounces-4278-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E9C913960
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 12:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E19D1C20D4D
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 10:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF176A342;
	Sun, 23 Jun 2024 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WwuWN2T7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B02F2CA7
	for <linux-i2c@vger.kernel.org>; Sun, 23 Jun 2024 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719137084; cv=none; b=H+llRIz2wqsw6qqKzYWbL32tx1pQ07jkjsqKUG2mSu4EcGnyylMAJ2eRP+OMXpMfR1LHLj5PmZg1yYg+jRP7bS+5kPhATbo8TlXDjb9YXFdI1qyNkjFsmjVXbhmD1flLqh2QcZlJrD5t9n8vMs0t/CQdBN4XHoVrH8/R8a8nERY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719137084; c=relaxed/simple;
	bh=P89GLESSHbKjUuRnqlXnJ+knmtoo+kIcJ+ZBjXWrjec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKrjUwmOLHDSrjwEPn5QypipF21VL2h/KD8DzsDWAbjSN58afB/6iC0ieIzrFrQSq6Hl0lDr6UzQCPeVU3sc7a8SY656lwnouZBcYOlysT3M6sEpoQvwb5z+gg9t6fS9HLLEY9l1iRt+u3802TmTJFW7MXFvENRocFj7O9Bg7V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WwuWN2T7; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A052AFF802;
	Sun, 23 Jun 2024 10:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719137080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UpUhxJTjXef7mrmznuFeyy/PGdc5ry2EqY0oYlNeZwA=;
	b=WwuWN2T71WFhDwaWUEoXn054uyMYUOxGnJb/tlsBFRoDvA7EAStswcGI6SkZpkrhOSriZe
	NLq2BPgtLSKZ3wOwfAi3HHWroNMO+9kz3y86Kf3VyNCAiCNAgKrCBa5wdsKEacVCCPpuMD
	WsNtO8iMGUVaZH1saJdrdmEjWrgTJ7PMUr6wwH+2NWo0qOTmmiZyLMXZQajzdzuE/Pdp+G
	KIelruTlc58jpHKBbeSUYMhp0YYpHU6BS4AAnPZhUNEkDWstmC+ScCMEIe12B3iJlsxzhp
	wRo1dW4zubYNiNyqE5frorEPHtrSvja9qZvVcZPp0NFiY/2C4EH19S1hFQlUlQ==
Date: Sun, 23 Jun 2024 12:04:39 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 2/4] nvmem: Document type attribute
Message-ID: <20240623100439c0d176f5@mail.local>
References: <20240623031752.353818-1-marex@denx.de>
 <20240623031752.353818-2-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240623031752.353818-2-marex@denx.de>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 23/06/2024 05:15:45+0200, Marek Vasut wrote:
> Document a type attribute used by userspace to discern different types of
> NVMEM devices. The implementation is already present, the ABI document is
> missing, add it.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: linux-i2c@vger.kernel.org
> ---
> V2: - New patch
> ---
>  Documentation/ABI/stable/sysfs-bus-nvmem | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/ABI/stable/sysfs-bus-nvmem b/Documentation/ABI/stable/sysfs-bus-nvmem
> index 854bd11d72ac4..0e3a8492a1082 100644
> --- a/Documentation/ABI/stable/sysfs-bus-nvmem
> +++ b/Documentation/ABI/stable/sysfs-bus-nvmem
> @@ -20,3 +20,14 @@ Description:
>  		  ...
>  		  *
>  		  0001000
> +
> +What:		/sys/bus/nvmem/devices/.../type
> +Date:		November 2018
> +KernelVersion:	5.0
> +Contact:	Alexandre Belloni <alexandre.belloni@bootlin.com>
> +Description:
> +		This read-only attribute allows user to read the NVMEM
> +		device type. Supported types are "Unknown", "EEPROM",
> +		"OTP", "Battery backed", "FRAM".
> +		Note: This file is only present if CONFIG_NVMEM_SYSFS
> +		is enabled
> -- 
> 2.43.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

