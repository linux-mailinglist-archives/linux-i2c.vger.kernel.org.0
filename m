Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7934243E8
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Oct 2021 19:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbhJFRWj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Oct 2021 13:22:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:58732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229835AbhJFRWi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Oct 2021 13:22:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A4E761186;
        Wed,  6 Oct 2021 17:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633540846;
        bh=kC3f5ZG5f4wd6mEL2gYcuxdj+qioZyKCdsOoTI7W7Hs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p9uLFu6xlkuF/eM2q3t7grPqDZ09Shd7Tn6wwXaUr0B2FV0JQWUbBWm3wO6/EmTd5
         wnKmpWfnfdRqFOCA6xNsOKqWTfdfwZvxNnXIy1s9dKsy6lsyDkLWpkyHPuevJd5XJu
         nu/TsQLmfYqlGnrDS2yodVF1L0fBET9yBtsce99Q=
Date:   Wed, 6 Oct 2021 19:20:43 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Saravana Kannan <saravanak@google.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v1 1/3] driver core: Provide device_match_acpi_handle()
 helper
Message-ID: <YV3a69VgQT4dOKTH@kroah.com>
References: <20211006171517.47393-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006171517.47393-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 06, 2021 at 08:15:15PM +0300, Andy Shevchenko wrote:
> We have couple of users of this helper, make it available for them.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/base/core.c        | 6 ++++++
>  include/linux/device/bus.h | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index c4a2c97a21a2..18f1f6499246 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -4840,6 +4840,12 @@ int device_match_acpi_dev(struct device *dev, const void *adev)
>  }
>  EXPORT_SYMBOL(device_match_acpi_dev);
>  
> +int device_match_acpi_handle(struct device *dev, const void *handle)
> +{
> +	return ACPI_HANDLE(dev) == handle;
> +}
> +EXPORT_SYMBOL(device_match_acpi_dev);

Did you build this?

:(

