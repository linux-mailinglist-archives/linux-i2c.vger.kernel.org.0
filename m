Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8317B494D67
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 12:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbiATLvM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 06:51:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24323 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231929AbiATLvL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 06:51:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642679470;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VRWsTNEWh7HBgrcUODGEYfqHq5GDHnCFHN5kO6NsR0Y=;
        b=MUZVatIO2R1WsmJZQS69/+GBhVirOc7QiH6OOkrRkOWpn/uAEKKQV3BvkaaH+4V+Vsf6Q8
        rj5q44yVcnvJneRORkd0b4y25p8jZyNw4yoOJm+o+9cknGVh2jvxODxivToUrjKQ1zAQFr
        oD2Gzte2a2zt/7nQ7HBG/WAPMgWbUTc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-GtJVQCc3MLeWoYX6CetNmQ-1; Thu, 20 Jan 2022 06:51:08 -0500
X-MC-Unique: GtJVQCc3MLeWoYX6CetNmQ-1
Received: by mail-ed1-f71.google.com with SMTP id c8-20020a05640227c800b003fdc1684cdeso5675684ede.12
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jan 2022 03:51:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VRWsTNEWh7HBgrcUODGEYfqHq5GDHnCFHN5kO6NsR0Y=;
        b=jPIgivOFWbdP1LNBNEoQf5MRwfpd5uNADktoLRFRsGQcfBTwz9AaftvP1A2WktfW2+
         cR/rQeG6iZM5U/ECJWsUjNw+kazIW/JKzbZue0ci1vYGW2+JSYCpUPZ0Vn3lUvJy2saf
         k4oHlZ//Xrl5Qaac3b+j4jqHsZIudJjpfq4QKlp9crmL8ZlYqGBopOw6u6oc0qvyiRtl
         wnimnCF3fm7+7YJ/IHMtsisUi5ZCsL/Rus8fizez3BX79ZLHFKVA1a108tD7qer7cmza
         RFzRlNMOWqbcngWOmo3PWzcWxsDgV6423TZMb+ZhFwYfyTQSDYPinUVZ4lU2gYbu+HIA
         FdwA==
X-Gm-Message-State: AOAM531vApkLVsNzOqwoBYjc4wON8L8vYGUQgP62KZKFMjzXFXda+D/q
        gcOOpBtoGLEzg1M9bBNI9W6f/av2k0Xc/zPTSf367AkEfE6gPqi1b7YEBAXka665HWqlhmkvxjn
        yhmUN2cAWRSRylcCARTSz
X-Received: by 2002:a17:906:1790:: with SMTP id t16mr6614899eje.396.1642679467279;
        Thu, 20 Jan 2022 03:51:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfeMTWVqRDBAo0C4U8SGarW5FZYABr9E08gzgwomdmIkiVyzJhqkcXLTq3DmTI2d+/E6tL/A==
X-Received: by 2002:a17:906:1790:: with SMTP id t16mr6614872eje.396.1642679466928;
        Thu, 20 Jan 2022 03:51:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id c7sm902030ejm.204.2022.01.20.03.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jan 2022 03:51:06 -0800 (PST)
Message-ID: <a6e0fc62-4a2e-cd2b-557f-5e86088aeeb7@redhat.com>
Date:   Thu, 20 Jan 2022 12:51:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/2] i2c: designware: Add AMD PSP I2C bus support
Content-Language: en-US
To:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, upstream@semihalf.com
References: <20220120001621.705352-1-jsd@semihalf.com>
 <20220120001621.705352-3-jsd@semihalf.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220120001621.705352-3-jsd@semihalf.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 1/20/22 01:16, Jan Dabros wrote:
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
> 
> Add new entry in MAINTAINERS file to cover new module.
> 
> Signed-off-by: Jan Dabros <jsd@semihalf.com>
> ---
>  MAINTAINERS                                  |   1 +
>  drivers/acpi/acpi_apd.c                      |   1 +
>  drivers/i2c/busses/Kconfig                   |  10 +
>  drivers/i2c/busses/Makefile                  |   1 +
>  drivers/i2c/busses/i2c-designware-amdpsp.c   | 357 +++++++++++++++++++
>  drivers/i2c/busses/i2c-designware-baytrail.c |  10 +-
>  drivers/i2c/busses/i2c-designware-core.h     |  18 +-
>  drivers/i2c/busses/i2c-designware-platdrv.c  |  61 ++++
>  8 files changed, 451 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/i2c/busses/i2c-designware-amdpsp.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b84e2d5642bc..3c81084bc6e6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18659,6 +18659,7 @@ SYNOPSYS DESIGNWARE I2C DRIVER
>  M:	Jarkko Nikula <jarkko.nikula@linux.intel.com>
>  R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>  R:	Mika Westerberg <mika.westerberg@linux.intel.com>
> +R:	Jan Dabros <jsd@semihalf.com>
>  L:	linux-i2c@vger.kernel.org
>  S:	Maintained
>  F:	drivers/i2c/busses/i2c-designware-*
> diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
> index e7934ba79b02..4a812476a418 100644
> --- a/drivers/acpi/acpi_apd.c
> +++ b/drivers/acpi/acpi_apd.c
> @@ -236,6 +236,7 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
>  	{ "AMD0020", APD_ADDR(cz_uart_desc) },
>  	{ "AMDI0020", APD_ADDR(cz_uart_desc) },
>  	{ "AMDI0022", APD_ADDR(cz_uart_desc) },
> +	{ "AMDI0019", APD_ADDR(wt_i2c_desc) },
>  	{ "AMD0030", },
>  	{ "AMD0040", APD_ADDR(fch_misc_desc)},
>  	{ "HYGO0010", APD_ADDR(wt_i2c_desc) },
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 42da31c1ab70..9177a56d2e94 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -553,6 +553,16 @@ config I2C_DESIGNWARE_PLATFORM
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-designware-platform.
>  
> +config I2C_DESIGNWARE_AMDPSP
> +	bool "AMD PSP I2C semaphore support"
> +	depends on ACPI
> +	depends on I2C_DESIGNWARE_PLATFORM
> +	help
> +	  This driver enables managed host access to the selected I2C bus shared
> +	  between AMD CPU and AMD PSP.
> +
> +	  You should say Y if running on an AMD system equipped with the PSP.
> +
>  config I2C_DESIGNWARE_BAYTRAIL
>  	bool "Intel Baytrail I2C semaphore support"
>  	depends on ACPI
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 1d00dce77098..752f47be3fc1 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -54,6 +54,7 @@ i2c-designware-core-y					+= i2c-designware-master.o
>  i2c-designware-core-$(CONFIG_I2C_DESIGNWARE_SLAVE) 	+= i2c-designware-slave.o
>  obj-$(CONFIG_I2C_DESIGNWARE_PLATFORM)			+= i2c-designware-platform.o
>  i2c-designware-platform-y 				:= i2c-designware-platdrv.o
> +i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_AMDPSP)	+= i2c-designware-amdpsp.o
>  i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_BAYTRAIL) += i2c-designware-baytrail.o
>  obj-$(CONFIG_I2C_DESIGNWARE_PCI)			+= i2c-designware-pci.o
>  i2c-designware-pci-y					:= i2c-designware-pcidrv.o
> diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
> new file mode 100644
> index 000000000000..e86cc56df921
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> @@ -0,0 +1,357 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <asm/msr.h>
> +#include <linux/i2c.h>
> +#include <linux/psp-sev.h>
> +
> +#include "i2c-designware-core.h"

So all the stuff starting here:

> +
> +#define MSR_AMD_PSP_ADDR	0xc00110a2
> +#define PSP_MBOX_OFFSET		0x10570
> +#define PSP_CMD_TIMEOUT_MS	500
> +
> +#define PSP_I2C_REQ_BUS_CMD		0x64
> +#define PSP_I2C_REQ_RETRY_CNT		10
> +#define PSP_I2C_REQ_RETRY_DELAY_MSEC	50
> +#define PSP_I2C_REQ_STS_OK		0x0
> +#define PSP_I2C_REQ_STS_BUS_BUSY	0x1
> +#define PSP_I2C_REQ_STS_INV_PARAM	0x3
> +
> +union psp_req_buffer_hdr {
> +	struct {
> +		u32 total_size;
> +		u32 status;
> +	} __packed;
> +	u64 hdr_val;
> +};
> +
> +enum psp_i2c_req_type {
> +	PSP_I2C_REQ_ACQUIRE,
> +	PSP_I2C_REQ_RELEASE,
> +	PSP_I2C_REQ_MAX,
> +};
> +
> +struct psp_i2c_req {
> +	union psp_req_buffer_hdr hdr;
> +	enum psp_i2c_req_type type;
> +} __packed __aligned(32);
> +
> +union psp_mbox_cmd_reg {
> +	struct psp_mbox_cmd_fields {
> +		u16 mbox_status;
> +		u8 mbox_cmd;
> +		u8 reserved:6;
> +		u8 recovery:1;
> +		u8 ready:1;
> +	} __packed fields;
> +	u32 val;
> +};
> +
> +struct psp_mbox {
> +	union psp_mbox_cmd_reg fields;
> +	uintptr_t i2c_req_addr;
> +} __packed;
> +
> +static DEFINE_MUTEX(psp_i2c_access_mutex);
> +static unsigned long psp_i2c_sem_acquired;
> +static void __iomem *mbox_iomem;
> +static u32 psp_i2c_access_count;
> +static bool psp_i2c_mbox_fail;
> +static struct device *psp_i2c_dev;
> +
> +static int psp_get_mbox_addr(unsigned long *mbox_addr)
> +{
> +	unsigned long long psp_mmio;
> +
> +	if (rdmsrl_safe(MSR_AMD_PSP_ADDR, &psp_mmio))
> +		return -EIO;
> +
> +	*mbox_addr = (unsigned long)(psp_mmio + PSP_MBOX_OFFSET);
> +
> +	return 0;
> +}
> +
> +static int psp_mbox_probe(void)
> +{
> +	unsigned long mbox_addr;
> +
> +	if (psp_get_mbox_addr(&mbox_addr))
> +		return -1;
> +
> +	mbox_iomem = ioremap(mbox_addr, sizeof(struct psp_mbox));
> +	if (!mbox_iomem)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +/* Recovery field should be equal 0 to start sending commands */
> +static int psp_check_mbox_recovery(struct psp_mbox *mbox)
> +{
> +	union psp_mbox_cmd_reg tmp = {0};
> +
> +	tmp.val = readl(&mbox->fields.val);
> +	return !!tmp.fields.recovery;
> +}
> +
> +static int psp_wait_cmd(struct psp_mbox *mbox)
> +{
> +	union psp_mbox_cmd_reg expected = { .val = 0 };
> +	u32 tmp;
> +
> +	/* Expect mbox_cmd to be cleared and ready bit to be set by PSP */
> +	expected.fields.ready = 1;
> +
> +	return readl_poll_timeout(&mbox->fields.val, tmp, (tmp == expected.val),
> +				  0, 1000 * PSP_CMD_TIMEOUT_MS);
> +}
> +
> +/* Status equal to 0 means that PSP succeed processing command */
> +static int psp_check_mbox_sts(struct psp_mbox *mbox)
> +{
> +	union psp_mbox_cmd_reg cmd_reg = {0};
> +
> +	cmd_reg.val = readl(&mbox->fields.val);
> +	return cmd_reg.fields.mbox_status;
> +}
> +
> +static int psp_send_cmd(struct psp_i2c_req *req)
> +{
> +	struct psp_mbox *mbox = (struct psp_mbox *)mbox_iomem;
> +	union psp_mbox_cmd_reg cmd_reg = {0};
> +
> +	if (psp_check_mbox_recovery(mbox))
> +		return -EIO;
> +
> +	if (psp_wait_cmd(mbox))
> +		return -EBUSY;
> +
> +	/* Fill address of command-response buffer */
> +	writeq((uintptr_t)__psp_pa((void *)req), &mbox->i2c_req_addr);
> +
> +	/* Write command register to trigger processing */
> +	cmd_reg.fields.mbox_cmd = PSP_I2C_REQ_BUS_CMD;
> +	writel(cmd_reg.val, &mbox->fields.val);
> +
> +	if (psp_wait_cmd(mbox))
> +		return -ETIMEDOUT;
> +
> +	if (psp_check_mbox_sts(mbox))
> +		return -EIO;
> +
> +	return 0;
> +}

Through here seems to all be generic code for accessing
the AMD PSP. To me this seems like something which belongs
in a separate AMD-PSP-mbox driver/lib, which can then be
shared between other kernel drivers which may also want
to access PSP.

Sorta like the generic iosf_mbi_read() and
iosf_mbi_write() functions from:

arch/x86/platform/intel/iosf_mbi.c

used on the Intel chips, which are also used outside of
the I2C bus-locking code.

This is also one of the reasons why I think it would be
good to get some AMD folks involved in this, since they
may be aware of other drivers which also need to access
the PSP mbox.




> +
> +/* Helper to verify status returned by PSP */
> +static int check_i2c_req_sts(struct psp_i2c_req *req)
> +{
> +	int status;
> +
> +	status = readl(&req->hdr.status);
> +
> +	switch (status) {
> +	case PSP_I2C_REQ_STS_OK:
> +		return 0;
> +	case PSP_I2C_REQ_STS_BUS_BUSY:
> +		return -EBUSY;
> +	case PSP_I2C_REQ_STS_INV_PARAM:
> +	default:
> +		return -EIO;
> +	};
> +}
> +
> +static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
> +{
> +	int status, ret, retry_cnt = PSP_I2C_REQ_RETRY_CNT;
> +	struct psp_i2c_req *req;
> +	unsigned long start;
> +
> +	/* Allocate command-response buffer */
> +	req = kzalloc(sizeof(*req), GFP_KERNEL);
> +	if (!req)
> +		return -ENOMEM;
> +
> +	req->hdr.total_size = sizeof(*req);
> +	req->type = i2c_req_type;
> +
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
> +
> +
> +	ret = -ETIMEDOUT;
> +
> +cleanup:
> +	kfree(req);
> +	return ret;
> +}
> +
> +static int psp_acquire_i2c_bus(void)
> +{
> +	int status;
> +
> +	mutex_lock(&psp_i2c_access_mutex);
> +
> +	/* Return early if mailbox malfunctioned */
> +	if (psp_i2c_mbox_fail)
> +		goto cleanup;
> +
> +	/*
> +	 * Simply increment usage counter and return if PSP semaphore was
> +	 * already taken by kernel
> +	 */
> +	if (psp_i2c_access_count > 0) {
> +		psp_i2c_access_count++;
> +		goto cleanup;
> +	};
> +
> +	status = psp_send_i2c_req(PSP_I2C_REQ_ACQUIRE);
> +	if (!status) {
> +		psp_i2c_sem_acquired = jiffies;
> +		psp_i2c_access_count++;
> +		goto cleanup;
> +	} else if (status == -ETIMEDOUT) {
> +		dev_err(psp_i2c_dev, "Timed out waiting for PSP to release I2C bus\n");
> +	} else {
> +		dev_err(psp_i2c_dev, "PSP communication error\n");
> +	};
> +
> +	dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
> +	psp_i2c_mbox_fail = true;
> +
> +cleanup:
> +	mutex_unlock(&psp_i2c_access_mutex);
> +	return 0;
> +}
> +
> +static void psp_release_i2c_bus(void)
> +{
> +	int status;
> +
> +	mutex_lock(&psp_i2c_access_mutex);
> +
> +	/* Return early if mailbox was malfunctional */
> +	if (psp_i2c_mbox_fail)
> +		goto cleanup;
> +
> +	/*
> +	 * If we are last owner of PSP semaphore, need to release aribtration
> +	 * via mailbox
> +	 */
> +	psp_i2c_access_count--;
> +	if (psp_i2c_access_count > 0)
> +		goto cleanup;
> +
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
> +
> +	dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
> +	psp_i2c_mbox_fail = true;
> +
> +cleanup:
> +	mutex_unlock(&psp_i2c_access_mutex);
> +}
> +
> +/*
> + * Locking methods are based on the default implementation from
> + * drivers/i2c/i2c-core.base.c, but with psp acquire and release operations
> + * added. With this in place we can ensure that i2c clients on the bus shared
> + * with psp are able to lock HW access to the bus for arbitrary number of
> + * operations - that is e.g. write-wait-read.
> + */
> +static void i2c_adapter_dw_psp_lock_bus(struct i2c_adapter *adapter,
> +					unsigned int flags)
> +{
> +	psp_acquire_i2c_bus();
> +	rt_mutex_lock_nested(&adapter->bus_lock, i2c_adapter_depth(adapter));

This does not do what you think it does and you will still deadlock
when things nest because of someone taking the bus-lock and then
the main i2c-designware transfer function calling the acquire_lock
callback.

The _nested postfix is only for the lockdep lock-debugger, this
actually turns into a regular mutex_lock when lockdep is not enabled:

#ifdef CONFIG_DEBUG_LOCK_ALLOC
extern void rt_mutex_lock_nested(struct rt_mutex *lock, unsigned int subclass);
#define rt_mutex_lock(lock) rt_mutex_lock_nested(lock, 0)
#else
extern void rt_mutex_lock(struct rt_mutex *lock);
#define rt_mutex_lock_nested(lock, subclass) rt_mutex_lock(lock)
#endif

The _nested postfix as such is only to tell the lockdep code that
even though it seems we are trying to take the same mutex twice
since in both cases it is of i2c_adapter.rt_mutex "lock class"
that we are sure it is never the same i2c_adapter (but rather
one which always gets called in a nested fashion from another
i2c_adapter).

IOW this only disables a false-positive lockdep warning, it does
not allow taking the same mutex twice, you will still hang on
the second mutex_lock call on the same lock.

Also I don't think you are allowed to use the bus_locking code
like this. The i2c bus-locking code is intended to deal with
busses which have muxes in them, where the mux must be set
to the right branch of the bus to reach the client and then
not be changed during the transfer to that client.

So i2c-client drivers are never supposed to directly call
the bus-locking functions.

This is why in the Bay Trail case we have i2c-drivers
directly calling iosf_mbi_block_punit_i2c_access() and
iosf_mbi_unblock_punit_i2c_access() to lock the bus
for multiple i2c-transfers. We can get away with this there
because the bus in question is only used to access the
PMIC and that PMIC is only used on Bay Trail (and CHT)
boards, so the PMIC drivers can just hard-code these
calls.

If you need to take the PSP I2C semaphore for multiple
transfers in some generic drivers, then I guess that the
i2c-subsys will need to get some new i2c_adapter callbacks
to acquire / release the bus for i2c-controllers where
the bus/controller is shared with some co-processor like
in the PSP case.

Also note that iosf_mbi_block_punit_i2c_access() and
iosf_mbi_unblock_punit_i2c_access() do their own
ref/lock-counting to allow calling them multiple times and
the first block call takes the bus and the last unblock
call releases it.

Regards,

Hans





> +}
> +
> +static int i2c_adapter_dw_psp_trylock_bus(struct i2c_adapter *adapter,
> +					  unsigned int flags)
> +{
> +	int ret;
> +
> +	ret = rt_mutex_trylock(&adapter->bus_lock);
> +	if (!ret)
> +		psp_acquire_i2c_bus();
> +
> +	return ret;
> +}
> +
> +static void i2c_adapter_dw_psp_unlock_bus(struct i2c_adapter *adapter,
> +					  unsigned int flags)
> +{
> +	psp_release_i2c_bus();
> +	rt_mutex_unlock(&adapter->bus_lock);
> +}
> +
> +static const struct i2c_lock_operations i2c_dw_psp_lock_ops = {
> +	.lock_bus = i2c_adapter_dw_psp_lock_bus,
> +	.trylock_bus = i2c_adapter_dw_psp_trylock_bus,
> +	.unlock_bus = i2c_adapter_dw_psp_unlock_bus,
> +};
> +
> +int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
> +{
> +	if (!dev || !dev->dev)
> +		return -ENODEV;
> +
> +	if (!(dev->flags & ARBITRATION_SEMAPHORE))
> +		return -ENODEV;
> +
> +	/* Allow to bind only one instance of a driver */
> +	if (!psp_i2c_dev)
> +		psp_i2c_dev = dev->dev;
> +	else
> +		return -EEXIST;
> +
> +	if (psp_mbox_probe())
> +		return -EIO;
> +
> +	dev_info(psp_i2c_dev, "I2C bus managed by AMD PSP\n");
> +
> +	/*
> +	 * Install global locking callbacks for adapter as well as internal i2c
> +	 * controller locks
> +	 */
> +	dev->adapter.lock_ops = &i2c_dw_psp_lock_ops;
> +	dev->acquire_lock = psp_acquire_i2c_bus;
> +	dev->release_lock = psp_release_i2c_bus;
> +
> +	return 0;
> +}
> +
> +/* Unmap area used as a mailbox with PSP */
> +void i2c_dw_amdpsp_remove_lock_support(struct dw_i2c_dev *dev)
> +{
> +	iounmap(mbox_iomem);
> +}
> diff --git a/drivers/i2c/busses/i2c-designware-baytrail.c b/drivers/i2c/busses/i2c-designware-baytrail.c
> index c6a7a00e1d52..0c674542dd99 100644
> --- a/drivers/i2c/busses/i2c-designware-baytrail.c
> +++ b/drivers/i2c/busses/i2c-designware-baytrail.c
> @@ -12,25 +12,25 @@
>  
>  #include "i2c-designware-core.h"
>  
> -int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
> +int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev)
>  {
>  	acpi_status status;
>  	unsigned long long shared_host = 0;
>  	acpi_handle handle;
>  
>  	if (!dev || !dev->dev)
> -		return 0;
> +		return -ENODEV;
>  
>  	handle = ACPI_HANDLE(dev->dev);
>  	if (!handle)
> -		return 0;
> +		return -ENODEV;
>  
>  	status = acpi_evaluate_integer(handle, "_SEM", NULL, &shared_host);
>  	if (ACPI_FAILURE(status))
> -		return 0;
> +		return -ENODEV;
>  
>  	if (!shared_host)
> -		return 0;
> +		return -ENODEV;
>  
>  	if (!iosf_mbi_available())
>  		return -EPROBE_DEFER;
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 4b26cba40139..1d65212fddbd 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -227,6 +227,8 @@ struct reset_control;
>   * @hs_lcnt: high speed LCNT value
>   * @acquire_lock: function to acquire a hardware lock on the bus
>   * @release_lock: function to release a hardware lock on the bus
> + * @semaphore_idx: Index of table with semaphore type attached to the bus. It's
> + *	-1 if there is no semaphore.
>   * @shared_with_punit: true if this bus is shared with the SoCs PUNIT
>   * @disable: function to disable the controller
>   * @disable_int: function to disable all interrupts
> @@ -285,6 +287,7 @@ struct dw_i2c_dev {
>  	u16			hs_lcnt;
>  	int			(*acquire_lock)(void);
>  	void			(*release_lock)(void);
> +	int			semaphore_idx;
>  	bool			shared_with_punit;
>  	void			(*disable)(struct dw_i2c_dev *dev);
>  	void			(*disable_int)(struct dw_i2c_dev *dev);
> @@ -297,6 +300,7 @@ struct dw_i2c_dev {
>  
>  #define ACCESS_INTR_MASK	BIT(0)
>  #define ACCESS_NO_IRQ_SUSPEND	BIT(1)
> +#define ARBITRATION_SEMAPHORE	BIT(2)
>  
>  #define MODEL_MSCC_OCELOT	BIT(8)
>  #define MODEL_BAIKAL_BT1	BIT(9)
> @@ -310,6 +314,11 @@ struct dw_i2c_dev {
>  #define AMD_UCSI_INTR_REG	0x474
>  #define AMD_UCSI_INTR_EN	0xd
>  
> +struct i2c_dw_semaphore_callbacks {
> +	int	(*probe)(struct dw_i2c_dev *dev);
> +	void	(*remove)(struct dw_i2c_dev *dev);
> +};
> +
>  int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
>  u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
>  u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset);
> @@ -370,9 +379,12 @@ static inline void i2c_dw_configure(struct dw_i2c_dev *dev)
>  }
>  
>  #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_BAYTRAIL)
> -extern int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev);
> -#else
> -static inline int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev) { return 0; }
> +int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev);
> +#endif
> +
> +#if IS_ENABLED(CONFIG_I2C_DESIGNWARE_AMDPSP)
> +int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev);
> +void i2c_dw_amdpsp_remove_lock_support(struct dw_i2c_dev *dev);
>  #endif
>  
>  int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 2bd81abc86f6..5844a4df4141 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -51,6 +51,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
>  	{ "AMD0010", ACCESS_INTR_MASK },
>  	{ "AMDI0010", ACCESS_INTR_MASK },
>  	{ "AMDI0510", 0 },
> +	{ "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
>  	{ "APMC0D0F", 0 },
>  	{ "HISI02A1", 0 },
>  	{ "HISI02A2", 0 },
> @@ -204,6 +205,64 @@ static const struct dmi_system_id dw_i2c_hwmon_class_dmi[] = {
>  	{ } /* terminate list */
>  };
>  
> +static const struct i2c_dw_semaphore_callbacks i2c_dw_semaphore_cb_table[] = {
> +#ifdef CONFIG_I2C_DESIGNWARE_BAYTRAIL
> +	{
> +		.probe = i2c_dw_baytrail_probe_lock_support,
> +		.remove = NULL,
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
> +};
> +
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
> +
> +		ret = i2c_dw_semaphore_cb_table[i].probe(dev);
> +		if (!ret) {
> +			dev->semaphore_idx = i;
> +			break;
> +		} else if (ret == -ENODEV) {
> +			/*
> +			 * If there is no semaphore device attached to this
> +			 * controller, we shouldn't abort general i2c_controller
> +			 * probe.
> +			 */
> +			continue;
> +		} else {
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
> +{
> +	if (dev->semaphore_idx < 0)
> +		return;
> +
> +	if (i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove)
> +		i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove(dev);
> +}
> +
>  static int dw_i2c_plat_probe(struct platform_device *pdev)
>  {
>  	struct i2c_adapter *adap;
> @@ -334,6 +393,8 @@ static int dw_i2c_plat_remove(struct platform_device *pdev)
>  	pm_runtime_put_sync(&pdev->dev);
>  	dw_i2c_plat_pm_cleanup(dev);
>  
> +	i2c_dw_remove_lock_support(dev);
> +
>  	reset_control_assert(dev->rst);
>  
>  	return 0;
> 

