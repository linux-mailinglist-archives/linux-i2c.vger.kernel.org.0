Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5369B5E9EA0
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 12:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234239AbiIZKIG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 06:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234960AbiIZKHk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 06:07:40 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB36439B96;
        Mon, 26 Sep 2022 03:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664186859; x=1695722859;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lhSJ6B97wE17BYE7duhPk1D95O/aSsVTRXqSPsbRYK0=;
  b=Be8/pPkuGp4HgIoPynyR4ecg89ozXkYsweKh7a7Tv/kTNXMgXizDy7mY
   qIBvIPISLLCO+OffplqLFQ1PmINqefEKgHD9+t92vJBBPl/OCm6lEa+s2
   SoaoDLRlL3wgarGqsUecu3vYO/t25Y/RGABXd2tKZ0aNQVk6T1AY0E1sL
   PFvtZVpeN2vgOZlIRAHcv5Qal/RWhB0NEmiOO8v9RU3JhlucDXSgslzlV
   iLxi89mXXeawrobzDFXIQ2A4hXC3nSZHU586LFptcsuhjwEpyv/GGmL/O
   4Y0891KalmmcuSFPZwu+6B5aePvW3+IoY1VXsd9Yf+o/OW2CzIBUMN2ge
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="327334603"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; 
   d="scan'208";a="327334603"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 03:07:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="710065907"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; 
   d="scan'208";a="710065907"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Sep 2022 03:07:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ocl1S-007k9e-00;
        Mon, 26 Sep 2022 13:07:34 +0300
Date:   Mon, 26 Sep 2022 13:07:33 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        wsa@kernel.org, krzk@kernel.org, jarkko.nikula@linux.intel.com,
        robh@kernel.org, semen.protsenko@linaro.org, sven@svenpeter.dev,
        jsd@semihalf.com, rafal@milecki.pl, olof@lixom.net, arnd@arndb.de,
        UNGLinuxDriver@microchip.com
Subject: Re: [PATCH v5 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Message-ID: <YzF55ckrtsNaxZUq@smile.fi.intel.com>
References: <20220926084654.2580827-1-tharunkumar.pasumarthi@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926084654.2580827-1-tharunkumar.pasumarthi@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 26, 2022 at 02:16:54PM +0530, Tharun Kumar P wrote:
> Microchip pci1xxxx is an unmanaged PCIe3.1a Switch for Consumer,
> Industrial and Automotive applications. This switch has multiple
> downstream ports. In one of the Switch's Downstream port, there
> is a multifunction endpoint for peripherals which includes an I2C
> host controller. The I2C function in the endpoint operates at 100KHz,
> 400KHz and 1 MHz and has buffer depth of 128 bytes.
> This patch provides the I2C controller driver for the I2C function
> of the switch.

> ---
> V4 -> V5:
> 1. Removed autoprobe
> ---
> V3 -> V4:
> 1. Removed typecasting for fields of min_t
> 2. Replaced TRUE with true
> ---
> V2 -> V3:
> 1. Replaced SIMPLE_DEV_PM_OPS with DEFINE_SIMPLE_DEV_PM_OPS
> 2. Used devm_add_action API to avoid mixing devm and non-devm APIs
> ---
> RFC -> V2:
> 1. Removed pci_free_irq_vectors API in code since pcim_enable_device
> is used
> 2. Added pci1xxxx_i2c_shutdown API in failure case of
> pci_alloc_irq_vectors and devm_request_irq
> 3. Used devm variant of i2c_add_adapter
> 4. Resolved name collision and fixed styling issues in comments
> ---



> Signed-off-by: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>

There is no SoB tag in your message. Homework: to understand what went wrong
and fix in v6. Without SoB tag this may not be considered at all.

Also, if somebody gave you a tag (reviewers/maintainers) in the previous
versions, it's your as a contributor responsibility to bear those tags with
new versions in case there were no drastic functional changes. Otherwise
there is no point to review your changes.


-- 
With Best Regards,
Andy Shevchenko


