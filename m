Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00A51616526
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 15:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231644AbiKBOaM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 10:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231690AbiKBO36 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 10:29:58 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9076C2A946
        for <linux-i2c@vger.kernel.org>; Wed,  2 Nov 2022 07:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667399393; x=1698935393;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1iNHim1VY9FTLXjoMqO/6PfKRk9hYwyLI6qFJls9n5Q=;
  b=hub7AhZsqXClr/rzHgyvJGf7ij/1qG0VtVm6YAIx6zYz/8/z4CQIfD2Y
   U/xOjOUhQPzhGmBEH8SMkf7M3P35+lgFeH1Rys7qgP9B/I70WdutDBSF2
   JsJF0UsN1Y8HXtVxaGLF58U/8UrEFohrgXIIwaa6s7zocBW/U2UXzRn6f
   +WLXFTmQ+/XGHLtgivUxAOb3owOSqSeS1kPcWTdTKYLBr9aSgXzWVDI3t
   C5sgaPDoO2yUw2u8C8ws4nPYENwBOwKI3Qv+kN9+KXbqnFp/9/zbPqNMQ
   lOROQrkpZoj0/NeWOsdC5jbSS6wDQ11vyLJCMJpG9YLvSNIL+WrGYkbh8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="395729267"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="395729267"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 07:23:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="665575204"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="665575204"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 02 Nov 2022 07:23:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oqEeQ-006DK9-18;
        Wed, 02 Nov 2022 16:23:30 +0200
Date:   Wed, 2 Nov 2022 16:23:30 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>
Subject: Re: [PATCH v2 09/12] i2c: designware: Simplify master interrupt
 handler nesting
Message-ID: <Y2J9YtWqeE6iIaDK@smile.fi.intel.com>
References: <20221102131125.421512-1-jarkko.nikula@linux.intel.com>
 <20221102131125.421512-10-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102131125.421512-10-jarkko.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 02, 2022 at 03:11:22PM +0200, Jarkko Nikula wrote:
> In my opinnion a few lines of spurious interrupt detection code can be

opinion

> moved to the actual master interrupt handling function i2c_dw_isr()
> without hurting readability.

-- 
With Best Regards,
Andy Shevchenko


