Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B401B8E02
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Apr 2020 10:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbgDZIoU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Apr 2020 04:44:20 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:53230 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726108AbgDZIoU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 26 Apr 2020 04:44:20 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id F313ED09628CC06D999E;
        Sun, 26 Apr 2020 16:44:17 +0800 (CST)
Received: from [127.0.0.1] (10.166.213.7) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Sun, 26 Apr 2020
 16:44:16 +0800
Subject: Re: [PATCH] i2c: busses: remove unneeded conversion to bool
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200420042816.18989-1-yanaijie@huawei.com>
 <20200426081652.GH1262@kunai>
From:   Jason Yan <yanaijie@huawei.com>
Message-ID: <bb3f98c1-e97d-7ed9-8983-a8d8a729e5ac@huawei.com>
Date:   Sun, 26 Apr 2020 16:44:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200426081652.GH1262@kunai>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.166.213.7]
X-CFilter-Loop: Reflected
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



在 2020/4/26 16:16, Wolfram Sang 写道:
> On Mon, Apr 20, 2020 at 12:28:16PM +0800, Jason Yan wrote:
>> The '>' expression itself is bool, no need to convert it to bool again.
>> This fixes the following coccicheck warning:
>>
>> drivers/i2c/busses/i2c-qup.c:960:48-53: WARNING: conversion to bool not needed here
>> drivers/i2c/busses/i2c-qup.c:962:47-52: WARNING: conversion to bool not needed here
>> drivers/i2c/busses/i2c-qup.c:1531:29-34: WARNING: conversion to bool not needed here
>> drivers/i2c/busses/i2c-qup.c:1533:29-34: WARNING: conversion to bool not needed here
>>
>> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> 
> Applied to for-next, thanks! But please fix $subject to have the driver
> name "qup" next time.
> 

OK, get it.

Thanks,
Jason

