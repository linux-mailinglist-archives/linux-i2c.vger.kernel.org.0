Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F943616109
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 11:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbiKBKjr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 06:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbiKBKjP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 06:39:15 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB741EEEF
        for <linux-i2c@vger.kernel.org>; Wed,  2 Nov 2022 03:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667385515; x=1698921515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T1pDV4XFUuPAQGKVPw3p7kJlEnGmARJYl4V0o6crXNk=;
  b=OZyVLAI6/xug1Lu9IlK1pbTG5e9uA7nznZHcLk8kOTdFSFJXrw2ISy89
   EXGVVHzZrPIa0+TicmWMM3uORDkOTlse5iyDBP0zUFKIg3lu32exMbgPX
   CKC8ADfuZc+TRofSnNCmf32VS77zkF4rKwiSE5L+qoUxarvI2PG9I4VTK
   /FkLEQPi74QKbVzDGEK8qbc9nkCPpxR9oTySRyZEbgQRA8bDb/1Av+J8A
   I283elpM75XI6XQVxMECmVWyvh8z34fvOo3mRkBNQldkYPGwpgA0k4tvz
   sejdnHDFfA4AQqQvzshdfGTtmHVnx77K+kkPd4SR19X5+n3hKe6z8r6EM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="292683475"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="292683475"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 03:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="667532353"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="667532353"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 02 Nov 2022 03:38:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oqB8h-0068FB-2K;
        Wed, 02 Nov 2022 12:38:31 +0200
Date:   Wed, 2 Nov 2022 12:38:31 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-i2c@vger.kernel.org, Yicong Yang <yangyicong@hisilicon.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation: devres: add missing I2C helper
Message-ID: <Y2JIpwqDinm5N1T2@smile.fi.intel.com>
References: <20221102034053.1708845-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102034053.1708845-1-yangyingliang@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 02, 2022 at 11:40:53AM +0800, Yang Yingliang wrote:
> Add missing devm_i2c_add_adapter() to devres.rst. It's introduced by
> commit 07740c92ae57 ("i2c: core: add managed function for adding i2c
> adapters").

Okay,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Fixes: 07740c92ae57 ("i2c: core: add managed function for adding i2c adapters")
> Cc: Yicong Yang <yangyicong@hisilicon.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>

Next time, please use --cc when sending patches, instead of Cc'ing explicitly
in the body of the message. The rationale is that we have this email in the
archives anyway and every additional byte in the commit message is a waste of
resources (storage, energy and as a result not so environment friendly).

> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  Documentation/driver-api/driver-model/devres.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
> index 853396d19419..ec97261530da 100644
> --- a/Documentation/driver-api/driver-model/devres.rst
> +++ b/Documentation/driver-api/driver-model/devres.rst
> @@ -280,6 +280,7 @@ GPIO
>  
>  I2C
>    devm_i2c_new_dummy_device()
> +  devm_i2c_add_adapter()

Perhaps keep this list ordered?

-- 
With Best Regards,
Andy Shevchenko


