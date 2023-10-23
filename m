Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3F4F7D3509
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 13:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234401AbjJWLpA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 07:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234416AbjJWLow (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 07:44:52 -0400
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09DC410C;
        Mon, 23 Oct 2023 04:44:47 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R641e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VuktnG._1698061482;
Received: from 30.97.48.63(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VuktnG._1698061482)
          by smtp.aliyun-inc.com;
          Mon, 23 Oct 2023 19:44:43 +0800
Message-ID: <111bf8cf-48d5-6433-6343-92415b919f52@linux.alibaba.com>
Date:   Mon, 23 Oct 2023 19:44:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V2 0/7] i2c: sprd: Modification of UNISOC Platform I2C
 Driver
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
References: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
From:   Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-13.2 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 10/23/2023 4:11 PM, Huangzheng Lai wrote:
> Recently, some bugs have been discovered during use, patch3 and
> patch5-6 are bug fixes. Also, this patchset add new features:
> patch1 allows I2C to use more frequencies for communication,
> patch2 allows I2C to use 'reset framework' for reset, and patch4 allows
> I2C controller to dynamically switch frequencies during use.

I suggest separating bugfix patches from feature patches to ensure that 
bugfix patches are reviewed and merged as soon as possible.

> 
> change in V2
> -Using 'I2C' instead of 'IIC' in the patch set.
> -Using imperative form in patch subject.
> -Use 'switch case' instead of 'else if' in PATCH 1/7.
> -Modify if (i2c_dev->rst != NULL) to if (i2c_dev->rst) in PATCH 2/7.
> -Modify some dev_err() to dev_warn() or dev_dbg().
> -Clear i2c_dev->ack_flag in sprd_i2c_clear_ack() in PATCH 3/7.
> -Modify the indentation format of the code in PATCH 4/7.
> -Move sprd_i2c_enable() above its caller in PATCH 5/7.
> -Remove 'Set I2C_RX_ACK when clear irq' commit.
> -Add Fixes tags.
> 
> Huangzheng Lai (7):
>    i2c: sprd: Add configurations that support 1Mhz and 3.4Mhz frequencies
>    i2c: sprd: Add I2C driver to use 'reset framework' function
>    i2c: sprd: Use global variables to record I2C ack/nack status instead
>      of local variables
>    i2c: sprd: Add I2C controller driver to support dynamic switching of
>      400K/1M/3.4M frequency
>    i2c: sprd: Configure the enable bit of the I2C controller before each
>      transmission initiation
>    i2c: sprd: Increase the waiting time for I2C transmission to avoid
>      system crash issues
>    i2c: sprd: Add I2C_NACK_EN and I2C_TRANS_EN control bits
> 
>   drivers/i2c/busses/i2c-sprd.c | 166 ++++++++++++++++++++++------------
>   1 file changed, 106 insertions(+), 60 deletions(-)
> 
