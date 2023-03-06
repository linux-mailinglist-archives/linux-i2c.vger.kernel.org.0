Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A825A6ABF05
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Mar 2023 13:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbjCFMEl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Mar 2023 07:04:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjCFMEf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Mar 2023 07:04:35 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAEE120695;
        Mon,  6 Mar 2023 04:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678104274; x=1709640274;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CVxITIz/taDItviqkNdDZC22Ok+YGY38badLQU0qG5s=;
  b=hXVf9TtNwY/Mam+8yBZcr6fPeCxqTS99hh4G3d76GRx7n/6I/tVVcjGf
   5qtX31jN7TNFz7EWiKW+8P7OWDdBn6i0lGDRyrI6Pjh2mCK0Lx/3t8NsQ
   /zpqt5qAKpvWZGHRHgx9MoCbOsGdC8SgjUjHG5MWUlznDK40s7+EOfRUB
   esJtmqls6QHMGLKpQeKVE9dDmlT522K8I7Z7S9McKWSPx+gB1pfkGrQLL
   rWKrIAt3M1CeHScopxDnKymUi2srluV7xPowqnAEtOt4Ovj++WlViFstI
   4bducyPTN2BbT5ZnDxARQsSod1jNTNbElXd3T+Yg6zUoLx6rre2C1GhMC
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="398118377"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="398118377"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 04:04:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="740301743"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="740301743"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 06 Mar 2023 04:04:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pZ9Zs-00GKz4-28;
        Mon, 06 Mar 2023 14:04:28 +0200
Date:   Mon, 6 Mar 2023 14:04:28 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>, Rijo-john.Thomas@amd.com,
        Thomas.Lendacky@amd.com, herbert@gondor.apana.org.au,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 9/9] i2c: designware: Add support for AMDI0020 ACPI ID
Message-ID: <ZAXWzMFBjo57UUa+@smile.fi.intel.com>
References: <20230303165050.2918-1-mario.limonciello@amd.com>
 <20230303165050.2918-10-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303165050.2918-10-mario.limonciello@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 03, 2023 at 10:50:47AM -0600, Mario Limonciello wrote:
> Cezanne and Skyrim have the same PSP hardware but use a different
> protocol to negotiate I2C arbitration. To disambiguate this going
> forward introduce a new ACPI ID to represent the protocol that utilizes
> a doorbell.

> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v2->v3:
>  * Split from earlier patch to standalone
> ---
>  drivers/i2c/busses/i2c-designware-amdpsp.c  | 5 +++--
>  drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
> index 2c671973010d..44b8432458b0 100644
> --- a/drivers/i2c/busses/i2c-designware-amdpsp.c
> +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> @@ -101,11 +101,12 @@ static int psp_send_i2c_req_amdi0019(enum psp_i2c_req_type i2c_req_type)
>  
>  static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
>  {
> +	const char *hid = acpi_device_hid(ACPI_COMPANION(psp_i2c_dev));
>  	unsigned long start = jiffies;
>  	int ret;
>  
> -	/* Use doorbell for Skyrim and mailbox for Cezanne */
> -	if (boot_cpu_data.x86 == 25 && boot_cpu_data.x86_model == 80)

Ah, in this form it's getting better than I thought!

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> +	/* Use doorbell for AMDI0020 and mailbox for AMDI0019 */
> +	if (!strcmp(hid, "AMDI0019"))
>  		ret = psp_send_i2c_req_amdi0019(i2c_req_type);
>  	else
>  		ret = psp_ring_platform_doorbell(i2c_req_type);
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 89ad88c54754..5ca71bda9ac2 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -51,6 +51,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
>  	{ "AMD0010", ACCESS_INTR_MASK },
>  	{ "AMDI0010", ACCESS_INTR_MASK },
>  	{ "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
> +	{ "AMDI0020", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
>  	{ "AMDI0510", 0 },
>  	{ "APMC0D0F", 0 },
>  	{ "HISI02A1", 0 },
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


