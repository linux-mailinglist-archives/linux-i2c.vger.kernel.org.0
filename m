Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 510C74CA7B2
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Mar 2022 15:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240834AbiCBONi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Mar 2022 09:13:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231796AbiCBONh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Mar 2022 09:13:37 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777DF49279
        for <linux-i2c@vger.kernel.org>; Wed,  2 Mar 2022 06:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646230374; x=1677766374;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YLFrBV+OiGN/dZuOxfYSgob3SSrrfLwGNhuDTq1hrWE=;
  b=Ga0Fpy2y6qZGIx4GtelZiXw1BJZ5Bl9yUDCXY2izCJ1mQHCT5rdKUcGx
   DYvLApdNi9SvtC5UfwkFjNHg6uGZGEB3HYkyV1Wq2RFsSe6MyeL962TBB
   Q1f2dSbllPhvXPGGFUd0Ijn3FjCnZsXq+Pi64WkAyq3sRN7StdDT9xKKm
   K2OOLKD5/sU+wXptRg92ONiGHvVicscjDIBAXHeba7ZVJVR0w00Udy4pv
   ma7peV35EWcMHvsX951Fmn4Goywh2KSVBXsQo31jDnLYDFUQNZ9wZ3T1q
   uYs5OjYJGyN8RS44uR1C3zByNfvYV8EMVrnsqYmex1DJmVPlFHUlsB61v
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="236917978"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; 
   d="scan'208";a="236917978"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2022 06:12:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; 
   d="scan'208";a="493549587"
Received: from mylly.fi.intel.com (HELO [10.237.72.156]) ([10.237.72.156])
  by orsmga003.jf.intel.com with ESMTP; 02 Mar 2022 06:12:53 -0800
Message-ID: <580a47c1-6a2a-2703-b6ce-1705a0467cf4@linux.intel.com>
Date:   Wed, 2 Mar 2022 16:12:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] i2c: i801: Add support for the Process Call command
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>
References: <20220301172859.5593309a@endymion.delvare>
 <20220301173937.636a21ce@endymion.delvare>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20220301173937.636a21ce@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/1/22 18:39, Jean Delvare wrote:
> The Process Call command is implemented by the hardware since the very
> first Intel 82801 chipset, and trivial to support. Oscar Romero
> Matamala from the Georgia Institute of Technology told me it is needed
> for an experiment his team is working on at the moment, so let's just
> add support for it.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> ---
> Disclaimer: untested code. I don't have any device at hand which
> supports the Process Call command so I just can't test it. If anyone
> has a chance, please test. If not, I hope Oscar will be able to test it
> soon.
> 
>   drivers/i2c/busses/i2c-i801.c |   12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
As far as I can see this follows how it is depicted in the specification.

Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
