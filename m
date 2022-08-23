Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 886C659E7C6
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 18:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245149AbiHWQov (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Aug 2022 12:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245163AbiHWQoc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Aug 2022 12:44:32 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D5D4D9D44
        for <linux-i2c@vger.kernel.org>; Tue, 23 Aug 2022 07:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661265289; x=1692801289;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=m8ZbsRkw2MthtAqV0YHT6NEqli9DhHwfPMoTTsz/eAw=;
  b=AKRo0wLE5iWjzdtjli3VlvJDAo6IiKq/vYFYGzzVyGlG+hHwmmInA/IM
   RQL/zwTU7ZZSf/zZ65g4eTU1+pkApWmb/V8QXcivlI8jjnutzt2JWhSCS
   kVxeiJdQ+N/8hbV4AN5mO/YxTSmoSmf6+SK9S/PtPPqRCfJVuoApe5BWJ
   V6114umg/wtfp5meskyJNZm0jBF1yGxsAbP46Cnm5Nga41+RXxrirVjaj
   +XH5Ay8ecWludsbfjI4PYd+rVbZx5ejiN49z2AiNsvOufBj93vwyqOTlf
   vCnbq2uCFkHR34/7am/8AvUDTgshySgL9m8Jooec8XKVOjayqFGjeUJbm
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="273455544"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="273455544"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 07:34:48 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="735504072"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 07:34:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oQUzM-002Tfw-2z;
        Tue, 23 Aug 2022 17:34:44 +0300
Date:   Tue, 23 Aug 2022 17:34:44 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Josef Johansson <josef@oderland.se>
Subject: Re: [PATCH] Revert "i2c: scmi: Replace open coded
 device_get_match_data()"
Message-ID: <YwTlhF0KprPoepy2@smile.fi.intel.com>
References: <20220818203113.1745-1-wsa@kernel.org>
 <YwB9p+q6rllB9KFF@shikoro>
 <YwHr0F2c/+I+l27V@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwHr0F2c/+I+l27V@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Aug 21, 2022 at 10:24:48AM +0200, Wolfram Sang wrote:
> > > Link: https://lore.kernel.org/r/4d2d5b04-0b6c-1cb1-a63f-dc06dfe1b5da@oderland.se
> > > Signed-off-by: Wolfram Sang <wsa@kernel.org>
> > 
> > Applied to for-current, thanks!
> 
> Added Reported-by tag from Josef, well deserved!

Ah, revert is there, thanks. I will respin then with checking the case Josef
reported about.

-- 
With Best Regards,
Andy Shevchenko


