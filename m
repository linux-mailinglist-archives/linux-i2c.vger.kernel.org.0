Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7DF532F28
	for <lists+linux-i2c@lfdr.de>; Tue, 24 May 2022 18:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239610AbiEXQn2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 May 2022 12:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbiEXQn0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 May 2022 12:43:26 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4637C434A4;
        Tue, 24 May 2022 09:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653410606; x=1684946606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6UMCM+RBG4JBxylz5LrdwSJ2Dpx/YvGxgj1zkXLPFqU=;
  b=mm8KztO4bQQJJq/lPq2pbpmiL8iulFLxtKAR2UUQKq14t9sECpMDknYW
   Nni94xUpT6nAGFIhtGTtHhnGgoGOUWQSLI4nOkd3v1bgWPZ+jT7Bi0tOa
   t7kYzlVV2I1gXr+8527SiQmYUpWFVryX3uVkrlOLmc4AzKavx24D5Kd+3
   PFm0Hn/zIaV6R/90ZLftKeqpjaPtH90JNxKC4O42YQRWDRi5F8tzCJmOP
   YeceXTxETuL8YuFZQRcvfFxtrekLyFiNOtppxFGof6pmD5DfWx8lXl95h
   fJGdrvBKoi5JZ/FSzLhi7Id/NNZPS1zzJaxw964xZfMiIoAH4iF7jPaBp
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="336634859"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="336634859"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 09:43:25 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="548544106"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 09:43:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ntXcv-000KF8-7Y;
        Tue, 24 May 2022 19:43:21 +0300
Date:   Tue, 24 May 2022 19:43:21 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCHv2 1/2] i2c: designware: introduce a custom scl recovery
 for SoCFPGA platforms
Message-ID: <Yo0LKQchQwitJVHm@smile.fi.intel.com>
References: <20220524135441.420600-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524135441.420600-1-dinguyen@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 24, 2022 at 08:54:40AM -0500, Dinh Nguyen wrote:
> The I2C pins on the SoCFPGA platforms do not go through a GPIO module,
> thus cannot be recovered by the default method of by doing a GPIO access.
> Only a reset of the I2C IP block can a recovery be successful.

Better now, but see my additional comments.

...

> +	switch (dev->flags & MODEL_MASK) {
> +	case MODEL_SOCFPGA:
> +		rinfo->recover_bus = i2c_socfpga_scl_recovery;
> +		break;
> +	default:
> +		rinfo->recover_bus = i2c_generic_scl_recovery;
> +		break;
> +	}

> +	adap->bus_recovery_info = rinfo;

Usually we do not assign the pointer while data structure is incomplete.
That's said, please leave this line as it was.

On top of that, why you can't move the above switch to the place where old
function was assigned?

-- 
With Best Regards,
Andy Shevchenko


