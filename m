Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3994E4AC263
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 16:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344827AbiBGPDP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 10:03:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345920AbiBGOkQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 09:40:16 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82002C0401C4;
        Mon,  7 Feb 2022 06:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644244815; x=1675780815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Q6N+UcBKjA+CjKknORZ8CqxajQcoIA8wV93IdhlS3kg=;
  b=UOwoTMmVGsThd4Kl08ni05wNeNpyvoVwyaspTMGNNw52FWdujudTXNas
   7l1e3VAWAZWT1I0UapI+a8gqfJiea/rNw4XByVHssOvbfscdtt7eceLIM
   TVPBAPyXZWmOOnDohfVhgvdomECposjweyk4wzhdEfBAAJ02RQ1NhO4pG
   StZfXRbodd3I3/ZjSadNagpUm8ZE8dq0D7d0zOJGXXgXEd34P76Nzz3UX
   wMHmQVm/CO2wU4/5CfkP1ze8IKyw0kge0NU9m6zvR5DH8gU7VD8/6NGPk
   MyZgjparTNcyzPAfyfZeXhhZQrLssBqjh39tMl9yxhKWdvPzKrW/4owSF
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="248492922"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; 
   d="scan'208";a="248492922"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 06:40:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; 
   d="scan'208";a="700485590"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 06:40:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nH5Af-001w3R-Ff;
        Mon, 07 Feb 2022 16:39:13 +0200
Date:   Mon, 7 Feb 2022 16:39:13 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Amit Cohen <amcohen@nvidia.com>,
        Nikolay Aleksandrov <nikolay@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3 1/5] i2c: Introduce common module to instantiate CCGx
 UCSI
Message-ID: <YgEvEQ7BRc4KhOcF@smile.fi.intel.com>
References: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
 <Ye7AhqMsOkfvHOAg@smile.fi.intel.com>
 <YgEa/blO2UMzztCq@smile.fi.intel.com>
 <YgEpYE2VNc05XhpG@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YgEpYE2VNc05XhpG@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 07, 2022 at 03:14:56PM +0100, Wolfram Sang wrote:
> 
> > > Ajay, is it possible to get your tag on the series, please?
> > 
> > Wolfram, can you remind, please, what the process is, if there is
> > a non-responsive (in a meaningful period of time) maintainer?
> 
> Well, I can apply patches if there is no response but interest and
> reasonable trust, of course. Your series has interest and trust. But
> still, it may be nice to ping active people from Nvidia and ask about
> Ajay.

Okay, I have Cc'ed this message to the people whose addresses I found in the
changes in the Git history of the vanilla kernel with most frequent appearance.

The Q is who is on nVidia side is responsible now for I²C controller driver?

-- 
With Best Regards,
Andy Shevchenko


