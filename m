Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2AB530217
	for <lists+linux-i2c@lfdr.de>; Sun, 22 May 2022 11:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235273AbiEVJhz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 May 2022 05:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235099AbiEVJhz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 May 2022 05:37:55 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A786F3B3C3
        for <linux-i2c@vger.kernel.org>; Sun, 22 May 2022 02:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653212273; x=1684748273;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=sjoxw9bAuYltDkKm3Gfnii4KZvi+N7A4Ab6E//IbjYo=;
  b=R3WFUW0LeXNZK2zuLm0V2zLDfGm0g2ZBFmLFDZcZnalraBvOsoSQI7ZU
   tYJIh7JxMBZCAU37GDTpAlWSPxDUv3dBDu/2uLeUSIPgrW/v4Jesyhl8n
   40JTCBzi4N4E8rnVcxKI/Hb48RiqnneHZXrFkOfvApJUR5bVU08ewgvMt
   t2nYPAxZkDaU68DrFxrg6NKH0ANOI2spQmu2EZ2bUNtIMl+asWhW9VxYY
   QPrP1G2CSwQ0HL4dT8Uq/XtOAC3J/JS0xZOi0Y8VBH4bjGlvj/Q9+sHgY
   BAoEbfdkgx+rq/mQb4elrDYDZX2JCIA2h6SMqEcSYwx/MU+7gfb4zl6F9
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10354"; a="298289784"
X-IronPort-AV: E=Sophos;i="5.91,244,1647327600"; 
   d="scan'208";a="298289784"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2022 02:37:53 -0700
X-IronPort-AV: E=Sophos;i="5.91,244,1647327600"; 
   d="scan'208";a="702491677"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2022 02:37:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nsi1z-000IQx-F8;
        Sun, 22 May 2022 12:37:47 +0300
Date:   Sun, 22 May 2022 12:37:47 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ismt: Provide a DMA buffer for Interrupt Cause
 Logging
Message-ID: <YooEa8i3fihInmo1@smile.fi.intel.com>
References: <20220427101910.47438-1-mika.westerberg@linux.intel.com>
 <YojExZeax9nCbhty@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YojExZeax9nCbhty@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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

It's indeed.

> Applied to for-current, thanks!

Thanks, Wolfram!

-- 
With Best Regards,
Andy Shevchenko


