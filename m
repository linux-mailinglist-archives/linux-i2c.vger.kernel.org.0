Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B899479E68E
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 13:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239909AbjIMLWm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 07:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240185AbjIMLW2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 07:22:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C991BD1;
        Wed, 13 Sep 2023 04:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694604143; x=1726140143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zwIejH8Vo2o3Bd4VQ5pQ6XfltJFdDJaaWmeRCMPt8GY=;
  b=Wh56K5J2RlM9MRjK9MBRUC6P24j6PAfxKxZRactaMS4V7NNnFJzgF1w/
   1uTw7HWOfa7+P54C4bGND7+cy3TxsA+aOBDX9uDarfwWgSGK3VY+k/7B7
   bLtifNZ3W2unHV8Br4GTIKzR6KNAlMGNME69USuQjJvjd1pLgJLMIClb1
   1t9lNiWme/UOFJmh62tK8RqzqxEZnxx1j6xac2mKWTAKQYps6ho6iYslX
   N+/dsMJSY4dTYAcoJTCMD2IrtCfUBZxmxfQ4/tmbh3I501a+V8xhhyJft
   ASysr5nPovk44mykjX7LHzceJUtZOwZLxrmVCcn6B8YEIbLhLBjp3hjb2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="375961674"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="375961674"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 04:22:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="1074912432"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="1074912432"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 04:22:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qgNwn-008qhF-2D;
        Wed, 13 Sep 2023 14:22:17 +0300
Date:   Wed, 13 Sep 2023 14:22:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yann Sionneau <ysionneau@kalrayinc.com>
Cc:     Jan Bottorff <janb@os.amperecomputing.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <ZQGbaXTnIk0NIZbK@smile.fi.intel.com>
References: <20230913010313.418159-1-janb@os.amperecomputing.com>
 <4537fa1c-b622-674c-026e-8453eda0a4d1@kalrayinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4537fa1c-b622-674c-026e-8453eda0a4d1@kalrayinc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 13, 2023 at 11:04:00AM +0200, Yann Sionneau wrote:
> On 13/09/2023 03:03, Jan Bottorff wrote:

...

> > +	/*
> > +	 * To guarantee data written by the current core is visible to
> > +	 * all cores, a write barrier is required. This needs to be
> > +	 * before an interrupt causes execution on another core.
> > +	 * For ARM processors, this needs to be a DSB barrier.
> > +	 */
> > +	wmb();
> 
> Apart from the commit message it looks good to me.
> 
> If I understand correctly without this wmb() it is possible that the writes
> to dev->msg_write_idx , dev->msg_read_idx = 0 etc would not yet be visible
> to another CPU running the ISR handler right after enabling those.

If this is the case, shouldn't we rather use READ_ONCE()/WRITE_ONCE() where
appropriate?

-- 
With Best Regards,
Andy Shevchenko


