Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD90F706F28
	for <lists+linux-i2c@lfdr.de>; Wed, 17 May 2023 19:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjEQRQE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 May 2023 13:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjEQRQD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 May 2023 13:16:03 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945833C30;
        Wed, 17 May 2023 10:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684343762; x=1715879762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zg/ejffle54KocW8fmHkFJRyjQXRJraVWXN1BPTHtdA=;
  b=e3/n3XFqeLZvl8tWCvcU5KhAaT6lw7yHMts11KSfYmjwHWRbdDUOWLxm
   nspg+0kdun2o12N5KetB4BaPOg4rCEdpL9pZmRRZXFAR9MqomL4kWS0SD
   DeLk0ET54B+tJ1wlTbkl/eSg2BpfdCyU+6Wc3PBgI2pyVpubrB2pfUE3d
   Cip6NGwvgfvfwmEw223ATJ2ZnTiBssEPXLKR0OKaFrtKCMNg6XnMqYXFB
   DTE8lheq/5Lk58J0IVL3/+enLuVg/67QU2FHyMvOwM51uX6pfUYwnQhyx
   hfz2jZ1z72PUVzEi+XI9FkM8mF71XVmogrIvfgLJ4yUT2mk2ytMVELl9d
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="438166847"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; 
   d="scan'208";a="438166847"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 10:16:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="652309832"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; 
   d="scan'208";a="652309832"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 17 May 2023 10:15:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pzKkn-0008W6-2t;
        Wed, 17 May 2023 20:15:57 +0300
Date:   Wed, 17 May 2023 20:15:57 +0300
From:   "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
To:     "Quan, Evan" <Evan.Quan@amd.com>
Cc:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "ajayg@nvidia.com" <ajayg@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Lazar, Lijo" <Lijo.Lazar@amd.com>,
        "Goswami, Sanket" <Sanket.Goswami@amd.com>
Subject: Re: [PATCH 0/2] Adjust logic for power_supply_is_system_supplied()
Message-ID: <ZGULzU0QJFXwieU5@smile.fi.intel.com>
References: <20230516182541.5836-1-mario.limonciello@amd.com>
 <DM6PR12MB2619C223B0450A23A39BB093E47E9@DM6PR12MB2619.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR12MB2619C223B0450A23A39BB093E47E9@DM6PR12MB2619.namprd12.prod.outlook.com>
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

On Wed, May 17, 2023 at 01:22:25AM +0000, Quan, Evan wrote:
> [AMD Official Use Only - General]
> 
> Series is Reviewed-and-tested-by: Evan Quan <evan.quan@amd.com>

This is not how we supply tags (and most of the maintainers prefer non-combined
ones, so two in this case instead of one).

The idea is that tag is supplied as a separate line, not mixed with any other
text.

All this is well written in Submitting Patches documentation, please refresh
your memories :-)

-- 
With Best Regards,
Andy Shevchenko


