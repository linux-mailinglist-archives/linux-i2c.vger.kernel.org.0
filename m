Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF3C138C046
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 09:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhEUHEn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 03:04:43 -0400
Received: from mga02.intel.com ([134.134.136.20]:55175 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232845AbhEUHEm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 03:04:42 -0400
IronPort-SDR: ryBx2+dAu13nv1L+Y1cOnG7PMUDAZ+q6s6YDBbicrmqijyWEunaIBnbEcw1nAnRO4tSFP7r5w/
 WyGizcML67yw==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="188548537"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="188548537"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2021 00:03:16 -0700
IronPort-SDR: m/YObD5DTCCRbB03+DCpOjSUZhBJbwhUD0U7t/TMvq1ZaY58/0dMdZRqnCv/Y4zAoGKRNpttAo
 t1RXAj1IpLGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="440948981"
Received: from unknown (HELO [10.237.72.56]) ([10.237.72.56])
  by fmsmga008.fm.intel.com with ESMTP; 21 May 2021 00:03:14 -0700
Subject: Re: [PATCH 07/16] i2c: busses: i2c-designware-master: Fix misnaming
 of 'i2c_dw_init_master()'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-8-lee.jones@linaro.org>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <649033f5-5f63-3c82-bedd-7a9f20d0b689@linux.intel.com>
Date:   Fri, 21 May 2021 10:03:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210520190105.3772683-8-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/20/21 10:00 PM, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/i2c/busses/i2c-designware-master.c:176: warning: expecting prototype for i2c_dw_init(). Prototype was for i2c_dw_init_master() instead
> 
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/i2c/busses/i2c-designware-master.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
