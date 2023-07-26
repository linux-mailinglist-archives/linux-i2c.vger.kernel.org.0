Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70A4B763984
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 16:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232849AbjGZOsI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 10:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233569AbjGZOsF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 10:48:05 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB4CFC1;
        Wed, 26 Jul 2023 07:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690382884; x=1721918884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fisp1pqwrXvmilLJn8Jc8iKZWR5fMT5EJL+/r3rqXOk=;
  b=ZhKf4d6N73gg/s1+hexxAWhgGfFi4mXDnYM588AGf36OPuooNC03bh7E
   LPqjYkA6fdohRPTMznlRH7bfolFNxo/UUMgp30SJarI6GxZXjzR+pVca8
   wi2gZYGoxaMZWG5yyx2qQIUJIrVwlu+J62s7udAplwe5q1wuFtQd+3PrH
   yX+tqaJWxQfGGk67+oyWSR15v0cVs8ivytg67R53wmC5lwMcAdLcXFFJg
   ACLL5s/7kYfcDceslY1xBsZHwYRTvnWbeL50iaZDFARujC9qLakJl+mbT
   f35T99zRiL9sCyOyrkPk3/pq/iHAxDyQrn0C3wAb3uOycq3Kr9Zv+SosZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="365492642"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="365492642"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 07:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="869899604"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2023 07:48:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qOfo0-00BXM2-1s;
        Wed, 26 Jul 2023 17:48:00 +0300
Date:   Wed, 26 Jul 2023 17:48:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 3/9] i2c: designware: Align dw_i2c_of_configure() with
 i2c_dw_acpi_configure()
Message-ID: <ZMEyIErSl+dSyE4d@smile.fi.intel.com>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-4-andriy.shevchenko@linux.intel.com>
 <20230725214836.dbussnrimoykudyw@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725214836.dbussnrimoykudyw@intel.intel>
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

On Tue, Jul 25, 2023 at 11:48:36PM +0200, Andi Shyti wrote:
> On Tue, Jul 25, 2023 at 05:30:17PM +0300, Andy Shevchenko wrote:

...

> > +static void i2c_dw_of_configure(struct dw_i2c_dev *dev)
> > +{
> > +	if (dev_of_node(dev->dev))
> > +		i2c_dw_of_do_configure(dev, dev->dev);
> 
> You could add this check above and avoid this micro-if-functions.
> 
> 	if (!dev_of_node(dev->dev))
> 		return;
> 
> up to you...

Have you had a chance to look into patch 7? Maybe you can come up with some
advice or ideas on how to make the series better...

> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thank you!

> >  }

-- 
With Best Regards,
Andy Shevchenko


