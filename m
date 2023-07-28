Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED0CD766D4A
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jul 2023 14:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234023AbjG1MeE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jul 2023 08:34:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232155AbjG1MeD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jul 2023 08:34:03 -0400
Received: from mgamail.intel.com (unknown [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F0EE75;
        Fri, 28 Jul 2023 05:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690547643; x=1722083643;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HiTrSpPoPgPBxfAwjmQEuUZ1zljA0J7SVmozB112nAs=;
  b=W5G4lOaxd13qArl4MZnJ8lTb88KGXi5n6rnxouiuSI36HwJVb8KM5xiW
   u+V6rsK9UwPk71p3FVQ0CF+f7kwCWpoM0YNwiYKxz5txSHAStauGQvCkv
   oG9mMOB65Co6C0cemkTYGjhAXBh09DGGoBFYLA+lM3IAz0TT7Cs6lZy2+
   up/2AEleQRq8+t6zuh83aKyhpF24yRKfqthSma4K5j7VC1J33+khtbpkd
   9T8r8VgXaMVA1Gw3YK8w69RR5LaNCvc9zj8KvhFrU4PNH/q87BPQq9ROF
   wQ6cobPF0iwoDc3cPl+oAteMJLbXOzYeVRFaAIljVih2aFa0oFKdgHcx1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="366041414"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="366041414"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 05:34:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="704549021"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="704549021"
Received: from mylly.fi.intel.com (HELO [10.237.72.59]) ([10.237.72.59])
  by orsmga006.jf.intel.com with ESMTP; 28 Jul 2023 05:34:00 -0700
Message-ID: <7be19d99-b197-662c-5157-dfdd9c793e3c@linux.intel.com>
Date:   Fri, 28 Jul 2023 15:33:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v1 5/9] i2c: designware: Always provide ID tables
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-6-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230725143023.86325-6-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/25/23 17:30, Andy Shevchenko wrote:
> There is no need to have ugly ifdeffery and additional macros
> for the ID tables. Always provide them. Since we touch the
> ACPI table, make it sorted by ID.
> 
> While at it, group MODULE_ALIAS() with other MODULE_*() macros.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 65 ++++++++++-----------
>   1 file changed, 31 insertions(+), 34 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

(minor comment below if you plan to update)

> +/* Work with hotplug and coldplug */
> +MODULE_ALIAS("platform:i2c_designware");

Perhaps this comment can be retired, i.e. dropped.
