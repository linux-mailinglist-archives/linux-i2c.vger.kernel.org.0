Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DECC676E7EE
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Aug 2023 14:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232883AbjHCMKm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Aug 2023 08:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234728AbjHCMKm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Aug 2023 08:10:42 -0400
Received: from mgamail.intel.com (unknown [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 609C72D6A;
        Thu,  3 Aug 2023 05:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691064640; x=1722600640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y9diiDuMKjFmLSdvr96GTt11s65KoHBivnS5R2ntLmE=;
  b=BrO521fHvbZ6qXA6mHC1GGqzEzKWmsVaUp3PLge4HaYLJkn7ud9DgzQH
   +4exHrSXVwOdFCe0x1SAqZ6oflITxg1yIUbk+ocKQsP1Kdy9G+IZ0WXLf
   nJNdPqaZ6XJReA0XKL+A7pLMVn9tsHvph8V66h9PPhR/kiUUevL3W9hDk
   fqi9qk6WvxrES8DuJIc7gJMcpmgB6dxYuGMVmjNIeA9kXPRFyH04Vnu6O
   qPBtMQClLmtzVlq9kpg/c1ulM5P5XAckeI6DXIEYb9GBbBwl03eyFWiXy
   ztKOdCbilr9XnbKuNZNy8beu+RWkHE4C3o+MJZ8o3fzgY3xWDih/lPSzN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="436162332"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="436162332"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 05:10:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="723197462"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="723197462"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 03 Aug 2023 05:10:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qRXA4-00BbOt-1S;
        Thu, 03 Aug 2023 15:10:36 +0300
Date:   Thu, 3 Aug 2023 15:10:36 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 RESEND 4/4] i2c: Extend i2c_device_get_match_data() to
 support i2c sysfs
Message-ID: <ZMuZPAaNL27KRQr6@smile.fi.intel.com>
References: <20230803103102.323987-1-biju.das.jz@bp.renesas.com>
 <20230803103102.323987-5-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803103102.323987-5-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 03, 2023 at 11:31:02AM +0100, Biju Das wrote:
> Extend i2c_device_get_match_data() to i2c sysfs interface for
> retrieving match data from the match table.

...

> +	const void *data;

> -	return i2c_get_match_data_helper(client);
> +	data = i2c_get_match_data_helper(client);
> +	if (data)
> +		return data;

> +	return NULL;
>  }

These may be incorporated to the previous patch that introduces the helper.
This patch after that will look much better.

-- 
With Best Regards,
Andy Shevchenko


