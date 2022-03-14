Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5215A4D7E16
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Mar 2022 10:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237794AbiCNJFM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Mar 2022 05:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237817AbiCNJFJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Mar 2022 05:05:09 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7764538DBC;
        Mon, 14 Mar 2022 02:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647248639; x=1678784639;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=rXqMSiiScsFnB1lwJAoSQ/GddK2AO3oaWxzf7gIkAbI=;
  b=aokcrmbR2A0ImY3whZJNWsGUwAcp+ORtjP1ef7nLLgppXDNvVYR+J5Cm
   AfF+dBlGbA1vxkF/xDJ0LEboS8+Ypr4E1tV6Z7fvJGBFe5NWoaz3zHX/W
   ObA1Vn7OUUAacylmnYCU1/Jx8v1Pz/7h92DnH/T/T8mvke1SCE6Gjyklp
   ONn7b1mEp90nzt1tOfGJZ/7ka+yOc0dbEslU7PS7S1nPxmOoAwVecm+nm
   mf43VaDAOjLE2VNgjeF/xY0jyqOSbxMGnSepcdbMceSn0e06xScpNVL9j
   G5Dds/jLr7+8jnKdkhbPSf7cTPKE7iR4nJ/S6sYA48aJk69uWtxYHJpwh
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="236578018"
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; 
   d="scan'208";a="236578018"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 02:03:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; 
   d="scan'208";a="539884104"
Received: from mylly.fi.intel.com (HELO [10.237.72.168]) ([10.237.72.168])
  by orsmga007.jf.intel.com with ESMTP; 14 Mar 2022 02:03:52 -0700
Message-ID: <e55f8d50-c5f5-83b3-a61a-97430c634230@linux.intel.com>
Date:   Mon, 14 Mar 2022 11:03:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [PATCH v2 -next] i2c: designware: Remove code duplication
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>, Jan Dabros <jsd@semihalf.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, upstream@semihalf.com
References: <20220310220932.140973-1-jsd@semihalf.com>
 <Yiu2NIvEOow87s+r@ninjato>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Yiu2NIvEOow87s+r@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/11/22 22:51, Wolfram Sang wrote:
> On Thu, Mar 10, 2022 at 11:09:32PM +0100, Jan Dabros wrote:
>> Simplify code by moving common part to one function.
>>
>> Signed-off-by: Jan Dabros <jsd@semihalf.com>
>> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Is it really based on for-next? I can't apply the patch. Am I missing
> something?
> 
Looks like Jan's patch is done without commit 1e4fe5430bd7 ("i2c: 
designware: remove unneeded semicolon") and that causes the git am not 
able to apply it while plain patch is not so strict "Hunk #2 succeeded 
at 260 with fuzz 1.".

Jarkko
