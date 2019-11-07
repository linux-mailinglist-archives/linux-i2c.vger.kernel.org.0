Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2E6F2D72
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2019 12:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbfKGL3s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Nov 2019 06:29:48 -0500
Received: from mga14.intel.com ([192.55.52.115]:9140 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727178AbfKGL3s (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 7 Nov 2019 06:29:48 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Nov 2019 03:29:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; 
   d="scan'208";a="196528556"
Received: from mylly.fi.intel.com (HELO [10.237.72.182]) ([10.237.72.182])
  by orsmga008.jf.intel.com with ESMTP; 07 Nov 2019 03:29:46 -0800
Subject: Re: [PATCH v1] i2c: i801: Correct Intel Jasper Lake PCH naming
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>
References: <20191107105529.22825-1-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <5f1cc181-c45e-bea2-f466-f9db9276335f@linux.intel.com>
Date:   Thu, 7 Nov 2019 13:29:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107105529.22825-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/7/19 12:55 PM, Andy Shevchenko wrote:
> There is no suffix applied to Intel Jasper Lake PCH. Remove it from
> the comments and definitions.
> 
> Fixes: e0c61c04791a ("i2c: i801: Add support for Intel Jasper Lake")
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-i801.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index df02040d36d5..2de184bbd21f 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -67,7 +67,7 @@
>    * Comet Lake-H (PCH)		0x06a3	32	hard	yes	yes	yes
>    * Elkhart Lake (PCH)		0x4b23	32	hard	yes	yes	yes
>    * Tiger Lake-LP (PCH)		0xa0a3	32	hard	yes	yes	yes
> - * Jasper Lake-N (PCH)		0x4da3	32	hard	yes	yes	yes
> + * Jasper Lake (PCH)		0x4da3	32	hard	yes	yes	yes
>    *
Let's crosscheck this first. The spec version I have explicitly says 
Jasper Lake -N and I wanted to carry it forward in case there is another 
version in the future.

-- 
Jarkko
