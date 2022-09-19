Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 124A25BCDCC
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Sep 2022 15:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbiISN7w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Sep 2022 09:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbiISN7v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Sep 2022 09:59:51 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2DD4BC29;
        Mon, 19 Sep 2022 06:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663595990; x=1695131990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LObPCrhSUDySWX6QzG2c16oJevpOjDMo1OzHkkYwhMU=;
  b=mbnQiiVXl9OQ9JvDBqGJz9lOgDL1DxNBTRf4MA79K5ZDjNT9CCz0vyzD
   9htEfknRjM7mnb/NHaaWuVGgzI5ba1q5rKeuynUo6uNWuYJeXPMIudUtc
   yIlX3tipJyy9KJOpny7XzTnlO3S4se7s1D+1NqztnQIY3O78crcJKfXyg
   A/V0UN6TbpDNQzhhQ/zxh8jpJvSvPWHIRZjnNyQ8RNqjbS3cNovobwRlw
   +s7lR6zSGxKNZXa2KwFgBU/ZUv4ETPdPRxRJzKBSvgcBXdti9ThzgwGTx
   wdWEnIWhrIt/of7S9GotRoLYO6BIkFqAug9FfgQ3OInofznJZmRuOp5mM
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="279786854"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; 
   d="scan'208";a="279786854"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 06:59:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; 
   d="scan'208";a="569660016"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 19 Sep 2022 06:59:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oaHJ4-004a5q-1V;
        Mon, 19 Sep 2022 16:59:30 +0300
Date:   Mon, 19 Sep 2022 16:59:30 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan Dabros <jsd@semihalf.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, wsa@kernel.org,
        rrangel@chromium.org, upstream@semihalf.com,
        mario.limonciello@amd.com
Subject: Re: [PATCH -next 0/2] Add i2c arbitration support for new SoCs
Message-ID: <YySbfN2b6UDf9/Bp@smile.fi.intel.com>
References: <20220916131854.687371-1-jsd@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916131854.687371-1-jsd@semihalf.com>
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>) id 1oZDci-003IRy-2k;
 Fri, 16 Sep 2022 18:51:24 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 16, 2022 at 03:18:52PM +0200, Jan Dabros wrote:
> This patchset comprises changes into i2c-designware-amdpsp.c module
> which aims to add support for new SoCs, while keep backward
> compatibility with Cezanne platforms.
> 
> Beside new algorithm introduced for the PSP-x86 communication, it also
> switches from MSR/MMIO access to SMN (System Management Network) since
> only the latter is working on both old new revisions of SoCs.

Which one is better performance/energy/etc wise? If it's not the SMN,
can we keep better in place?

-- 
With Best Regards,
Andy Shevchenko


