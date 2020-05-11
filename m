Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9A91CDB38
	for <lists+linux-i2c@lfdr.de>; Mon, 11 May 2020 15:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgEKNbU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 09:31:20 -0400
Received: from mga14.intel.com ([192.55.52.115]:17124 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726013AbgEKNbU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 May 2020 09:31:20 -0400
IronPort-SDR: UpIHmsA6KlNRbcd6rvdHedc5RrV9y51FT18J/UeQJMT8WuZt4hhIFEpGXwzvmvMxGtmKM5PMxi
 QKuIZLXbPMqw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 06:31:20 -0700
IronPort-SDR: XMVTz1Uqbt7MuGRFO/qbgxPKsi9aAZId2yQn10OpMF8ZRW5IIly+1EYEdOxGEveBNxCxYIe36b
 JRZ7ZsvxeHdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,380,1583222400"; 
   d="scan'208";a="286271827"
Received: from mylly.fi.intel.com (HELO [10.237.72.167]) ([10.237.72.167])
  by fmsmga004.fm.intel.com with ESMTP; 11 May 2020 06:31:19 -0700
Subject: Re: [PATCH v1 3/4] i2c: designware: Split out ACPI parts into
 separate module
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
References: <20200507135140.14635-1-andriy.shevchenko@linux.intel.com>
 <20200507135140.14635-3-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <407cc9b3-fd56-43bf-1361-c6b1aec0442f@linux.intel.com>
Date:   Mon, 11 May 2020 16:31:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200507135140.14635-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/7/20 4:51 PM, Andy Shevchenko wrote:
> For better maintenance and possible code reuse in the future,
> split out ACPI parts into a separate module.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/Makefile                 |   3 +
>   drivers/i2c/busses/i2c-designware-acpi.c    | 130 +++++++++++++++++
>   drivers/i2c/busses/i2c-designware-core.h    |   8 ++
>   drivers/i2c/busses/i2c-designware-platdrv.c | 151 +++-----------------
>   4 files changed, 163 insertions(+), 129 deletions(-)
>   create mode 100644 drivers/i2c/busses/i2c-designware-acpi.c
> 
Comment to both of this and patch 2/4:

I'm not so fan of introducing even more i2c-designware modules. No any 
other drivers have so many files as i2c-designware in 
drivers/i2c/busses/*.c. Feeling a bit of hall of shame because of it :-)

What's the rationale here? Currently i2c-designware-platdrv.c is 512 
lines of code so it's not too hard to maintain in my opinion.

-- 
Jarkko

