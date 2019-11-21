Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C06C104AF4
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2019 08:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfKUHFD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Nov 2019 02:05:03 -0500
Received: from mga03.intel.com ([134.134.136.65]:47900 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725842AbfKUHFC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 21 Nov 2019 02:05:02 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Nov 2019 23:05:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,224,1571727600"; 
   d="scan'208";a="238058878"
Received: from unknown (HELO [10.237.72.63]) ([10.237.72.63])
  by fmsmga002.fm.intel.com with ESMTP; 20 Nov 2019 23:05:00 -0800
Subject: Re: [PATCH v2] i2c: i801: Correct Intel Jasper Lake SOC naming
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>
References: <20191120151932.40269-1-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <8c50c5b0-ea4f-d922-1947-1cbd4de454fd@linux.intel.com>
Date:   Thu, 21 Nov 2019 09:04:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191120151932.40269-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/20/19 5:19 PM, Andy Shevchenko wrote:
> There is no suffix applied to Intel Jasper Lake SOC. Remove it
> from the comments and definitions. Besides that, it's a SOC,
> thus replace PCH with SOC where it appropriate.
> 
> Fixes: e0c61c04791a ("i2c: i801: Add support for Intel Jasper Lake")
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: PCH -> SOC (Jarkko)
>   Documentation/i2c/busses/i2c-i801.rst | 2 +-
>   drivers/i2c/busses/Kconfig            | 2 +-
>   drivers/i2c/busses/i2c-i801.c         | 8 ++++----
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
