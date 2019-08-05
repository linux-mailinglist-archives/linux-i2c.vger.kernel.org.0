Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0DC6815E6
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2019 11:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfHEJvl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Aug 2019 05:51:41 -0400
Received: from mga09.intel.com ([134.134.136.24]:51952 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726454AbfHEJvl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Aug 2019 05:51:41 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Aug 2019 02:51:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; 
   d="scan'208";a="176265825"
Received: from mylly.fi.intel.com (HELO [10.237.72.61]) ([10.237.72.61])
  by orsmga003.jf.intel.com with ESMTP; 05 Aug 2019 02:51:39 -0700
Subject: Re: [PATCH -next] i2c: designware: Fix unused variable warning
To:     Shaokun Zhang <zhangshaokun@hisilicon.com>,
        linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
References: <1564997468-48538-1-git-send-email-zhangshaokun@hisilicon.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <d4b78f30-accb-5452-a11b-57c642bf4534@linux.intel.com>
Date:   Mon, 5 Aug 2019 12:51:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564997468-48538-1-git-send-email-zhangshaokun@hisilicon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/5/19 12:31 PM, Shaokun Zhang wrote:
> drivers/i2c/busses/i2c-designware-master.c: In function ‘i2c_dw_init_recovery_info’:
> drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused variable ‘r’ [-Wunused-variable]
>    int r;
>        ^
> Fixes: 33eb09a02e8d ("i2c: designware: make use of devm_gpiod_get_optional")
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Uwe Kleine-König <uwe@kleine-koenig.org>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> ---
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
