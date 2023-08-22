Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 166E8784455
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Aug 2023 16:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235908AbjHVOca (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Aug 2023 10:32:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234980AbjHVOca (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Aug 2023 10:32:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F57CFE;
        Tue, 22 Aug 2023 07:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692714729; x=1724250729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lLVHA+wbulHmFJxtggwukH/8p7P+zlDRisDT4oBjb1I=;
  b=GXMBgUAC2OUnUkOgPmtLb/ovw47yOzkXTu8GCuUrNOF4AtxSB7J5372t
   gK75Wiu6YsYwfa13xv612IfICaGaWlqekFnuTdSRwpd43l5DMx1D3LDcy
   H6QGefMph9smT1wN0E+3vK8HuqprsXE9if8+dokmY7o2QtXGN+/Awo80y
   YrSpCIhHbLCBlyGCHP7Pk0Ixddm2pxMuuDjswjesMaDcuVXRIHKbROun7
   6ewau8t7LEGMf7KoXhDmw98h/9qseXZ0sIzcdBt3lW+Xm7Ua+zt8P8daa
   PxJJO6vFYZ5rLsoWQSAonYJz3mhCRQcVGsNtU17s2Go67giDZa5dkCQxT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="364066635"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="364066635"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 07:31:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765751948"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="765751948"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 22 Aug 2023 07:31:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qYSPt-00EMMm-1S;
        Tue, 22 Aug 2023 17:31:33 +0300
Date:   Tue, 22 Aug 2023 17:31:33 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yann Sionneau <ysionneau@kalrayinc.com>
Cc:     Yann Sionneau <ysionneau@kalray.eu>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] i2c: designware: Currently if the SoC needs pinctrl
 to switch the SCL and SDA from the I2C function to GPI
Message-ID: <ZOTGxW6AfXGgVxeQ@smile.fi.intel.com>
References: <20230822142513.7518-1-ysionneau@kalray.eu>
 <c388a776-4d1f-13a6-e682-a47509fae4e2@kalrayinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c388a776-4d1f-13a6-e682-a47509fae4e2@kalrayinc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 22, 2023 at 04:26:25PM +0200, Yann Sionneau wrote:
> Subject seems to have been truncated... I'll re-send.

It was missing _completely_ up to v4. In v5 it's mangled. I explained in
previous reply how it should be in the commit message in your local Git repo
to begin with.

-- 
With Best Regards,
Andy Shevchenko


