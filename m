Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4C5D2D4576
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Dec 2020 16:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727750AbgLIPcM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Dec 2020 10:32:12 -0500
Received: from mga07.intel.com ([134.134.136.100]:39793 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726555AbgLIPcM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Dec 2020 10:32:12 -0500
IronPort-SDR: Z1AfTTdsZOBE2jV6QxnPAos0E1prRbti2dC5cnwUSfUmDIvgvCr2RlHs4sbJZ2TNDAq61swt+u
 kqhP867B03nA==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="238197328"
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="scan'208";a="238197328"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 07:30:26 -0800
IronPort-SDR: rA6foZseLYaNZPXxXiow5qh8Hd0lVFx1UlqKp3deUPTfSmoszYcbZpyHph00tsqq/BRZnHtq8w
 qwpAdE2l1ASg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="scan'208";a="370865281"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2020 07:30:25 -0800
Subject: Re: [PATCH v1 3/3] i2c: designware: Fix indentation in the header
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
References: <20201208140337.33236-1-andriy.shevchenko@linux.intel.com>
 <20201208140337.33236-3-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <2fa87019-d503-7b96-a806-9057f3e68864@linux.intel.com>
Date:   Wed, 9 Dec 2020 17:30:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201208140337.33236-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/8/20 4:03 PM, Andy Shevchenko wrote:
> In couple of places the indentation makes harder to read the code.
> Fix it to be sane.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-core.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 85307cfa7109..de00e62e8c7a 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -115,7 +115,7 @@
>   
All 3 patches:

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
