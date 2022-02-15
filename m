Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDA524B6815
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 10:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234278AbiBOJq3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 04:46:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235188AbiBOJq2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 04:46:28 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18FB8E61E7;
        Tue, 15 Feb 2022 01:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644918378; x=1676454378;
  h=date:from:to:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=vOCrxyx+Em1mv/W/Z9juhfYYpBa1abJNHiholsvFULA=;
  b=Aa/QQyBkuVDcqpbQlGmbxKJ6+p8j0+mfNBHiI5v5r4GyvhaIVIyutLDX
   PW/pDMg29zLH0tPNpAYsOYWfYTSAsKuS1Ef63xzuBTkwze2SUBfmfHyUc
   8ZOqlhlGOeDSirJ/BIyPpRH4Q907zdGg5BKfzKJRnUV1v6ZxocytR1qTq
   Kwal4qCVLwduK45pFWAISrcpzMokokcOl8kH85oY/4RD5u9NADfcehk8N
   LSGy2GkWibgrlHQOg0cxOFMcXaEr4ocJ40Ri7rTQEZOME3SP+szQmkn+o
   Tufo/xMp1x3UMegIyiOQWeYlXFfMtt5PUjX6JoyNNBl32YRseaXf9UUG8
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="313585699"
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; 
   d="scan'208";a="313585699"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 01:46:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; 
   d="scan'208";a="486076665"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 01:46:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nJuOd-004ryf-S7;
        Tue, 15 Feb 2022 11:45:19 +0200
Date:   Tue, 15 Feb 2022 11:45:19 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, Thierry Reding <treding@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>,
        Amit Cohen <amcohen@nvidia.com>,
        Nikolay Aleksandrov <nikolay@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3 1/5] i2c: Introduce common module to instantiate CCGx
 UCSI
Message-ID: <Ygt2L/WkJ9rCe3XF@smile.fi.intel.com>
References: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
 <Ye7AhqMsOkfvHOAg@smile.fi.intel.com>
 <YgEa/blO2UMzztCq@smile.fi.intel.com>
 <YgEpYE2VNc05XhpG@shikoro>
 <YgEvEQ7BRc4KhOcF@smile.fi.intel.com>
 <Ygtt8c+s7LiAuI6C@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ygtt8c+s7LiAuI6C@kunai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 15, 2022 at 10:10:09AM +0100, Wolfram Sang wrote:
> 
> > Okay, I have Cc'ed this message to the people whose addresses I found in the
> > changes in the Git history of the vanilla kernel with most frequent appearance.
> > 
> > The Q is who is on nVidia side is responsible now for I²C controller driver?
> 
> I applied your series now. But the question where Ajay is or who now
> maintains the i2c-nvidia-gpu driver still remains...

True. I dunno why nVidia guys are non-responsive for more than a week...
Maybe we should orphan the driver if no-one response in meaningful time
(let's say till the next merge window)?

-- 
With Best Regards,
Andy Shevchenko


