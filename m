Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46267356653
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 10:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238637AbhDGIS4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 04:18:56 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:16808 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239849AbhDGISz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Apr 2021 04:18:55 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FFcg45l8gz7tPr;
        Wed,  7 Apr 2021 16:16:32 +0800 (CST)
Received: from [127.0.0.1] (10.69.38.196) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0; Wed, 7 Apr 2021
 16:18:37 +0800
Subject: Re: [PATCH v6 3/5] i2c: add support for HiSilicon I2C controller
To:     Wolfram Sang <wsa@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <linux-i2c@vger.kernel.org>, <Sergey.Semin@baikalelectronics.ru>,
        <linux-kernel@vger.kernel.org>, <digetx@gmail.com>,
        <treding@nvidia.com>, <jarkko.nikula@linux.intel.com>,
        <rmk+kernel@armlinux.org.uk>, <song.bao.hua@hisilicon.com>,
        <john.garry@huawei.com>, <mika.westerberg@linux.intel.com>,
        <prime.zeng@huawei.com>, <linuxarm@huawei.com>
References: <1617197790-30627-1-git-send-email-yangyicong@hisilicon.com>
 <1617197790-30627-4-git-send-email-yangyicong@hisilicon.com>
 <20210406200248.GH3122@kunai>
From:   Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <5c64a396-05ca-d19f-04ca-a3770e82c009@hisilicon.com>
Date:   Wed, 7 Apr 2021 16:18:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20210406200248.GH3122@kunai>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/4/7 4:02, Wolfram Sang wrote:
> 
> Only super minor stuff. Thanks to all the contributors and reviewers!
> 
>> +#define HZ_PER_KHZ	1000
> 
> KHZ_PER_HZ?

that doesn't match what we want. we want the count of HZs per one KHZ.

> 
>> +	ret = devm_i2c_add_adapter(dev, adapter);
>> +	if (ret) {
>> +		dev_err(dev, "failed to add i2c adapter, ret = %d\n", ret);
> 
> No need to print that. The core prints messages on failures.
> 

i check the code and find a little difference. the print in the core doesn't
have the device prefix so it may not tell us which device's registeration fails.
but considering we have device name embedded in the adapter name for this
driver, it's ok to remove this message.

