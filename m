Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 849B76C6951
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 14:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjCWNPC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 09:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbjCWNPA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 09:15:00 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE904B442;
        Thu, 23 Mar 2023 06:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679577298; x=1711113298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=76vbyUj1BFEGVpgeYnRVsqxoxjxQHbQeiYKBwm7d0+M=;
  b=LKZ0hUifC9tqC6tckIPtX0gb9sgODw+7BoTPZSEa5Og5gO5KrcBOd4fv
   X8MMCy/C19AZBo4n832ERnzyp9nHgKuXG9wpgkNf+e+Mcm/9iz7Uq46U9
   SDz1ZQi11P7UicvNeMKmdnB9/8l4hefI49WpV3QZOUWTONMuGwpA6+CqE
   mk65YiC76ufmOgip26k41stiUS1LSr74dPyE21C6N7VaNNxaOLM2bSKiO
   zEE+LVUbKqxXLH5eYGq9Uyfyk0T/cwvqG3I3R4VYS5UHc+q3RGSK80bZE
   oRH4jRbeKwfyzxLxDsF5fHzhEXKGT+a38/S3DbtvK93sQzKjeLDQABRQ7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="404370648"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="404370648"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 06:08:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="825815037"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="825815037"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 23 Mar 2023 06:08:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pfKfn-007WB2-29;
        Thu, 23 Mar 2023 15:08:07 +0200
Date:   Thu, 23 Mar 2023 15:08:07 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/4] i2c: designware: Use PCI PSP driver for
 communication
Message-ID: <ZBxPNy3Fo9gDsR/l@smile.fi.intel.com>
References: <20230322210227.464-1-mario.limonciello@amd.com>
 <20230322210227.464-4-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322210227.464-4-mario.limonciello@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 22, 2023 at 04:02:25PM -0500, Mario Limonciello wrote:
> Currently the PSP semaphore communication base address is discovered
> by using an MSR that is not architecturally guaranteed for future
> platforms.  Also the mailbox that is utilized for communication with
> the PSP may have other consumers in the kernel, so it's better to
> make all communication go through a single driver.

Fine by me,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v5->v6:
>  * Drop now unnecessary asm/msr.h header
>  * Fix IS_REACHABLE
>  * Drop tags
>  * Fix status code handling for Cezanne
> v4->v5:
>  * Pick up tags
> v3->v4:
>  * Pick up tags
> v1->v2:
>  * Fix Kconfig to use imply
>  * Use IS_REACHABLE
> ---
>  drivers/i2c/busses/Kconfig                  |   2 +-
>  drivers/i2c/busses/i2c-designware-amdpsp.c  | 175 +++-----------------
>  drivers/i2c/busses/i2c-designware-core.h    |   1 -
>  drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
>  include/linux/psp-platform-access.h         |   1 +
>  5 files changed, 27 insertions(+), 153 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 25eb4e8fd22f..d53bf716f97d 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -566,9 +566,9 @@ config I2C_DESIGNWARE_PLATFORM
>  
>  config I2C_DESIGNWARE_AMDPSP
>  	bool "AMD PSP I2C semaphore support"
> -	depends on X86_MSR
>  	depends on ACPI
>  	depends on I2C_DESIGNWARE_PLATFORM
> +	imply CRYPTO_DEV_SP_PSP
>  	help
>  	  This driver enables managed host access to the selected I2C bus shared
>  	  between AMD CPU and AMD PSP.
> diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
> index 652e6b64bd5f..12870dc44bdb 100644
> --- a/drivers/i2c/busses/i2c-designware-amdpsp.c
> +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> @@ -1,35 +1,20 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
> -#include <linux/bitfield.h>
> -#include <linux/bits.h>
>  #include <linux/i2c.h>
> -#include <linux/io-64-nonatomic-lo-hi.h>
> +#include <linux/psp-platform-access.h>
>  #include <linux/psp.h>
> -#include <linux/types.h>
>  #include <linux/workqueue.h>
>  
> -#include <asm/msr.h>
> -
>  #include "i2c-designware-core.h"
>  
> -#define MSR_AMD_PSP_ADDR	0xc00110a2
> -#define PSP_MBOX_OFFSET		0x10570
> -#define PSP_CMD_TIMEOUT_US	(500 * USEC_PER_MSEC)
> -
>  #define PSP_I2C_RESERVATION_TIME_MS 100
>  
> -#define PSP_I2C_REQ_BUS_CMD		0x64
>  #define PSP_I2C_REQ_RETRY_CNT		400
>  #define PSP_I2C_REQ_RETRY_DELAY_US	(25 * USEC_PER_MSEC)
>  #define PSP_I2C_REQ_STS_OK		0x0
>  #define PSP_I2C_REQ_STS_BUS_BUSY	0x1
>  #define PSP_I2C_REQ_STS_INV_PARAM	0x3
>  
> -struct psp_req_buffer_hdr {
> -	u32 total_size;
> -	u32 status;
> -};
> -
>  enum psp_i2c_req_type {
>  	PSP_I2C_REQ_ACQUIRE,
>  	PSP_I2C_REQ_RELEASE,
> @@ -41,119 +26,12 @@ struct psp_i2c_req {
>  	enum psp_i2c_req_type type;
>  };
>  
> -struct psp_mbox {
> -	u32 cmd_fields;
> -	u64 i2c_req_addr;
> -} __packed;
> -
>  static DEFINE_MUTEX(psp_i2c_access_mutex);
>  static unsigned long psp_i2c_sem_acquired;
> -static void __iomem *mbox_iomem;
>  static u32 psp_i2c_access_count;
>  static bool psp_i2c_mbox_fail;
>  static struct device *psp_i2c_dev;
>  
> -/*
> - * Implementation of PSP-x86 i2c-arbitration mailbox introduced for AMD Cezanne
> - * family of SoCs.
> - */
> -
> -static int psp_get_mbox_addr(unsigned long *mbox_addr)
> -{
> -	unsigned long long psp_mmio;
> -
> -	if (rdmsrl_safe(MSR_AMD_PSP_ADDR, &psp_mmio))
> -		return -EIO;
> -
> -	*mbox_addr = (unsigned long)(psp_mmio + PSP_MBOX_OFFSET);
> -
> -	return 0;
> -}
> -
> -static int psp_mbox_probe(void)
> -{
> -	unsigned long mbox_addr;
> -	int ret;
> -
> -	ret = psp_get_mbox_addr(&mbox_addr);
> -	if (ret)
> -		return ret;
> -
> -	mbox_iomem = ioremap(mbox_addr, sizeof(struct psp_mbox));
> -	if (!mbox_iomem)
> -		return -ENOMEM;
> -
> -	return 0;
> -}
> -
> -/* Recovery field should be equal 0 to start sending commands */
> -static int psp_check_mbox_recovery(struct psp_mbox __iomem *mbox)
> -{
> -	u32 tmp;
> -
> -	tmp = readl(&mbox->cmd_fields);
> -
> -	return FIELD_GET(PSP_CMDRESP_RECOVERY, tmp);
> -}
> -
> -static int psp_wait_cmd(struct psp_mbox __iomem *mbox)
> -{
> -	u32 tmp, expected;
> -
> -	/* Expect mbox_cmd to be cleared and the response bit to be set by PSP */
> -	expected = FIELD_PREP(PSP_CMDRESP_RESP, 1);
> -
> -	/*
> -	 * Check for readiness of PSP mailbox in a tight loop in order to
> -	 * process further as soon as command was consumed.
> -	 */
> -	return readl_poll_timeout(&mbox->cmd_fields, tmp, (tmp == expected),
> -				  0, PSP_CMD_TIMEOUT_US);
> -}
> -
> -/* Status equal to 0 means that PSP succeed processing command */
> -static u32 psp_check_mbox_sts(struct psp_mbox __iomem *mbox)
> -{
> -	u32 cmd_reg;
> -
> -	cmd_reg = readl(&mbox->cmd_fields);
> -
> -	return FIELD_GET(PSP_CMDRESP_STS, cmd_reg);
> -}
> -
> -static int psp_send_cmd(struct psp_i2c_req *req)
> -{
> -	struct psp_mbox __iomem *mbox = mbox_iomem;
> -	phys_addr_t req_addr;
> -	u32 cmd_reg;
> -
> -	if (psp_check_mbox_recovery(mbox))
> -		return -EIO;
> -
> -	if (psp_wait_cmd(mbox))
> -		return -EBUSY;
> -
> -	/*
> -	 * Fill mailbox with address of command-response buffer, which will be
> -	 * used for sending i2c requests as well as reading status returned by
> -	 * PSP. Use physical address of buffer, since PSP will map this region.
> -	 */
> -	req_addr = __psp_pa((void *)req);
> -	writeq(req_addr, &mbox->i2c_req_addr);
> -
> -	/* Write command register to trigger processing */
> -	cmd_reg = FIELD_PREP(PSP_CMDRESP_CMD, PSP_I2C_REQ_BUS_CMD);
> -	writel(cmd_reg, &mbox->cmd_fields);
> -
> -	if (psp_wait_cmd(mbox))
> -		return -ETIMEDOUT;
> -
> -	if (psp_check_mbox_sts(mbox))
> -		return -EIO;
> -
> -	return 0;
> -}
> -
>  /* Helper to verify status returned by PSP */
>  static int check_i2c_req_sts(struct psp_i2c_req *req)
>  {
> @@ -173,22 +51,25 @@ static int check_i2c_req_sts(struct psp_i2c_req *req)
>  	}
>  }
>  
> -static int psp_send_check_i2c_req(struct psp_i2c_req *req)
> +/*
> + * Errors in x86-PSP i2c-arbitration protocol may occur at two levels:
> + * 1. mailbox communication - PSP is not operational or some IO errors with
> + *    basic communication had happened.
> + * 2. i2c-requests - PSP refuses to grant i2c arbitration to x86 for too long.
> + *
> + * In order to distinguish between these in error handling code all mailbox
> + * communication errors on the first level (from CCP symbols) will be passed
> + * up and if -EIO is returned the second level will be checked.
> + */
> +static int psp_send_i2c_req_cezanne(struct psp_i2c_req *req)
>  {
> -	/*
> -	 * Errors in x86-PSP i2c-arbitration protocol may occur at two levels:
> -	 * 1. mailbox communication - PSP is not operational or some IO errors
> -	 * with basic communication had happened;
> -	 * 2. i2c-requests - PSP refuses to grant i2c arbitration to x86 for too
> -	 * long.
> -	 * In order to distinguish between these two in error handling code, all
> -	 * errors on the first level (returned by psp_send_cmd) are shadowed by
> -	 * -EIO.
> -	 */
> -	if (psp_send_cmd(req))
> -		return -EIO;
> +	int ret;
>  
> -	return check_i2c_req_sts(req);
> +	ret = psp_send_platform_access_msg(PSP_I2C_REQ_BUS_CMD, (struct psp_request *)req);
> +	if (ret == -EIO)
> +		return check_i2c_req_sts(req);
> +
> +	return ret;
>  }
>  
>  static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
> @@ -202,11 +83,11 @@ static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
>  	if (!req)
>  		return -ENOMEM;
>  
> -	req->hdr.total_size = sizeof(*req);
> +	req->hdr.payload_size = sizeof(*req);
>  	req->type = i2c_req_type;
>  
>  	start = jiffies;
> -	ret = read_poll_timeout(psp_send_check_i2c_req, status,
> +	ret = read_poll_timeout(psp_send_i2c_req_cezanne, status,
>  				(status != -EBUSY),
>  				PSP_I2C_REQ_RETRY_DELAY_US,
>  				PSP_I2C_REQ_RETRY_CNT * PSP_I2C_REQ_RETRY_DELAY_US,
> @@ -381,7 +262,8 @@ static const struct i2c_lock_operations i2c_dw_psp_lock_ops = {
>  
>  int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
>  {
> -	int ret;
> +	if (!IS_REACHABLE(CONFIG_CRYPTO_DEV_CCP_DD))
> +		return -ENODEV;
>  
>  	if (!dev)
>  		return -ENODEV;
> @@ -393,11 +275,10 @@ int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
>  	if (psp_i2c_dev)
>  		return -EEXIST;
>  
> -	psp_i2c_dev = dev->dev;
> +	if (psp_check_platform_access_status())
> +		return -EPROBE_DEFER;
>  
> -	ret = psp_mbox_probe();
> -	if (ret)
> -		return ret;
> +	psp_i2c_dev = dev->dev;
>  
>  	dev_info(psp_i2c_dev, "I2C bus managed by AMD PSP\n");
>  
> @@ -411,9 +292,3 @@ int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
>  
>  	return 0;
>  }
> -
> -/* Unmap area used as a mailbox with PSP */
> -void i2c_dw_amdpsp_remove_lock_support(struct dw_i2c_dev *dev)
> -{
> -	iounmap(mbox_iomem);
> -}
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 050d8c63ad3c..c5d87aae39c6 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -383,7 +383,6 @@ int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev);
>  
>  #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_AMDPSP)
>  int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev);
> -void i2c_dw_amdpsp_remove_lock_support(struct dw_i2c_dev *dev);
>  #endif
>  
>  int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 74182db03a88..89ad88c54754 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -214,7 +214,6 @@ static const struct i2c_dw_semaphore_callbacks i2c_dw_semaphore_cb_table[] = {
>  #ifdef CONFIG_I2C_DESIGNWARE_AMDPSP
>  	{
>  		.probe = i2c_dw_amdpsp_probe_lock_support,
> -		.remove = i2c_dw_amdpsp_remove_lock_support,
>  	},
>  #endif
>  	{}
> diff --git a/include/linux/psp-platform-access.h b/include/linux/psp-platform-access.h
> index 1b661341d8f3..75da8f5f7ad8 100644
> --- a/include/linux/psp-platform-access.h
> +++ b/include/linux/psp-platform-access.h
> @@ -7,6 +7,7 @@
>  
>  enum psp_platform_access_msg {
>  	PSP_CMD_NONE = 0x0,
> +	PSP_I2C_REQ_BUS_CMD = 0x64,
>  };
>  
>  struct psp_req_buffer_hdr {
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


