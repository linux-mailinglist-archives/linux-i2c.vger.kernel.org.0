Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C62AF7B3359
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 15:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233248AbjI2NTe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 09:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233156AbjI2NTd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 09:19:33 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B74EE7;
        Fri, 29 Sep 2023 06:19:31 -0700 (PDT)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38TABSom007571;
        Fri, 29 Sep 2023 15:18:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        message-id:date:mime-version:subject:from:to:cc:references
        :in-reply-to:content-type:content-transfer-encoding; s=
        selector1; bh=KMM5HFfGi3/V+NX/zIj16MtndrNJ3wjO6VBqQEWwOzE=; b=ga
        rM6WT7soC9Qg5lgEynlNIDEz19ICFxdBxx8K4WKaa81yBoo69ZoqQgPtPJrk+yqH
        6Ke+T4tgb/wvQ7+D6b8/REeHXj+x3qhuVXstjmlbfDXVsD7fnq1otz0IBlMfWVfL
        E4pait5J8DRp751sajaRVoUu+IBQuOKISwGGaDU+w8jkYTr9fXxKlpYDQovtoe8f
        gElrQ2fdRogxsh24zwaguSO+d3txrH3Ag2t7373pPcvxthqul803q1iHU52Zkj5N
        HDkK8wgJgLFXVxL19kvPUsq9yAyQ76DfuoiJhXjgKUsphyNPOIYM5JXL5gCdij8s
        EmQ/SdD52jWC2koKfFGg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ta9k0s0fb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 29 Sep 2023 15:18:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE29710002A;
        Fri, 29 Sep 2023 15:18:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4AB3A2865FC;
        Fri, 29 Sep 2023 15:18:48 +0200 (CEST)
Received: from [10.201.20.32] (10.201.20.32) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 29 Sep
 2023 15:18:46 +0200
Message-ID: <6e419e89-10f1-e448-10fe-64f1ea9ff862@foss.st.com>
Date:   Fri, 29 Sep 2023 15:18:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [IGNORE][PATCH v4 01/11] dt-bindings: Document common device
 controller bindings
From:   Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <Oleksii_Moisieiev@epam.com>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <alexandre.torgue@foss.st.com>, <vkoul@kernel.org>,
        <jic23@kernel.org>, <olivier.moysan@foss.st.com>,
        <arnaud.pouliquen@foss.st.com>, <mchehab@kernel.org>,
        <fabrice.gasnier@foss.st.com>, <andi.shyti@kernel.org>,
        <ulf.hansson@linaro.org>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <hugues.fruchet@foss.st.com>,
        <lee@kernel.org>, <will@kernel.org>, <catalin.marinas@arm.com>,
        <arnd@kernel.org>, <richardcochran@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>, <peng.fan@oss.nxp.com>,
        <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-media@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <20230811100731.108145-1-gatien.chevallier@foss.st.com>
 <20230811100731.108145-2-gatien.chevallier@foss.st.com>
 <2023081117-sprout-cruncher-862c@gregkh>
 <4f0f9d6c-ce4d-73a2-60bf-801c1a1d6cc3@foss.st.com>
Content-Language: en-US
In-Reply-To: <4f0f9d6c-ce4d-73a2-60bf-801c1a1d6cc3@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-29_11,2023-09-28_03,2023-05-22_02
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 8/11/23 14:00, Gatien CHEVALLIER wrote:
> 
> 
> On 8/11/23 12:16, Greg KH wrote:
>> On Fri, Aug 11, 2023 at 12:07:21PM +0200, Gatien Chevallier wrote:
>>> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
>>>
>>> Introducing of the common device controller bindings for the controller
>>> provider and consumer devices. Those bindings are intended to allow
>>> divided system on chip into multiple domains, that can be used to
>>> configure hardware permissions.
>>>
>>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>>> [Gatien: Fix typos and YAML error]
>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>> ---
>>>
>>> Changes in V4:
>>>     Corrected typos and YAML errors
>>
>> Why are we supposed to ignore the first patch in this series, but pay
>> attention to the 10 after this that depend on it?
>>
>> totally confused,
>>
>> greg k-h
> 
> Hello Greg,
> 
> I'm sorry that this tag troubles your review. It was first suggested
> in [1]. The "IGNORE" means ignore review on this thread, as it is still
> under review in another thread (Link in the cover letter). It does not
> mean that the content should be ignored for the series. I will change
> this to something else as this is obviously confusing the review.
> 
> @Oleksii, can we imagine integrating this patch to this series or do
> you prefer to keep it apart?
> 

Hi,

after a discussion with Oleksii: I'll rename the binding to narrow
down its scope and integrate the patch in my series. This way, I'll drop
the [IGNORE] tag.

=> I'll stick with the generic binding for V5 (Sorry for the misleading
    information in the previous mail)

Best regards,
Gatien

> Should I consider a resend with another tag if Oleksii prefers to keep
> this patch apart?
> 
> [1] 
> https://lore.kernel.org/all/1e498b93-d3bd-bd12-e991-e3f4bedf632d@linaro.org/
> 
> Best regards,
> Gatien
