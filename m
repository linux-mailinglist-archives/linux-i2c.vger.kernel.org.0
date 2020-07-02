Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED7912123E9
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jul 2020 14:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729290AbgGBM6N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jul 2020 08:58:13 -0400
Received: from mga09.intel.com ([134.134.136.24]:21477 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729263AbgGBM6D (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 Jul 2020 08:58:03 -0400
IronPort-SDR: vu3ur1m5ptCO/E4kYYILEubSPR6zaGsKm2DED+KV+22uMYhHMq928PKXT4e77zZqmBOK5pVyB2
 QANxhweP7UqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="148434056"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="148434056"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2020 05:58:02 -0700
IronPort-SDR: h6S8D0BrFhZ2+OkSlaPjIi6B2dK12oE9vTzO5dd5z6srbcFfrKLOoncxIDZ0Bv/IlaCHSTxqZS
 Jt3uxpG88uyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="295885937"
Received: from mylly.fi.intel.com (HELO [10.237.72.153]) ([10.237.72.153])
  by orsmga002.jf.intel.com with ESMTP; 02 Jul 2020 05:58:01 -0700
Subject: Re: [PATCH v6] i2c: designware: platdrv: Set class based on DMI
To:     Ricardo Ribalda <ribalda@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
References: <20200702103321.2092254-1-ribalda@kernel.org>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <c70553f1-527c-2e91-3fd1-d0f6072f96b8@linux.intel.com>
Date:   Thu, 2 Jul 2020 15:56:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200702103321.2092254-1-ribalda@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/2/20 1:33 PM, Ricardo Ribalda wrote:
> Current AMD's zen-based APUs use this core for some of its i2c-buses.
> 
> With this patch we re-enable autodetection of hwmon-alike devices, so
> lm-sensors will be able to work automatically.
> 
> It does not affect the boot-time of embedded devices, as the class is
> set based on the DMI information.
> 
> DMI is probed only on Qtechnology QT5222 Industrial Camera Platform.
> 
> DocLink: https://qtec.com/camera-technology-camera-platforms/
> Fixes: 3eddad96c439 ("i2c: designware: reverts "i2c: designware: Add support for AMD I2C controller"")
> Signed-off-by: Ricardo Ribalda <ribalda@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v6: Removed extra line, sorry for the invalid v5
>   drivers/i2c/busses/i2c-designware-platdrv.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
