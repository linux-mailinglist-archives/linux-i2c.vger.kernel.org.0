Return-Path: <linux-i2c+bounces-4276-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A5C913844
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 08:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D005B2236D
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 06:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E295C17C77;
	Sun, 23 Jun 2024 06:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UrM1HzIr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1B5FC08
	for <linux-i2c@vger.kernel.org>; Sun, 23 Jun 2024 06:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719123233; cv=none; b=fx10m9CS6Rl1HeSklqsFZkDAfQdRgCyyISzYahnVRqiO06f77AQvpEGlcEXBsKyev3UfxTPcjp0ukIfjQmtTRglXvBPzEy0y6/cdf7RFhOtqcAQXOb8Q32btjXto2Fv5HN0jLN+VG1F2XNxXH1UEj/BCuGkX2Hoq8qp/1XwdtMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719123233; c=relaxed/simple;
	bh=o5uVPD7Iku4dfF/SMKPi4VCxRmUZNa2vE7HkCfkJu/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtNqg5C+uKic3AqXi0xxaq9KmAT8o5+JoSH+H+CvobZjtVcnusIT+MdGny8dx0lKCMEVNxU/w1Z9oqesaNcce36Bqap4uCCqJE1C1hLxJQcZ/xJ+4OA5xWokqUHOhXkF8uZwmzkWgBFmxpR4rWDmAAfMkWzgcVzbTqYFS7oE6W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UrM1HzIr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2489C2BD10;
	Sun, 23 Jun 2024 06:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719123233;
	bh=o5uVPD7Iku4dfF/SMKPi4VCxRmUZNa2vE7HkCfkJu/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UrM1HzIrw5ou5zDf/QsHo22un2RdQyixJdRvkSXtZVXwmMe5NOSYZx/s+D26hoeYp
	 umnryk1trk0v/mUOgVdilsuyuc+n7f2cVFB5n8VB2J8nddl4egoiIu7ybf9t7LmvCj
	 Zm/pbHELbDcGcfZofgNIxCHrfOFvuPgc+oPL/C6I=
Date: Sun, 23 Jun 2024 08:13:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-i2c@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 4/4] nvmem: core: Implement force_ro sysfs attribute
Message-ID: <2024062330-pound-endeared-b07a@gregkh>
References: <20240623031752.353818-1-marex@denx.de>
 <20240623031752.353818-4-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240623031752.353818-4-marex@denx.de>

On Sun, Jun 23, 2024 at 05:15:47AM +0200, Marek Vasut wrote:
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
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: linux-i2c@vger.kernel.org
> ---
> V2: - Document the force_ro attribute
>     - Use sysfs_emit()
> ---
>  Documentation/ABI/stable/sysfs-bus-nvmem | 13 +++++++
>  drivers/nvmem/core.c                     | 44 ++++++++++++++++++++++++
>  drivers/nvmem/internals.h                |  1 +
>  3 files changed, 58 insertions(+)
> 
> diff --git a/Documentation/ABI/stable/sysfs-bus-nvmem b/Documentation/ABI/stable/sysfs-bus-nvmem
> index 0e3a8492a1082..c713c4e6cecb1 100644
> --- a/Documentation/ABI/stable/sysfs-bus-nvmem
> +++ b/Documentation/ABI/stable/sysfs-bus-nvmem
> @@ -1,3 +1,16 @@
> +What:		/sys/bus/nvmem/devices/.../force_ro
> +Date:		June 2024
> +KernelVersion:	6.11
> +Contact:	Marek Vasut <marex@denx.de>
> +Description:
> +		This read/write attribute allows users to set read-write
> +		devices as read-only and back to read-write from userspace.
> +		This can be used to unlock and relock write-protection of
> +		devices which are generally locked, except during sporadic
> +		programming operation.
> +		Note: This file is only present if CONFIG_NVMEM_SYSFS
> +		is enabled

And what exactly are the values that can be read or written here?

thanks,

greg k-h

