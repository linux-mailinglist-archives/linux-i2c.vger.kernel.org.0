Return-Path: <linux-i2c+bounces-11200-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BD1ACC58E
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 13:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2A773A34F7
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 11:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C3B22ACEE;
	Tue,  3 Jun 2025 11:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhdvA7uh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5CEC2F2;
	Tue,  3 Jun 2025 11:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748950737; cv=none; b=WBRGyEhmX4vjgtWr1+D1dbw8wYg3YshniIyH0nZj6YfhyWsoHYjHjbNQd5EJfmVctie4i0v0XDI86sNrTbVHWe9ER35VdLc8urigABIJG6bW7FZ1wb0OznmoPGrPG4DWfb6+ZBebJgsnsWHBOpPYqCPcJWZvBGN4bL9LgpQYtLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748950737; c=relaxed/simple;
	bh=rvotY18B/WPFD0LCnG33kHUe2Ckc5dIBJopSdRB6GI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbL4DCmGmucJtAjU69shiOSeNE5vvMCR/6kcu83LdrAfF9UAQOjQbmgD0qPG9dMNND+1D7iZa9CGZVi/d7VWPwS4kC9RO6qT0BEInT+IZ8L/HX+tnT4tMYi9wjlhnHTrIjKyY+KXbFJslFQcpKo8YZ4yHjVZzLx/D4ppmrEv3A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DhdvA7uh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748950735; x=1780486735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rvotY18B/WPFD0LCnG33kHUe2Ckc5dIBJopSdRB6GI0=;
  b=DhdvA7uh8jcmFTJBp7SVMQDRQz/OujK2BEvz6B/S6xnP5lYqFd9TrBvk
   lwji1sL7x85e6ps+qcqVY54FyE4lC5a19A58rgUIHrkch+0wKf3BQe8GD
   a6/LrGAvJCEmgApklLDeitZfsgomtcb7cFB7QG3Nrcr+7eINp4Z/KG/Ao
   yvHRdtOWMAqXl1//SLXYKiXqtaqeFLK0TR2U7f/NnMbfO2qO1eFISBQW4
   xU9T39hXW44tLopNWv75oRt3HuEHRyF2SflhEOTFyQpbqbgpBoXwskubw
   F85rzpyr23t3NZQHiLtYVxVSVWnwcVKSeDOo0HTHiokbbqzJoC4rVFT9z
   A==;
X-CSE-ConnectionGUID: VUraiVPZQk6xv5Confxcjg==
X-CSE-MsgGUID: MXIgVr3GQfmdKurGG4nmiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="51129819"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="51129819"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 04:38:52 -0700
X-CSE-ConnectionGUID: VDdCMpBFSpyy6oKh6XuLzQ==
X-CSE-MsgGUID: 3humCpN7Tu6UDazzjtMzwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="144723877"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa006.jf.intel.com with SMTP; 03 Jun 2025 04:38:47 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 03 Jun 2025 14:38:45 +0300
Date: Tue, 3 Jun 2025 14:38:45 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Raag Jadav <raag.jadav@intel.com>,
	"Tauro, Riana" <riana.tauro@intel.com>,
	"Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: Re: [PATCH v1 2/2] drm/xe: Support for I2C attached MCUs
Message-ID: <aD7exRsHZ5UIzFrr@kuha.fi.intel.com>
References: <20250530141744.3605983-1-heikki.krogerus@linux.intel.com>
 <20250530141744.3605983-3-heikki.krogerus@linux.intel.com>
 <ixdkpl3ssri7ggv7yxhdla4ft5hbyce6a2ngvmypgkmjc5tj4a@qqbebbzhkd2b>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ixdkpl3ssri7ggv7yxhdla4ft5hbyce6a2ngvmypgkmjc5tj4a@qqbebbzhkd2b>

Hi Lucas,

Thank you for the review.

On Mon, Jun 02, 2025 at 09:48:21AM -0500, Lucas De Marchi wrote:
> On Fri, May 30, 2025 at 05:17:44PM +0300, Heikki Krogerus wrote:
> > Adding adaption/glue layer where the I2C host adapter
> > (Synopsys DesignWare I2C adapter) and the I2C clients (the
> > microcontroller units) are enumerated.
> > 
> > The microcontroller units (MCU) that are attached to the GPU
> > depend on the OEM. The initially supported MCU will be the
> > Add-In Management Controller (AMC).
> > 
> > Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> Please use drm-tip as base for the patch series, otherwise we can't run
> CI to make sure it doesn't regress:
> https://drm.pages.freedesktop.org/maintainer-tools/repositories/drm-tip.html

Got it.

> We will probably also need new tests in igt.
> 
> > ---
> > drivers/gpu/drm/xe/Makefile           |   1 +
> > drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  16 ++
> > drivers/gpu/drm/xe/regs/xe_irq_regs.h |   1 +
> > drivers/gpu/drm/xe/xe_device.c        |   3 +
> > drivers/gpu/drm/xe/xe_device_types.h  |   4 +
> > drivers/gpu/drm/xe/xe_i2c.c           | 270 ++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_i2c.h           |  60 ++++++
> > drivers/gpu/drm/xe/xe_irq.c           |   2 +
> > 8 files changed, 357 insertions(+)
> > create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> > create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
> > create mode 100644 drivers/gpu/drm/xe/xe_i2c.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index e4bf484d4121..3f581e2bb564 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -124,6 +124,7 @@ xe-y += xe_bb.o \
> > 	xe_wait_user_fence.o \
> > 	xe_wopcm.o
> > 
> > +xe-$(CONFIG_I2C)	+= xe_i2c.o
> > xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
> > xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> > new file mode 100644
> > index 000000000000..2acb55eeef0d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _XE_I2C_REGS_H_
> > +#define _XE_I2C_REGS_H_
> > +
> > +#include "xe_reg_defs.h"
> > +
> > +#define SOC_BASE			0x280000
> > +
> > +#define I2C_CONFIG_SPACE_OFFSET		(SOC_BASE + 0xf6000)
> > +#define I2C_MEM_SPACE_OFFSET		(SOC_BASE + 0xf7400)
> > +#define I2C_BRIDGE_OFFSET		(SOC_BASE + 0xd9000)
> > +
> > +#define CLIENT_DISC_COOKIE		XE_REG(SOC_BASE + 0x0164)
> > +#define CLIENT_DISC_ADDRESS		XE_REG(SOC_BASE + 0x0168)
> > +
> > +#endif /* _XE_I2C_REGS_H_ */
> > diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> > index f0ecfcac4003..13635e4331d4 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> > @@ -19,6 +19,7 @@
> > #define   MASTER_IRQ				REG_BIT(31)
> > #define   GU_MISC_IRQ				REG_BIT(29)
> > #define   DISPLAY_IRQ				REG_BIT(16)
> > +#define   I2C_IRQ				REG_BIT(12)
> > #define   GT_DW_IRQ(x)				REG_BIT(x)
> > 
> > /*
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index d4b6e623aa48..dd635101420b 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -42,6 +42,7 @@
> > #include "xe_guc.h"
> > #include "xe_hw_engine_group.h"
> > #include "xe_hwmon.h"
> > +#include "xe_i2c.h"
> > #include "xe_irq.h"
> > #include "xe_memirq.h"
> > #include "xe_mmio.h"
> > @@ -929,6 +930,8 @@ int xe_device_probe(struct xe_device *xe)
> > 
> > 	xe_vsec_init(xe);
> > 
> > +	xe_i2c_probe(xe);
> 
> please don't ignore errors on probe, it's painful to keep fixing this up
> later. See e.g.
> 
> 	35359c36356a drm/xe: Stop ignoring errors from xe_ttm_sys_mgr_init()
> 	292b1a8a5054 drm/xe: Stop ignoring errors from xe_heci_gsc_init()
> 	d40f275d96e8 drm/xe: Move survivability entirely to xe_pci
> 	62fbc75b28a7 drm/xe/hwmon: Stop ignoring errors on probe
> 	6b5506158f90 drm/xe/pmu: Fail probe if xe_pmu_register() fails
> 	960d71044eee drm/xe/oa: Handle errors in xe_oa_register()
> 
> if it's failing we want to catch it in our CI rather than realizing much
> later a subsystem integration was not really working and the driver is
> in a semi-working state.

Sure thing. I'll fix this.

> > +
> > 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
> > 
> > err_unregister_display:
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 50b2bfa682ac..7011a078b9c7 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -36,6 +36,7 @@
> > #endif
> > 
> > struct xe_ggtt;
> > +struct xe_i2c;
> > struct xe_pat_ops;
> > struct xe_pxp;
> > 
> > @@ -572,6 +573,9 @@ struct xe_device {
> > 	/** @pmu: performance monitoring unit */
> > 	struct xe_pmu pmu;
> > 
> > +	/** @i2c: I2C host controller */
> > +	struct xe_i2c *i2c;
> > +
> > 	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
> > 	u32 atomic_svm_timeslice_ms;
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> > new file mode 100644
> > index 000000000000..cc231368789f
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_i2c.c
> > @@ -0,0 +1,270 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Intel Xe I2C attached Microcontroller Units (MCU)
> > + *
> > + * Copyright (C) 2025 Intel Corporation.
> > + */
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/container_of.h>
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/ioport.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/notifier.h>
> > +#include <linux/pci.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +#include <linux/sprintf.h>
> > +#include <linux/string.h>
> > +#include <linux/types.h>
> > +#include <linux/workqueue.h>
> > +
> > +#include "regs/xe_i2c_regs.h"
> > +#include "regs/xe_irq_regs.h"
> > +
> > +#include "xe_device.h"
> > +#include "xe_device_types.h"
> > +#include "xe_i2c.h"
> > +#include "xe_mmio.h"
> > +#include "xe_platform_types.h"
> > +
> > +/* Synopsys DesignWare I2C Host Adapter */
> > +static const char adapter_name[] = "i2c_designware";
> > +
> > +static const struct property_entry xe_i2c_adapter_properties[] = {
> > +	PROPERTY_ENTRY_STRING("compatible", "intel,xe-mcu-i2c"),
> > +	PROPERTY_ENTRY_U32("clock-frequency", I2C_MAX_FAST_MODE_PLUS_FREQ),
> > +	{ }
> > +};
> > +
> > +static inline void xe_i2c_read_endpoint(struct xe_mmio *mmio, void *ep)
> > +{
> > +	u32 *val = ep;
> > +
> > +	val[0] = xe_mmio_read32(mmio, CLIENT_DISC_COOKIE);
> > +	val[1] = xe_mmio_read32(mmio, CLIENT_DISC_ADDRESS);
> > +}
> > +
> > +static void xe_i2c_client_work(struct work_struct *work)
> > +{
> > +	struct xe_i2c *i2c = container_of(work, struct xe_i2c, work);
> > +	struct i2c_board_info info = {
> > +		.type	= "amc",
> > +		.flags	= I2C_CLIENT_HOST_NOTIFY,
> > +		.addr	= i2c->ep.addr[1],
> > +	};
> 
> so... AMC is not a new thing. We also have it in PVC for example.
> However the way it is exposed to the driver seems to be different
> and what you did here here wouldn't match.

The I2C was most likely hidden and taken care of in some firmware
blob (or maybe the AMC was attached to some completely different
interconnect), but that's no longer the case. The I2C is no longer
taken care of by the GPU itself, but instead the I2C host adapter
registers are now mapped to the GPU MMIO, and the operating system is
now expected to take care of it.

The AMC uses the Intelligent Platform Management Interface (IPMI), or
at least used in the past [1] (I think IPMI is what you are referring
to here - please let me know if I misunderstood). It should not be a
problem to bind this I2C client device to a driver that then registers
the IPMI (or what ever interface is used).

However, right now this I2C client device is used only to let the user
space (the XPU manager) know that the system has the AMC attached to
it. The actual communication with the AMC happens with the i2c-dev for
now. The client device is nevertheless already needed.

The i2c-dev interface really can't be the final solution, so this
device really has to be bind to a driver sooner or later. But this is
the first step.

[1] https://github.com/intel/xpumanager

> > +
> > +	i2c->client[0] = i2c_new_client_device(i2c->adapter, &info);
> > +}
> > +
> > +static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void *data)
> > +{
> > +	struct xe_i2c *i2c = container_of(nb, struct xe_i2c, bus_notifier);
> > +	struct i2c_adapter *adapter = i2c_verify_adapter(data);
> > +	struct device *dev = data;
> > +
> > +	if (action == BUS_NOTIFY_ADD_DEVICE &&
> > +	    adapter && dev->parent == &i2c->pdev->dev) {
> > +		i2c->adapter = adapter;
> > +		schedule_work(&i2c->work);
> > +		return NOTIFY_OK;
> > +	}
> > +
> > +	return NOTIFY_DONE;
> > +}
> > +
> > +static int xe_i2c_register_adapter(struct xe_i2c *i2c)
> > +{
> > +	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
> > +	struct platform_device *pdev;
> > +	struct fwnode_handle *fwnode;
> > +	int ret;
> > +
> > +	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
> > +	if (!fwnode)
> > +		return -ENOMEM;
> > +
> > +	/*
> > +	 * Not using platform_device_register_full() here because we don't have
> > +	 * a handle to the platform_device before it returns. xe_i2c_notifier()
> > +	 * uses that handle, but it may be called before
> > +	 * platform_device_register_full() is done.
> > +	 */
> > +	pdev = platform_device_alloc(adapter_name, pci_dev_id(pci));
> > +	if (!pdev) {
> > +		ret = -ENOMEM;
> > +		goto err_fwnode_remove;
> > +	}
> > +
> > +	if (i2c->adapter_irq) {
> > +		struct resource	res = { };
> > +
> > +		res.start = i2c->adapter_irq;
> > +		res.name = "xe_i2c";
> > +		res.flags = IORESOURCE_IRQ;
> > +
> > +		ret = platform_device_add_resources(pdev, &res, 1);
> > +		if (ret)
> > +			goto err_pdev_put;
> > +	}
> > +
> > +	pdev->dev.parent = i2c->drm_dev;
> > +	pdev->dev.fwnode = fwnode;
> > +	i2c->adapter_node = fwnode;
> > +	i2c->pdev = pdev;
> > +
> > +	ret = platform_device_add(pdev);
> > +	if (ret)
> > +		goto err_pdev_put;
> > +
> > +	return 0;
> > +
> > +err_pdev_put:
> > +	platform_device_put(pdev);
> > +err_fwnode_remove:
> > +	fwnode_remove_software_node(fwnode);
> > +
> > +	return ret;
> > +}
> > +
> > +static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
> > +{
> > +	platform_device_unregister(i2c->pdev);
> > +	fwnode_remove_software_node(i2c->adapter_node);
> > +}
> > +
> > +void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
> > +{
> > +	if (!xe->i2c || !xe->i2c->adapter_irq)
> > +		return;
> > +
> > +	if (master_ctl & I2C_IRQ)
> > +		generic_handle_irq_safe(xe->i2c->adapter_irq);
> > +}
> > +
> > +static int xe_i2c_irq_map(struct irq_domain *h, unsigned int virq,
> > +			  irq_hw_number_t hw_irq_num)
> > +{
> > +	irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);
> > +	return 0;
> > +}
> > +
> > +static const struct irq_domain_ops xe_i2c_irq_ops = {
> > +	.map = xe_i2c_irq_map,
> > +};
> > +
> > +static int xe_i2c_create_irq(struct xe_i2c *i2c)
> > +{
> > +	struct irq_domain *domain;
> > +
> > +	if (!(i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ))
> > +		return 0;
> > +
> > +	domain = irq_domain_create_linear(dev_fwnode(i2c->drm_dev), 1, &xe_i2c_irq_ops, NULL);
> > +	if (!domain)
> > +		return -ENOMEM;
> > +
> > +	i2c->adapter_irq = irq_create_mapping(domain, 0);
> > +	i2c->irqdomain = domain;
> > +
> > +	return 0;
> > +}
> > +
> > +static void xe_i2c_remove_irq(struct xe_i2c *i2c)
> > +{
> > +	if (i2c->irqdomain) {
> > +		irq_dispose_mapping(i2c->adapter_irq);
> > +		irq_domain_remove(i2c->irqdomain);
> > +	}
> > +}
> > +
> > +static int xe_i2c_read(void *context, unsigned int reg, unsigned int *val)
> > +{
> > +	struct xe_i2c *i2c = context;
> > +
> > +	*val = xe_mmio_read32(i2c->mmio, XE_REG(reg + I2C_MEM_SPACE_OFFSET));
> > +
> > +	return 0;
> > +}
> > +
> > +static int xe_i2c_write(void *context, unsigned int reg, unsigned int val)
> > +{
> > +	struct xe_i2c *i2c = context;
> > +
> > +	xe_mmio_write32(i2c->mmio, XE_REG(reg + I2C_MEM_SPACE_OFFSET), val);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct regmap_config i2c_regmap_config = {
> > +	.reg_bits = 32,
> > +	.val_bits = 32,
> > +	.reg_read = xe_i2c_read,
> > +	.reg_write = xe_i2c_write,
> > +	.fast_io = true,
> > +};
> > +
> > +static void xe_i2c_remove(void *data)
> > +{
> > +	struct xe_i2c *i2c = data;
> > +	int i;
> > +
> > +	for (i = 0; i < XE_I2C_MAX_CLIENTS; i++)
> > +		i2c_unregister_device(i2c->client[i]);
> > +
> > +	xe_i2c_unregister_adapter(i2c);
> > +	xe_i2c_remove_irq(i2c);
> > +	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
> 
> this looks racy. Shouldn't you unregister the notifier before the other
> 2 calls?

OK, I'll move it up.

> > +}
> > +
> > +int xe_i2c_probe(struct xe_device *xe)
> > +{
> > +	struct xe_i2c_endpoint ep;
> > +	struct regmap *regmap;
> > +	struct xe_i2c *i2c;
> > +	int ret;
> > +
> > +	if (xe->info.platform != XE_BATTLEMAGE)
> > +		return 0;
> 
> we prefer checking for IP versions but don't have a good way for the SOC
> versioning. However bspec 54028 seems to disagree here. It
> would probably be better to check on the GT IP + is_dgfx. Or if it's
> safe to rely on the cookie below, just check for is_dgfx.

I'll drop this. I quite certain that the cookie should be sufficient
for this.

> > +
> > +	xe_i2c_read_endpoint(xe_root_tile_mmio(xe), &ep);
> > +	if (ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> > +		return 0;
> > +
> > +	i2c = devm_kzalloc(xe->drm.dev, sizeof(*i2c), GFP_KERNEL);
> > +	if (!i2c)
> > +		return -ENOMEM;
> > +
> > +	INIT_WORK(&i2c->work, xe_i2c_client_work);
> > +	i2c->mmio = xe_root_tile_mmio(xe);
> > +	i2c->drm_dev = xe->drm.dev;
> > +	i2c->ep = ep;
> > +
> > +	regmap = devm_regmap_init(i2c->drm_dev, NULL, i2c, &i2c_regmap_config);
> > +	if (IS_ERR(regmap))
> > +		return PTR_ERR(regmap);
> > +
> > +	i2c->bus_notifier.notifier_call = xe_i2c_notifier;
> > +	ret = bus_register_notifier(&i2c_bus_type, &i2c->bus_notifier);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = xe_i2c_create_irq(i2c);
> > +	if (ret)
> > +		goto err_unregister_notifier;
> > +
> > +	ret = xe_i2c_register_adapter(i2c);
> > +	if (ret)
> > +		goto err_unregister_notifier;
> > +
> > +	return devm_add_action_or_reset(i2c->drm_dev, xe_i2c_remove, i2c);
> > +
> > +err_unregister_notifier:
> > +	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
> > +
> > +	return ret;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
> > new file mode 100644
> > index 000000000000..ab8e21630838
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_i2c.h
> > @@ -0,0 +1,60 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _XE_I2C_H_
> > +#define _XE_I2C_H_
> > +
> > +#include <linux/bits.h>
> > +#include <linux/notifier.h>
> > +#include <linux/types.h>
> > +#include <linux/workqueue.h>
> > +
> > +struct device;
> > +struct fwnode_handle;
> > +struct i2c_adapter;
> > +struct i2c_client;
> > +struct irq_domain;
> > +struct platform_device;
> > +struct xe_device;
> > +struct xe_mmio;
> > +
> > +#define XE_I2C_MAX_CLIENTS		3
> > +
> > +#define XE_I2C_EP_COOKIE_DEVICE		0xde
> > +
> > +/* Endpoint Capabilities */
> > +#define XE_I2C_EP_CAP_IRQ		BIT(0)
> > +#define XE_I2C_EP_CAP_MULTI_MCU		BIT(1)
> > +#define XE_I2C_EP_CAP_SMBUS		BIT(2)
> 
> these 2 are unused?

True, I'll drop them.

thanks,

-- 
heikki

