Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C463D4D5D3A
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Mar 2022 09:24:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbiCKIZI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Mar 2022 03:25:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbiCKIZH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Mar 2022 03:25:07 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D28541B8FD2;
        Fri, 11 Mar 2022 00:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646987043; x=1678523043;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hXMTWP12cF1XIIoGwokz4YFKIaWPIIR3XQCj1zCJMg0=;
  b=Wt01LPcqEzMLtdMOoT6FGj67rMl5EpRGDUCNEQDbxnAmRYICA/2ORSj7
   wKcn2uF5cIfYrr6NgKjcIQQR/3njFsanoIG4IDUE6mu7zSVVoAZB5uufg
   duUvoDM045JmNi9bplY1qKmSoJ9HY26TcFm8++8vzOxKHLW2GcSVnfvCZ
   0u5Uv7yhVPlOoRtquZh+/tKFbfTNGp4m/hTm36acksF+s5++vdXAHLr9I
   HmJywexqr7Af0E1z6dilZhM2FCIZ6kV7EJjA5D1fgKEhJAm3pbEUoFxVQ
   1xYc7zYJB4Yd1Pug5T8S4o29JEtwYBhtSaSnxsodqnjZv6TxjGCRl82Iv
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="318751061"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="318751061"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 00:24:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="555210745"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by orsmga008.jf.intel.com with ESMTP; 11 Mar 2022 00:24:01 -0800
Message-ID: <99e859a3-5a8e-8dc2-5a04-0a63f69173a6@linux.intel.com>
Date:   Fri, 11 Mar 2022 10:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v2 -next] i2c: designware: Remove code duplication
Content-Language: en-US
To:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, andriy.shevchenko@linux.intel.com
Cc:     wsa@kernel.org, upstream@semihalf.com
References: <20220310220932.140973-1-jsd@semihalf.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20220310220932.140973-1-jsd@semihalf.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/11/22 00:09, Jan Dabros wrote:
> Simplify code by moving common part to one function.
> 
> Signed-off-by: Jan Dabros <jsd@semihalf.com>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v1->v2:
> * Add kudos for Andy who suggested this change
> * Get rid of extra function and move common code to psp_send_i2c_req
> * Update commit message and commit title
>    (was "i2c:designware: Add helper to remove redundancy")
>   drivers/i2c/busses/i2c-designware-amdpsp.c | 35 ++++++++++------------
>   1 file changed, 15 insertions(+), 20 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
