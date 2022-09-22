Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0194A5E6268
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 14:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbiIVMaU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 08:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiIVMaT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 08:30:19 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 87C802E9EB;
        Thu, 22 Sep 2022 05:30:16 -0700 (PDT)
Received: from [10.136.12.12] (unknown [111.9.175.10])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx9OFRVSxjdB0gAA--.53947S3;
        Thu, 22 Sep 2022 20:30:10 +0800 (CST)
Subject: Re: [PATCH 1/5] i2c: core: Pick i2c bus number from ACPI if present
To:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
        WANG Xuerui <kernel@xen0n.name>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
References: <cover.1663835855.git.zhoubinbin@loongson.cn>
 <be5cd69c7c58d44ca119d4ca692d95a2ae924533.1663835855.git.zhoubinbin@loongson.cn>
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <b9d167bd-9899-e715-cd8a-a498d26653af@loongson.cn>
Date:   Thu, 22 Sep 2022 20:29:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <be5cd69c7c58d44ca119d4ca692d95a2ae924533.1663835855.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8Cx9OFRVSxjdB0gAA--.53947S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tFWDtrykGFy7Wr15CF1rWFg_yoW8Xw13pF
        Z8CFZIkr4jvF4v9FZxXr15ury5W395Kry2qFZFkw1UuFnxJrnrtFW5JFy2vFWrJ34qqws7
        ZF4vv3yUCF4a9FUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
        c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVW5JwCF04k20xvY0x0EwIxGrw
        CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
        14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
        IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
        x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
        0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUDWrXUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2022/9/22 下午7:39, Binbin Zhou wrote:

> Under LoongARCH based on ACPI(such as Loongson-3A + LS7A), the ls2x i2c
> driver obtains the i2c bus number from ACPI table.
>
> Similar to the DT-base system, this is also a static bus number.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>   drivers/i2c/i2c-core-base.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 91007558bcb2..ffab4cc2c6ba 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1559,7 +1559,8 @@ static int __i2c_add_numbered_adapter(struct i2c_adapter *adap)
>   int i2c_add_adapter(struct i2c_adapter *adapter)
>   {
>   	struct device *dev = &adapter->dev;
> -	int id;
> +	acpi_status status;
> +	unsigned long long id;
>   
>   	if (dev->of_node) {
>   		id = of_alias_get_id(dev->of_node, "i2c");
> @@ -1567,6 +1568,13 @@ int i2c_add_adapter(struct i2c_adapter *adapter)
>   			adapter->nr = id;
>   			return __i2c_add_numbered_adapter(adapter);
>   		}
> +	} else if (dev->parent->fwnode) {
> +		status = acpi_evaluate_integer(ACPI_HANDLE(dev->parent),
> +						"_UID", NULL, &id);
> +		if (ACPI_SUCCESS(status) && (id >= 0)) {

Hi, Binbin,


Emm, the id is unsigned and it always return true if (id>=0). And I think

you should check the other patches.


Jinyang


> +			adapter->nr = id;
> +			return __i2c_add_numbered_adapter(adapter);
> +		}
>   	}
>   
>   	mutex_lock(&core_lock);

