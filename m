Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 539A47727D3
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Aug 2023 16:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232860AbjHGOdb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Aug 2023 10:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbjHGOda (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Aug 2023 10:33:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A03210DC;
        Mon,  7 Aug 2023 07:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691418809; x=1722954809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TRDCLFDgzgMsAH800OlISo9NPJHoNGEwoCEGo3ugJME=;
  b=dHo4qmBC8osqA8qh+/9mRCMBokFuBX8/d7pRc6TO0na+2DLI12F7/Bzy
   u3MhLMZwpt89hko6rJC0sDk2iKqkH/k9uLn9lOrtvIXFQwckGHp/JbblR
   jWpe0mpRMexjLzby7sIlhETHvIochznBJ7qeM/H5BzF1CsBe8YB/PXKyO
   P6P4JleXWGIwZB5RO5hv0gBCysVWRs0U5I6wHZ61GHsSxpkzd9ZmKbOW+
   u+A63hyg5tC3xa4QHTmRxR6sxr3y7cVLF7b4Rzgegca1wrJOV7XfI+Cq7
   S+MesuifdmNQFsHN/4koD5SHUsA/Kbem4uNn1Caq8oE2LyQcanEGmA+D7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350867078"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="350867078"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 07:32:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="977465850"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="977465850"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 07 Aug 2023 07:32:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qT1Hu-00FTgr-1x;
        Mon, 07 Aug 2023 17:32:50 +0300
Date:   Mon, 7 Aug 2023 17:32:50 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 4/9] i2c: designware: Propagate firmware node
Message-ID: <ZNEAklbEI5wbjv7l@smile.fi.intel.com>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-5-andriy.shevchenko@linux.intel.com>
 <f0e0c31e-ad5e-c3ae-945e-c2af0d68beab@linux.intel.com>
 <ZMgU9Jm4u37D+70Y@smile.fi.intel.com>
 <20230804205956.uuna4c76ww64z3zm@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804205956.uuna4c76ww64z3zm@intel.intel>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 04, 2023 at 10:59:56PM +0200, Andi Shyti wrote:
> On Mon, Jul 31, 2023 at 11:09:24PM +0300, Andy Shevchenko wrote:
> > On Fri, Jul 28, 2023 at 03:25:58PM +0300, Jarkko Nikula wrote:
> > > On 7/25/23 17:30, Andy Shevchenko wrote:
> > > > Propagate firmware node by using a specific API call, i.e. device_set_node().

...

> > > > +	device_set_node(&dev->adapter.dev, dev_fwnode(dev->dev));
> > > 
> > > Would this be better to put in the same place where ACPI_COMPANION_SET() is
> > > removed like below? I'd keep this static inline function in the header file
> > > as simple as possible. All extra code might invite adding even more.
> > 
> > We come again to the duplication and prone to deviation code, I wouldn't like
> > to go this way. The idea of this call is to unify and avoid mistakes, like
> > updating only in ACPI or DT (or any new one if happens in the future) case
> > and leaving the second one unconsidered.
> 
> it's anyway an inline function becoming a bit too fat. Can't we
> make it not inline?
> 
> > That said, I would rather drop this patch until i2c core will take this
> > once for all (may be never in the reasonable future :-).
> 
> Which patch are you referring to that should be taken into i2c
> core?

Something I tried to do in the past but failed.
https://lore.kernel.org/linux-i2c/20211207162457.18450-1-andriy.shevchenko@linux.intel.com/

-- 
With Best Regards,
Andy Shevchenko


