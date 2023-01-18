Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEBDB671FEE
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 15:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbjAROnR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 09:43:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbjAROmz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 09:42:55 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A6A4903F
        for <linux-i2c@vger.kernel.org>; Wed, 18 Jan 2023 06:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674052469; x=1705588469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8e5Z3XBRzZPYO1BcWOQ9FcZsTEG6ijTO2l+Ixw1CCfg=;
  b=EuMybOMkjvnsTK+Yx+BUQZAhrsYYgkt9aNqT/pEvmQnU+hnl3LGfNHRh
   aAssQOYpjIdxVLJX/Gpos2P/nn7jsnvIqBwhDA4Zk7WMYs8K97Y8F7Tgo
   X0XTjdhRq4W6tPa9UWPBYdFgeDqPfUZQD1J5/JvG7AeMVrBLzgjYTtlO9
   74LVZEvnyuC0XeP5iP7S65sZ4v42NCmdqH5DUy9MCF4L85k1NAIflbxWK
   Dokt2IiBFvhzGyNPUsJcQOFxfREcW+9CfQkLo0qhAjuTy6Py8gvKP1c31
   as6nszqfPyPFZMswaA5v8aUnm7IJZa7XrMuRCHFHS8PrdkP3JJiRBQWQd
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="323679549"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="323679549"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 06:34:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="652965201"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="652965201"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 18 Jan 2023 06:34:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pI9WD-00BDyt-1j;
        Wed, 18 Jan 2023 16:34:25 +0200
Date:   Wed, 18 Jan 2023 16:34:25 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: add a new bit check for IC_CON
 control
Message-ID: <Y8gDcaPT+WcsGRRA@smile.fi.intel.com>
References: <20230117122801.1605176-1-Shyam-sundar.S-k@amd.com>
 <Y8a54u1ipywtTIlH@smile.fi.intel.com>
 <dbdc2d2a-8fcd-8667-3088-ca730212c162@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbdc2d2a-8fcd-8667-3088-ca730212c162@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 18, 2023 at 07:27:06PM +0530, Shyam Sundar S K wrote:
> On 1/17/2023 8:38 PM, Andy Shevchenko wrote:
> > On Tue, Jan 17, 2023 at 05:58:01PM +0530, Shyam Sundar S K wrote:

...

> >> +	ic_con = ioread32(dev->base + DW_IC_CON);
> > 
> > Any particular reason why regmap_read() can't be used?
> 
> Yes. init_regmap() happens at a later stage in dw_i2c_plat_probe() and
> i2c_dw_configure() gets called first.
> 
> So dev->map will not be initialized to use regmap_read().
> 
> In order to use regmap_read() instead of ioread32() in this case, we
> have to defer calling i2c_dw_configure()

I think we need to try to be consistent with IO accessors across the driver
which means to try hard to have regmap being initialised beforehand or other
functions being moved accordingly. However, it seems a bit non-trivial
ordering case and I leave this to you, I²C maintainers and this driver
maintainer to decide how to proceed.

-- 
With Best Regards,
Andy Shevchenko


