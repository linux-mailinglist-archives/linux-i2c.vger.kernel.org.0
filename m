Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF2F47384C6
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Jun 2023 15:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232463AbjFUNUJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Jun 2023 09:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232559AbjFUNUD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Jun 2023 09:20:03 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C56E57;
        Wed, 21 Jun 2023 06:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687353601; x=1718889601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gXKkCfw0L0vm2oisoVKbq0dOluIkKgZ/dLrFgppTtNQ=;
  b=UTj8qhqAmKUHpYfgEaPbDJLWVAVf+jkrsxT1h2tS8FZNh5fXcS6vbZE1
   YXKLhDi428GbGf1uzGoZT640M6PogHMwv589DZQrLa+x8xtvJP5NL8gTy
   yFmzPK9AJjXyvkn7a8Li7NU0nlwBRYW+6hkfUbhXKoLRbq3J57O3jcatb
   bq2B2kdtmccn7uxEPBagWYwquaHokhFv/OVl40XmsZ9jG2v28u8L9XFjD
   BTR2UZDIA6RCv0GRaB4LtlOZ5X9Ka/pUBtXgl8m4PNYTdp102wfnHwkky
   K02nXp/mR5yixPmBLQ9hBLL8MhZA6v1M/xmxOXNL4h01Snnm1H8twVD5x
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="349900487"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="349900487"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 06:20:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="804378806"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="804378806"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Jun 2023 06:19:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qBxkb-005VOb-1r;
        Wed, 21 Jun 2023 16:19:57 +0300
Date:   Wed, 21 Jun 2023 16:19:57 +0300
From:   "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Michael Brunner <michael.brunner@kontron.com>,
        "acpica-devel@lists.linuxfoundation.org" 
        <acpica-devel@lists.linuxfoundation.org>,
        "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "robert.moore@intel.com" <robert.moore@intel.com>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "lenb@kernel.org" <lenb@kernel.org>
Subject: Re: [PATCH v1 1/2] ACPI: platform: Ignore SMB0001 only when it has
 resources
Message-ID: <ZJL4/X1Z9gCdESxp@smile.fi.intel.com>
References: <20230620163534.1042-1-andriy.shevchenko@linux.intel.com>
 <b9af5a068cc0b5e785c8e2ddfc70d811fd5929cd.camel@kontron.com>
 <20230621093056.5qfa3kn7ldgwsyeg@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621093056.5qfa3kn7ldgwsyeg@intel.intel>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 21, 2023 at 11:30:56AM +0200, Andi Shyti wrote:
> On Wed, Jun 21, 2023 at 07:46:42AM +0000, Michael Brunner wrote:
> > On Tue, 2023-06-20 at 19:35 +0300, Andy Shevchenko wrote:
> > > After switchind i2c-scmi driver to be a plaform one it stopped
> > > being enumerated on number of Kontron platformsm, because it's
> > > listed in the forbidden_id_list.
> > > 
> > > To resolve the situation, split the list to generic one and
> > > another that holds devices that has to be skiped if and only if
> > > they have bogus resources attached (_CRS method returns some).
> > > 
> > > Fixes: 03d4287add6e ("i2c: scmi: Convert to be a platform driver")
> > > Closes: https://lore.kernel.org/r/60c1756765b9a3f1eab0dcbd84f59f00fe1caf48.camel@kontron.com
> > > Reported-by: Michael Brunner <michael.brunner@kontron.com>
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > Works as expected - the SMB0001 device shows up as platform device and
> > the i2c-scmi driver is enumerated again on the affected boards.
> > Thanks a lot!
> 
> is this a "Tested-by: Michael Brunner <michael.brunner@kontron.com>" :)

Michael, indeed, it would be nice to have a formal tag.
After that I will send a v2 with tags and fixed typos
as Andi noticed (thank you, Andi!).


-- 
With Best Regards,
Andy Shevchenko


