Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64CFA7071B8
	for <lists+linux-i2c@lfdr.de>; Wed, 17 May 2023 21:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjEQTOV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 May 2023 15:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjEQTOU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 May 2023 15:14:20 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B32B3A8D;
        Wed, 17 May 2023 12:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684350847; x=1715886847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bcV1wWBOCBZQgPTgstGT/dGjpn/djf7q8srqFQkL1qk=;
  b=cLJr2hnuiMf7hrN0DohrPjkMu0Rn5Sxp94KHZt1yHe+rcYRapikG5fVm
   yK9PCmw5LBfVpaiDwR8MbN8/wt/2ZYNrg6bVCS4USmkIsMH3UawO/UYhA
   P7DozsIZ5+zHrxp617wPN5fqgfzyVffXpan6wo9vtiUu8X1aFvcw4irL4
   +yc1GB+XtNF1j4TGfviklBGlBqoGU1ET15sIo1D7VxCrHphvMTwB0QvVv
   WyJjDxngioX8SO1AOlnXiBsk63Kdp4bcDZUz+iByrvtPdWBMnOz8qrHWN
   U+QjCN20R+7rmz+DrUwkE2ifJoO/HT0mISpCku0vsDkPKPXEK8B0sWy3x
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="349358981"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; 
   d="scan'208";a="349358981"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 12:14:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="696004563"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; 
   d="scan'208";a="696004563"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 17 May 2023 12:14:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pzMb3-0008aX-2j;
        Wed, 17 May 2023 22:14:01 +0300
Date:   Wed, 17 May 2023 22:14:01 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg KH <greg@kroah.com>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        heikki.krogerus@linux.intel.com, rafael@kernel.org,
        ajayg@nvidia.com, linux-i2c@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Evan.Quan@amd.com, Lijo.Lazar@amd.com,
        Sanket.Goswami@amd.com
Subject: Re: [PATCH 2/2] usb: typec: ucsi: Don't create power supplies for
 dGPUs
Message-ID: <ZGUneSmV6dJBk7AO@smile.fi.intel.com>
References: <20230516182541.5836-1-mario.limonciello@amd.com>
 <20230516182541.5836-3-mario.limonciello@amd.com>
 <ZGULZU01tdqm1Xoc@smile.fi.intel.com>
 <2023051742-guiding-footing-3527@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023051742-guiding-footing-3527@gregkh>
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

On Wed, May 17, 2023 at 08:58:49PM +0200, Greg KH wrote:
> On Wed, May 17, 2023 at 08:14:13PM +0300, Andy Shevchenko wrote:
> > On Tue, May 16, 2023 at 01:25:41PM -0500, Mario Limonciello wrote:

...

> > > +static const struct property_entry dgpu_properties[] = {
> > > +	/* USB-C doesn't power the system */
> > > +	PROPERTY_ENTRY_U8("scope", POWER_SUPPLY_SCOPE_DEVICE),
> > > +	{},
> > 
> > Comma is not needed in terminator entry.
> 
> But it's encouraged!

Why?! This might lead to the subtle mistakes going unnoticed during rebases.
Yes, it's quite unlikely, but it might be still possible to have the empty
entry in the middle of the array. Why should we shoot ourselves in the foot
if we can avoid it without any effort?

Hence I can say it's discouraged.

-- 
With Best Regards,
Andy Shevchenko


