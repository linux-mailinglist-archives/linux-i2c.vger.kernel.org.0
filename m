Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3C6C4F6473
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 18:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237094AbiDFQIz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Apr 2022 12:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238367AbiDFQIl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Apr 2022 12:08:41 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48DB22B4A4B;
        Tue,  5 Apr 2022 21:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649218623; x=1680754623;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mqH7z+67UJ3aSBQZLGAzbRcUX3Z7J38wJRCxzX1Fenw=;
  b=J6vThwtFB7uovOqnw7Zf5NqGQJVcUDQQfAZ8pCyJKM4ZodYS9gUQJ3Ds
   6r6pJVDdYmgYOXBHYdu2eyq5uITiTG5lE+dWHTPKf/TWuwzEd2yFIFn/m
   ONm9vdT1sgTggDXmuyR2KNgI/Ju4QXxkSrfhSRM096/zF1QsAsij6em6w
   LEkNPVuVVIabnNNtVnFT/77il7Fn2GZL7JdMpG+SfRXjqpjetgL9BI0yM
   Ul9c3R/SyZ9OC/wWjbc2i7XTmhpxS9CxlprD6kI7LFk9zR0c9pvzySVQ1
   N6nFyY//rjvXkMbNq4R5ohO5pWPo5VYUuY+TLJG8p8UhWVEBqpj9FdvbF
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="240879261"
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="240879261"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 21:17:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="790198741"
Received: from unknown (HELO localhost.localdomain) ([10.23.185.145])
  by fmsmga006.fm.intel.com with ESMTP; 05 Apr 2022 21:17:01 -0700
Message-ID: <fadc2b7d4ab98755413218872e04c0ef7afe64db.camel@intel.com>
Subject: Re: [PATCH 05/11] i2c: ismt: Fix undefined behavior due to shift
 overflowing the constant
From:   Seth Heasley <seth.heasley@intel.com>
To:     Borislav Petkov <bp@alien8.de>, LKML <linux-kernel@vger.kernel.org>
Cc:     Neil Horman <nhorman@tuxdriver.com>, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org, seth.heasley@intel.com
Date:   Tue, 05 Apr 2022 14:18:21 -0700
In-Reply-To: <20220405151517.29753-6-bp@alien8.de>
References: <20220405151517.29753-1-bp@alien8.de>
         <20220405151517.29753-6-bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-8.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 2022-04-05 at 17:15 +0200, Borislav Petkov wrote:
> From: Borislav Petkov <bp@suse.de>
> 
> Fix:
> 
>   drivers/i2c/busses/i2c-ismt.c: In function ‘ismt_hw_init’:
>   drivers/i2c/busses/i2c-ismt.c:770:2: error: case label does not
> reduce to an integer constant
>     case ISMT_SPGT_SPD_400K:
>     ^~~~
>   drivers/i2c/busses/i2c-ismt.c:773:2: error: case label does not
> reduce to an integer constant
>     case ISMT_SPGT_SPD_1M:
>     ^~~~
> 
> See https://lore.kernel.org/r/YkwQ6%2BtIH8GQpuct@zn.tnic for the gory
> details as to why it triggers with older gccs only.
> 
> Signed-off-by: Borislav Petkov <bp@suse.de>
Reviewed-by: Seth Heasley <seth.heasley@intel.com>

> Cc: Seth Heasley <seth.heasley@intel.com>
> Cc: Neil Horman <nhorman@tuxdriver.com>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: linux-i2c@vger.kernel.org
> ---
>  drivers/i2c/busses/i2c-ismt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-
> ismt.c
> index f4820fd3dc13..c0364314877e 100644
> --- a/drivers/i2c/busses/i2c-ismt.c
> +++ b/drivers/i2c/busses/i2c-ismt.c
> @@ -145,8 +145,8 @@
>  #define ISMT_SPGT_SPD_MASK	0xc0000000	/* SMBus Speed mask
> */
>  #define ISMT_SPGT_SPD_80K	0x00		/* 80 kHz */
>  #define ISMT_SPGT_SPD_100K	(0x1 << 30)	/* 100 kHz */
> -#define ISMT_SPGT_SPD_400K	(0x2 << 30)	/* 400 kHz */
> -#define ISMT_SPGT_SPD_1M	(0x3 << 30)	/* 1 MHz */
> +#define ISMT_SPGT_SPD_400K	(0x2U << 30)	/* 400 kHz */
> +#define ISMT_SPGT_SPD_1M	(0x3U << 30)	/* 1 MHz */
>  
>  
>  /* MSI Control Register (MSICTL) bit definitions */

