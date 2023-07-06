Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F11D749863
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 11:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbjGFJ1m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jul 2023 05:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjGFJ1l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jul 2023 05:27:41 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF4871725;
        Thu,  6 Jul 2023 02:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688635660; x=1720171660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JArIM2HKqC9QBC+pTllM7eQ+KGMVlg+PycBfFpwwyJU=;
  b=aMMG4iuXMm0le92scYgSRoUNY0zXgPAxXBfTyALvqI83K40SFicjLse8
   BRebSCmtinOBh0SVYFDpjDytpRZgLrnvL1jOg2aPeoZSpXWI+Mrun5zMB
   W2TchB0+1+3XES8EbmraN1pN1c+aYX7kGk/HxjnDh06LGq4MALcgrsZB4
   BW42i7q07JDuz+3B91MncL546aDe+O5HuAxHW2ErEO3RFeJxJmnp6JF6S
   9T2a3Sx9fIAvpDt3HqKIEU1DkjXsWx79AC1lsun8efwjN5MfQo3I4j4xT
   hbZDI5ALiUtPZ5C/lONSrR0ucPzoA5yMn1kbKDSl9+zwWVA/OzC0PrjeD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="363583183"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="363583183"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 02:27:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="719525627"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="719525627"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 06 Jul 2023 02:27:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qHLGj-000Tso-2V;
        Thu, 06 Jul 2023 12:27:21 +0300
Date:   Thu, 6 Jul 2023 12:27:21 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        acpica-devel@lists.linuxfoundation.org,
        Len Brown <lenb@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v4 2/5] ACPI: platform: Ignore SMB0001 only when it has
 resources
Message-ID: <ZKaI+XeYZkdGyFxF@smile.fi.intel.com>
References: <20230703121411.69606-1-andriy.shevchenko@linux.intel.com>
 <20230703121411.69606-3-andriy.shevchenko@linux.intel.com>
 <CAJZ5v0iZzvdkxe3NjHbiZzDjea=CoK-pGw3hjSoa9u8f87TLtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0iZzvdkxe3NjHbiZzDjea=CoK-pGw3hjSoa9u8f87TLtg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jul 04, 2023 at 07:32:43PM +0200, Rafael J. Wysocki wrote:
> On Mon, Jul 3, 2023 at 2:14 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> Applied as 6.5-rc material along with the rest of the series (except
> for the last patch that has been superseded), but I moved the
> has_resources definition to the block where it is used and added a
> 'false' initial value to it. as the code might not work as expected
> without initializing it.
> 
> Please double check the bleeding-edge branch of linux-pm.

Now it's in Linux Next and everything looks fine to me,
thank you!

-- 
With Best Regards,
Andy Shevchenko


