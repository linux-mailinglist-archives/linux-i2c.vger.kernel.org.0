Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8B1835EFF9
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 10:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350180AbhDNIkw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 04:40:52 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:16455 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350181AbhDNIkf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 04:40:35 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FKwpT5SthztWKM;
        Wed, 14 Apr 2021 16:37:53 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.144) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Wed, 14 Apr 2021
 16:40:02 +0800
Subject: Re: [PATCH drivers/i2c 1/3] i2c: amd8111: Fix coding style issues
To:     Wolfram Sang <wsa@kernel.org>
CC:     Tian Tao <tiantao6@hisilicon.com>, <linux-i2c@vger.kernel.org>
References: <1617613430-11921-1-git-send-email-tiantao6@hisilicon.com>
 <1617613430-11921-2-git-send-email-tiantao6@hisilicon.com>
 <20210413202503.GD2751@kunai>
 <4aeba72c-46bd-35be-a1e8-2739f1825d92@huawei.com>
 <20210414083124.GL2180@ninjato>
From:   "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <0e864e39-9755-7fe6-b69d-2d42111d6be1@huawei.com>
Date:   Wed, 14 Apr 2021 16:40:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210414083124.GL2180@ninjato>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.188.144]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


在 2021/4/14 16:31, Wolfram Sang 写道:
>>> Is the binary after the patch applied equal to the binary before your
>>> patch? Same question for patch 2.
>> The MD5 value of binary is the same before and after the patch is
>> merged，the log is as below：
> Thanks for checking! What about patch 2?

The MD5 value of binary is the same before and after the patch2 is
merged，the log is as below：

tiantao@ubuntu:~/mailline/linux-next$ make modules M=drivers/i2c/busses/
   CC [M]  drivers/i2c/busses//i2c-iop3xx.o
   MODPOST drivers/i2c/busses//Module.symvers
   CC [M]  drivers/i2c/busses//i2c-iop3xx.mod.o
   LD [M]  drivers/i2c/busses//i2c-iop3xx.ko
tiantao@ubuntu:~/mailline/linux-next$ md5sum 
drivers/i2c/busses//i2c-iop3xx.o
6c1b7bdd1fa8bb372eee04344e496617  drivers/i2c/busses//i2c-iop3xx.o
tiantao@ubuntu:~/mailline/linux-next$ git am 
/home/tiantao/patchi3c/0002-i2c-iop3xx-Fix-coding-style-issues.patch
Applying: i2c: iop3xx: Fix coding style issues
tiantao@ubuntu:~/mailline/linux-next$ make modules M=drivers/i2c/busses/
   CC [M]  drivers/i2c/busses//i2c-iop3xx.o
   MODPOST drivers/i2c/busses//Module.symvers
   LD [M]  drivers/i2c/busses//i2c-iop3xx.ko
tiantao@ubuntu:~/mailline/linux-next$ md5sum 
drivers/i2c/busses//i2c-iop3xx.o
6c1b7bdd1fa8bb372eee04344e496617  drivers/i2c/busses//i2c-iop3xx.o

>

