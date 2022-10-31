Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 789C1612EC9
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Oct 2022 02:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiJaB56 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Oct 2022 21:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiJaB55 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Oct 2022 21:57:57 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890D995AF;
        Sun, 30 Oct 2022 18:57:55 -0700 (PDT)
Received: from canpemm500004.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N0x9r3vDczHvRq;
        Mon, 31 Oct 2022 09:57:36 +0800 (CST)
Received: from [10.174.179.106] (10.174.179.106) by
 canpemm500004.china.huawei.com (7.192.104.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 09:57:52 +0800
Subject: Re: [PATCH next v9 1/4] i2c: hisi: Add initial device tree support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <yangyicong@hisilicon.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <wsa@kernel.org>,
        <f.fainelli@gmail.com>, <jarkko.nikula@linux.intel.com>,
        <jdelvare@suse.de>, <william.zhang@broadcom.com>,
        <jsd@semihalf.com>, <conor.dooley@microchip.com>,
        <phil.edworthy@renesas.com>,
        <tharunkumar.pasumarthi@microchip.com>,
        <semen.protsenko@linaro.org>, <kfting@nuvoton.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20221029115937.179788-1-chenweilong@huawei.com>
 <Y170TZoIp1WBIwU4@smile.fi.intel.com>
From:   chenweilong <chenweilong@huawei.com>
Message-ID: <dfc1c006-61c0-8f28-6164-060347c69d04@huawei.com>
Date:   Mon, 31 Oct 2022 09:57:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <Y170TZoIp1WBIwU4@smile.fi.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.179.106]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500004.china.huawei.com (7.192.104.92)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2022/10/31 6:01, Andy Shevchenko wrote:
> On Sat, Oct 29, 2022 at 07:59:36PM +0800, Weilong Chen wrote:
>> The HiSilicon I2C controller can be used on embedded platform, which
>> boot from devicetree.
> ...
>
>> +#include <linux/acpi.h>
>> +#include <linux/of.h>
> Why?
>
> ...
>
>> +#ifdef CONFIG_ACPI
> Why?
>
> ...
>
>> +#ifdef CONFIG_OF
> Why?
>
> ...
>
>> -		.acpi_match_table = hisi_i2c_acpi_ids,
>> +		.acpi_match_table = ACPI_PTR(hisi_i2c_acpi_ids),
> Why?
>
> ...
>
>> +		.of_match_table = of_match_ptr(hisi_i2c_dts_ids),
> Why of_match_ptr()?

There's a lot of drivers use of_match_ptr/ACPI_PTR to protect the of_device_id and

have explicit headers file references to linux/acpi.h or linux/of.h, such as

drivers/media/platform/intel/pxa_camera.c,

bluetooth/hci_intel.c, 

platform/x86/intel/chtwc_int33fe.c,

platform/x86/intel/pmc/core.c and so on.


The acpi.h and of.h have a nice function or macro definition if CONFIG_OF/ACPI is not satisfy,

for example:

#define ACPI_PTR(_ptr)  (_ptr)  vs  #define ACPI_PTR(_ptr)  (NULL)

and also a lot of 'static inline' function there.


Seems a good idea to remove all of them, the codes your noted may look a bit verbose there ,

But I think it is valuable for a driver and device ,telling users it support acpi boot or is it just embedded.


Thanks for review.

Best Regards.

>

