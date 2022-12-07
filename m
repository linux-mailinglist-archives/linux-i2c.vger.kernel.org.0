Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 627A2645463
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Dec 2022 08:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbiLGHKt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Dec 2022 02:10:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiLGHKs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Dec 2022 02:10:48 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BB8A82DC8;
        Tue,  6 Dec 2022 23:10:46 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8DxdPB1PJBjqcIDAA--.8908S3;
        Wed, 07 Dec 2022 15:10:45 +0800 (CST)
Received: from [0.0.0.0] (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8AxDuJ0PJBjdBknAA--.31168S3;
        Wed, 07 Dec 2022 15:10:45 +0800 (CST)
Message-ID: <14dcf7b0-2fb1-575f-7e41-f58ce55b920b@loongson.cn>
Date:   Wed, 7 Dec 2022 15:10:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V5 1/4] i2c: gpio: Add support on ACPI-based system
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
References: <cover.1670293176.git.zhoubinbin@loongson.cn>
 <0a8a1dec27beea61935adb2a9c2d74e41c86e9b1.1670293176.git.zhoubinbin@loongson.cn>
 <Y49cL9JQ6kFblLeX@smile.fi.intel.com>
From:   Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <Y49cL9JQ6kFblLeX@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxDuJ0PJBjdBknAA--.31168S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
        ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
        BjDU0xBIdaVrnRJUUUmjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
        xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
        j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxV
        AFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x02
        67AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
        I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2
        jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
        AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxAqzxv262kKe7AKxVWUAVWUtwCF54CYxVCY
        1x0262kKe7AKxVWUAVWUtwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAV
        WUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
        1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6x
        IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
        UI43ZEXa7IU82g43UUUUU==
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_SBL_CSS,SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


在 2022/12/6 23:13, Andy Shevchenko 写道:
> On Tue, Dec 06, 2022 at 11:16:54AM +0800, Binbin Zhou wrote:
>> Add support for the ACPI-based device registration, so that the driver
>> can be also enabled through ACPI table.
> ...
>
>> -#include <linux/of.h>
> Cool, but don't you need to add property.h?

Get it, I should have been more careful, maybe I'm still not very 
sensitive to header files.

Now I'm still basically judging based on whether I compile with errors 
or not.

Thanks.

Binbin

>
> Otherwise looks good to me.
>

