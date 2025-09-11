Return-Path: <linux-i2c+bounces-12873-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C3AB533CD
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 15:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35B36488019
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 13:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACAD1F03C5;
	Thu, 11 Sep 2025 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d+owmBMM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E601E87B;
	Thu, 11 Sep 2025 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757597511; cv=none; b=iZ2sr1CigB+JvHEj9SkiQk0ZBTTvvBVx+UeJi85Ba8r9TN7dY8kjdGAreJIH3spxEDJxWoPjeaslz8W68Ij7pepkD8PAfHBl8RpqRHehuJSWQw5ZlrRv/H8NGSRnnjhEXsou9hsaEn2gd4UEP/pG8g/EvoFOz4K8WF+x1kupCCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757597511; c=relaxed/simple;
	bh=bdkAfeqOtLrw8Rk5fQ1/9AGIZ5sgo/ymKSpCkXno8jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6H6rneVk/QPNabVlfWdOARWtnYD82/q5bMjlhxnGAZnqQErBhQRFSJ5UWsPfkd95yuG7qF2qBT/RlZ+VlPXDL95MRwWBvuQos+oqivgAk5cOUt8XZQpn7n29IVPPsUQtYQ/CFx1h+uArAR/1Wy4Lw5UMTv8T+3tZO3Lj4eDe+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d+owmBMM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA7DC4CEF0;
	Thu, 11 Sep 2025 13:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757597511;
	bh=bdkAfeqOtLrw8Rk5fQ1/9AGIZ5sgo/ymKSpCkXno8jU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d+owmBMMaoEYzj7ijuFcfepx8EZTCenoIM/Aas2XsSCUme6oQf3QNm9c+C5pmAVTy
	 1nI6kLuQiegxBIBwQQm1ocG9LPSAfY0JgGVHgQ2LZvKmjfKInjJLLQnSDinuVDIkje
	 kHIztKDvS5rbYjRd2ciomJgpFwf99XX5bQ39NvOE=
Date: Thu, 11 Sep 2025 15:31:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Hans de Goede <hansg@kernel.org>, Richard Hughes <rhughes@redhat.com>,
	linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 2/3] gpio: Add Intel USBIO GPIO driver
Message-ID: <2025091139-scalping-twenty-93d2@gregkh>
References: <20250911131832.59335-1-hansg@kernel.org>
 <20250911131832.59335-3-hansg@kernel.org>
 <CAMRc=McKOTWxu=M0S0p0Uyhod-h4mNH9QfsLsycN4vbHJPtgeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McKOTWxu=M0S0p0Uyhod-h4mNH9QfsLsycN4vbHJPtgeQ@mail.gmail.com>

On Thu, Sep 11, 2025 at 09:27:19AM -0400, Bartosz Golaszewski wrote:
> On Thu, 11 Sep 2025 15:18:31 +0200, Hans de Goede <hansg@kernel.org> said:
> > From: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
> >
> > Add a a driver for the GPIO auxbus child device of the Intel USBIO USB
> > IO-expander used by the MIPI cameras on various new (Meteor Lake and
> > later) Intel laptops.
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Co-developed-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
> > ---
> > Changes in v5:
> > - Move GPIO_USBIO Kconfig option under 'menu "USB GPIO expanders"'
> >
> > Changes in v4:
> > - Drop include <linux/dev_printk.h>, unneeded auxiliary_set_drvdata()
> >
> > Changes in v3:
> > - Drop (offset >= gc->ngpio) check and make usbio_gpio_get_bank_and_pin()
> >   return void
> > - Propagate usbio_gpio_set() ret val in usbio_gpio_direction_output()
> > - Use devm_gpiochip_add_data() and drop auxiliary_driver remove() callback
> >
> > Changes in v2:
> > - Add a config_mutex protect usbio_gpio_update_config() calls, which
> >   read-modify-write banks[x].config, racing with each other
> > - Adjust usbio_gpio_get() to have an int return value and propagate the
> >   usbio_control_msg() return value
> > - Use __le16, __le32 type + cpu_to_le16() and friends for on wire words
> > - Some small style fixes from Sakari's review
> 
> If Greg wants to take it:
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> or I can take it once patch 1/3 is in an immutable branch.

I'll just take it, simpler that way, thanks!

greg k-h

