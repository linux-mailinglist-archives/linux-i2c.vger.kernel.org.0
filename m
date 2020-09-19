Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E058270997
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Sep 2020 03:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbgISBBU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Sep 2020 21:01:20 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:55736 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbgISBBU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 18 Sep 2020 21:01:20 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 68FDDDC34ED5440A51EF;
        Sat, 19 Sep 2020 09:01:18 +0800 (CST)
Received: from [127.0.0.1] (10.57.60.129) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Sat, 19 Sep 2020
 09:01:12 +0800
Subject: Re: [PATCH] i2c: Switch to using the new API kobj_to_dev()
To:     <wsa@kernel.org>, Tian Tao <tiantao6@hisilicon.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxarm@huawei.com>
References: <1600133898-35883-1-git-send-email-tiantao6@hisilicon.com>
 <20200918210911.GF52206@kunai>
From:   "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <0f47261e-c80e-a57f-2771-1be5e179a436@huawei.com>
Date:   Sat, 19 Sep 2020 09:01:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200918210911.GF52206@kunai>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.57.60.129]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



在 2020/9/19 5:09, wsa@kernel.org 写道:
> 
>>   static inline struct i2c_client *kobj_to_i2c_client(struct kobject *kobj)
>>   {
>> -	struct device * const dev = container_of(kobj, struct device, kobj);
>> +	struct device * const dev = kobj_to_dev(kobj);
>>   	return to_i2c_client(dev);
> 
> Can't we make this a oneliner then merging the last two lines?
> 
I think two lines have better readability, and if you prefer one line, I 
can send v2 to fix that!

