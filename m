Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8B5D4BCE13
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Feb 2022 11:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbiBTK6l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Feb 2022 05:58:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiBTK6k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Feb 2022 05:58:40 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 769BA41313;
        Sun, 20 Feb 2022 02:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645354699; x=1676890699;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=tRjRf7F5Xx8HrYICcY74K2PVjBqE611yRJQYJaE8Sj8=;
  b=Eo7AfXLqctEA9hmXhZOcs42fGBapWMrxb0fKSZxxflaU0Wn+aSSY8vOc
   8w9YN7kpijzoVinKV4caD98KWMMmmpbGqFXw7xbxh3I2v9qRF/dtgmY2p
   xqxQJehIMeGo+387MSPWtau/47iWR2Ouz4hsGZ7AeNaikyHLKm3HrIL+q
   FHWezVBvqwOpnqT3VAH2KTQdE623x3sNzmS9ZOz6ycIL6d+NhbMfMJRvq
   yeQG5Ug2urXq2xRUPvPrSXP4kCwQYatuskXgxM8/gdVPV1ziCtqD00DYZ
   yDFsH+fxjFEJl+NMc+BPatepBfxYBI+OVqCriSo9VbwFlNbYrlKNvRQ3Q
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10263"; a="238773982"
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; 
   d="scan'208";a="238773982"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2022 02:58:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; 
   d="scan'208";a="638240688"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2022 02:58:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nLju9-006UaA-El;
        Sun, 20 Feb 2022 12:57:25 +0200
Date:   Sun, 20 Feb 2022 12:57:25 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+0591ccf54ee05344e4eb@syzkaller.appspotmail.com
Subject: Re: [PATCH v1 1/1] i2c: robotfuzz-osif: Propagate parent device to
 I2C core
Message-ID: <YhIelZFe/HtjVX/8@smile.fi.intel.com>
References: <20220204151726.8924-1-andriy.shevchenko@linux.intel.com>
 <Yg+rm+ZjuhT4zPWB@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yg+rm+ZjuhT4zPWB@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 18, 2022 at 03:22:19PM +0100, Wolfram Sang wrote:
> 
> > +	struct device *dev = &interface->dev;
> 
> This now creates a mixture of 'dev' and '&interface->dev'...
> 
> > +	priv->adapter.dev.parent = dev;
> 
> I propose to use &interface->dev here in this patch and convert to dev
> in a later patch?

Why not?
Will do for next version (next week).

-- 
With Best Regards,
Andy Shevchenko


