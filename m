Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97C7D7D3464
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 13:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234154AbjJWLjR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 07:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234218AbjJWLjQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 07:39:16 -0400
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8BACDB;
        Mon, 23 Oct 2023 04:39:13 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R651e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0Vukt.sC_1698061147;
Received: from 30.97.48.63(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Vukt.sC_1698061147)
          by smtp.aliyun-inc.com;
          Mon, 23 Oct 2023 19:39:08 +0800
Message-ID: <c67fcc8b-4270-4b61-069c-b3afd4899fba@linux.alibaba.com>
Date:   Mon, 23 Oct 2023 19:39:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V2 6/7] i2c: sprd: Increase the waiting time for I2C
 transmission to avoid system crash issues
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
References: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
 <20231023081158.10654-7-Huangzheng.Lai@unisoc.com>
From:   Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20231023081158.10654-7-Huangzheng.Lai@unisoc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-13.2 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 10/23/2023 4:11 PM, Huangzheng Lai wrote:
> Due to the relatively low priority of the isr_thread, when the CPU
> load is high, the execution of sprd_i2c_isr_thread will be delayed.
> After the waiting time is exceeded, the I2C driver will perform
> operations such as disabling the I2C controller. Later, when
> sprd_i2c_isr_thread is called by the CPU, there will be kernel panic
> caused by illegal access to the IIC register. After pressure testing,
> we found that increasing the IIC waiting time to 10 seconds can
> avoid this problem.
> 
> Fixes: 0b884fe71f9e ("i2c: sprd: use a specific timeout to avoid system hang up issue")
> Cc: <stable@vger.kernel.org> # v5.11+
> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>

Looks reasonable to me.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   drivers/i2c/busses/i2c-sprd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index b65729ba7d5a..dbdac89ad482 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -74,7 +74,7 @@
>   /* timeout (ms) for pm runtime autosuspend */
>   #define SPRD_I2C_PM_TIMEOUT	1000
>   /* timeout (ms) for transfer message */
> -#define I2C_XFER_TIMEOUT	1000
> +#define I2C_XFER_TIMEOUT	10000
>   /* dynamic modify clk_freq flag  */
>   #define I2C_3M4_FLAG		0x0100
>   #define I2C_1M_FLAG		0x0080
