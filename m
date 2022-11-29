Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99F3B63C0F7
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Nov 2022 14:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbiK2NYp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Nov 2022 08:24:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbiK2NYo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Nov 2022 08:24:44 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DE81D2BF9;
        Tue, 29 Nov 2022 05:24:41 -0800 (PST)
Received: from loongson.cn (unknown [112.20.109.110])
        by gateway (Coremail) with SMTP id _____8Cx5vAYCIZj8hECAA--.4767S3;
        Tue, 29 Nov 2022 21:24:40 +0800 (CST)
Received: from [0.0.0.0] (unknown [112.20.109.110])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxTuAUCIZjgYUeAA--.11610S3;
        Tue, 29 Nov 2022 21:24:37 +0800 (CST)
Message-ID: <57496a84-52b3-db97-f0b9-1477de84eb1e@loongson.cn>
Date:   Tue, 29 Nov 2022 21:24:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V3 3/5] dt-bindings: i2c: add bindings for Loongson LS2X
 I2C
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     loongarch@lists.linux.dev, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
References: <cover.1669359515.git.zhoubinbin@loongson.cn>
 <57339e73b6c0bfe446e19a7f55a48b7ca640b9ec.1669359515.git.zhoubinbin@loongson.cn>
 <61541d15-fbfd-3f99-fc05-663ebf4a2b54@linaro.org>
 <654be437-f4f0-4c98-b124-ac2d8f78fdbe@loongson.cn>
 <026d3af4-1903-4486-f127-691b8ea7a2fc@linaro.org>
From:   Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <026d3af4-1903-4486-f127-691b8ea7a2fc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxTuAUCIZjgYUeAA--.11610S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7Xw47trW7Kw1kZrWkGw1xKrg_yoWkJFb_Gr
        yUJwnrKw1Ikrn7Ka1qqr1SqrWag3WUZ34rW34kKw4xZ34avr1DZrZ3G3sxAwn3Ja4rAFs0
        krZ5tws8Ww43ujkaLaAFLSUrUUUUnb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
        xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUO
        07kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
        AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
        6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
        xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWln4kS
        14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
        1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
        67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
        xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
        6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
        026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF
        0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0x
        vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv
        6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7TmhUUUUU
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


在 2022/11/28 22:15, Krzysztof Kozlowski 写道:
> On 28/11/2022 13:24, Binbin Zhou wrote:
>> Hi Krzysztof:
>>
>> 在 2022/11/28 04:49, Krzysztof Kozlowski 写道:
>>> On 25/11/2022 09:54, Binbin Zhou wrote:
>>>> Add device tree bindings for the i2c controller on the Loongson-2K Soc
>>>> or Loongosn LS7A bridge.
>>> It's a v3 which is for the first time sent to DT maintainers...
>> Sorry, it was my mistake, I didn't double check the mail recipients in
>> my .git/config.
>>> Subject: drop second, redundant "bindings for".
>> Ok. I get it.
> Actually, sending bindings and patches for same devices is a waste of
> everyone's time:
> https://lore.kernel.org/all/20221117075938.23379-2-zhuyinbo@loongson.cn/
>
> Get your upstream process synchronized. Perform reviews on each other
> patches, check mailing lists.

Hi:

Through communication with Yinbo offline, I will continue the series of 
patch set submissions.

There is his reply:

https://lore.kernel.org/all/2e10ae64-3c91-ccf8-a970-eb6e3371b948@loongson.cn/

Thanks.

Binbin

>
> Best regards,
> Krzysztof

