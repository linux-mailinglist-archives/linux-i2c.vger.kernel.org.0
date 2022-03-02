Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 102274CA6B5
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Mar 2022 14:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236258AbiCBN4N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Mar 2022 08:56:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242695AbiCBN4A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Mar 2022 08:56:00 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655522C668
        for <linux-i2c@vger.kernel.org>; Wed,  2 Mar 2022 05:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646229298; x=1677765298;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GdqwP5WXrGBy0okxuHBnbmBEcMkL0MwDtPi4ENAomAs=;
  b=FyMItRdQZ3zMWrjHZTGN91drVUWGlJ6dFVyHb+AL0pzSNGnSz/UAhvMg
   NZDZ8MtzS8E1/Pfc10bN/1BdweDX0FuFBAuWgod/pJlTgxswBtts3UbL4
   JsB/9Mwd0gEsOD2+JWuclovXf55VhvFbqEgV3mETKAiaihL5EZripxXzG
   116JaKXST8N4AVmZoE3QakOhuQe0VOayD5Q1DnT5UGs1tgv+2QVrnioa8
   dfRy59XLcpvG37NAI1N9VLZOsOexmAqcagM5Psr/m8Kb++fJf3ipwLS1v
   67zELZtypCDPmAQLQ64NYLceR/Y4ZN4qxckM8+ooSuZRWz16knpMBGKdr
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="253329125"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; 
   d="scan'208";a="253329125"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2022 05:54:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; 
   d="scan'208";a="493545319"
Received: from mylly.fi.intel.com (HELO [10.237.72.156]) ([10.237.72.156])
  by orsmga003.jf.intel.com with ESMTP; 02 Mar 2022 05:54:56 -0800
Message-ID: <89a778ff-039e-bbe9-645d-f049a4aebb00@linux.intel.com>
Date:   Wed, 2 Mar 2022 15:54:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH 1/2] i2c: i801: Drop useless masking in i801_access
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>
References: <20220301172859.5593309a@endymion.delvare>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20220301172859.5593309a@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/1/22 18:28, Jean Delvare wrote:
> I went all the way back to kernel 2.6.12 and that masking was never
> needed. I suppose it was there in anticipation of software PEC
> support, but that was never added to the driver (and never will be,
> as this is made obsolete by hardware PEC).
> 
> I'm also removing initialization to 0, which is not needed either,
> and would prevent the compiler from reporting an actual usage of
> uninitialized variables.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> ---
>   drivers/i2c/busses/i2c-i801.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
