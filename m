Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB49935693C
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 12:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350834AbhDGKQz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 06:16:55 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15625 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350821AbhDGKQy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Apr 2021 06:16:54 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FFgHF1d6lz19L6J;
        Wed,  7 Apr 2021 18:14:33 +0800 (CST)
Received: from [127.0.0.1] (10.69.38.196) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.498.0; Wed, 7 Apr 2021
 18:16:37 +0800
Subject: Re: [PATCH v6 3/5] i2c: add support for HiSilicon I2C controller
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>, <wsa@kernel.org>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <Sergey.Semin@baikalelectronics.ru>, <linux-kernel@vger.kernel.org>
CC:     <digetx@gmail.com>, <treding@nvidia.com>,
        <rmk+kernel@armlinux.org.uk>, <song.bao.hua@hisilicon.com>,
        <john.garry@huawei.com>, <mika.westerberg@linux.intel.com>,
        <prime.zeng@huawei.com>, <linuxarm@huawei.com>
References: <1617197790-30627-1-git-send-email-yangyicong@hisilicon.com>
 <1617197790-30627-4-git-send-email-yangyicong@hisilicon.com>
 <f1d50200-93f5-2c35-933a-01a1e7622983@linux.intel.com>
From:   Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <19f33eff-e7b2-0e03-bbd4-f50b2ef050c5@hisilicon.com>
Date:   Wed, 7 Apr 2021 18:16:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <f1d50200-93f5-2c35-933a-01a1e7622983@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/4/7 16:32, Jarkko Nikula wrote:
> Hi
> 
> On 3/31/21 4:36 PM, Yicong Yang wrote:
>> +    ret = device_property_read_u64(dev, "clk_rate", &ctlr->clk_rate_khz);
>> +    if (ret) {
>> +        dev_err(dev, "failed to get clock frequency, ret = %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    ctlr->clk_rate_khz = DIV_ROUND_UP_ULL(ctlr->clk_rate_khz, HZ_PER_KHZ);
>> +
> 
> I'd use a temp variable here for reading the "clk_rate" property in Hertz and calculating the derived kHz value from it. As a bonus allow to use u32 for clk_rate_khz instead of u64. u32 will still provide plenty of headroom :-)
> 
> Reason for temp variable is for me it's confusing to see statement like "rate_khz = rate_khz / 1000".
> 

I can get this addressed in the updated version. Thanks for the suggestion!

