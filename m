Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5942C60E232
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Oct 2022 15:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbiJZNef (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Oct 2022 09:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232848AbiJZNed (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Oct 2022 09:34:33 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194CF65CF
        for <linux-i2c@vger.kernel.org>; Wed, 26 Oct 2022 06:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666791272; x=1698327272;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vo9QkprkR1VZMMjM/UtICWIE+KyAru0sSc0Mk6wSAR4=;
  b=NbKA1RkggLuscFbMRJar9xcU3QLKcpSZSZJmNNY/9rwHJWd3h8MEz7jx
   j1YCuDEOD2GnKOHIslpMMyLSetGyD6q7glv7G5la+yFNffzLDsICsZtai
   b+iG5Wdfc21yfDW4NB65FEk6z4Vjy+/3KDinB1Obd3dfpGkMbyB38EXqF
   rZjBn1NRmkn+NEKwqp7K8hAEulQbH86jhnfAG6LhpXe68TlOIPIrdtQ2E
   noTY5cUNAj7wyRh46/7wGSJCmHoWS8vO9wZQsQTbGq7KNzTr+Dt2JPZkb
   OkCOyi9PWsgSyp9gtlcTMdWiFQFWGMFHz1Grt/URECmBaNIBR6TNZlPW8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="287660765"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="287660765"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 06:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="737237576"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="737237576"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 26 Oct 2022 06:34:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ongY7-002fXq-2u;
        Wed, 26 Oct 2022 16:34:27 +0300
Date:   Wed, 26 Oct 2022 16:34:27 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Luis Oliveira <luis.oliveira@synopsys.com>
Subject: Re: [PATCH 10/11] i2c: designware: Remove common i2c_dw_disable_int()
Message-ID: <Y1k3Y0D8qr8q5o7s@smile.fi.intel.com>
References: <20221026123912.2833271-1-jarkko.nikula@linux.intel.com>
 <20221026123912.2833271-11-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026123912.2833271-11-jarkko.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 26, 2022 at 03:39:11PM +0300, Jarkko Nikula wrote:
> i2c_dw_disable_int() and disable_int pointer in struct dw_i2c_dev were
> introduced by the commit 90312351fd1e ("i2c: designware: MASTER mode as
> separated driver") but it looks i2c_dw_disable_int() was never called
> through the pointer.

But the last part is not true... See below.

> Since i2c_dw_disable_int() is just masking interrupts and the direct
> DW_IC_INTR_MASK register write looks more clear in the code use that and
> remove from common code.

...

>  	else if (unlikely(dev->flags & ACCESS_INTR_MASK)) {
>  		/* Workaround to trigger pending interrupt */
>  		regmap_read(dev->map, DW_IC_INTR_MASK, &stat);
> -		i2c_dw_disable_int(dev);
> +		regmap_write(dev->map, DW_IC_INTR_MASK, 0);
>  		regmap_write(dev->map, DW_IC_INTR_MASK, stat);

Not sure I understood this dance. What exactly happen for the interrupts
that are getting masked and immediately unmasked? Is that the core of
the above mentioned workaround?

>  	}

...

> -	dev->disable_int(dev);
> +	regmap_write(dev->map, DW_IC_INTR_MASK, 0);

Called via pointer, didn't it?

-- 
With Best Regards,
Andy Shevchenko


