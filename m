Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D930C534235
	for <lists+linux-i2c@lfdr.de>; Wed, 25 May 2022 19:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245690AbiEYRch (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 May 2022 13:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238126AbiEYRcg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 May 2022 13:32:36 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B079AAE27A;
        Wed, 25 May 2022 10:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653499953; x=1685035953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zFfZG5aE64Sz5hHGHeaLLPFGzXoXwE70vbeN27URneg=;
  b=FAJSFFKrU+HyWNzP7MRxvQw3czX1dcvw53hG65+CX2uxmbJuobGoqDIU
   x9RDJfusIHY4NpYQK1+ZcnQe+5ilwjpDE/LxAyqW8VMx41YMU9Gb99eCc
   xCLO6T6OU0LFSt6OXUbmEcTdqkmys6IOwspBJszxMhZLmCRVFifQ6t9h3
   dsjB52U8WDySOqsvGN3C/XwtpESiA8ZE1GJQ3wo0uyovR3l2z171u5SH6
   cN7e7DAGptSeMAPPaFptMJMnaPcXWEnZQZK37NgkUhybpO4tx3LKx1tld
   EIdAxXMuNbrylDP3J4e7kCmddacFvU9L18WYHfHAAUOqZnMjaeDj7qXsd
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="253752142"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="253752142"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 10:08:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="609286483"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 10:08:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ntuUn-000L4I-9o;
        Wed, 25 May 2022 20:08:29 +0300
Date:   Wed, 25 May 2022 20:08:28 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        wsa@kernel.org, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, jie.deng@intel.com, jsd@semihalf.com,
        sven@svenpeter.dev, lukas.bulwahn@gmail.com, olof@lixom.net,
        arnd@arndb.de, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/5] i2c: npcm: Bug fixes timeout, spurious interrupts
Message-ID: <Yo5ijJ9mqXRNB7d8@smile.fi.intel.com>
References: <20220525032341.3182-1-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525032341.3182-1-warp5tw@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 25, 2022 at 11:23:36AM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> This patchset includes the following fixes:
> 
> - Add dt-bindings description for NPCM845.
> - Bug fix for timeout calculation.
> - Better handling of spurious interrupts.
> - Fix for event type in slave mode.
> - Removal of own slave addresses [2:10].
> - Support for next gen BMC (NPCM845).
> 
> The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.

LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Addressed comments from:
>  - Wolfram Sang : https://lkml.org/lkml/2022/5/21/51
> 
> Changes since version 5:
>  - Shorten npcm_i2caddr array since the number of supported i2c slave
>    addresses is reduced.
>  - Create a new patch from the original PATCH v5 08/10 to modify the slave
>    transaction logic.
> 
> Changes since version 4:
>  - Remove quotes around ref handle to nuvoton,sys-mgr in i2c binding
>    document.
>  - Keep the "longer line first" order.
>  - Correct the SoB chain.
>  - Modify the if statement in one line and add new line characters.
>  - Modify the commit message format in the patch Remove own slave
>    addresses 2:10. Correct the if statement in one line and shorten the
>    debug messages.
>  - Create a new patch to capitalize the one-line comment in the driver.
> 
> Changes since version 3:
>  - Correct the const format in if condition in i2c binding document.
>  - Add the oops message statement and register information in register
>    access width patch.
>  - Add the occurring rate of the i2c spurious interrupt issue and more
>    details in driver's behavior to overcome this issue.
>  - Address Andy's comments in the patch to support NPCM845.
>  
> Changes since version 2:
>  - Keep old code as fallback, if getting nuvoton,sys-mgr property fails.
>  - Fix the error reported by running 'make DT_CHECKER_FLAGS=-m 
>    dt_binding_check'.
>  - Make nuvoton,sys-mgr required for nuvoton,npcm845-i2c.
>  - Correct the patch's subject about changing the way of getting GCR
>    regmap and add the description about keeping old code as fallback
>    if getting nuvoton,sys-mgr property fails.
>  - Correct the patch title and description about removing the unused 
>    variable clk_regmap.
>  - Use the data field directly instead of the macros since macros are
>    not constants anymore in this patch.
>  
> Changes since version 1:
>  - Add nuvoton,sys-mgr property in NPCM devicetree.
>  - Describe the commit message in imperative mood.
>  - Modify the description in i2c binding document to cover NPCM series.
>  - Add new property in i2c binding document.
>  - Create a new patch for client address calculation.
>  - Create a new patch for updating gcr property name.
>  - Create a new patch for removing unused clock node.
>  - Explain EOB in the commit description.
>  - Create a new patch for correcting NPCM register access width.
>  - Remove some comment since the corresponding logic no longer exists.
>  - Remove fixes tag while the patch adds an additional feature.
>  - Use devicetree data field to support NPCM845.
> 
> Tali Perry (2):
>   i2c: npcm: Remove own slave addresses 2:10
>   i2c: npcm: Correct slave role behavior
> 
> Tyrone Ting (3):
>   dt-bindings: i2c: npcm: support NPCM845
>   i2c: npcm: Support NPCM845
>   i2c: npcm: Capitalize the one-line comment
> 
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     |  25 ++-
>  drivers/i2c/busses/Kconfig                    |   8 +-
>  drivers/i2c/busses/Makefile                   |   2 +-
>  drivers/i2c/busses/i2c-npcm7xx.c              | 176 ++++++++++--------
>  4 files changed, 124 insertions(+), 87 deletions(-)
> 
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


