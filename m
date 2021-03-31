Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7C935099E
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 23:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbhCaVhr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 31 Mar 2021 17:37:47 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3511 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232685AbhCaVho (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 Mar 2021 17:37:44 -0400
Received: from DGGEML404-HUB.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4F9fkV382pzRX2b;
        Thu,  1 Apr 2021 05:35:46 +0800 (CST)
Received: from dggema773-chm.china.huawei.com (10.1.198.217) by
 DGGEML404-HUB.china.huawei.com (10.3.17.39) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Thu, 1 Apr 2021 05:37:41 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggema773-chm.china.huawei.com (10.1.198.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Thu, 1 Apr 2021 05:37:41 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.013;
 Thu, 1 Apr 2021 05:37:41 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        yangyicong <yangyicong@huawei.com>
Subject: RE: [PATCH v1 1/1] i2c: designware: Adjust bus_freq_hz when refuse
 high speed mode set
Thread-Topic: [PATCH v1 1/1] i2c: designware: Adjust bus_freq_hz when refuse
 high speed mode set
Thread-Index: AQHXJh2955I5oqU49UuEJBCnbAaQ8aqenc/g
Date:   Wed, 31 Mar 2021 21:37:41 +0000
Message-ID: <07b6264280314d919f2747290bb80b01@hisilicon.com>
References: <20210331110510.67523-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210331110510.67523-1-andriy.shevchenko@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.203.26]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> -----Original Message-----
> From: Andy Shevchenko [mailto:andriy.shevchenko@linux.intel.com]
> Sent: Thursday, April 1, 2021 12:05 AM
> To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>; Serge Semin
> <Sergey.Semin@baikalelectronics.ru>; linux-i2c@vger.kernel.org;
> linux-kernel@vger.kernel.org
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>; Mika Westerberg
> <mika.westerberg@linux.intel.com>; wsa@kernel.org; yangyicong
> <yangyicong@huawei.com>; Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>
> Subject: [PATCH v1 1/1] i2c: designware: Adjust bus_freq_hz when refuse high
> speed mode set
> 
> When hardware doesn't support High Speed Mode, we forget bus_freq_hz
> timing adjustment. This makes the timings and real registers being
> unsynchronized. Adjust bus_freq_hz when refuse high speed mode set.
> 
> Fixes: b6e67145f149 ("i2c: designware: Enable high speed mode")
> Reported-by: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Thanks for fixing that.

Reviewed-by: Barry Song <song.bao.hua@hisilicon.com>

>  drivers/i2c/busses/i2c-designware-master.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c
> b/drivers/i2c/busses/i2c-designware-master.c
> index 34bb4e21bcc3..9bfa06e31eec 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -129,6 +129,7 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev
> *dev)
>  		if ((comp_param1 & DW_IC_COMP_PARAM_1_SPEED_MODE_MASK)
>  			!= DW_IC_COMP_PARAM_1_SPEED_MODE_HIGH) {
>  			dev_err(dev->dev, "High Speed not supported!\n");
> +			t->bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
>  			dev->master_cfg &= ~DW_IC_CON_SPEED_MASK;
>  			dev->master_cfg |= DW_IC_CON_SPEED_FAST;
>  			dev->hs_hcnt = 0;
> --
> 2.30.2

