Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA164952F1
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 18:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377234AbiATRM0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 12:12:26 -0500
Received: from mga12.intel.com ([192.55.52.136]:12268 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346412AbiATRM0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jan 2022 12:12:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642698746; x=1674234746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wLQNADyyNJsuNIww5+s/w6SemtHmpxADc9KQDUzmhA4=;
  b=KyIZkz4FXRx7PYmajgwYvs28b9Q+2BiNpnu9zk14kM7e3xkiHoR3/3JT
   d5A+JATJioX3OUW0GlmmD81sj6cBSA4LDp7K7AVb/FGugVB575jOiRDFT
   2ZUiFvkJC2TnW7C6kIj0C40Bm+naC28QrM7+wiTCTthCPaSSpDm95aLIW
   ooMpZof4+p3ACh+9PaDV1ShvNCFfyrWLJC05f6oDaQMUzLlAdEOgIhqI5
   7ARUqLp6PzgQzJBIkQpKjtlCwO9Z+foLejoEUeEXMURq9HOLS1TzTlwsp
   kXXSZ+ib4XHkGilcxtH0FxUNWmueK8SDFQTt4JPbNrEXCJ2xwWVSDZXk8
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="225382201"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; 
   d="scan'208";a="225382201"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 09:11:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; 
   d="scan'208";a="475600713"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 09:10:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nAawW-00CcXd-No;
        Thu, 20 Jan 2022 19:09:48 +0200
Date:   Thu, 20 Jan 2022 19:09:48 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     kernel test robot <lkp@intel.com>
Cc:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
        kbuild-all@lists.01.org, mika.westerberg@linux.intel.com,
        hdegoede@redhat.com, wsa@kernel.org, rrangel@chromium.org,
        mw@semihalf.com, jaz@semihalf.com
Subject: Re: [PATCH 2/2] i2c: designware: Add AMD PSP I2C bus support
Message-ID: <YemXXCsy4lBsCmDx@smile.fi.intel.com>
References: <20220120001621.705352-3-jsd@semihalf.com>
 <202201202353.tVXCQlqh-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202201202353.tVXCQlqh-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 20, 2022 at 11:33:05PM +0800, kernel test robot wrote:

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/i2c/busses/i2c-designware-amdpsp.c: In function 'psp_send_cmd':
> >> drivers/i2c/busses/i2c-designware-amdpsp.c:130:2: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
>      130 |  writeq((uintptr_t)__psp_pa((void *)req), &mbox->i2c_req_addr);
>          |  ^~~~~~
>          |  writel
>    cc1: some warnings being treated as errors

Adding io-64-nonatomic-lo-hi.h after io.h should fix this.


-- 
With Best Regards,
Andy Shevchenko


