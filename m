Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 742471A633
	for <lists+linux-i2c@lfdr.de>; Sat, 11 May 2019 03:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbfEKBeU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 May 2019 21:34:20 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:7190 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728064AbfEKBeU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 10 May 2019 21:34:20 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 1E36C22EF0B83997152F;
        Sat, 11 May 2019 09:34:18 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.180) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Sat, 11 May 2019
 09:34:09 +0800
Subject: Re: [PATCH 3/3] i2c: i801: avoid panic if ioreamp fails
To:     Jean Delvare <jdelvare@suse.de>
CC:     <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
References: <20190510030320.109154-1-wangkefeng.wang@huawei.com>
 <20190510030320.109154-3-wangkefeng.wang@huawei.com>
 <20190510100955.497a1a57@endymion>
 <164bb498-35dc-b226-4adb-3d743f4790a1@huawei.com>
 <20190510141833.2cb3d108@endymion>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <b76a3c35-015f-8ecb-0dd1-1329ee93e637@huawei.com>
Date:   Sat, 11 May 2019 09:32:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190510141833.2cb3d108@endymion>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.177.19.180]
X-CFilter-Loop: Reflected
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2019/5/10 20:18, Jean Delvare wrote:
> On Fri, 10 May 2019 17:35:46 +0800, Kefeng Wang wrote:
>> On 2019/5/10 16:09, Jean Delvare wrote:
>>> We don't need this anyway. The comment says it can't fail, so why
>>> bother checking for a condition which will never happen?  
>> The ioremap could fails due to no memory, our inner test robot(enable FAULT_INJECTION)
>>
>> find this issue.
> The code only runs on x86 where this specific memory segment is
> standardized for the purpose. That's how we know it "can't fail".
>
> That being said, maybe it could fail for other reasons (internal kernel
> bug, or bogus BIOS maybe), and I don't care adding the check
> anyway, as this code path is not performance critical.
Got it , please ignore it.
>

