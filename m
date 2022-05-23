Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45906530B7B
	for <lists+linux-i2c@lfdr.de>; Mon, 23 May 2022 11:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbiEWIvz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 May 2022 04:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232548AbiEWIva (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 May 2022 04:51:30 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24AD0617E
        for <linux-i2c@vger.kernel.org>; Mon, 23 May 2022 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653295890; x=1684831890;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=2aZL5fwQebrFoRe5BFTNAcoy6cbM/OrhfpjTMTuVbQw=;
  b=hW4uSkDl76nOfqbuvSOki4xzKApKpFRUiV1+zsha8ChmobQNsfQBEs3Q
   ahhVg2lfzYYwckRAj5Ic38ROL3FEUsYGG/dGB/migOKARJ3aDmmJPsJG6
   gUpBB8AYE+DGhKNCUyUlJOpmb4VZMZgkZzK8kwlGBm4ZXVu6sUIiybzwQ
   ebCg7e/abcNcLA48nsjrKc4nHuNkp+1D2R+ePZ7GyLpL6iHrNOHuRvcWD
   1zs484/XTIYPAU/nwApQ3BUCFi850IcSxCKxWHQjJKKfbmYMVuSLCH1F+
   SgZ5YEq9oT83xhUy4Hl7MuCPN4TCsTc6yJdyK4aC7ilsU5SvgHK/9PWft
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="359547587"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; 
   d="scan'208";a="359547587"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2022 01:51:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; 
   d="scan'208";a="571975224"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2022 01:51:26 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 23 May 2022 11:51:24 +0300
Date:   Mon, 23 May 2022 11:51:24 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ismt: Provide a DMA buffer for Interrupt Cause
 Logging
Message-ID: <YotLDBFmlI0GGYvE@lahna>
References: <20220427101910.47438-1-mika.westerberg@linux.intel.com>
 <YojExZeax9nCbhty@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YojExZeax9nCbhty@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, May 21, 2022 at 12:53:57PM +0200, Wolfram Sang wrote:
> On Wed, Apr 27, 2022 at 01:19:10PM +0300, Mika Westerberg wrote:
> > Before sending a MSI the hardware writes information pertinent to the
> > interrupt cause to a memory location pointed by SMTICL register. This
> > memory holds three double words where the least significant bit tells
> > whether the interrupt cause of master/target/error is valid. The driver
> > does not use this but we need to set it up because otherwise it will
> > perform DMA write to the default address (0) and this will cause an
> > IOMMU fault such as below:
> > 
> >   DMAR: DRHD: handling fault status reg 2
> >   DMAR: [DMA Write] Request device [00:12.0] PASID ffffffff fault addr 0
> >         [fault reason 05] PTE Write access is not set
> > 
> > To prevent this from happening, provide a proper DMA buffer for this
> > that then gets mapped by the IOMMU accordingly.
> > 
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> No maintainer response so far, but given this looks like an important
> bugfix and you guys are all from Intel as well, I'll apply it this time.
> 
> Applied to for-current, thanks!

Thanks!
