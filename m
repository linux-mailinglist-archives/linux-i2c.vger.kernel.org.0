Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA8A55BCDCB
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Sep 2022 15:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbiISN7v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Sep 2022 09:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbiISN7q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Sep 2022 09:59:46 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE5B6445;
        Mon, 19 Sep 2022 06:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663595985; x=1695131985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZDrlPJ8c7h2ypE+fbKsa96aFWpumfpvi6BmS/TWfKLE=;
  b=EJgq3/AJkVR6iyVJtvgt3VRoXDmLMpBWJOGPpndu91zShNF4Fn5YDxpg
   eLzBBPLHYQ+EsuM0bUrhPoztJ5bFrTn88o5TEHxjxIsLcDX6MJQb8UDKb
   ppwsQJs32U3gKNf5BaibHjqd8LhgdzXVpV6WRLnvUyAOF4R90TsZL7VK5
   OTeKtT+QqUHAopB6a9wymp/fZMZ0LrtppWf5e0R0Hzmftp/GbXwQJt5kE
   JjcSVHKGNAfYX35DgTSX+kgONR/Wejb0dFxPAK//cSEsxOraBZWXIyBAK
   n3Oa3O1gmnMoFLS+tXES6o72UdZYaSjvfVb6yw0k/v2MQR//AfaTHBaeQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="296999046"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; 
   d="scan'208";a="296999046"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 06:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; 
   d="scan'208";a="686983272"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 19 Sep 2022 06:59:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oaHJF-004a6U-0V;
        Mon, 19 Sep 2022 16:59:41 +0300
Date:   Mon, 19 Sep 2022 16:59:40 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan Dabros <jsd@semihalf.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, wsa@kernel.org,
        rrangel@chromium.org, upstream@semihalf.com,
        mario.limonciello@amd.com
Subject: Re: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
Message-ID: <YyScSCcXOT9/KD5w@smile.fi.intel.com>
References: <20220916131854.687371-1-jsd@semihalf.com>
 <20220916131854.687371-2-jsd@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916131854.687371-2-jsd@semihalf.com>
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>) id 1oZDg0-003IXN-16;
 Fri, 16 Sep 2022 18:54:48 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 16, 2022 at 03:18:53PM +0200, Jan Dabros wrote:
> Due to a change in silicon compared to Cezanne, in future revisions MSR
> access can't be used to get the base address of the PSP MMIO region that
> contains the PSP mailbox interface.
> 
> Modify driver to use SMN access also for Cezanne platforms (it is
> working there) in order to simplify codebase when adding support for new
> SoC versions.
> 
> Export amd_cache_northbridges() which was unexported by

> e1907d3: "x86/amd_nb: Unexport amd_cache_northbridges()"

Please, use standard format of referring to the commits in the history
(basically the same as for Fixes tags).

> since function which registers i2c-designware-platdrv is a
> subsys_initcall that is executed before fs_initcall (when enumeration of
> NB descriptors occurs). Thus in order to use SMN accesses it's necessary
> to explicitly call amd_cache_northrbidges() from within this driver.

Also it doesn't clarify if this commit a full revert of that (rebased for
new kernel versions) or partial or functional?

-- 
With Best Regards,
Andy Shevchenko


