Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4F235A045
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Apr 2021 15:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbhDINta (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Apr 2021 09:49:30 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:16559 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232884AbhDINt1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Apr 2021 09:49:27 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGzvN6S9Rz1BGXx;
        Fri,  9 Apr 2021 21:46:56 +0800 (CST)
Received: from [127.0.0.1] (10.69.38.196) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 21:49:03 +0800
Subject: Re: [PATCH v7 2/5] i2c: core: add api to provide frequency mode
 strings
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
CC:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        "Thierry Reding" <treding@nvidia.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Barry Song <song.bao.hua@hisilicon.com>,
        John Garry <john.garry@huawei.com>,
        "Mika Westerberg" <mika.westerberg@linux.intel.com>,
        <prime.zeng@huawei.com>, Linuxarm <linuxarm@huawei.com>
References: <1617880641-664-1-git-send-email-yangyicong@hisilicon.com>
 <1617880641-664-3-git-send-email-yangyicong@hisilicon.com>
 <20210408205551.GD1900@kunai> <YHAuIdwKMjZuDmXU@smile.fi.intel.com>
 <20210409113722.GB879@ninjato>
 <CAHp75VekZKo-45Pc7mp9Pfwzx=jS7L2SBhb564acWkuAo5cPAQ@mail.gmail.com>
From:   Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <716b2bca-9d27-529e-93ab-3e6aa75bf948@hisilicon.com>
Date:   Fri, 9 Apr 2021 21:49:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VekZKo-45Pc7mp9Pfwzx=jS7L2SBhb564acWkuAo5cPAQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2021/4/9 19:40, Andy Shevchenko wrote:
> On Fri, Apr 9, 2021 at 2:37 PM Wolfram Sang <wsa@kernel.org> wrote:
>>
>>
>>> Can we add this later if needed?
>>> Because in such case additionally printing bus_freq_hz will be fine, no?
>>
>> Yes, we can do that.
>>
>>> But putting max to each frequency representation in the list of strings sounds
>>> good to me.
>>
>> It is not important to me if we are going to change that later anyhow.
>> I'll leave it to you guys.
> 
> Thanks, I think the series is okay to go as is.
> 

sorry for the late reply. we can have this series applied if possible,
or you may apply the changed patch below (please let me know if you
want the whole series updated).
I didn't realize this, sorry. our two users don't have this situation.

thanks Wolfram and Andy!

Yicong.



From 14da3be8d85536c16adbc4006fc12c6837ef7474 Mon Sep 17 00:00:00 2001
From: Yicong Yang <yangyicong@hisilicon.com>
Date: Sat, 27 Mar 2021 11:48:25 +0800
Subject: [PATCH] i2c: core: add api to provide frequency mode strings

Some I2C drivers like Designware and HiSilicon will print the
bus frequency mode information, so add a public one that everyone
can make use of.

Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/i2c/i2c-core-base.c | 19 +++++++++++++++++++
 include/linux/i2c.h         |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index de9402c..53836b5 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -76,6 +76,25 @@ void i2c_transfer_trace_unreg(void)
 	static_branch_dec(&i2c_trace_msg_key);
 }

+const char *i2c_freq_mode_string(u32 bus_freq_hz)
+{
+	if (bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ)
+		return "Standard Mode (max 100 kHz)";
+	else if (bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ)
+		return "Fast Mode (max 400 kHz)";
+	else if (bus_freq_hz <= I2C_MAX_FAST_MODE_PLUS_FREQ)
+		return "Fast Mode Plus (max 1.0 MHz)";
+	else if (bus_freq_hz <= I2C_MAX_TURBO_MODE_FREQ)
+		return "Turbo Mode (max 1.4 MHz)";
+	else if (bus_freq_hz <= I2C_MAX_HIGH_SPEED_MODE_FREQ)
+		return "High Speed Mode (max 3.4 MHz)";
+	else if (bus_freq_hz <= I2C_MAX_ULTRA_FAST_MODE_FREQ)
+		return "Ultra Fast Mode (max 5.0 MHz)";
+	else
+		return "Unknown Mode";
+}
+EXPORT_SYMBOL_GPL(i2c_freq_mode_string);
+
 const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
 						const struct i2c_client *client)
 {
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 10bd0b0..0813be1 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -51,6 +51,9 @@ struct module;
 struct property_entry;

 #if IS_ENABLED(CONFIG_I2C)
+/* Return the Frequency mode string based on the bus frequency */
+const char *i2c_freq_mode_string(u32 bus_freq_hz);
+
 /*
  * The master routines are the ones normally used to transmit data to devices
  * on a bus (or read from them). Apart from two basic transfer functions to
-- 
2.8.1





