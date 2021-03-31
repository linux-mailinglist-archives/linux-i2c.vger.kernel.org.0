Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D96F34FBCD
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 10:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234471AbhCaIjQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 04:39:16 -0400
Received: from mga03.intel.com ([134.134.136.65]:3666 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230093AbhCaIjC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 04:39:02 -0400
IronPort-SDR: 1+tMnowLkkw+XPOHBwtByv2/qq4hXcN5WPhWtnI69t9uK4jYfjAyE1Uyt9KaPvJ2KMBwoMqIBA
 fmbeMOBTNGYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="191975207"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="191975207"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 01:39:00 -0700
IronPort-SDR: cqqguWh6WGpJEpU2LTpfPWNWSAmFrraPjsgVlve/2DJ84806e03oJIAWMPMa2oYOu3b7WCGt8S
 RGbPxTghDBgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="418564055"
Received: from mylly.fi.intel.com (HELO [10.237.72.184]) ([10.237.72.184])
  by orsmga008.jf.intel.com with ESMTP; 31 Mar 2021 01:38:58 -0700
Subject: Re: [PATCH v1 1/1] i2c: designware: Switch over to
 i2c_freq_mode_string()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yicong Yang <yangyicong@hisilicon.com>
References: <20210330134633.29889-1-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <4631eddd-1855-566e-7d3c-591e5d559cf8@linux.intel.com>
Date:   Wed, 31 Mar 2021 11:38:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210330134633.29889-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/30/21 4:46 PM, Andy Shevchenko wrote:
> Use generic i2c_freq_mode_string() helper to print chosen bus speed.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> Depends on the "Add support for HiSilicon I2C controller" series.
> Message-Id - 1617109549-4013-1-git-send-email-yangyicong@hisilicon.com
> Yicong, feel free to attach to your new version of it.
> 
>   drivers/i2c/busses/i2c-designware-master.c | 20 ++++----------------
>   1 file changed, 4 insertions(+), 16 deletions(-)
> 
Please note kernel test robot <lkp@intel.com> reported some issues with 
this patch before included in this series.

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
