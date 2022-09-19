Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAE035BCDCF
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Sep 2022 16:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbiISOAA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Sep 2022 10:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231162AbiISN75 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Sep 2022 09:59:57 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B36E86408;
        Mon, 19 Sep 2022 06:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663595995; x=1695131995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2SgwOQ6c0lZzyjffabkbJLhqyM0oDKwkJsc3X8zO6rQ=;
  b=iOf8I7B1MFV/sVptqzxEN33O+wTj9aYMTAviYpN+34bGc6Q1ZbkDkt+w
   s0lHUcaJcdzW1ierqOC8LVjbXgDkSubj1F9wKZPiLQr3nnceVuBNX/FHq
   S1qTvhFjTYCs/BDp7DXGyMOdX5hz8j5wLd7VUIg8YEtgfH/KaxtJrcP4e
   AOsjJb1BfjgwT54zqsAQumK0ld3WFMZdUIGcio2MPtRDfnIGw04G4rjfG
   eu4EF+umLywGCuMxkWoTwcSuXb14L1JIwLTDATJhC7V7JIGAqRemPGGNh
   fgG9Bu731/JipV2XAHgVHn7IK6HogtD1KKXXqfDsFyFdhdFpcWPxZO3lz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="298131837"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; 
   d="scan'208";a="298131837"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 06:59:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; 
   d="scan'208";a="793865203"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 19 Sep 2022 06:59:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oaHJP-004a76-1P;
        Mon, 19 Sep 2022 16:59:51 +0300
Date:   Mon, 19 Sep 2022 16:59:51 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan Dabros <jsd@semihalf.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, wsa@kernel.org,
        rrangel@chromium.org, upstream@semihalf.com,
        mario.limonciello@amd.com
Subject: Re: [PATCH -next 2/2] i2c: designware: Add support for new SoCs in
 AMDPSP driver
Message-ID: <YySdjEXHqvTL8mEl@smile.fi.intel.com>
References: <20220916131854.687371-1-jsd@semihalf.com>
 <20220916131854.687371-3-jsd@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916131854.687371-3-jsd@semihalf.com>
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>) id 1oZDlE-003Ig1-2X;
 Fri, 16 Sep 2022 19:00:12 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 16, 2022 at 03:18:54PM +0200, Jan Dabros wrote:
> New AMD SoCs are using different algorithm for x86-PSP communication,
> thus need to modify I2C arbitration driver. Since possible future
> revisions should have follow new approach, mark functions used only for
> Cezanne with "czn_" prefix.
> 
> While at it, remove redundant check by modifying psp_wait_cmd() to only
> check for MBOX_READY bit, since MBOX_CMD field being zero is verified by
> czn_psp_check_mbox_sts() later on in the sequence.

...

> -#define PSP_MBOX_CMD_OFFSET		0x3810570
> -#define PSP_MBOX_BUFFER_L_OFFSET	0x3810574
> -#define PSP_MBOX_BUFFER_H_OFFSET	0x3810578
> +#define CZN_PSP_MBOX_CMD_OFFSET		0x3810570
> +#define CZN_PSP_MBOX_BUFFER_L_OFFSET	0x3810574
> +#define CZN_PSP_MBOX_BUFFER_H_OFFSET	0x3810578

Can we avoid this renaming noise by putting the proper names in the first place
(in the first patch)? Respectively move the corresponding commit message piece
to there.

Or looking into the below maybe even split the renaming to a separate
non-functional change?

...

> +	if (req)
> +		ret = czn_psp_send_cmd(req);
> +	else
> +		ret = psp_send_cmd(i2c_req_type);

> +

Unnecessary blank line.

> +	if (ret)
>  		return -EIO;

Why you can't return the actual error code here?

...

>  	start = jiffies;
>  	ret = read_poll_timeout(psp_send_check_i2c_req, status,
>  				(status != -EBUSY),
>  				PSP_I2C_REQ_RETRY_DELAY_US,
>  				PSP_I2C_REQ_RETRY_CNT * PSP_I2C_REQ_RETRY_DELAY_US,
> -				0, req);
> +				0, req, i2c_req_type);

> +

Stray blank line addition.

>  	if (ret) {
>  		dev_err(psp_i2c_dev, "Timed out waiting for PSP to %s I2C bus\n",
>  			(i2c_req_type == PSP_I2C_REQ_ACQUIRE) ?

-- 
With Best Regards,
Andy Shevchenko


