Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021502CBABC
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 11:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388304AbgLBKko (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 05:40:44 -0500
Received: from mga05.intel.com ([192.55.52.43]:48995 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725971AbgLBKko (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 05:40:44 -0500
IronPort-SDR: AMU5WaUTMjLpHEYoWmYpWIiAlYXnsm1lvSgcbCW6Y2kd4AJGttyxnu78uPSmNijqpBvelqHNni
 9QBA+gaxaADA==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="257706316"
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; 
   d="scan'208";a="257706316"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 02:39:02 -0800
IronPort-SDR: QViAd5tmDjr+sBoGlfIZBSw3H866zkbPNe26YOdRP40UaXgTBtmwkIM2Db354V62lr5NvOmtfM
 5NcyLEhYA4Zw==
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; 
   d="scan'208";a="481506009"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 02:38:54 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id ED62D20884; Wed,  2 Dec 2020 12:38:51 +0200 (EET)
Date:   Wed, 2 Dec 2020 12:38:51 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dan Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
        andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 13/18] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
Message-ID: <20201202103851.GC852@paasikivi.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-14-djrscally@gmail.com>
 <20201130170955.GN14465@pendragon.ideasonboard.com>
 <b5cc6bbd-f679-7023-fde0-de2acb65a3c2@gmail.com>
 <20201201223053.GB4569@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201223053.GB4569@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Laurent,

On Wed, Dec 02, 2020 at 12:30:53AM +0200, Laurent Pinchart wrote:
> Hi Daniel,
> 
> On Tue, Dec 01, 2020 at 10:08:25PM +0000, Dan Scally wrote:
> > On 30/11/2020 17:09, Laurent Pinchart wrote:
> > > On Mon, Nov 30, 2020 at 01:31:24PM +0000, Daniel Scally wrote:
> > >> Currently on platforms designed for Windows, connections between CIO2 and
> > >> sensors are not properly defined in DSDT. This patch extends the ipu3-cio2
> > >> driver to compensate by building software_node connections, parsing the
> > >> connection properties from the sensor's SSDB buffer.
> > >>
> > >> Suggested-by: Jordan Hand <jorhand@linux.microsoft.com>
> > >> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> > >> ---
> > >> Changes since RFC v3:
> > >>
> > >> 	- Removed almost all global variables, dynamically allocated
> > >> 	the cio2_bridge structure, plus a bunch of associated changes
> > >> 	like 
> > >> 	- Added a new function to ipu3-cio2-main.c to check for an 
> > >> 	existing fwnode_graph before calling cio2_bridge_init()
> > >> 	- Prefixed cio2_bridge_ to any variables and functions that
> > >> 	lacked it
> > >> 	- Assigned the new fwnode directly to the sensor's ACPI device
> > >> 	fwnode as secondary. This removes the requirement to delay until
> > >> 	the I2C devices are instantiated before ipu3-cio2 can probe, but
> > >> 	it has a side effect, which is that those devices then grab a ref
> > >> 	to the new software_node. This effectively prevents us from
> > >> 	unloading the driver, because we can't free the memory that they
> > >> 	live in whilst the device holds a reference to them. The work
> > >> 	around at the moment is to _not_ unregister the software_nodes
> > >> 	when ipu3-cio2 is unloaded; this becomes a one-time 'patch', that
> > >> 	is simply skipped if the module is reloaded.
> > >> 	- Moved the sensor's SSDB struct to be a member of cio2_sensor
> > >> 	- Replaced ints with unsigned ints where appropriate
> > >> 	- Iterated over all ACPI devices of a matching _HID rather than
> > >> 	just the first to ensure we handle a device with multiple sensors
> > >> 	of the same model.
> > >>
> > >>  MAINTAINERS                                   |   1 +
> > >>  drivers/media/pci/intel/ipu3/Kconfig          |  18 ++
> > >>  drivers/media/pci/intel/ipu3/Makefile         |   1 +
> > >>  drivers/media/pci/intel/ipu3/cio2-bridge.c    | 260 ++++++++++++++++++
> > >>  drivers/media/pci/intel/ipu3/cio2-bridge.h    | 108 ++++++++
> > >>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  27 ++
> > >>  drivers/media/pci/intel/ipu3/ipu3-cio2.h      |   6 +
> > >>  7 files changed, 421 insertions(+)
> > >>  create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.c
> > >>  create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.h
> > >>
> > >> diff --git a/MAINTAINERS b/MAINTAINERS
> > >> index 9702b886d6a4..188559a0a610 100644
> > >> --- a/MAINTAINERS
> > >> +++ b/MAINTAINERS
> > >> @@ -8927,6 +8927,7 @@ INTEL IPU3 CSI-2 CIO2 DRIVER
> > >>  M:	Yong Zhi <yong.zhi@intel.com>
> > >>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> > >>  M:	Bingbu Cao <bingbu.cao@intel.com>
> > >> +M:	Dan Scally <djrscally@gmail.com>
> > >>  R:	Tianshu Qiu <tian.shu.qiu@intel.com>
> > >>  L:	linux-media@vger.kernel.org
> > >>  S:	Maintained
> > >> diff --git a/drivers/media/pci/intel/ipu3/Kconfig b/drivers/media/pci/intel/ipu3/Kconfig
> > >> index 82d7f17e6a02..2b3350d042be 100644
> > >> --- a/drivers/media/pci/intel/ipu3/Kconfig
> > >> +++ b/drivers/media/pci/intel/ipu3/Kconfig
> > >> @@ -16,3 +16,21 @@ config VIDEO_IPU3_CIO2
> > >>  	  Say Y or M here if you have a Skylake/Kaby Lake SoC with MIPI CSI-2
> > >>  	  connected camera.
> > >>  	  The module will be called ipu3-cio2.
> > >> +
> > >> +config CIO2_BRIDGE
> > >> +	bool "IPU3 CIO2 Sensors Bridge"
> > >> +	depends on VIDEO_IPU3_CIO2
> > >> +	help
> > >> +	  This extension provides an API for the ipu3-cio2 driver to create
> > >> +	  connections to cameras that are hidden in SSDB buffer in ACPI. It
> > >> +	  can be used to enable support for cameras in detachable / hybrid
> > >> +	  devices that ship with Windows.
> > >> +
> > >> +	  Say Y here if your device is a detachable / hybrid laptop that comes
> > >> +	  with Windows installed by the OEM, for example:
> > >> +
> > >> +	  	- Microsoft Surface models (except Surface Pro 3)
> > >> +		- The Lenovo Miix line (for example the 510, 520, 710 and 720)
> > >> +		- Dell 7285
> > >> +
> > >> +	  If in doubt, say N here.
> > >> diff --git a/drivers/media/pci/intel/ipu3/Makefile b/drivers/media/pci/intel/ipu3/Makefile
> > >> index 429d516452e4..933777e6ea8a 100644
> > >> --- a/drivers/media/pci/intel/ipu3/Makefile
> > >> +++ b/drivers/media/pci/intel/ipu3/Makefile
> > >> @@ -2,3 +2,4 @@
> > >>  obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o
> > >>  
> > >>  ipu3-cio2-y += ipu3-cio2-main.o
> > >> +ipu3-cio2-$(CONFIG_CIO2_BRIDGE) += cio2-bridge.o
> > >> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> > >> new file mode 100644
> > >> index 000000000000..fd3f8ba07274
> > >> --- /dev/null
> > >> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> > >> @@ -0,0 +1,260 @@
> > >> +// SPDX-License-Identifier: GPL-2.0
> > >> +/* Author: Dan Scally <djrscally@gmail.com> */
> > > 
> > > Could you please add a blank line here ?
> > 
> > Yes
> >
> > >> +#include <linux/acpi.h>
> > >> +#include <linux/device.h>
> > >> +#include <linux/i2c.h>
> > > 
> > > Is this header needed ?
> > > 
> > >> +#include <linux/kernel.h>
> > >> +#include <linux/module.h>
> > > 
> > > And this one ?
> > > 
> > >> +#include <linux/pci.h>
> > >> +#include <linux/property.h>
> > >> +#include <media/v4l2-subdev.h>
> > > 
> > > And this one ?
> > 
> > Ah yes - bit sloppy, they're orphaned from earlier versions, sorry about
> > that.
> > 
> > >> +
> > >> +#include "cio2-bridge.h"
> > >> +
> > >> +/*
> > >> + * Extend this array with ACPI Hardware ID's of devices known to be working.
> > >> + * Do not add a HID for a sensor that is not actually supported.
> > >> + */
> > >> +static const char * const cio2_supported_devices[] = {
> > > 
> > > Maybe cio2_supported_sensors ?
> > 
> > Sure
> > 
> > >> +	"INT33BE",
> > >> +	"OVTI2680",
> > >> +};
> > >> +
> > >> +static int cio2_bridge_read_acpi_buffer(struct acpi_device *adev, char *id,
> > >> +					void *data, u32 size)
> > >> +{
> > >> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> > >> +	union acpi_object *obj;
> > >> +	acpi_status status;
> > >> +	int ret;
> > >> +
> > >> +	status = acpi_evaluate_object(adev->handle, id, NULL, &buffer);
> > >> +	if (ACPI_FAILURE(status))
> > >> +		return -ENODEV;
> > >> +
> > >> +	obj = buffer.pointer;
> > >> +	if (!obj) {
> > >> +		dev_err(&adev->dev, "Couldn't locate ACPI buffer\n");
> > >> +		return -ENODEV;
> > >> +	}
> > >> +
> > >> +	if (obj->type != ACPI_TYPE_BUFFER) {
> > >> +		dev_err(&adev->dev, "Not an ACPI buffer\n");
> > >> +		ret = -ENODEV;
> > >> +		goto out_free_buff;
> > >> +	}
> > >> +
> > >> +	if (obj->buffer.length > size) {
> > >> +		dev_err(&adev->dev, "Given buffer is too small\n");
> > >> +		ret = -EINVAL;
> > >> +		goto out_free_buff;
> > >> +	}
> > >> +
> > >> +	memcpy(data, obj->buffer.pointer, obj->buffer.length);
> > >> +	ret = obj->buffer.length;
> > >> +
> > >> +out_free_buff:
> > >> +	kfree(buffer.pointer);
> > >> +	return ret;
> > >> +}
> > >> +
> > >> +static void cio2_bridge_init_property_names(struct cio2_sensor *sensor)
> > >> +{
> > >> +	strcpy(sensor->prop_names.clock_frequency, "clock-frequency");
> > >> +	strcpy(sensor->prop_names.rotation, "rotation");
> > >> +	strcpy(sensor->prop_names.bus_type, "bus-type");
> > >> +	strcpy(sensor->prop_names.data_lanes, "data-lanes");
> > >> +	strcpy(sensor->prop_names.remote_endpoint, "remote-endpoint");
> > > 
> > > This is a bit fragile, as there's no len check. How about the following
> > > ?
> > > static const struct cio2_property_names prop_names = {
> > > 	.clock_frequency = "clock-frequency",
> > > 	.rotation = "rotation",
> > > 	.bus_type = "bus-type",
> > > 	.data_lanes = "data-lanes",
> > > 	.remote_endpoint = "remote-endpoint",
> > > };
> > > 
> > > static void cio2_bridge_init_property_names(struct cio2_sensor *sensor)
> > > {
> > > 	sensor->prop_names = prop_names;
> > > }
> > > 
> > > This shoudl generate a compilation warning if the string is too long.
> > > 
> > > You could even inline that line in
> > > cio2_bridge_create_fwnode_properties().
> > 
> > Yes, I like that, thanks - I'll make the change.
> > 
> > >> +}
> > >> +
> > >> +static void cio2_bridge_create_fwnode_properties(struct cio2_sensor *sensor)
> > >> +{
> > >> +	unsigned int i;
> > >> +
> > >> +	cio2_bridge_init_property_names(sensor);
> > >> +
> > >> +	for (i = 0; i < 4; i++)
> > >> +		sensor->data_lanes[i] = i + 1;
> > > 
> > > Is there no provision in the SSDB for data lane remapping ?
> > 
> > Sorry; don't follow what you mean by data lane remapping here.
> 
> Some CSI-2 receivers can remap data lanes. The routing inside the SoC
> from the data lane input pins to the PHYs is configurable. This makes
> board design easier as you can route the data lanes to any of the
> inputs. That's why the data lanes DT property is a list of lane numbers
> instead of a number of lanes. I'm actually not sure if the CIO2 supports
> this.

To my knowledge it does not. Only the number of lanes allocated to
different ports matters.

...

> > >> @@ -0,0 +1,108 @@
> > >> +/* SPDX-License-Identifier: GPL-2.0 */
> > >> +/* Author: Dan Scally <djrscally@gmail.com> */
> > >> +#ifndef __CIO2_BRIDGE_H
> > >> +#define __CIO2_BRIDGE_H
> > >> +
> > >> +#include <linux/property.h>
> > >> +
> > >> +#define CIO2_HID				"INT343E"
> > >> +#define CIO2_NUM_PORTS			  4
> > > 
> > > There are a few rogue spaces before '4'.
> > 
> > Argh, thanks, this is the curse of using VS code on multiple machines...
> 
> I recommend vim ;-)

What is VS code? Very Serious Code?

I can recommend Emacs; that could help, too.

-- 
Kind regards,

Sakari Ailus
