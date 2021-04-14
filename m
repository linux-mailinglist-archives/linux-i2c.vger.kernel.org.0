Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88A035EA29
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 03:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344287AbhDNBDw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 21:03:52 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:16584 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245086AbhDNBDu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 21:03:50 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FKkgT6JXJz18JBS;
        Wed, 14 Apr 2021 09:01:09 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.144) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Wed, 14 Apr 2021
 09:03:19 +0800
Subject: Re: [PATCH drivers/i2c 1/3] i2c: amd8111: Fix coding style issues
To:     Wolfram Sang <wsa@kernel.org>, Tian Tao <tiantao6@hisilicon.com>,
        <linux-i2c@vger.kernel.org>
References: <1617613430-11921-1-git-send-email-tiantao6@hisilicon.com>
 <1617613430-11921-2-git-send-email-tiantao6@hisilicon.com>
 <20210413202503.GD2751@kunai>
From:   "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <4aeba72c-46bd-35be-a1e8-2739f1825d92@huawei.com>
Date:   Wed, 14 Apr 2021 09:03:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210413202503.GD2751@kunai>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.188.144]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


在 2021/4/14 4:25, Wolfram Sang 写道:
> On Mon, Apr 05, 2021 at 05:03:48PM +0800, Tian Tao wrote:
>> Fix the following checkpatch errors:
>>
>>    ERROR: "foo * bar" should be "foo *bar"
>>    #189: FILE: drivers/i2c/busses/i2c-amd8111.c:189:
>>
>>    ERROR: "foo * bar" should be "foo *bar"
>>    #191: FILE: drivers/i2c/busses/i2c-amd8111.c:191:
>>
>>    ERROR: switch and case should be at the same indent
>>    #201: FILE: drivers/i2c/busses/i2c-amd8111.c:201:
>>
>>    ERROR: switch and case should be at the same indent
>>    #359: FILE: drivers/i2c/busses/i2c-amd8111.c:359:
>>
>> No functional changes.
>>
>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>> Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
>> Cc: Jean Delvare <jdelvare@suse.com>
> Is the binary after the patch applied equal to the binary before your
> patch? Same question for patch 2.

The MD5 value of binary is the same before and after the patch is 
merged，the log is as below：

tiantao@ubuntu:~/mailline/linux-next$ md5sum 
drivers/i2c/busses//i2c-amd8111.o

d1d2a43e4a6166f127e47c494b9bef1c  drivers/i2c/busses//i2c-amd8111.o
tiantao@ubuntu:~/mailline/linux-next$ git am 
/home/tiantao/i2c/0004-i2c-amd8111-Fix-coding-style-issues.patch
Applying: i2c: amd8111: Fix coding style issues
tiantao@ubuntu:~/mailline/linux-next$ make modules M=drivers/i2c/busses/
   CC [M]  drivers/i2c/busses//i2c-amd8111.o
   MODPOST drivers/i2c/busses//Module.symvers
   LD [M]  drivers/i2c/busses//i2c-amd8111.ko
tiantao@ubuntu:~/mailline/linux-next$ md5sum 
drivers/i2c/busses//i2c-amd8111.o
d1d2a43e4a6166f127e47c494b9bef1c  drivers/i2c/busses//i2c-amd8111.o


