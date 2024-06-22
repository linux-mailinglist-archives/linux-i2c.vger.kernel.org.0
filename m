Return-Path: <linux-i2c+bounces-4238-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E94191326D
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 08:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B033284E9B
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 06:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C5213D503;
	Sat, 22 Jun 2024 06:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="r42jzCU+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A5613D614
	for <linux-i2c@vger.kernel.org>; Sat, 22 Jun 2024 06:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719038947; cv=none; b=NsyDzyiEtfmjhdYVyd3Xw0YRhX+4Ic+fNfPBFD9MJCltL82oMcT5yqNDLCxLOH4pJswRQNEAtFeZIrTGoUuPkurGsoAh+Q6PAVz1RSAGssS/T/q7f8ySRMuyO1zldVNoDB+6haInpSMM75WSBnbcJeCU62+c7Izjt3X45ppw1fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719038947; c=relaxed/simple;
	bh=NUmXzTvjg4/nzJGbpypjHTAH5vUFfhGb3cSYD3YpYEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/bGVbzYVWkFPyO7fIiImdKNQ+r1nOt1sdEksiB3PtEVnX+o7r+ZiFX9hLEZGqPdy5c0xTzGMnrnUOeiWa/ayWXA+lYX1cr6dDHhWgHin6fp3oqKN5bY+aadctf6p5T1ywd9+Ied2ofX0rS6E5b9ZpX0zl2Z2hTRK/iMIA86UGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=r42jzCU+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA4BC32781;
	Sat, 22 Jun 2024 06:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719038946;
	bh=NUmXzTvjg4/nzJGbpypjHTAH5vUFfhGb3cSYD3YpYEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r42jzCU+tqlNavSc8NHmv+EQK41Jwj7l15+FDD/0lpmuHR6GbbRliOTM07jolEZAh
	 yprc7TzN3oHVpAQvLUkm5X1E36VAR1v9V4lYxGls84tnPO5eyhvlLYpsPL2JFcgAyl
	 6DIlgB8v6TytDYDnun8IYK35FNy6cOsF69BmYN2I=
Date: Sat, 22 Jun 2024 08:49:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-i2c@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] nvmem: core: Implement force_ro sysfs attribute
Message-ID: <2024062234-congested-partly-0cf1@gregkh>
References: <20240621160309.97843-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621160309.97843-1-marex@denx.de>

On Fri, Jun 21, 2024 at 06:02:14PM +0200, Marek Vasut wrote:
> Implement "force_ro" sysfs attribute to allow users to set read-write
> devices as read-only and back to read-write from userspace. The choice
> of the name is based on MMC core 'force_ro' attribute.
> 
> This solves a situation where an AT24 I2C EEPROM with GPIO based nWP
> signal may have to be occasionally updated. Such I2C EEPROM device is
> usually set as read-only during most of the regular system operation,
> but in case it has to be updated in a controlled manner, it could be
> unlocked using this new "force_ro" sysfs attribute and then re-locked
> again.
> 
> The "read-only" DT property and config->read_only configuration is
> respected and is used to set default state of the device, read-only
> or read-write, for devices which do implement .reg_write function.
> For devices which do not implement .reg_write function, the device
> is unconditionally read-only and the "force_ro" attribute is not
> visible.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-i2c@vger.kernel.org
> ---
>  drivers/nvmem/core.c      | 44 +++++++++++++++++++++++++++++++++++++++
>  drivers/nvmem/internals.h |  1 +
>  2 files changed, 45 insertions(+)

No Documentation/ABI/ update for the new sysfs file?

> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index e1ec3b7200d7b..d263871b66dca 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -184,7 +184,30 @@ static ssize_t type_show(struct device *dev,
>  
>  static DEVICE_ATTR_RO(type);
>  
> +static ssize_t force_ro_show(struct device *dev, struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct nvmem_device *nvmem = to_nvmem_device(dev);
> +
> +	return snprintf(buf, PAGE_SIZE, "%d\n", nvmem->read_only);

sysfs_emit() please.

thanks,

greg k-h

