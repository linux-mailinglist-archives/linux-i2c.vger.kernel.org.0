Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 070B8706F1F
	for <lists+linux-i2c@lfdr.de>; Wed, 17 May 2023 19:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbjEQROW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 May 2023 13:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjEQROT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 May 2023 13:14:19 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 421AA40EF;
        Wed, 17 May 2023 10:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684343658; x=1715879658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PIb1m6rDVELZHR03g5Ezh8+AcEOOlpLN1h3VlAWWeEY=;
  b=UAUhM/Z6kQpsTyCUlPX9ghQeVTQXuq2Qavwgn2+YEze/hKn6BbYpK96M
   7P8DlXGnFYmxItN/tMsHY60t505d1XT4HR573MElGK8PuRz+daE1q0cJg
   70z06KQDlhQqMEjp9H/E+4KAP3JupMeo1YDr9PYiKLgkIaHw/YogvT3uD
   tbuWW/pM+m/Od8fvPB+/IG0vdUtf8Ta2d6qMZ1nP77lEPXieQRwvVxHP/
   TsKhwbcqAsvisgysyZ2fxcSOhlB9pgKxPebxe6H6tZFTe5D26pAVj+9hy
   P6FXNQutatKmlwI47oRFtht4qcmNv+IOBK6bv9YUAIc1kBKDt5jqLIEXz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="332188768"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; 
   d="scan'208";a="332188768"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 10:14:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="766849105"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; 
   d="scan'208";a="766849105"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 17 May 2023 10:14:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pzKj7-0008Vq-1i;
        Wed, 17 May 2023 20:14:13 +0300
Date:   Wed, 17 May 2023 20:14:13 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     heikki.krogerus@linux.intel.com, rafael@kernel.org,
        ajayg@nvidia.com, linux-i2c@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Evan.Quan@amd.com, Lijo.Lazar@amd.com,
        Sanket.Goswami@amd.com
Subject: Re: [PATCH 2/2] usb: typec: ucsi: Don't create power supplies for
 dGPUs
Message-ID: <ZGULZU01tdqm1Xoc@smile.fi.intel.com>
References: <20230516182541.5836-1-mario.limonciello@amd.com>
 <20230516182541.5836-3-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230516182541.5836-3-mario.limonciello@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 16, 2023 at 01:25:41PM -0500, Mario Limonciello wrote:
> power_supply_is_system_supplied() checks whether any power
> supplies are present that aren't batteries to decide whether
> the system is running on DC or AC.  Downstream drivers use
> this to make performance decisions.
> 
> Navi dGPUs include an UCSI function that has been exported
> since commit 17631e8ca2d3 ("i2c: designware: Add driver
> support for AMD NAVI GPU").
> 
> This UCSI function registers a power supply since commit
> 992a60ed0d5e ("usb: typec: ucsi: register with power_supply class")
> but this is not a system power supply.
> 
> As the power supply for a dGPU is only for powering devices connected
> to dGPU, create a device property to indicate that the UCSI endpoint
> is only for the scope of `POWER_SUPPLY_SCOPE_DEVICE`.

...

> +static const struct property_entry dgpu_properties[] = {
> +	/* USB-C doesn't power the system */
> +	PROPERTY_ENTRY_U8("scope", POWER_SUPPLY_SCOPE_DEVICE),
> +	{},

Comma is not needed in terminator entry.

> +};

-- 
With Best Regards,
Andy Shevchenko


