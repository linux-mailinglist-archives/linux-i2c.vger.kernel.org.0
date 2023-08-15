Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4897377CFA3
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Aug 2023 17:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238340AbjHOPxU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Aug 2023 11:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238394AbjHOPxR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Aug 2023 11:53:17 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C58B127;
        Tue, 15 Aug 2023 08:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692114797; x=1723650797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wUZlmqXgBnLgWlPor+fmQVUDvqytbySx2EHTKvYyLZc=;
  b=Bm2RPnduiPW1HfUEfvZGcTpijzjl3LtSiU3sRh5cdUg32n6WVxqcqcv6
   e4GzGe4kvmVhkpLAjPKYIYhNbGA36V8a3pxnzdV4Rq8Vu0LR0HdA4Xfpj
   jDJlItLRsdS9I8PCUKghLWhwSioar2Fbrj+Ua8NZIosJBi/j4jbBmUBOA
   LE2f5wX1pqpPfDGNVVb5u3891+jhRwC0f0tbfRhu61aaYUdHmmZAatRG9
   8qT36to5DqSDn8Bfze4LSyW7qWi9ZvC05mgtIhhrpJjArnd/XX1DbRqAf
   pi7Y7jVD7R6uZpkSEGATWpUqKUtXyKbTtC6/lVop61ncPH0gf4R7Vr7Dy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376042079"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="376042079"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 08:53:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1064510242"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="1064510242"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2023 08:53:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qVwM3-0089T0-38;
        Tue, 15 Aug 2023 18:53:11 +0300
Date:   Tue, 15 Aug 2023 18:53:11 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 4/4] i2c: slave-eeprom: convert to using a pointer in
 i2c_device_id
Message-ID: <ZNufZ+zttHIsdCaY@smile.fi.intel.com>
References: <20230814-i2c-id-rework-v1-0-3e5bc71c49ee@gmail.com>
 <20230814-i2c-id-rework-v1-4-3e5bc71c49ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814-i2c-id-rework-v1-4-3e5bc71c49ee@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 14, 2023 at 02:52:52PM -0700, Dmitry Torokhov wrote:
> Switch the driver to use newly added "data" pointer in i2c_device_id and
> introduce struct eeprom_chip to describe chip's characteristics instead
> of cramming it all into an unisigned long and then decipher.

...

> -	const struct i2c_device_id *id = i2c_client_get_device_id(client);
> +	const struct i2c_device_id *id;

> +	id = i2c_client_get_device_id(client);
> +	if (!id)
> +		return -EINVAL;

Unneeded piece of change.


-- 
With Best Regards,
Andy Shevchenko


