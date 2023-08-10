Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74DB1776E18
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Aug 2023 04:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbjHJCeF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Aug 2023 22:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjHJCeE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Aug 2023 22:34:04 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 072E41BF7;
        Wed,  9 Aug 2023 19:34:04 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RLrWx3vfBzkXxQ;
        Thu, 10 Aug 2023 10:31:09 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 10:33:59 +0800
Message-ID: <46a39960-ad79-ca65-6b2b-ccaf982965f5@huawei.com>
Date:   Thu, 10 Aug 2023 10:33:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 9/9] i2c: synquacer: Use dev_err_probe in probe
 function
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     <florian.fainelli@broadcom.com>, <rjui@broadcom.com>,
        <sbranden@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
        <yangyicong@hisilicon.com>, <aisheng.dong@nxp.com>,
        <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
        <kblaiech@nvidia.com>, <asmaa@nvidia.com>,
        <loic.poulain@linaro.org>, <rfoss@kernel.org>, <ardb@kernel.org>,
        <gcherian@marvell.com>, <linux-i2c@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230808012954.1643834-1-liaochang1@huawei.com>
 <20230808012954.1643834-10-liaochang1@huawei.com>
 <20230809192117.h7rn6vwmvxdnkr2a@intel.intel>
From:   "Liao, Chang" <liaochang1@huawei.com>
In-Reply-To: <20230809192117.h7rn6vwmvxdnkr2a@intel.intel>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi and Krzysztof,

在 2023/8/10 3:21, Andi Shyti 写道:
> Hi Liao,
> 
> On Tue, Aug 08, 2023 at 09:29:54AM +0800, Liao Chang wrote:
>> Use the dev_err_probe function instead of dev_err in the probe function
>> so that the printed messge includes the return value and also handles
>> -EPROBE_DEFER nicely.
>>
>> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> 
> After some discussions and time, I think it's right to r-b this
> patch. If you agree more with Krzysztof, feel free to follow his
> recommendation and send another version otherwise I will go ahead
> and take this series in my branch. I do not really mind, both
> arguments are valid.

I saw that Frank Li developed some new APIs that look like they would be very
helpful for aligning the error messages of devm_request_irq in device probes.
However, the patches have been pending for weeks and the author hasn't sent a
new version. So I'm not planning to switch to the new APIs in this patch series,
if there are no objections.

Do I need to resend a new revision to add your R-B at this patch?

Thanks.

> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 
> 
> Thanks,
> Andi

-- 
BR
Liao, Chang
