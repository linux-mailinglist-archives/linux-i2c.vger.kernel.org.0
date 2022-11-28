Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46AF5639EE6
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 02:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbiK1B2t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Nov 2022 20:28:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiK1B2r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Nov 2022 20:28:47 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 74006A479;
        Sun, 27 Nov 2022 17:28:45 -0800 (PST)
Received: from loongson.cn (unknown [112.20.109.110])
        by gateway (Coremail) with SMTP id _____8Cx7+vLDoRjyYcBAA--.3816S3;
        Mon, 28 Nov 2022 09:28:43 +0800 (CST)
Received: from [0.0.0.0] (unknown [112.20.109.110])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxNlfJDoRj58QcAA--.55015S3;
        Mon, 28 Nov 2022 09:28:42 +0800 (CST)
Message-ID: <b79a7f9e-d45d-aad9-8a34-4db609ce2c74@loongson.cn>
Date:   Mon, 28 Nov 2022 09:28:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V3 2/5] i2c: gpio: Add support on ACPI-based system
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
References: <cover.1669359515.git.zhoubinbin@loongson.cn>
 <e0ed6dfa3dbf60b58ef4eaeb40ea46d2577a2834.1669359515.git.zhoubinbin@loongson.cn>
 <Y4CXrDh61D/f8V2A@smile.fi.intel.com>
From:   Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <Y4CXrDh61D/f8V2A@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxNlfJDoRj58QcAA--.55015S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7XF15JF4xWFy8Cr1xtF43Jrb_yoWxCFb_uF
        yUZa1kAw1vvF18Aa1Ykr12gF48XF4DGF1UGF4ktwn3Kr1rJF93ZF95Zr92krn3Zry7GrsI
        yryjvFy8KrW29jkaLaAFLSUrUUUU0b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
        xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUO
        07kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
        AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
        6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
        xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAa
        w2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
        I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2
        jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
        AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCa
        FVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
        IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
        aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcbAwUUUUU
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


在 2022/11/25 18:23, Andy Shevchenko 写道:
> On Fri, Nov 25, 2022 at 04:54:12PM +0800, Binbin Zhou wrote:
>> Add support for the ACPI-based device registration, so that the driver
>> can be also enabled through ACPI table.
> ...
>
>> +/* get i2c-gpio props from DT or ACPI table */
> Get
>
> ...
>
>> -	if (np) {
>> -		of_i2c_gpio_get_props(np, pdata);
>> +	if (np || has_acpi_companion(dev)) {
>> +		i2c_gpio_get_props(dev, pdata);
> 	if (dev_fwnode() {
> 		i2c_gpio_get_props(dev, pdata);
>
> ...
>
>> +	{"LOON0005", 0}, /*LoongArch*/
> ", 0" part is redundant. Also missing spaces in the comment.
>
Hi Andy:

Thanks for your review. I will fix them in the V4 patchset.

Binbin

