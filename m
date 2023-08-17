Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63CF077FB2E
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 17:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353333AbjHQPvs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 11:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353374AbjHQPve (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 11:51:34 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4365830E1;
        Thu, 17 Aug 2023 08:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692287490; x=1723823490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mSEcYZALTQJIZt/i/ZDOECf+xJ+2HGAure6MfLyotKg=;
  b=a1BJZaeHVEaABBmouCSaoLT06Zt8qB7wRcrUPHG+qvSTRGsfkizO/x1G
   Tb9X8easCaBZgxp7K8YfT6BIpUlYD/gygj0Cd+YRFo0UGjM0VtOavri2P
   L9Ok8BQqYrDaUmDaNIxEgWBZA06teHu/9x5uyEhQ68sZlmaz3LZ/+1SJR
   mAVCGaAvg8jrN6P0SHGszo5RXs++72R6zNKPeHtHEwhyP/p41Wim7cirP
   9GjB3QopbB/fx8e8QC2Es9H0pPLBJOClbTV6Ly4R2VRUA4Nn8SIpLO9Ji
   rDuNlzF7icwFLGIy6yb1s/udr6GR328FaAdWduLooCjuIM6nvm17CryV9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="436767852"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="436767852"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 08:51:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="878280802"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 17 Aug 2023 08:51:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qWfHH-000gnh-1N;
        Thu, 17 Aug 2023 18:51:15 +0300
Date:   Thu, 17 Aug 2023 18:51:15 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yann Sionneau <yann@sionneau.net>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalray.eu>,
        Jonathan Borne <jborne@kalray.eu>
Subject: Re: [PATCH 2/2] i2c: designware: abort the transfer if receiving
 byte count of 0
Message-ID: <ZN5B89MpyjKxDKVP@smile.fi.intel.com>
References: <20230811124624.12792-1-yann@sionneau.net>
 <20230811124624.12792-2-yann@sionneau.net>
 <ZNY/OL4ZKiTL3lF3@smile.fi.intel.com>
 <d493159f-8656-5777-8f77-c45504397c60@sionneau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d493159f-8656-5777-8f77-c45504397c60@sionneau.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 17, 2023 at 04:42:05PM +0200, Yann Sionneau wrote:
> Le 11/08/2023 à 16:01, Andy Shevchenko a écrit :
> > On Fri, Aug 11, 2023 at 02:46:24PM +0200, Yann Sionneau wrote:

...

> > > +				if ((tmp <= I2C_SMBUS_BLOCK_MAX) && (tmp != 0))
> > 				if (tmp && tmp <= I2C_SMBUS_BLOCK_MAX)
> 
> I find the tmp != 0 "more obvious", I am more used to "just tmp" when it's a
> pointer or a boolean, but maybe it's just me!
> 
> I'll fix that in the V2 :)

IIRC it's unsigned, so you may use

				if (tmp > 0 && tmp <= I2C_SMBUS_BLOCK_MAX)

which will be more explicit.

> > > +					len = i2c_dw_recv_len(dev, tmp);
> > > +				else
> > > +					i2c_dw_abort(dev);

-- 
With Best Regards,
Andy Shevchenko


