Return-Path: <linux-i2c+bounces-12831-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6BCB517D2
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 15:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 034EA4684A3
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 13:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928C7260563;
	Wed, 10 Sep 2025 13:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BWaoWt68"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BB41E9B35;
	Wed, 10 Sep 2025 13:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757510711; cv=none; b=D618qQs0jv1tnEpt9WeWTNVK5PbpzyIwtpz9AznNbrYI3fcWStL48RHO7VL6w97HBhtH4H0tEmdkxBTMfPyuOwAZ1aoHq7tHTeZkt7XAy6YUlsDEmWO+S3AgeuY/jEJYnAtR505MmmD2YcTK9NtrXVGlcFu7NAciacfapjZlWsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757510711; c=relaxed/simple;
	bh=jXWe1gVlqmHJz+/IEZuAtv9znlYNmpmvwSYIU2altns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jX9xvD6vz+1qH5rz6ajYs7dzMPZ9jzuQVhXCkM4vS24m1MuskyTQ6EPFgwAvSYKqNNJ9zNpVLglPYKGhhveUmwzucYn2x0pRbYUS/uyvFOFNOCgtXU/gVPMft9TrbAeE4FPnDXrxADBQtq1skI37CyUiRS01DC6AZ50GfKTEkfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BWaoWt68; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD98C4CEF0;
	Wed, 10 Sep 2025 13:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757510710;
	bh=jXWe1gVlqmHJz+/IEZuAtv9znlYNmpmvwSYIU2altns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWaoWt68gJTWs/EPVoCDdO6EX3bAi8j/KW4S86P8Avry9erGjqRVoTI3RrGQXjBBa
	 E/9J6GqjTWdHOTzUI4IHVih4Fx5782SFl/2WESPegfmdd9iEXHsBkmoG0R9pZAA827
	 HXmJ8k7BiE/F1N50PlAvvK3vDXdPx8nBlCakRCeY=
Date: Wed, 10 Sep 2025 15:25:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 0/3] usb/gpio/i2c: Add Intel USBIO USB IO-expander
 drivers
Message-ID: <2025091045-expel-fiction-299f@gregkh>
References: <20250907175056.47314-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907175056.47314-1-hansg@kernel.org>

On Sun, Sep 07, 2025 at 07:50:53PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Here is v2 of the patch series to add support for the Intel USBIO USB
> IO-expander used by the MIPI cameras on various new (Meteor Lake and later)
> Intel laptops.
> 
> Changes in v2:
> - Split usbio-bridge mutex into ctrl_mutex and bulk_mutex
> - Drop SPI support since this is not used on devices in the field
> - Rework disconnect handling to be more robust
> - Several different revisions need special casing add a quirks mechanism
>   for this
> - Stop using stdint.h (uintX_t) types
> - Use __le16, __le32 type + cpu_to_le16() and friends for on wire words
> - Properly check auxiliary_device_add() return value
> - Add a mutex to the GPIO driver to protect usbio_gpio_update_config()
>   calls, which read-modify-write banks[x].config, racing with each other
> - Adjust usbio_gpio_get() to have an int return value and propagate the
>   usbio_control_msg() return value
> - Various (small) style fixes from Sakari's review of all 3 patches
> 
> The first patch adds an USB bridge driver which registers auxbus children
> for the GPIO and I2C functions of the USBIO chip.
> 
> The second and third patch add a GPIO resp. an I2C driver for the
> auxbus children using the IO functions exported by the USB bridge driver.
> 
> The second and third patch depend on the IO functions exported by
> the first patch. So to merge this we will need either an immutable tag on
> the USB tree, or all 3 patches can be merged through the USB tree with
> acks from the GPIO and I2C subsystem maintainers.

Either is fine with me, patch 1 looks good enough for me to queue it up
now.  Let me know what you want me to do.

thanks,

greg k-h

