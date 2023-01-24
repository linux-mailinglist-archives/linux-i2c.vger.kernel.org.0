Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB366798A2
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 13:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjAXMzh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 07:55:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbjAXMzf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 07:55:35 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D6440BFC
        for <linux-i2c@vger.kernel.org>; Tue, 24 Jan 2023 04:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674564914; x=1706100914;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+G0vjzFBFFPrlu4XTKULv2Dzj2pvw0FAZrN7nxbalY4=;
  b=Ov7c2p5zUW3doC4WTJkOlrajEm4VjU5XJb4QOyRPbcBgF1exte16QQ0D
   QJsffVaLVLnB9U7xcWU4Lo5m47G5+q0+otcN5nu8fDZtisQ3brxB4edv7
   pUxE3xJ4u1uUEmcMcM5u8l5CKFd2BMJ1N59KScZSK9SKgUZCzyACk9u5r
   48l1Ep+g1JoLmFV9XKT3LdlGRaWQeAuMMAxWte6MGfIsd67Ige9sklGcu
   XQ5Z6c4T5zYHvT4qzWBjNLUUzbVlGG6UihMD7t+OV8djOGkuykTOft1DU
   LMLFj7pmTgceSKp33L6A8cxQHl2NoAbWlNj9jQOTehNZChBjJGJsTG6sd
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="327544763"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="327544763"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 04:54:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="770303557"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="770303557"
Received: from mylly.fi.intel.com (HELO [10.237.72.143]) ([10.237.72.143])
  by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2023 04:54:52 -0800
Message-ID: <e32d5647-530c-80d0-e7e5-a92e5f5a82dd@linux.intel.com>
Date:   Tue, 24 Jan 2023 14:54:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH v1] i2c: designware: Change from u32 to unsigned int for
 regmap_read() calls
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Cc:     linux-i2c@vger.kernel.org
References: <20230124114732.1387997-1-Shyam-sundar.S-k@amd.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230124114732.1387997-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/24/23 13:47, Shyam Sundar S K wrote:
> regmap_read() API signature expects the caller to send "unsigned int"
> type to return back the read value, but there are some occurrences of 'u32'
> across i2c-designware-* files.
> 
> Change them to match the regmap_read() signature.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/i2c/busses/i2c-designware-common.c | 11 ++++++-----
>   drivers/i2c/busses/i2c-designware-core.h   |  2 +-
>   drivers/i2c/busses/i2c-designware-master.c | 13 +++++++------
>   drivers/i2c/busses/i2c-designware-slave.c  |  4 ++--
>   4 files changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index a3240ece55b2..ae808e91b17f 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -388,7 +388,7 @@ u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset)
>   
>   int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
>   {
> -	u32 reg;
> +	unsigned int reg;
>   	int ret;
>   
Hmm.. I'm not sure about these. We know registers are 32-bit and change 
to unsigned int is a step being more ambiguous. I'm wearing my old 
embedded developer hat who likes to see explicit types when dealing with HW.

Andy: what was your rationale to propose changing u32 to unsigned int in 
another i2c-designware patch? Has gcc started complaining if 
regmap_read() is used with u32 type?
