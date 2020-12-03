Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD632CCB3D
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 01:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgLCAwD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 19:52:03 -0500
Received: from mail.loongson.cn ([114.242.206.163]:33908 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726730AbgLCAwD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 19:52:03 -0500
Received: from [10.130.0.193] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxutGCNshfgzwZAA--.56902S3;
        Thu, 03 Dec 2020 08:51:15 +0800 (CST)
Subject: Re: [PATCH] i2c: busses: Use dma_set_mask_and_coherent
To:     Wolfram Sang <wsa@kernel.org>
References: <1606223315-13390-1-git-send-email-tangyouling@loongson.cn>
 <20201202160147.GG13425@kunai>
Cc:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Youling Tang <tangyouling@loongson.cn>
Message-ID: <c3b2aed2-1c65-d242-648e-11624fd7b629@loongson.cn>
Date:   Thu, 3 Dec 2020 08:51:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20201202160147.GG13425@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxutGCNshfgzwZAA--.56902S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tw17ur4UJw1DKF48KFy8Zrb_yoW8XF4fpw
        1UGa43C3yxtFyYqa45Aw45XryYgws0gr98KrW7KwnxZay5WFyktr1Iyr43Kr18JFyI9r1f
        Z3yDt3WYgF1Fya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvFb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY
        02Avz4vE14v_twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
        02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
        Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
        CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAF
        wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj
        xUISdyUUUUU
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi, Wolfram

On 12/03/2020 12:01 AM, Wolfram Sang wrote:
> On Tue, Nov 24, 2020 at 09:08:35PM +0800, Youling Tang wrote:
>> 'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
>> an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.
>>
>> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> Please use "i2c: ismt:", so driver maintainers know that the patch is
> relevant to them.
Thank you for your suggestion, I'll send v2 later.

Thanks.
Youling.
>> ---
>>   drivers/i2c/busses/i2c-ismt.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
>> index a35a27c..5f49830 100644
>> --- a/drivers/i2c/busses/i2c-ismt.c
>> +++ b/drivers/i2c/busses/i2c-ismt.c
>> @@ -903,16 +903,12 @@ ismt_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>   		return -ENODEV;
>>   	}
>>   
>> -	if ((pci_set_dma_mask(pdev, DMA_BIT_MASK(64)) != 0) ||
>> -	    (pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64)) != 0)) {
>> -		if ((pci_set_dma_mask(pdev, DMA_BIT_MASK(32)) != 0) ||
>> -		    (pci_set_consistent_dma_mask(pdev,
>> -						 DMA_BIT_MASK(32)) != 0)) {
>> +	if (dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(64)) != 0)
>> +		if (dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(32)) != 0) {
>>   			dev_err(&pdev->dev, "pci_set_dma_mask fail %p\n",
>>   				pdev);
>>   			return -ENODEV;
>>   		}
>> -	}
>>   
>>   	err = ismt_dev_init(priv);
>>   	if (err)
>> -- 
>> 2.1.0
>>

