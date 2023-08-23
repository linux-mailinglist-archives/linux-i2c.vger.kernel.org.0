Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D049278604D
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 21:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238266AbjHWTBy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 15:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238279AbjHWTBc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 15:01:32 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41AECE79;
        Wed, 23 Aug 2023 12:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692817290; x=1724353290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=q8HqfOIX9FUQBqFQujvPJoo8ORZpfr5B1wEGzq2gXlY=;
  b=HisyjFpqQjib+Is/zE/Ogko/gDBh0DJLo5QncpDRlK8nFVnr84nfB2ZF
   Le1GceHLSyXMdejTIa+9f2Ccz/ATq6Q9TsOkDRRZrdXJYFAD+Z9cTvAZu
   O/tNtynzzRWyclDxIIVaxS8Lg+b6M+4ex/l/EtfaDKOObBOHxxIxgxbXl
   pKzKeQu9A3ts9KCvcYkILbhSA/ao9q0bBxHc2zi9cXYuO73mFfhDHJIBy
   Kyp9hmBG0PPhsVDrWhsLJKOi+PN5c1lmDQ/zHsDK7o1/sYETj3DeiSLGW
   /rRjsxgcEAaLVEu6PCLmW9NnGgCui/XHb++9Vg3PrN3RGEUU8xF4dsxQs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="364422883"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="364422883"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 12:01:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="730324844"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="730324844"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 12:01:10 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id BCF7911F915;
        Wed, 23 Aug 2023 22:01:07 +0300 (EEST)
Date:   Wed, 23 Aug 2023 19:01:07 +0000
From:   "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To:     "Wu, Wentong" <wentong.wu@intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "lee@kernel.org" <lee@kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "kfting@nuvoton.com" <kfting@nuvoton.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "maz@kernel.org" <maz@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "linux-drivers-review@eclists.intel.com" 
        <linux-drivers-review@eclists.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: Re: [PATCH v9 4/4] gpio: update Intel LJCA USB GPIO driver
Message-ID: <ZOZXc8Vsa/aJQMIc@kekkonen.localdomain>
References: <1692225111-19216-1-git-send-email-wentong.wu@intel.com>
 <1692225111-19216-5-git-send-email-wentong.wu@intel.com>
 <CACRpkda4Wrih_HPz6KjNf5rQ3A7jSRoPpMpQbm+ZWNv5P3WccA@mail.gmail.com>
 <DM6PR11MB43162BD4B856DF157D5F6F698D1AA@DM6PR11MB4316.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM6PR11MB43162BD4B856DF157D5F6F698D1AA@DM6PR11MB4316.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wentong, Linus,

On Thu, Aug 17, 2023 at 07:07:54AM +0000, Wu, Wentong wrote:
> > From: Linus Walleij <linus.walleij@linaro.org>
> > 
> > On Thu, Aug 17, 2023 at 12:32 AM Wentong Wu <wentong.wu@intel.com>
> > wrote:
> > 
> > > This driver communicate with LJCA GPIO module with specific protocol
> > > through interfaces exported by LJCA USB driver.
> > > Update the driver according to LJCA USB driver's changes.
> > >
> > > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > This patch does several things at the same time, consider the "one technical step
> > per patch" approach, for some definition of a "technical step". The upside is that
> > git bisect gets better precision when something goes sidewise.
> 
> Ack, thanks. I will follow this going forward.

The old LJCA GPIO driver got added without the rest of the LJCA, including
the main driver (now 1st patch of this set). I might have just reverted the
patch that added the old one and put the new one on top.

The old driver was never usable AFAIU and there are many changes as Linus
noted. It would be easier to review as new driver.

I wonder what others think.

-- 
Regards,

Sakari Ailus
