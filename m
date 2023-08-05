Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADBC0770D57
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 04:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbjHECos (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 22:44:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjHECor (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 22:44:47 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A454EDB
        for <linux-i2c@vger.kernel.org>; Fri,  4 Aug 2023 19:44:46 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RHn1q37y5zVk2P;
        Sat,  5 Aug 2023 10:42:55 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 5 Aug 2023 10:44:43 +0800
Message-ID: <b5fbdc3f-0404-c939-9f33-8d7489c19921@huawei.com>
Date:   Sat, 5 Aug 2023 10:44:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next] i2c: stm32: fix the return value handle for
 platform_get_irq()
To:     Andi Shyti <andi.shyti@kernel.org>,
        <pierre-yves.mordret@foss.st.com>, <alain.volmat@foss.st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
References: <20230731112755.1943630-1-ruanjinjie@huawei.com>
 <169119887102.1781235.17733733758389845864.b4-ty@kernel.org>
Content-Language: en-US
From:   Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <169119887102.1781235.17733733758389845864.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2023/8/5 9:29, Andi Shyti wrote:
> Hi
> 
> On Mon, 31 Jul 2023 19:27:55 +0800, Ruan Jinjie wrote:
>> There is no possible for platform_get_irq() to return 0,
>> and the return value of platform_get_irq() is more sensible
>> to show the error reason.
>>
>>
> 
> With the commit log fixed, applied to i2c/andi-for-next on

Thank you!

> 
> https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git
> 
> Please note that this patch may still undergo further evaluation
> and the final decision will be made in collaboration with
> Wolfram.
> 
> Thank you,
> Andi
> 
> Patches applied
> ===============
> [1/1] i2c: stm32: fix the return value handle for platform_get_irq()
>       commit: 603b3cf89d8a96cc0e51eb15853f28944eb78f31
> 
