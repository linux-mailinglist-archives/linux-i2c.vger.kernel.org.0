Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEC754ABE6C
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 13:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235199AbiBGMJu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 07:09:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383591AbiBGLXB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 06:23:01 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C669C043181;
        Mon,  7 Feb 2022 03:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644232981; x=1675768981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dUGZzS8EC40nfUarY4jwY+040gT34k7WB1DGm5ou7O8=;
  b=LfFdJ7r8EFfi0dMcII+OaIQEK4lvBwcCnZWCEQ4ZB27igp2nwPPRSpxy
   rkOk5wJ/ULpGvox89zKNUx2obukB/wonHeQlQlLJW+FgT0xbiC9HR+oug
   ZYIU0wWM0u0orYb1tUlmmK6rUQp8A7ocO4D6pVcaKU6y+i5J0aH5L/H8l
   7fwk66Wyk/0OvwpONbEG6psFiDVrfxJ/VOJvI1Woaz13uaKf5MtDKmNUs
   GRYeQCaXTOVUFHsQc0t3HicDvm08dgPAyMBidmwqBfPgqERxpS7dJ9aZZ
   Nfzd+jz8mdN+uuklNw0w1CTsANk+wFBC7UA/kzwYQ7y7qS51Ve9C4u79E
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="273213979"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="273213979"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 03:23:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="632425274"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 03:22:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nH25m-001sYP-Sn;
        Mon, 07 Feb 2022 13:21:58 +0200
Date:   Mon, 7 Feb 2022 13:21:58 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yicong Yang <yangyicong@huawei.com>
Cc:     Yicong Yang <yangyicong@hisilicon.com>,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, prime.zeng@hisilicon.com,
        linuxarm@huawei.com
Subject: Re: [PATCH 0/2] Add I2C bus recovery support on Kunpeng 920/930
Message-ID: <YgEA1lPq7bUnUqKo@smile.fi.intel.com>
References: <20220125124930.50369-1-yangyicong@hisilicon.com>
 <0db7b7ab-a640-b8c3-33cc-29731a65227b@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0db7b7ab-a640-b8c3-33cc-29731a65227b@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 07, 2022 at 03:37:17PM +0800, Yicong Yang wrote:
> a friendly ping ...
> 
> Hi Designware maintainers and Wolfram, any comments for this?

Answered, sorry for the delay.

-- 
With Best Regards,
Andy Shevchenko


