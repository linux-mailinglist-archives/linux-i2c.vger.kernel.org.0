Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FBE965B5DD
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Jan 2023 18:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232151AbjABR3f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Jan 2023 12:29:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232796AbjABR3e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Jan 2023 12:29:34 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A2919F
        for <linux-i2c@vger.kernel.org>; Mon,  2 Jan 2023 09:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672680574; x=1704216574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WFCCMx8FvNAGXuSRcuCSuaBNBjgj22vg2q/AhwDPIWU=;
  b=j4hNTjaHPCfXgkgxP0B7cYoiXc1h0dj3Qw9mObFOnPVXmhO+FEkVdKRH
   NoEbNogVknduqE5h6woOOXrx8Leg+K0hKwQk7eoeXT+wBHOP7Ld+cIoeK
   +U9F4UX7d2jJakfPVHDIJuGLP5v2g7Li7UZXISbC7E3JoGCJ5hGmlAUZi
   6/V7MLoxtKWPqKmXD5+t2twb+6e5xt2jS7xmoW3cboebYnI82msEmo0FI
   9GdhAZ+dpnlowo7TO0qPt2KmQWewltmPuXafAI0jbmZmQnuc0pPRMW8MS
   3Hj1h5i8emg6GM2XJWD72n+COCswspXBzYfosDD1AxxGMOKuqg6c0/6wN
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="319219353"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; 
   d="scan'208";a="319219353"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2023 09:29:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="647957060"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; 
   d="scan'208";a="647957060"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 02 Jan 2023 09:29:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pCOcr-003WaQ-2Z;
        Mon, 02 Jan 2023 19:29:29 +0200
Date:   Mon, 2 Jan 2023 19:29:29 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, linux-i2c@vger.kernel.org, Rajesh1.Kumar@amd.com,
        Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH] i2c: designware-pci: Add new PCI IDs for AMD NAVI GPU
Message-ID: <Y7MUeRqYJ6peB3eh@smile.fi.intel.com>
References: <20230102170955.1750734-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230102170955.1750734-1-Basavaraj.Natikar@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 02, 2023 at 10:39:55PM +0530, Basavaraj Natikar wrote:
> Add additional supported PCI IDs for latest AMD NAVI GPU card which
> has an integrated Type-C controller and designware I2C with PCI
> interface.

Obviously looks correct from the code and style perspectives.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> Tested-by: Sanath S <Sanath.S@amd.com>
> ---
>  drivers/i2c/busses/i2c-designware-pcidrv.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index e499f96506c5..782fe1ef3ca1 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -396,6 +396,8 @@ static const struct pci_device_id i2_designware_pci_ids[] = {
>  	{ PCI_VDEVICE(ATI,  0x73a4), navi_amd },
>  	{ PCI_VDEVICE(ATI,  0x73e4), navi_amd },
>  	{ PCI_VDEVICE(ATI,  0x73c4), navi_amd },
> +	{ PCI_VDEVICE(ATI,  0x7444), navi_amd },
> +	{ PCI_VDEVICE(ATI,  0x7464), navi_amd },
>  	{ 0,}
>  };
>  MODULE_DEVICE_TABLE(pci, i2_designware_pci_ids);
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


