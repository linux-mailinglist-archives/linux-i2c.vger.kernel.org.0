Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE30C7650D1
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jul 2023 12:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232046AbjG0KUC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jul 2023 06:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233512AbjG0KUB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jul 2023 06:20:01 -0400
Received: from mgamail.intel.com (unknown [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10A3C1731;
        Thu, 27 Jul 2023 03:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690453195; x=1721989195;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nbRe253v8bkp1X8CqDo2HpbTj+RvwlNAeCNUJqBJ2lA=;
  b=OKkwypBspM4d3RnZoGvYy5R353MAeNYy4raL6V8mB6TEQTaHP3p4bE19
   O/+50Fq81tSRvPV/SuZWUxIyjUypGU5TWtVq5+pofGvAqZ+rkfwKRDH2u
   Qz3PtJxewcIe7zytYlnb0BDYI6xIWfmuXTpX8pwkGI10nxhKKolIzKGBj
   vXeZw1ueXS+6ohNeVlSDQlp91uRp05GBE52/dNR1v7g1VmpkP4lU+NaiC
   E8W2PRlrQwcC/bUmdxkM58yTRoj/YbXpymucYbjt91+4vSGemOYWc1deE
   5EnMULK4AzX3Q3J1QGk6Pzz8rDHmAr46AmTFxk+KTUuHRECHsWbv6jwP6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="365729780"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="365729780"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 03:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="900841540"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="900841540"
Received: from mylly.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
  by orsmga005.jf.intel.com with ESMTP; 27 Jul 2023 03:19:52 -0700
Message-ID: <0363f0b1-2810-b68e-1ade-d20bb347b97e@linux.intel.com>
Date:   Thu, 27 Jul 2023 13:19:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2 05/22] i2c: designware: Remove #ifdef guards for PM
 related functions
Content-Language: en-US
To:     Paul Cercueil <paul@crapouillou.net>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
References: <20230722115046.27323-1-paul@crapouillou.net>
 <20230722115046.27323-6-paul@crapouillou.net>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230722115046.27323-6-paul@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/22/23 14:50, Paul Cercueil wrote:
> Use the new PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> ---
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Jan Dabros <jsd@semihalf.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 22 ++++++---------------
>   1 file changed, 6 insertions(+), 16 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
