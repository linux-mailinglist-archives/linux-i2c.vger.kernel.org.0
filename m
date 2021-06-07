Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A57AB39DC7F
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 14:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhFGMfZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 08:35:25 -0400
Received: from mga03.intel.com ([134.134.136.65]:5916 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230173AbhFGMfZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Jun 2021 08:35:25 -0400
IronPort-SDR: sK/bxTUKGvQ+vWEYV0d2GC+VD3E9U1Gwi8rIVAEnzQgqwkJ5uMWenhk+6R26/fewX2I3IqLWdJ
 V7t2UW1wIPvg==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="204633492"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="204633492"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 05:33:33 -0700
IronPort-SDR: JEXsAk3Fw2gtxxOdV1utxw6X6djNC5a+3kbcsAyrtgL4Ztzu2bwFvqoz21p/1KFyjK3hJbDcwo
 Pvaviz6MP4lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="551869337"
Received: from mylly.fi.intel.com (HELO [10.237.72.153]) ([10.237.72.153])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2021 05:33:32 -0700
Subject: Re: [PATCH resend v1 1/3] units: Add SI metric prefix definitions
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>, wsa@kernel.org
References: <20210603160433.35816-1-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <0466dab7-f2d2-3b7c-52a6-a12a6b09a67f@linux.intel.com>
Date:   Mon, 7 Jun 2021 15:33:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210603160433.35816-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/3/21 7:04 PM, Andy Shevchenko wrote:
> Sometimes it's useful to have well-defined SI metric prefix to be used
> to self-describe the formulas or equations.
> 
> List most popular ones in the units.h.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   include/linux/units.h | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/include/linux/units.h b/include/linux/units.h
> index dcc30a53fa93..7366fcd45ec2 100644
> --- a/include/linux/units.h
> +++ b/include/linux/units.h
> @@ -4,6 +4,22 @@
>   
>   #include <linux/math.h>
>   
> +/* Metric prefixes in accordance with Système international (d'unités) */
> +#define PETA	1000000000000000LL
> +#define TERA	1000000000000LL
> +#define GIGA	1000000000L
> +#define MEGA	1000000L
> +#define KILO	1000L
> +#define HECTO	100L
> +#define DECA	10L
> +#define DECI	10L
> +#define CENTI	100L
> +#define MILLI	1000L
> +#define MICRO	1000000L
> +#define NANO	1000000000L
> +#define PICO	1000000000000LL
> +#define FEMTO	1000000000000000LL
> +

For me milli is always 1/1000. Might lead to confusion with these 
defines if idea is to multiply with KILO but divide with MILLI?

Jarkko
