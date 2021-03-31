Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05D263500DC
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 15:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235664AbhCaNDW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 09:03:22 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:15414 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235642AbhCaNCt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 Mar 2021 09:02:49 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F9RJb5dNvzlX0s;
        Wed, 31 Mar 2021 21:01:03 +0800 (CST)
Received: from [10.69.38.196] (10.69.38.196) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Wed, 31 Mar 2021
 21:02:37 +0800
Subject: Re: [PATCH 5/5] i2c: designware: Switch over to
 i2c_freq_mode_string()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <Sergey.Semin@baikalelectronics.ru>,
        <linux-kernel@vger.kernel.org>, <digetx@gmail.com>,
        <treding@nvidia.com>, <jarkko.nikula@linux.intel.com>,
        <rmk+kernel@armlinux.org.uk>, <song.bao.hua@hisilicon.com>,
        <john.garry@huawei.com>, <mika.westerberg@linux.intel.com>,
        <prime.zeng@huawei.com>, <linuxarm@huawei.com>
References: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
 <1617113966-40498-6-git-send-email-yangyicong@hisilicon.com>
 <YGRQzoifaWcYrt8k@smile.fi.intel.com>
From:   Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <79932cb0-afae-6b50-fd4a-deb16c76a7f9@hisilicon.com>
Date:   Wed, 31 Mar 2021 21:02:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <YGRQzoifaWcYrt8k@smile.fi.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/3/31 18:37, Andy Shevchenko wrote:
> On Tue, Mar 30, 2021 at 10:19:26PM +0800, Yicong Yang wrote:
>> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> Use generic i2c_freq_mode_string() helper to print chosen bus speed.
> 
> Since it will be a new version (based on Jarkko's comments), I guess you may
> add his Ack here that he gave against standalone submission of this patch.
> 
> What Bary reported I will fix separately.
> 

i'll addresse the comments and update the series with Jarkko's acked-by added.
Thanks for reminding me!
