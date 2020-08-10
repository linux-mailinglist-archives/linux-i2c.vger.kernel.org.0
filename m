Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEE772407BD
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Aug 2020 16:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgHJOl5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Aug 2020 10:41:57 -0400
Received: from foss.arm.com ([217.140.110.172]:56762 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726392AbgHJOl4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Aug 2020 10:41:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C24F81063;
        Mon, 10 Aug 2020 07:41:55 -0700 (PDT)
Received: from bogus (unknown [10.37.12.40])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3002A3F22E;
        Mon, 10 Aug 2020 07:41:51 -0700 (PDT)
Date:   Mon, 10 Aug 2020 15:41:48 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: Re: [PATCH v5 1/6] i2c: Allow driver to manage the device's power
 state during probe
Message-ID: <20200810144148.GD31434@bogus>
References: <20200810142747.12400-1-sakari.ailus@linux.intel.com>
 <20200810142747.12400-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200810142747.12400-2-sakari.ailus@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 10, 2020 at 05:27:42PM +0300, Sakari Ailus wrote:
> Enable drivers to tell ACPI that there's no need to power on a device for
> probe. Drivers should still perform this by themselves if there's a need
> to. In some cases powering on the device during probe is undesirable, and
> this change enables a driver to choose what fits best for it.
>
> Add a field called "flags" into struct i2c_driver for driver flags, and a
> flag I2C_DRV_FL_ALLOW_LOW_POWER_PROBE to tell a driver supports probe in
> low power state.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/i2c/i2c-core-base.c | 17 ++++++++++++++---
>  include/linux/i2c.h         | 14 ++++++++++++++
>  2 files changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 34a9609f256da..cde9cf49a07e6 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -436,6 +436,14 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
>  	return irq > 0 ? irq : -ENXIO;
>  }
>
> +static bool allow_low_power_probe(struct device *dev)
> +{
> +	struct i2c_driver *driver = to_i2c_driver(dev->driver);
> +
> +	return driver->flags & I2C_DRV_FL_ALLOW_LOW_POWER_PROBE &&
> +		device_property_present(dev, "allow-low-power-probe");

I assume this change makes even the DT property "allow-low-power-probe"
work in the same way. Should we have proper DT binding for that ?

This comment applies for any property using device_property_* but has
no explicit DT binding ? Just asking the question to know the strategy
followed. Sorry if this is redundant question, feel free to point me
to the past discussions.

--
Regards,
Sudeep
