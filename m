Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A070360D89C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Oct 2022 02:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbiJZAyj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 20:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231259AbiJZAyi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 20:54:38 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB0661742F;
        Tue, 25 Oct 2022 17:54:35 -0700 (PDT)
Received: from canpemm500004.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mxqvn2sp9z15M4F;
        Wed, 26 Oct 2022 08:49:41 +0800 (CST)
Received: from [10.174.179.106] (10.174.179.106) by
 canpemm500004.china.huawei.com (7.192.104.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 26 Oct 2022 08:54:33 +0800
Subject: Re: [PATCH next v8 2/2] dt-bindings: i2c: add entry for
 hisilicon,i2c-ascend910
To:     Rob Herring <robh@kernel.org>
CC:     <yangyicong@hisilicon.com>, <wsa@kernel.org>,
        <linux-i2c@vger.kernel.org>, <xuwei5@huawei.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <robh+dt@kernel.org>
References: <20221024015151.342651-1-chenweilong@huawei.com>
 <20221024015151.342651-2-chenweilong@huawei.com>
 <166673852817.3415370.7297380833835419705.robh@kernel.org>
From:   chenweilong <chenweilong@huawei.com>
Message-ID: <2f3487da-3e81-3a52-d960-900bebb221fc@huawei.com>
Date:   Wed, 26 Oct 2022 08:54:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <166673852817.3415370.7297380833835419705.robh@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.179.106]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500004.china.huawei.com (7.192.104.92)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks a lot.

On 2022/10/26 6:55, Rob Herring wrote:
> On Mon, 24 Oct 2022 09:51:51 +0800, Weilong Chen wrote:
>> Add the new compatible for HiSilicon i2c.
>>
>> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
>> ---
>> Change since v7:
>> - Fix yamllint errors, rename i2c-xxx to i2c-ascend910
>> Link: https://lore.kernel.org/all/166635752527.3428089.707277745439761591.robh@kernel.org/
>>
>>  .../bindings/i2c/hisilicon,i2c-ascend910.yaml | 70 +++++++++++++++++++
>>  MAINTAINERS                                   |  1 +
>>  2 files changed, 71 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml
>>
> Reviewed-by: Rob Herring <robh@kernel.org>
>
> .


