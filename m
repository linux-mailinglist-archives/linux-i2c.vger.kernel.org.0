Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 665FD77CFB1
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Aug 2023 17:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238367AbjHOPz3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Aug 2023 11:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238453AbjHOPz1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Aug 2023 11:55:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC59A6;
        Tue, 15 Aug 2023 08:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692114926; x=1723650926;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xjBcL6FBcGapG9UkcvFfq8o8+YiISNlkILWmTkEJaHc=;
  b=OZ+Ei9I3CO53ZUjV2lDG4uOZZoo+KktOUlhbmRYA8rZsw9V5kd208Any
   cQJSdfSYBHBMCnd9jKDE8ro7HexGL6+aeUDshsocJbgXe9HeQpJrCChRW
   p7kXJjCn+RblcDYiBZQmdm9LBemjwg5dUMYVmFcPilftxXQAw6lNQSC7p
   3GPEdY/zILuersnKqH8lorBjWhRwa5dl7wmarh4TaKRVViEw0a/tu7Q/T
   MKjeDCJoF3vWe6j5GJ2cwATLKqEagSCGFWg6Isvjrgjob58AEaIMOyM35
   yTIAG7LEclrlUTBAkqVv7dDv1fX6u8n8erxHoI/ZYOpkOlQCAf2NFSf5b
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436203440"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="436203440"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 08:55:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763304122"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="763304122"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 15 Aug 2023 08:55:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qVwO9-008EDA-33;
        Tue, 15 Aug 2023 18:55:21 +0300
Date:   Tue, 15 Aug 2023 18:55:21 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/4] i2c: start migrating to a pointer in
 i2c_device_id
Message-ID: <ZNuf6UpcyVGjxZ2F@smile.fi.intel.com>
References: <20230814-i2c-id-rework-v1-0-3e5bc71c49ee@gmail.com>
 <20230814-i2c-id-rework-v1-1-3e5bc71c49ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814-i2c-id-rework-v1-1-3e5bc71c49ee@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 14, 2023 at 02:52:49PM -0700, Dmitry Torokhov wrote:
> The of_device_id structure uses a void pointer to associate additional
> driver-private data with device id, most commonly used to refer to a
> structure containing additional characteristics of a particular chip.
> However i2c_device_id uses an unsigned long. While it can easily be
> converted to a pointer, several drivers use it to store a scalar (and it
> is possible to use a pointer in of_device_id to store a scalar value as
> well). The worst case comes when OF part of a driver uses pointers,
> while legacy part is using scalars, causing constructs like:
> 
> 	data = device_get_match_data(...);
> 	if (!data)
> 		data = &some_array[i2c_match_id(...)->data];
> 	...
> 
> To avoid this introduce a const void "data" pointer to i2c_device_id as
> well, so that we can convert drivers one by one, and drop driver_data
> member in the end.
> 
> The end goal is to clean up all helpers and make device_get_match_data()
> work universally for all ACPI, DT, and legacy variants.

So, we have in the parallel the activity to make buses to have a callback,
why do we need this one? Looks to me as yet another 1000+ churn for not
much value. What the good outcome of this is constification, but maybe
we can find the way on how to prove const to stay over the kernel_ulong_t
transformations for all device ID tables?

-- 
With Best Regards,
Andy Shevchenko


