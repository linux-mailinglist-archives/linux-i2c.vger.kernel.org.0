Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACC84B50F5
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Feb 2022 14:04:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349874AbiBNNDr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Feb 2022 08:03:47 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353815AbiBNNDq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Feb 2022 08:03:46 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0146C4E398;
        Mon, 14 Feb 2022 05:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644843816; x=1676379816;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uYL3xhBbVCpZum9f3FYlZNyjCU4f4j5OTyoAWlPvpNY=;
  b=DfUjxrZWdZDFb1nb1nvpJkkTausQcs/+JV76OIQUL13LF75UtZrDzzuH
   laOX2483R+wvEOKEb7xZv7KrvUNkGceD7lwAnvkpgl+3teNPfe1lTFDU/
   uVlMWGvqdT8zbA8f8MdnITwKCFZ6UXfmoiY7AP21bYOQlfUHiR5AXdq2E
   gViaA0do2JB8v+4cCWlnjI3LTLDXEi06AbuiXa2gaoP6HYUaTxRmfubLB
   gDSnWAYVXkZrpodJ29tfqSxJIzonI4Xf/S9bpeByedXC/evhfpchx0UhR
   dQLq6GN+KBJXlx/cEoYI8Bvh5DyqdUyVgIaT7wn+4PRYowxHsnIzC7h7Z
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="274654534"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="274654534"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 05:03:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="495569219"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by orsmga006.jf.intel.com with ESMTP; 14 Feb 2022 05:03:34 -0800
Message-ID: <307ca790-e9ca-c8f3-e0f7-28ad594db2aa@linux.intel.com>
Date:   Mon, 14 Feb 2022 15:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [PATCH -next v2 RESEND] i2c: designware: remove unneeded
 semicolon
Content-Language: en-US
To:     Yang Li <yang.lee@linux.alibaba.com>, jsd@semihalf.com
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abaci Robot <abaci@linux.alibaba.com>
References: <20220214124701.105814-1-yang.lee@linux.alibaba.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20220214124701.105814-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 2/14/22 14:47, Yang Li wrote:
> Eliminate the following coccicheck warnings:
> ./drivers/i2c/busses/i2c-designware-amdpsp.c:172:2-3: Unneeded semicolon
> ./drivers/i2c/busses/i2c-designware-amdpsp.c:245:2-3: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
> 
> --Changes in v2:
>    According to Jan's suggestion
>    Fix the same problem in check_i2c_req_sts() function.
> 
>   drivers/i2c/busses/i2c-designware-amdpsp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
For future contributions: Technically this would be v3 rather than v2 
RESEND since you fixed the typo in commit log noted by Jan for v2.

Please use RESEND only if you'll send exactly the same version for 
instance if you didn't receive any comments for several weeks or some 
recipient was missing from Cc field.

I believe Jan will give Reviewed-by tag to this version too.

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
