Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 844F47A0D7E
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Sep 2023 20:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbjINSvg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Sep 2023 14:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242102AbjINSvS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Sep 2023 14:51:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 677C659CB;
        Thu, 14 Sep 2023 11:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694717200; x=1726253200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZFTGHd2goKP49eo3E216ua07cqRAw0uQyfYqJT6GITM=;
  b=Zhp9JyuZM15REk5YYLvGhwpvakDxyAnOWJJQvRaOqqJBKuQ1de1SuBIz
   +VpgrVQNbgOjlBN6Z9BygPm2ypmcprRjLIcgDYtccKuON1l9ipE0hf0n+
   twy2TzxLoqz9MHljJhL5dUUY8aZwur1XlRwMq4bRD2+XdLdTOjzk4b6mi
   LJG8a0zKWkJQTuGOnILFs8R/D2bOltCyrDQKZxoXehvFsLNzPDCbvCrRj
   J6vqeVbDHpS9/BdTlfyr7Kx4sQNGSEkp6Pz4FA2ngRMZNTNir+dZL4Lra
   ZmRduqSm24Xj0c1s+FPhc0ZwoBjyIu2MDn4fLMSdVA40wQ7aVSO9fRgVF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="369342510"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="369342510"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 11:46:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="773985624"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="773985624"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 11:46:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qgrMI-00000008KDm-0Wji;
        Thu, 14 Sep 2023 21:46:34 +0300
Date:   Thu, 14 Sep 2023 21:46:33 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan Bottorff <janb@os.amperecomputing.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalrayinc.com>
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <ZQNVCVHLQvA8s9F9@smile.fi.intel.com>
References: <20230913232938.420423-1-janb@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913232938.420423-1-janb@os.amperecomputing.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 13, 2023 at 04:29:38PM -0700, Jan Bottorff wrote:
> Errors were happening in the ISR that looked like corrupted
> memory. This was because memory writes from the core enabling
> interrupts were not yet visible to the core running the ISR. The
> kernel log would get the message "i2c_designware APMC0D0F:00:
> controller timed out" during in-band IPMI SSIF stress tests.
> 
> Add a write barrier before enabling interrupts to assure data written
> by the current core is visible to all cores before the interrupt fires.
> 
> The ARM Barrier Litmus Tests and Cookbook has an example under
> Sending Interrupts and Barriers that matches the usage in this
> driver. That document says a DSB barrier is required.
> 
> Signed-off-by: Jan Bottorff <janb@os.amperecomputing.com>
> Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
> Tested-by: Yann Sionneau <ysionneau@kalrayinc.com>
> ---

Changelog?

-- 
With Best Regards,
Andy Shevchenko


