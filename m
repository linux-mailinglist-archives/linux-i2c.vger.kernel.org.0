Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA1246D347
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Dec 2021 13:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233315AbhLHMcj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Dec 2021 07:32:39 -0500
Received: from mga02.intel.com ([134.134.136.20]:3829 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233310AbhLHMci (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Dec 2021 07:32:38 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="225077611"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; 
   d="scan'208";a="225077611"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2021 04:29:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; 
   d="scan'208";a="461674587"
Received: from mylly.fi.intel.com (HELO [10.237.72.56]) ([10.237.72.56])
  by orsmga003.jf.intel.com with ESMTP; 08 Dec 2021 04:29:05 -0800
Message-ID: <a0ac314f-9e9d-7749-6f22-fd3e44372288@linux.intel.com>
Date:   Wed, 8 Dec 2021 14:29:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH v1 01/11] i2c: Introduce common module to instantiate CCGx
 UCSI
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>
References: <20211207192159.41383-1-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20211207192159.41383-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/7/21 21:21, Andy Shevchenko wrote:
> Introduce a common module to provide an API to instantiate UCSI device
> for Cypress CCGx Type-C controller. Individual bus drivers need to select
> this one on demand.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/Kconfig         |  7 +++++++
>   drivers/i2c/busses/Makefile        |  3 +++
>   drivers/i2c/busses/i2c-ccgx-ucsi.c | 27 +++++++++++++++++++++++++++
>   drivers/i2c/busses/i2c-ccgx-ucsi.h | 11 +++++++++++
>   4 files changed, 48 insertions(+)
>   create mode 100644 drivers/i2c/busses/i2c-ccgx-ucsi.c
>   create mode 100644 drivers/i2c/busses/i2c-ccgx-ucsi.h
> 
I've mixed feelings about this set. I'd either put patches 3-8 first 
since e.g. 6/11 and 8/11 are fixing existing issues or even better to 
split CCGx UCSI stuff into another set.

Jarkko
