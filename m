Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78D00703FE2
	for <lists+linux-i2c@lfdr.de>; Mon, 15 May 2023 23:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245479AbjEOVgT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 May 2023 17:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245534AbjEOVgS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 May 2023 17:36:18 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9C2E733;
        Mon, 15 May 2023 14:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684186577; x=1715722577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i26ZNXwyqXpWlboCiXBNvjHBTK8BsWO7oNAyIZfZwRI=;
  b=dGrfb+NqZtN2irnOHmKZLcmzw64qrwObwrIBa1HPHny/j0X+2RMCoDvq
   LF8dyyObccvkdJcWewIimF3mb1Q8imONbqShtiLhvuJwKfBDGcD3fx9lm
   TNeaQVrsgQ/rrmOEEsyT4tzXSn4bbGOvMiV7lbPjsVl62altwwctdRKdv
   R0gAcN9fz02h5tPLs7H/jCIffe1vNxL0QGLOoRa4B49b49cw9kEbQMr+x
   GXl40djwPJJsuENN1cqIw5IubsuSxV9wv7Cd7ae+sGoCrfVQ7I0OetWLM
   MFpFEHO8l7uc1etlUzDjHPl1bCT4USk9YxA4XgjhkXj0ygXew3cGQI5SP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="437655143"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="437655143"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 14:36:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="845427132"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="845427132"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 15 May 2023 14:36:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pyfrY-00074j-3C;
        Tue, 16 May 2023 00:36:12 +0300
Date:   Tue, 16 May 2023 00:36:12 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, mengyuanlou@net-swift.com
Subject: Re: [PATCH net-next v8 6/9] net: txgbe: Support GPIO to SFP socket
Message-ID: <ZGKlzFXfqCuq3s8u@smile.fi.intel.com>
References: <20230515063200.301026-1-jiawenwu@trustnetic.com>
 <20230515063200.301026-7-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515063200.301026-7-jiawenwu@trustnetic.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 15, 2023 at 02:31:57PM +0800, Jiawen Wu wrote:
> Register GPIO chip and handle GPIO IRQ for SFP socket.

...

> +	spin_lock_init(&wx->gpio_lock);

Almost forgot to ask, are you planning to use this GPIO part on PREEMPT_RT
kernels? Currently you will get a splat in case IRQ is fired.

-- 
With Best Regards,
Andy Shevchenko


