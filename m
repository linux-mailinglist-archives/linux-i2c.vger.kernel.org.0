Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29BC234F39E
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 23:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhC3VhN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 30 Mar 2021 17:37:13 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:5116 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232641AbhC3Vgr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Mar 2021 17:36:47 -0400
Received: from DGGEML401-HUB.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4F92ll0CTWzYQFB;
        Wed, 31 Mar 2021 05:34:43 +0800 (CST)
Received: from dggema774-chm.china.huawei.com (10.1.198.216) by
 DGGEML401-HUB.china.huawei.com (10.3.17.32) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 31 Mar 2021 05:36:37 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggema774-chm.china.huawei.com (10.1.198.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Wed, 31 Mar 2021 05:36:37 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.013;
 Wed, 31 Mar 2021 05:36:37 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     yangyicong <yangyicong@huawei.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Sergey.Semin@baikalelectronics.ru" 
        <Sergey.Semin@baikalelectronics.ru>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "digetx@gmail.com" <digetx@gmail.com>,
        "treding@nvidia.com" <treding@nvidia.com>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
        John Garry <john.garry@huawei.com>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "Zengtao (B)" <prime.zeng@hisilicon.com>,
        Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH 5/5] i2c: designware: Switch over to
 i2c_freq_mode_string()
Thread-Topic: [PATCH 5/5] i2c: designware: Switch over to
 i2c_freq_mode_string()
Thread-Index: AQHXJXAQhX+a0hiUXkCpTQNzS4ZJoKqdC6Iw
Date:   Tue, 30 Mar 2021 21:36:36 +0000
Message-ID: <baa1c622040745b0b13e99e3f7bf2cd3@hisilicon.com>
References: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
 <1617113966-40498-6-git-send-email-yangyicong@hisilicon.com>
In-Reply-To: <1617113966-40498-6-git-send-email-yangyicong@hisilicon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.202.63]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> -----Original Message-----
> From: yangyicong
> Sent: Wednesday, March 31, 2021 3:19 AM
> To: wsa@kernel.org; andriy.shevchenko@linux.intel.com;
> linux-i2c@vger.kernel.org; Sergey.Semin@baikalelectronics.ru;
> linux-kernel@vger.kernel.org
> Cc: digetx@gmail.com; treding@nvidia.com; jarkko.nikula@linux.intel.com;
> rmk+kernel@armlinux.org.uk; Song Bao Hua (Barry Song)
> <song.bao.hua@hisilicon.com>; John Garry <john.garry@huawei.com>;
> mika.westerberg@linux.intel.com; yangyicong <yangyicong@huawei.com>; Zengtao
> (B) <prime.zeng@hisilicon.com>; Linuxarm <linuxarm@huawei.com>
> Subject: [PATCH 5/5] i2c: designware: Switch over to i2c_freq_mode_string()
> 
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Use generic i2c_freq_mode_string() helper to print chosen bus speed.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/i2c/busses/i2c-designware-master.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c
> b/drivers/i2c/busses/i2c-designware-master.c
> index dd27b9d..b64c4c8 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -35,10 +35,10 @@ static void i2c_dw_configure_fifo_master(struct dw_i2c_dev
> *dev)
> 
>  static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
>  {
> -	const char *mode_str, *fp_str = "";
>  	u32 comp_param1;
>  	u32 sda_falling_time, scl_falling_time;
>  	struct i2c_timings *t = &dev->timings;
> +	const char *fp_str = "";
>  	u32 ic_clk;
>  	int ret;
> 
> @@ -153,22 +153,10 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev
> *dev)
> 
>  	ret = i2c_dw_set_sda_hold(dev);
>  	if (ret)
> -		goto out;
> -
> -	switch (dev->master_cfg & DW_IC_CON_SPEED_MASK) {
> -	case DW_IC_CON_SPEED_STD:
> -		mode_str = "Standard Mode";
> -		break;
> -	case DW_IC_CON_SPEED_HIGH:
> -		mode_str = "High Speed Mode";
> -		break;
> -	default:
> -		mode_str = "Fast Mode";
> -	}
> -	dev_dbg(dev->dev, "Bus speed: %s%s\n", mode_str, fp_str);
> +		return ret;
> 
> -out:
> -	return ret;
> +	dev_dbg(dev->dev, "Bus speed: %s\n",
> i2c_freq_mode_string(t->bus_freq_hz));

Weird the original code was printing both mode and fp.
And you are printing mode only.

> +	return 0;
>  }
> 
>  /**
> --
> 2.8.1

