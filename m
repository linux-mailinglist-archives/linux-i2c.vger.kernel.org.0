Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A26A495003
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 15:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345782AbiATOVh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 09:21:37 -0500
Received: from mga17.intel.com ([192.55.52.151]:7121 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345801AbiATOVg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jan 2022 09:21:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642688496; x=1674224496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9u2K5IzBdtaJeIG9geUHRGpUxKlLo28VAD+x2KE/0b8=;
  b=HgQf7yGAG0N9OEH3IVopuFFtWEuTiXNHmAYraLJ0uUuAmdigVoqM7aVI
   CJKLi/dOCv27iFYYE+BynPkpGM4KChvwgQv5tYUr1uKUgXqB7XOq6KU53
   GPtXhjs+KtJkDtMagKhs9qXjbyZJ0V8rlKls3RHMVqcm02Yztysi6t8r/
   e9fzVQ6vX7O6078zSnGpwvUCHx2OeW3iN94hnxvXWijTo1uS7jnkH3xd4
   IR1RCZEwJBONFskb9ShkeQ61YV8oK9RAp+WMCZRUs26/KDoMUHeXRAKUF
   kI/k7M2lD/VnvLk1JO5laLW+PJdeBj1/D9FtnmlYZCuFtL3ccMZS44E0T
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="226037409"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; 
   d="scan'208";a="226037409"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 06:21:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; 
   d="scan'208";a="694215189"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 06:21:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nAYIa-00CX1e-JM;
        Thu, 20 Jan 2022 16:20:24 +0200
Date:   Thu, 20 Jan 2022 16:20:24 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan Dabros <jsd@semihalf.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        hdegoede@redhat.com, wsa@kernel.org, rrangel@chromium.org,
        mw@semihalf.com, jaz@semihalf.com, upstream@semihalf.com
Subject: Re: [PATCH 2/2] i2c: designware: Add AMD PSP I2C bus support
Message-ID: <YelvqHuxaIOB+yP1@smile.fi.intel.com>
References: <20220120001621.705352-1-jsd@semihalf.com>
 <20220120001621.705352-3-jsd@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120001621.705352-3-jsd@semihalf.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 20, 2022 at 01:16:21AM +0100, Jan Dabros wrote:
> Implement an I2C controller sharing mechanism between the host (kernel)
> and PSP co-processor on some platforms equipped with AMD Cezanne SoC.
> 
> On these platforms we need to implement "software" i2c arbitration.
> Default arbitration owner is PSP and kernel asks for acquire as well
> as inform about release of the i2c bus via mailbox mechanism.
> 
>             +---------+
>  <- ACQUIRE |         |
>   +---------|   CPU   |\
>   |         |         | \      +----------+  SDA
>   |         +---------+  \     |          |-------
> MAILBOX                   +--> |  I2C-DW  |  SCL
>   |         +---------+        |          |-------
>   |         |         |        +----------+
>   +---------|   PSP   |
>    <- ACK   |         |
>             +---------+
> 
>             +---------+
>  <- RELEASE |         |
>   +---------|   CPU   |
>   |         |         |        +----------+  SDA
>   |         +---------+        |          |-------
> MAILBOX                   +--> |  I2C-DW  |  SCL
>   |         +---------+  /     |          |-------
>   |         |         | /      +----------+
>   +---------|   PSP   |/
>    <- ACK   |         |
>             +---------+
> 
> The solution is similar to i2c-designware-baytrail.c implementation, where
> we are using a generic i2c-designware-* driver with a small "wrapper".
> 
> In contrary to baytrail semaphore implementation, beside internal
> acquire_lock() and release_lock() methods we are also applying quirks to
> lock_bus() and unlock_bus() global adapter methods. With this in place
> all i2c clients drivers may lock i2c bus for a desired number of i2c
> transactions (e.g. write-wait-read) without being aware of that such bus
> is shared with another entity.
> 
> Modify i2c_dw_probe_lock_support() to select correct semaphore
> implementation at runtime, since now we have more than one available.
> 
> Configure new matching ACPI ID "AMDI0019" and register
> ARBITRATION_SEMAPHORE flag in order to distinguish setup with PSP
> arbitration.

> Add new entry in MAINTAINERS file to cover new module.

It's confusing. You added yourself as a reviewer for I2C DesignWare driver,
which is great, but not described in the commit message.

...

>  	{ "AMD0020", APD_ADDR(cz_uart_desc) },

>  	{ "AMDI0020", APD_ADDR(cz_uart_desc) },
>  	{ "AMDI0022", APD_ADDR(cz_uart_desc) },
> +	{ "AMDI0019", APD_ADDR(wt_i2c_desc) },

This addition adds more chaos in the ordering (the group of AMDI should be
after AMD as far as I can see here). Can you order the entries by IDs?

>  	{ "AMD0030", },
>  	{ "AMD0040", APD_ADDR(fch_misc_desc)},

...

> +#include <asm/msr.h>

Usually linux/* followed by asm/*.

> +#include <linux/i2c.h>
> +#include <linux/psp-sev.h>

types.h?

...

> +union psp_req_buffer_hdr {
> +	struct {
> +		u32 total_size;
> +		u32 status;
> +	} __packed;

What does packet bring you here?

> +	u64 hdr_val;

And why does this not have the same alignment since it's also part of
the union?

> +};
> +
> +enum psp_i2c_req_type {
> +	PSP_I2C_REQ_ACQUIRE,
> +	PSP_I2C_REQ_RELEASE,

> +	PSP_I2C_REQ_MAX,

Is MAX a terminator or not?
If former, no comma.

> +};
> +
> +struct psp_i2c_req {
> +	union psp_req_buffer_hdr hdr;
> +	enum psp_i2c_req_type type;

> +} __packed __aligned(32);

Can you explain, what this means and how it's supposed to work?

> +union psp_mbox_cmd_reg {
> +	struct psp_mbox_cmd_fields {
> +		u16 mbox_status;
> +		u8 mbox_cmd;
> +		u8 reserved:6;
> +		u8 recovery:1;
> +		u8 ready:1;

> +	} __packed fields;

So, what is the __packed purpose here?

> +	u32 val;
> +};
> +
> +struct psp_mbox {
> +	union psp_mbox_cmd_reg fields;
> +	uintptr_t i2c_req_addr;
> +} __packed;

...

> +static int psp_mbox_probe(void)
> +{
> +	unsigned long mbox_addr;
> +
> +	if (psp_get_mbox_addr(&mbox_addr))

> +		return -1;

Use error code.

> +	mbox_iomem = ioremap(mbox_addr, sizeof(struct psp_mbox));
> +	if (!mbox_iomem)
> +		return -ENOMEM;
> +
> +	return 0;
> +}

...

> +	union psp_mbox_cmd_reg tmp = {0};

> +	tmp.val = readl(&mbox->fields.val);
> +	return !!tmp.fields.recovery;

OK, I understood the purpose of unions, no, please use bitfield.h APIs.

...

> +	struct psp_mbox *mbox = (struct psp_mbox *)mbox_iomem;

Heck, no!

...

> +	/* Fill address of command-response buffer */
> +	writeq((uintptr_t)__psp_pa((void *)req), &mbox->i2c_req_addr);

What does this voodoo mean?!

...

> +	start = jiffies;
> +	do {
> +		if (psp_send_cmd(req)) {
> +			ret = -EIO;
> +			goto cleanup;
> +		}
> +
> +		status = check_i2c_req_sts(req);
> +		if (!status) {
> +			dev_dbg(psp_i2c_dev, "Request accepted by PSP after %ums\n",
> +				jiffies_to_msecs(jiffies - start));
> +			ret = 0;
> +			goto cleanup;
> +		} else if (status == -EBUSY) {
> +			retry_cnt--;
> +		} else {
> +			ret = -EIO;
> +			goto cleanup;
> +		};
> +
> +		/* IF EBUSY, give PSP time to finish its i2c activities */
> +		mdelay(PSP_I2C_REQ_RETRY_DELAY_MSEC);
> +	} while (retry_cnt);

NIH iopoll.h API(s).

> +	ret = -ETIMEDOUT;

...

> +	status = psp_send_i2c_req(PSP_I2C_REQ_ACQUIRE);
> +	if (!status) {

Handle errors first.

...

> +		goto cleanup;
> +	} else if (status == -ETIMEDOUT) {

In this case it's redundant 'else'.

...

> +	/* Send a release command to PSP */
> +	status = psp_send_i2c_req(PSP_I2C_REQ_RELEASE);
> +	if (!status) {
> +		dev_dbg(psp_i2c_dev, "PSP semaphore held for %ums\n",
> +			jiffies_to_msecs(jiffies - psp_i2c_sem_acquired));
> +		goto cleanup;
> +	} else if (status == -ETIMEDOUT) {
> +		dev_err(psp_i2c_dev, "Timed out waiting for PSP to acquire I2C bus\n");
> +	} else {
> +		dev_err(psp_i2c_dev, "PSP communication error\n");
> +	}

As per above comments.

...

> +	int ret;
> +
> +	ret = rt_mutex_trylock(&adapter->bus_lock);
> +	if (!ret)

	if (ret)
		...

> +		psp_acquire_i2c_bus();
> +
> +	return ret;

...

> +	/* Allow to bind only one instance of a driver */
> +	if (!psp_i2c_dev)
> +		psp_i2c_dev = dev->dev;
> +	else
> +		return -EEXIST;

As per above.

...

> +	if (psp_mbox_probe())
> +		return -EIO;

Why error code is hidden?

...

> +	/*
> +	 * Install global locking callbacks for adapter as well as internal i2c
> +	 * controller locks

Missed period.

> +	 */

...

>  	{ "AMD0010", ACCESS_INTR_MASK },
>  	{ "AMDI0010", ACCESS_INTR_MASK },
>  	{ "AMDI0510", 0 },
> +	{ "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },

It's not in order.

...

> +static const struct i2c_dw_semaphore_callbacks i2c_dw_semaphore_cb_table[] = {
> +#ifdef CONFIG_I2C_DESIGNWARE_BAYTRAIL
> +	{
> +		.probe = i2c_dw_baytrail_probe_lock_support,

> +		.remove = NULL,

See below.

> +	},
> +#endif
> +#ifdef CONFIG_I2C_DESIGNWARE_AMDPSP
> +	{
> +		.probe = i2c_dw_amdpsp_probe_lock_support,
> +		.remove = i2c_dw_amdpsp_remove_lock_support,
> +	},
> +#endif

> +	{
> +		.probe = NULL,
> +		.remove = NULL,
> +	},

First of all, it should be terminating entry, so no comma.
On top of that, no need to assign 0/NULL to static variables.
So here, it will become as simple as

	{}

> +};

...

> +static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
> +{
> +	int ret;
> +	int i;
> +
> +	dev->semaphore_idx = -1;
> +
> +	for (i = 0; i < ARRAY_SIZE(i2c_dw_semaphore_cb_table); i++) {

> +		if (!i2c_dw_semaphore_cb_table[i].probe)
> +			continue;

Huh?

> +	}
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


