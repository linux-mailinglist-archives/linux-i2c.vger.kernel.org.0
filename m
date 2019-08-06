Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E812082E1A
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2019 10:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731922AbfHFIux (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Aug 2019 04:50:53 -0400
Received: from mga07.intel.com ([134.134.136.100]:5513 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731835AbfHFIux (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Aug 2019 04:50:53 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Aug 2019 01:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; 
   d="scan'208";a="202738275"
Received: from mylly.fi.intel.com (HELO [10.237.72.124]) ([10.237.72.124])
  by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2019 01:36:22 -0700
Subject: Re: [PATCH] i2c: designware: Fix unused variable warning in
 i2c_dw_init_recovery_info
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190806075054.GA15418@embeddedor>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <2ddc2077-aefb-2330-3096-7473dc55f19c@linux.intel.com>
Date:   Tue, 6 Aug 2019 11:36:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806075054.GA15418@embeddedor>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 8/6/19 10:50 AM, Gustavo A. R. Silva wrote:
> Fix the following warning:
> 
> drivers/i2c/busses/i2c-designware-master.c: In function ‘i2c_dw_init_recovery_info’:
> drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused variable ‘r’ [-Wunused-variable]
>    int r;
>        ^
> 
> Fixes: 33eb09a02e8d ("i2c: designware: make use of devm_gpiod_get_optional")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
This was fixed yesterday, not applied yet though:

https://www.spinics.net/lists/linux-i2c/msg41651.html

-- 
Jarkko
