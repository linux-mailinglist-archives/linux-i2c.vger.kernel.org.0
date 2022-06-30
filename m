Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B60A75614DF
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 10:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbiF3IWl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 04:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232776AbiF3IWX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 04:22:23 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6806300
        for <linux-i2c@vger.kernel.org>; Thu, 30 Jun 2022 01:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656577329; x=1688113329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4x5x06jcBdX/aoRa8XJT57as2hvohdjPYZsW/uZpSBM=;
  b=byjZUureY5b5K5U4k5pkfxpAmv718hluRELZfbJlPPVr/PIIHRbdG9Gk
   +oOy4/c/rPnf6qYvhrXwGicOeM02jhYjESMCeo7+mtdqi0GgPSQZ3NPPZ
   42v526QnfQJ95QnEUeK8+pPee/rGF843qFZfLfQ/6ih/NsS4U6mvZefZL
   bQ1fGjvUqrm+GVNfrN7XT0IDkfEOhLX9TKkXxh3eguExOculOWUkLp6IB
   e1mCtc3nnpRmRSdJdV1P6IdSCq9JAS2elcbFyVh6/yhQSHd5gka+y+TC0
   7s+yCWCjM3I37QcTkx6m7lPeisZUyCvSRmUXfjndBb0cqK3mkaTkpnayj
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="271051696"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="271051696"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 01:22:09 -0700
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="595601444"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 01:22:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o6pR7-000yN2-4k;
        Thu, 30 Jun 2022 11:22:05 +0300
Date:   Thu, 30 Jun 2022 11:22:04 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v2] i2c: i801: Add support for Intel Meteor Lake-P
Message-ID: <Yr1dLLfykmFWOxXh@smile.fi.intel.com>
References: <20220630074154.692578-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630074154.692578-1-jarkko.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 30, 2022 at 10:41:54AM +0300, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Meteor Lake-P.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
> v2. Meteor Lake-P doesn't have a PCH die but integrates the
> functionality into a SoC. Change commit log and patch diff accordingly.
> Thanks to Andy Shevchenko for noticing this in an another patch.
> ---
>  Documentation/i2c/busses/i2c-i801.rst | 1 +
>  drivers/i2c/busses/Kconfig            | 1 +
>  drivers/i2c/busses/i2c-i801.c         | 3 +++
>  3 files changed, 5 insertions(+)
> 
> diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
> index cad59170b2ad..ab9e850e8fe0 100644
> --- a/Documentation/i2c/busses/i2c-i801.rst
> +++ b/Documentation/i2c/busses/i2c-i801.rst
> @@ -46,6 +46,7 @@ Supported adapters:
>    * Intel Emmitsburg (PCH)
>    * Intel Alder Lake (PCH)
>    * Intel Raptor Lake (PCH)
> +  * Intel Meteor Lake (SOC)
>  
>     Datasheets: Publicly available at the Intel website
>  
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index b1d7069dd377..3f6d03073079 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -156,6 +156,7 @@ config I2C_I801
>  	    Emmitsburg (PCH)
>  	    Alder Lake (PCH)
>  	    Raptor Lake (PCH)
> +	    Meteor Lake (SOC)
>  
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-i801.
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index ff706349bdfb..9e5b87e107ba 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -76,6 +76,7 @@
>   * Alder Lake-P (PCH)		0x51a3	32	hard	yes	yes	yes
>   * Alder Lake-M (PCH)		0x54a3	32	hard	yes	yes	yes
>   * Raptor Lake-S (PCH)		0x7a23	32	hard	yes	yes	yes
> + * Meteor Lake-P (SOC)		0x7e22	32	hard	yes	yes	yes
>   *
>   * Features supported by this driver:
>   * Software PEC				no
> @@ -231,6 +232,7 @@
>  #define PCI_DEVICE_ID_INTEL_BROXTON_SMBUS		0x5ad4
>  #define PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_S_SMBUS		0x7a23
>  #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS		0x7aa3
> +#define PCI_DEVICE_ID_INTEL_METEOR_LAKE_P_SMBUS		0x7e22
>  #define PCI_DEVICE_ID_INTEL_LYNXPOINT_SMBUS		0x8c22
>  #define PCI_DEVICE_ID_INTEL_WILDCATPOINT_SMBUS		0x8ca2
>  #define PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS		0x8d22
> @@ -1049,6 +1051,7 @@ static const struct pci_device_id i801_ids[] = {
>  	{ PCI_DEVICE_DATA(INTEL, ALDER_LAKE_P_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ PCI_DEVICE_DATA(INTEL, ALDER_LAKE_M_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ PCI_DEVICE_DATA(INTEL, RAPTOR_LAKE_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
> +	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_P_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ 0, }
>  };
>  
> -- 
> 2.35.1
> 

-- 
With Best Regards,
Andy Shevchenko


