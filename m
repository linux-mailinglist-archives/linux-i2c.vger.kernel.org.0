Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31D5A79149C
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 11:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233168AbjIDJTQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 05:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231321AbjIDJTP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 05:19:15 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014FBCC;
        Mon,  4 Sep 2023 02:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693819152; x=1725355152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VjpYXsltIszpfffxdMxgN6rMjRC7/msS0BsaWzad89s=;
  b=k9ACoD3pm72PdTj5k0MmNan+sqxpd8SNbdP62R31JA0kLroGsZCzF5kp
   eJrCMZ7VVVkaj4kIXYQBHJOZ0bkG1Nll+7y7TrZr2aHOB99yHurGQP2ND
   R083Pe92NJEB/DwRaw7YsIwgIfU6TKmKE0B0OUcEONLoJkCrcFAagU+z8
   Ciqc6KL6CN8JqQPMM9NALVSl1rHqTBYqkefDJAYDMfJTzdMTNHGwzQjd/
   dEfGIeUAaUGDh1RjoVabfqii2l/0BjJXykbtNkLGdOrdIVE+Iy8p+e9Tr
   /IB38tRX75pZj9z1+LpIH4JJxGv33ju7wqxOBiIhMv8LrmrCabYXRNeUR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="356053492"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="356053492"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 02:19:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="855546750"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="855546750"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 02:19:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qd5jf-006NqW-1o;
        Mon, 04 Sep 2023 12:19:07 +0300
Date:   Mon, 4 Sep 2023 12:19:07 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH] eeprom: at24: Drop at24_get_chip_data()
Message-ID: <ZPWhC/ve8V+aPVGm@smile.fi.intel.com>
References: <20230902174547.71316-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230902174547.71316-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Sep 02, 2023 at 06:45:47PM +0100, Biju Das wrote:
> Replace at24_get_chip_data()->i2c_get_match_data() as it is
> redundant.

Nice, never noticed that we have that old code in the kernel.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


