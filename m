Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461AD357D1C
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 09:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbhDHHR3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 03:17:29 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:16079 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhDHHR3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Apr 2021 03:17:29 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGCFj44JWz1BGL8;
        Thu,  8 Apr 2021 15:15:05 +0800 (CST)
Received: from [127.0.0.1] (10.69.38.196) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.498.0; Thu, 8 Apr 2021
 15:17:07 +0800
Subject: Re: [PATCH v6 3/5] i2c: add support for HiSilicon I2C controller
To:     Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <Sergey.Semin@baikalelectronics.ru>,
        <linux-kernel@vger.kernel.org>, <digetx@gmail.com>,
        <treding@nvidia.com>, <rmk+kernel@armlinux.org.uk>,
        <song.bao.hua@hisilicon.com>, <john.garry@huawei.com>,
        <mika.westerberg@linux.intel.com>, <prime.zeng@huawei.com>,
        <linuxarm@huawei.com>
References: <1617197790-30627-1-git-send-email-yangyicong@hisilicon.com>
 <1617197790-30627-4-git-send-email-yangyicong@hisilicon.com>
 <f1d50200-93f5-2c35-933a-01a1e7622983@linux.intel.com>
 <20210407230421.GB860@kunai>
From:   Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <5c478c9b-fc2a-2dd7-6191-8f68e265c2f7@hisilicon.com>
Date:   Thu, 8 Apr 2021 15:17:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20210407230421.GB860@kunai>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/4/8 7:04, Wolfram Sang wrote:
> 
>> Reason for temp variable is for me it's confusing to see statement like
>> "rate_khz = rate_khz / 1000".
> 
> Yes. And with this clearer calculation, we can maybe skip the HZ_PER_KHZ
> define completely and just use plain '1000' as a factor/divider because
> it then becomes obvious. I still find the define more confusing than
> helpful TBH. But I'll leave the final decision to Yicong Yang.
> 

HZ_PER_KHZ macro are defined separately in other places of the kernel.
Andy suggested to have this defined and used so that one day we can factor
this macro out to the public. :)

