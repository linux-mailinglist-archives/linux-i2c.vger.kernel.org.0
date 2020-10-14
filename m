Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2AC328DEBA
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 12:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728825AbgJNKP4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 06:15:56 -0400
Received: from mga12.intel.com ([192.55.52.136]:10917 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729442AbgJNKPq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Oct 2020 06:15:46 -0400
IronPort-SDR: UhBuLvEwNHhUAUTvoJoGiSv++McIBJSkmqfHN40y5JwVTDt6sgP4oNGQaZJEsckXgByVJhWkBd
 bhKg8EGucFdg==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="145388387"
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="145388387"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 03:15:46 -0700
IronPort-SDR: kgJ9HIADONTfTvAm4vhxgSRsw9L74d8cXhSlnfHbAeGI2HxEpyJrGqsZ2PiQ2GsT+E+339XPrd
 mLOMt0strWww==
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="345607092"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 03:15:43 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kSdpu-006XXz-9N; Wed, 14 Oct 2020 13:16:46 +0300
Date:   Wed, 14 Oct 2020 13:16:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Michael.Wu@vatics.com
Cc:     lkp@intel.com, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, kbuild-all@lists.01.org,
        clang-built-linux@googlegroups.com, morgan.chang@vatics.com,
        dean.hsiao@vatics.com, paul.chen@vatics.com
Subject: Re: [PATCH] i2c: designware: fix slave omitted IC_INTR_STOP_DET
Message-ID: <20201014101646.GV4077@smile.fi.intel.com>
References: <20201014052532.3298-1-michael.wu@vatics.com>
 <202010141551.Y4x2qiN1-lkp@intel.com>
 <20201014085251.GS4077@smile.fi.intel.com>
 <5DB475451BAA174CB158B5E897FC1525B1294238@MBS07.vivotek.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5DB475451BAA174CB158B5E897FC1525B1294238@MBS07.vivotek.tw>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 14, 2020 at 09:58:54AM +0000, Michael.Wu@vatics.com wrote:
> On 10/14/20 4:53 PM, andriy.shevchenko@linux.intel.com wrote:
> > 
> > Wondering if you compile this at all...
> 
> 
> I'm very sorry that I did not compile it because I only have ARM SoC with my
> linux 4.9.170, but I've verified the logic of this patch in my linux.
> 
> I'll correct these two syntax errors in next version. The reported
> warnings occurs from drivers/i2c/busses/i2c-designware-slave.c:13 seems
> not made by this modification. Please correct me if I'm wrong....

So, you have a chance to create a follow up patch to fix the warnings. :-)

-- 
With Best Regards,
Andy Shevchenko


