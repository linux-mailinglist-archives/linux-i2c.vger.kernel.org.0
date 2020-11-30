Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23BFB2C8D0C
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 19:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729740AbgK3Sl1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 13:41:27 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:32962 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729717AbgK3Sl0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 13:41:26 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D15E8B26;
        Mon, 30 Nov 2020 19:40:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606761643;
        bh=FeJgv55ZQDGX5SC/a9GdqcQVulu7NByYBHSarUh+RDs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TV/jfwfpKshB/m6EolPfZ4H+kgSJbZjpiHsjxU8moCRW2NlpV6DFp9AJVTfbDrJN+
         S7ej31bt2N4KK3FotagOeQc/GAengfDIf6ISGFXeIxW8FzFyELeXHC/YvNzaHtIGx3
         oCjJTeY8Agt8scqXAkl8GaBmLjbxH0j46YRzltM0=
Date:   Mon, 30 Nov 2020 20:40:34 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 14/18] acpi: utils: Add function to fetch dependent
 acpi_devices
Message-ID: <20201130184034.GW4141@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-15-djrscally@gmail.com>
 <20201130182354.GW4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130182354.GW4077@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Mon, Nov 30, 2020 at 08:23:54PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 30, 2020 at 01:31:25PM +0000, Daniel Scally wrote:
> > ACPI devices declare themselves dependent on other devices via the _DEP
> > buffer. Fetching the dependee from dependent is a matter of parsing
> > _DEP, but currently there's no method to fetch dependent from dependee.
> > Add one, so we can parse sensors dependent on a PMIC from the PMIC's
> > acpi_driver.
> 
> Do I understand correctly that it's an existing table provided by firmware that
> (ab)uses _DEP in such way? Note, the specification doesn't tell we may use it
> in this way, OTOH I don't remember if it strictly forbids such use.

The ACPI "bindings" (I come from the DT world, is there a standard term
to describe this in ACPI ?) for the camera in Windows-based Kaby Lake
machines could be used as textbook examples of how to abuse ACPI, in
many different ways :-) I'm sure that applies to ACPI in general
though...

Depending on the device, camera sensors are controlled by a PMIC that
provides regulators, clocks and GPIOs (for the reset and power down
signals), or directly by GPIOs that control discrete regulators and
sensor signals. In the first case an INT3472 device models the
regulator, which can be a TI TPS68470 or a uPI Semi uP6641Q (two
completely different devices with a single HID...). The device model is
specified in the CLDB, a custom data table for INT3472.

In the latter case, Intel has created ACPI bindings for a "discrete
PMIC". It uses an ACPI device object with HID set to INT3472 as well,
also with a CLDB whose type field indicate the PMIC is "discrete". The
ACPI device is only used to reference up to 4 GPIOs (provided by the
Kaby Lake GPIO controller, the LPSS) in the _CRS. There's also a _DSM
that reports, for each GPIO, its function. All this information should
have been stored in the camera sensor ACPI device object, but that would
have been too simple...

In both cases, the PMIC device object is referenced by the _DEP data. We
need to access it to dig up the GPIOs, look up their type, and register
fixed regulators, supply mappings and GPIO mappings for the sensor.

> So, please elaborate in the commit message why you need this and pint out to
> the 6.5.8 "_DEP (Operation Region Dependencies)" which clearly says about
> OpRegions and that part already supported by ACPI in the Linux, if I'm not
> mistaken, need to refresh my memory.
> 
> ...
> 
> > +	handle = adev->handle;
> > +
> > +	if (!acpi_has_method(handle, "_DEP"))
> > +		return 0;
> > +
> > +	status = acpi_evaluate_reference(handle, "_DEP", NULL, &dep_handles);
> > +	if (ACPI_FAILURE(status))
> > +		return 0;
> > +
> > +	for (i = 0; i < dep_handles.count; i++) {
> > +		struct acpi_device_info *info;
> > +
> > +		status = acpi_get_object_info(dep_handles.handles[i], &info);
> > +		if (ACPI_FAILURE(status))
> > +			continue;
> > +
> > +		if (info->valid & ACPI_VALID_HID) {
> > +			ret = acpi_bus_get_device(dep_handles.handles[i], &candidate);
> > +			if (ret || !candidate) {
> > +				kfree(info);
> > +				continue;
> > +			}
> > +
> > +			if (candidate == dependee) {
> > +				acpi_dev_put(candidate);
> > +				kfree(info);
> > +				return 1;
> > +			}
> > +
> > +			kfree(info);
> > +		}
> > +	}
> 
> Can you utilize (by moving to here and export for ACPI layer the
> acpi_lpss_dep()?

-- 
Regards,

Laurent Pinchart
