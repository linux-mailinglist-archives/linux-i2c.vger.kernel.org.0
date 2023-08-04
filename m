Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C45A7703A8
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Aug 2023 16:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbjHDOzp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 10:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjHDOzn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 10:55:43 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D2C8AC;
        Fri,  4 Aug 2023 07:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691160941; x=1722696941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=60rJbfhMoLJ+zSWzAQY/TtISkMn+8jKtICd9D6QXhn4=;
  b=NXxJ35y3ayIVD4UaMCOgn9+U6Cg9GnF2qDHyaOpPksfh5KRHj7Uea7q4
   gi/vt9UNMDhZcEZaowVWQK/WwsZeX+X9RyEWJRmOImd2lru9gAE1/8GVQ
   I1eFGvV94ZwppcV5mXceQHz1NxbJhCTkgtMg+8E8xnGCvatIfny3JmaJn
   eZublnsUJnsa/tHSwSTRXy3VDFLPkJfC7lB0Q2VQrMGbdJT4G3ScjVEtr
   XPMteDU3yWIyTJyiYchWVEp3ffUsXzmyGlc9CbdIwjK0XUKCIri7Tn/7Y
   +B8Xfwro81k3TxuMguV2sUnueJFVluvr9WdGrET/4oRVnKE3XjgO54VE/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="350473321"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="350473321"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 07:55:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="873429377"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 04 Aug 2023 07:55:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qRwD0-00D8Vb-1S;
        Fri, 04 Aug 2023 17:55:18 +0300
Date:   Fri, 4 Aug 2023 17:55:18 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Cameron <jic23@kernel.org>, linux-rtc@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 4/4] i2c: Add i2c_device_get_match_data() callback
Message-ID: <ZM0RVjKWtqXK8sFe@smile.fi.intel.com>
References: <20230804070915.117829-1-biju.das.jz@bp.renesas.com>
 <20230804070915.117829-5-biju.das.jz@bp.renesas.com>
 <ZM0RIEshpTV4Sn0q@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZM0RIEshpTV4Sn0q@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 04, 2023 at 05:54:25PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 04, 2023 at 08:09:15AM +0100, Biju Das wrote:
> > Add i2c_device_get_match_data() callback to struct bus_type().

Actually should be "... struct bus_type." here (no parentheses).
Please, fix in v7.

> > While at it, introduced i2c_get_match_data_helper() to avoid code
> > duplication with i2c_get_match_data().
> 
> LGTM,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


