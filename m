Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D962A537ABA
	for <lists+linux-i2c@lfdr.de>; Mon, 30 May 2022 14:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232599AbiE3Mku (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 May 2022 08:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbiE3Mku (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 May 2022 08:40:50 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB9C7DE09;
        Mon, 30 May 2022 05:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653914449; x=1685450449;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BbByahY1nfmcJEgPBRh3UpjJMSql/8lYm9tvLU4hTs0=;
  b=dMa8KfUSRvWsh0RzfnvldZAmkuOln7v7I2PO97m2gXAZF4+t0IZntUnf
   5mkQ6sgMt4yyiW/L8hJunIFAfqZvmotgmXeyRYfLpSoHOTUfVXZjDNZn4
   tpzS5QihTyaNoFFDIHElgxY0YAgamHJ6qmTymwYf5fVv9hosgJYjC0fG6
   Uyc/L39jnWlKhoZ7ffpl4c0jfIiRuAtc2HpnTZiIzfiS+ftQAGvmkmeyx
   naQ9VpQM87lDYGqML7w83oK+XpAI+5BB38/TrPCygCdpeCYBR37Q38+7y
   csHaw++k28x+ZRSgTUha13mvn7kRm412H+vBW22A2LpeSTvxZXz8k3+h7
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274708112"
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; 
   d="scan'208";a="274708112"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 05:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; 
   d="scan'208";a="644611148"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by fmsmga004.fm.intel.com with ESMTP; 30 May 2022 05:40:47 -0700
Message-ID: <178d6b21-ef29-0790-1470-3324efa76def@linux.intel.com>
Date:   Mon, 30 May 2022 15:40:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH v1 1/1] MAINTAINERS: Update Synopsys DesingWare I2C to
 Supported
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, dave.hansen@linux.intel.com
References: <20220530120247.70582-1-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20220530120247.70582-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/30/22 15:02, Andy Shevchenko wrote:
> The actual status of the code is Supported (from x86 perspective).
> 
> Reported-by: dave.hansen@linux.intel.com
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 56dd473d5d59..f8ff2b523498 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19066,7 +19066,7 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>   R:	Mika Westerberg <mika.westerberg@linux.intel.com>
>   R:	Jan Dabros <jsd@semihalf.com>
>   L:	linux-i2c@vger.kernel.org
> -S:	Maintained
> +S:	Supported
>   F:	drivers/i2c/busses/i2c-designware-*
>   
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

