Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5A446C46C7
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Mar 2023 10:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbjCVJp5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Mar 2023 05:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjCVJp4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Mar 2023 05:45:56 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E51302B5;
        Wed, 22 Mar 2023 02:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679478356; x=1711014356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kyard2vaQRrYqKa/ASB/OedgrPwiFfj0R8RF86tv7Vg=;
  b=n/eE3Zz1ze8+aMyQElfB6UWEVyoRYmSIaUVYETqKbY9CslxZU3/fvr0L
   Nrn2HdpXdjNXqk3xo5/Nu5uuwyV4EKwjzyTRnithmWe0sjDB1pE5Ol09M
   cFzoj8+1pyumGwgYifNXSpVp1KtgB4Ppgru7CGiA/W1ESjzqPuNkOYKKL
   OzVU2MZVeCjs/xuKijjARzTQsQz/j8ukeCv9dwzQ2S4btrCJCfvQctkyr
   64F4mGSZdomFIXOo39tiAnKfzk6TP2PsbaUvL92TFWKTOc5fKMAyawCZR
   cPHXfUmwL+EX3IrwL+Q+H3ccpZJh2pJryJEKf5JEwf5cOINSeZBjhWQ5u
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="404055910"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="404055910"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 02:45:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="746235048"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="746235048"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 22 Mar 2023 02:45:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pev2U-0075JG-2P;
        Wed, 22 Mar 2023 11:45:50 +0200
Date:   Wed, 22 Mar 2023 11:45:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     kernel test robot <lkp@intel.com>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, oe-kbuild-all@lists.linux.dev,
        Held Felix <Felix.Held@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] i2c: designware: Use PCI PSP driver for
 communication
Message-ID: <ZBrOTu1DqKr608UD@smile.fi.intel.com>
References: <20230321212822.5714-3-mario.limonciello@amd.com>
 <202303221157.58L3rUhr-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303221157.58L3rUhr-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 22, 2023 at 11:26:01AM +0800, kernel test robot wrote:

...

> All errors (new ones prefixed by >>):
> 
> >> drivers/i2c/busses/i2c-designware-amdpsp.c:8:10: fatal error: asm/msr.h: No such file or directory
>        8 | #include <asm/msr.h>
>          |          ^~~~~~~~~~~
>    compilation terminated.

Should be under "#ifdef CONFIG_X86" (IIRC).

-- 
With Best Regards,
Andy Shevchenko


