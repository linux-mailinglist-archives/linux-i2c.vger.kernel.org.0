Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5788563BA2F
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Nov 2022 08:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiK2HEf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Nov 2022 02:04:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbiK2HE1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Nov 2022 02:04:27 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C3B77554D2;
        Mon, 28 Nov 2022 23:04:16 -0800 (PST)
Received: from loongson.cn (unknown [117.133.84.114])
        by gateway (Coremail) with SMTP id _____8AxhfDvroVjqPcBAA--.4637S3;
        Tue, 29 Nov 2022 15:04:15 +0800 (CST)
Received: from [192.168.1.7] (unknown [117.133.84.114])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_eHsroVjMg8eAA--.10184S3;
        Tue, 29 Nov 2022 15:04:13 +0800 (CST)
Message-ID: <a7eb1e30-3b12-eae9-12ca-e62c66bfac31@loongson.cn>
Date:   Tue, 29 Nov 2022 15:04:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/2] i2c: loongson: add bus driver for the loongson i2c
 controller
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jan Dabros <jsd@semihalf.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221128130025.23184-1-zhuyinbo@loongson.cn>
 <Y4S/dh9lztpOHxkD@smile.fi.intel.com>
 <ee52f463-f54c-70cb-5a31-5748f26f40bc@linaro.org>
 <Y4TFFPWrd7KPAsh+@smile.fi.intel.com>
From:   Yinbo Zhu <zhuyinbo@loongson.cn>
In-Reply-To: <Y4TFFPWrd7KPAsh+@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx_eHsroVjMg8eAA--.10184S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvdXoWrKr48Zr1fWF15GryDuFWrGrg_yoW3Xrb_ur
        WjyrnrCr4xJr4xG3W0y34Yq39Iq34jqw15AryfZ3y7Jr13C3s2vayjkwn3ZasxJr4kJFsF
        9rn0q3y5urZFqjkaLaAFLSUrUUUUOb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
        xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUO
        07CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2
        IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84AC
        jcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM2
        8EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWln4kS14v26r1q6r43M2AIxVAIcxkEcVAq
        07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7
        xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Y
        z7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxV
        WUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26rWl4I8I3I0E4IkC6x0Y
        z7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
        8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE
        2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42
        xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIE
        c7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUIdWrDUUUU
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


在 2022/11/28 22:26, Andy Shevchenko 写道:
> On Mon, Nov 28, 2022 at 03:12:54PM +0100, Krzysztof Kozlowski wrote:
>> On 28/11/2022 15:02, Andy Shevchenko wrote:
>>> On Mon, Nov 28, 2022 at 09:00:24PM +0800, Yinbo Zhu wrote:
> ...
>
>>> It seems you ignored some of my comments...
>>> I stopped here, please check what was given against v1 and try again.
>> I propose to wait with wasting more time on reviews because you might do
>> the same work twice:
>>
>> https://lore.kernel.org/all/822356908305580d601e5b3e424371ed7f220b85.1669359515.git.zhoubinbin@loongson.cn/
> I see, thank for the pointer!

Hi

Please ignore my i2c patch and help continue review zhoubinbin's 
loongson i2c series patch.

I will not cover it.


Thanks,

Yinbo.

>

