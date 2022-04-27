Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E45A0511F28
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Apr 2022 20:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240311AbiD0PrS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Apr 2022 11:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240340AbiD0PrP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Apr 2022 11:47:15 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322F64E38D
        for <linux-i2c@vger.kernel.org>; Wed, 27 Apr 2022 08:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651074241; x=1682610241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zeBke6BJmHsOvrLzb+liguzesMcQj17x1HoGhMuOwbk=;
  b=Q04JpRfqdWe99NPdeCS7PwsbPix3JGMUqgnFs4LA12TfqHagJDdfH6Kv
   iwmdxTY13ynRltyCIXsmSW/Rx7jw8gFuhGQtOyIc+JGzoBB/Gq5Qs58oA
   y29T6/8Hjq0icqUXsTMvCR8WwtCauz4x0HKddXko9KV4EGiFFNMvbJ1yQ
   nGdtEalJFQZfraMyhPLXpDaSE60wOQVTYBSEShAeLFJg8ODmA2kstspZC
   tMxD1b96ceNZ1NVjvHgh96y+djEL8VcZ6+JlXPmIUylfQxngD/Rb0wxgs
   AQDH9vszkFYiTsbX2KT+LX8AmNAOSkFyV/USsrqABeHnElthhPQlpvAGH
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="253349617"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; 
   d="scan'208";a="253349617"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 08:19:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; 
   d="scan'208";a="565121727"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 08:19:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1njjRm-008sdY-MH;
        Wed, 27 Apr 2022 18:19:18 +0300
Date:   Wed, 27 Apr 2022 18:19:18 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ismt: Provide a DMA buffer for Interrupt Cause
 Logging
Message-ID: <Ymle9oNOCFM83KSS@smile.fi.intel.com>
References: <20220427101910.47438-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427101910.47438-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 27, 2022 at 01:19:10PM +0300, Mika Westerberg wrote:
> Before sending a MSI the hardware writes information pertinent to the
> interrupt cause to a memory location pointed by SMTICL register. This
> memory holds three double words where the least significant bit tells
> whether the interrupt cause of master/target/error is valid. The driver
> does not use this but we need to set it up because otherwise it will
> perform DMA write to the default address (0) and this will cause an
> IOMMU fault such as below:
> 
>   DMAR: DRHD: handling fault status reg 2
>   DMAR: [DMA Write] Request device [00:12.0] PASID ffffffff fault addr 0
>         [fault reason 05] PTE Write access is not set
> 
> To prevent this from happening, provide a proper DMA buffer for this
> that then gets mapped by the IOMMU accordingly.

Reviewed-by: From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-ismt.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
> index c0364314877e..c16157ee8c52 100644
> --- a/drivers/i2c/busses/i2c-ismt.c
> +++ b/drivers/i2c/busses/i2c-ismt.c
> @@ -82,6 +82,7 @@
>  
>  #define ISMT_DESC_ENTRIES	2	/* number of descriptor entries */
>  #define ISMT_MAX_RETRIES	3	/* number of SMBus retries to attempt */
> +#define ISMT_LOG_ENTRIES	3	/* number of interrupt cause log entries */
>  
>  /* Hardware Descriptor Constants - Control Field */
>  #define ISMT_DESC_CWRL	0x01	/* Command/Write Length */
> @@ -175,6 +176,8 @@ struct ismt_priv {
>  	u8 head;				/* ring buffer head pointer */
>  	struct completion cmp;			/* interrupt completion */
>  	u8 buffer[I2C_SMBUS_BLOCK_MAX + 16];	/* temp R/W data buffer */
> +	dma_addr_t log_dma;
> +	u32 *log;
>  };
>  
>  static const struct pci_device_id ismt_ids[] = {
> @@ -411,6 +414,9 @@ static int ismt_access(struct i2c_adapter *adap, u16 addr,
>  	memset(desc, 0, sizeof(struct ismt_desc));
>  	desc->tgtaddr_rw = ISMT_DESC_ADDR_RW(addr, read_write);
>  
> +	/* Always clear the log entries */
> +	memset(priv->log, 0, ISMT_LOG_ENTRIES * sizeof(u32));
> +
>  	/* Initialize common control bits */
>  	if (likely(pci_dev_msi_enabled(priv->pci_dev)))
>  		desc->control = ISMT_DESC_INT | ISMT_DESC_FAIR;
> @@ -708,6 +714,8 @@ static void ismt_hw_init(struct ismt_priv *priv)
>  	/* initialize the Master Descriptor Base Address (MDBA) */
>  	writeq(priv->io_rng_dma, priv->smba + ISMT_MSTR_MDBA);
>  
> +	writeq(priv->log_dma, priv->smba + ISMT_GR_SMTICL);
> +
>  	/* initialize the Master Control Register (MCTRL) */
>  	writel(ISMT_MCTRL_MEIE, priv->smba + ISMT_MSTR_MCTRL);
>  
> @@ -795,6 +803,12 @@ static int ismt_dev_init(struct ismt_priv *priv)
>  	priv->head = 0;
>  	init_completion(&priv->cmp);
>  
> +	priv->log = dmam_alloc_coherent(&priv->pci_dev->dev,
> +					ISMT_LOG_ENTRIES * sizeof(u32),
> +					&priv->log_dma, GFP_KERNEL);
> +	if (!priv->log)
> +		return -ENOMEM;
> +
>  	return 0;
>  }
>  
> -- 
> 2.35.1
> 

-- 
With Best Regards,
Andy Shevchenko


