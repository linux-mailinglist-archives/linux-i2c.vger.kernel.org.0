Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 208D46C11FF
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Mar 2023 13:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbjCTMhd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Mar 2023 08:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbjCTMhc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Mar 2023 08:37:32 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A4C71969A;
        Mon, 20 Mar 2023 05:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679315851; x=1710851851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=shwS6H2yP9WzS83JZYbQSKXmDnL0qqKc0EicSPK/i74=;
  b=mriRx1s63iuLPJYbe8U9En9EOIlxHLfbXVapTMDjPsqAhv7HAidG/5B3
   GfgSINxFPdv2yWEBwX7SxDmUWLQloyi+rsN5nbJtCaR0YyWaESvWg/dy8
   OgLcNR45nDvQlYLBMJ5G6P98sffCjCyfO3QExabtZf63OvQSh0xkVE7kF
   yGtHNcTNoqQYu+z7vlD+jZHo2qXs/4/3jr+eybYlXr16jGrcoaVWl12s8
   CJdVNQPadv4NuceXNpIcLKTW78x8VBsUwj/rRlsY3idk9HybruRJ9Zk3u
   39Yl0NtI0vwdC55CEVhfXzjG1V4jeOX3fnBShWFDQ7zp4a4VmW4/Mkp12
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="403519053"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="403519053"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 05:37:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="658326017"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="658326017"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 20 Mar 2023 05:37:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1peElT-006Gab-18;
        Mon, 20 Mar 2023 14:37:27 +0200
Date:   Mon, 20 Mar 2023 14:37:26 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tharunkumar.Pasumarthi@microchip.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        wsa@kernel.org, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH i2c-master] i2c: microchip: pci1xxxx: Update Timing
 registers
Message-ID: <ZBhThvAm8yAEbNtS@smile.fi.intel.com>
References: <20230316033223.2046359-1-tharunkumar.pasumarthi@microchip.com>
 <ZBL6JWXKCLsLyNzn@smile.fi.intel.com>
 <PH7PR11MB5958DE8BDC2B824B4961379A9B839@PH7PR11MB5958.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR11MB5958DE8BDC2B824B4961379A9B839@PH7PR11MB5958.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Mar 19, 2023 at 02:42:37PM +0000, Tharunkumar.Pasumarthi@microchip.com wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Thursday, March 16, 2023 4:45 PM
> > To: Tharunkumar Pasumarthi - I67821
> > <Tharunkumar.Pasumarthi@microchip.com>
> > 
> > On Thu, Mar 16, 2023 at 09:02:23AM +0530, Tharun Kumar P wrote:
> > > Update I2C timing registers based on latest hardware design.
> > 
> > What about older designs?
> 
> Older design is updated due to a bug. No future changes are expected in the timing registers going forward.

Do you have customers for the older designs in the wild?

P.S> All this has to be mentioned in the commit message to assure maintainers
that you are not going to break things for the existing users.

-- 
With Best Regards,
Andy Shevchenko


