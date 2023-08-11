Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 468B6778E86
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Aug 2023 14:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233238AbjHKMBG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Aug 2023 08:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231285AbjHKMBF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Aug 2023 08:01:05 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C2410F;
        Fri, 11 Aug 2023 05:01:00 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37B88G8v008911;
        Fri, 11 Aug 2023 14:00:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        message-id:date:mime-version:subject:to:cc:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        selector1; bh=YFHcudHf3KpEu6VK+Oi7sDZa7u7aRH57T4p90BFxYt4=; b=kU
        O35PwDwyu9KjgW31K5h+6ypqbjSO6SxBadYITZWgPgbjcx7JybnAtEPYUufCNZ1c
        UmcJYsfb4v5cYrhDkibKKDxm5TpRLh/usyV9eplTbzPk8FWxlpA11SMe+tWFoHtE
        nXPAN596HtBzcvDnDHR0ekdCH486R0r+TxPzL9tozmYQYoPWnnLGInYl3MRzO4Ve
        mX/GHIkPAIGcQsdV9V/wrcIE3MhSv5JVpUfvddbdbHMcOV/6LpEQ9KIuJdAz19XH
        RJctqFi0wSAJ+BRNaqX/iLjVk/ggN6VW/unTU9UDPsJ6xBkOROMcl3YQW+ceqGTb
        HV30OC1Vqh+PAlrRr7vg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sdh74h9vb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 11 Aug 2023 14:00:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 64D9710004F;
        Fri, 11 Aug 2023 14:00:27 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 287D02171E0;
        Fri, 11 Aug 2023 14:00:27 +0200 (CEST)
Received: from [10.201.21.121] (10.201.21.121) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 11 Aug
 2023 14:00:25 +0200
Message-ID: <4f0f9d6c-ce4d-73a2-60bf-801c1a1d6cc3@foss.st.com>
Date:   Fri, 11 Aug 2023 14:00:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [IGNORE][PATCH v4 01/11] dt-bindings: Document common device
 controller bindings
Content-Language: en-US
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
From:   Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <2023081117-sprout-cruncher-862c@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-11_02,2023-08-10_01,2023-05-22_02
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 8/11/23 12:16, Greg KH wrote:
> On Fri, Aug 11, 2023 at 12:07:21PM +0200, Gatien Chevallier wrote:
>> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
>>
>> Introducing of the common device controller bindings for the controller
>> provider and consumer devices. Those bindings are intended to allow
>> divided system on chip into multiple domains, that can be used to
>> configure hardware permissions.
>>
>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>> [Gatien: Fix typos and YAML error]
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>>
>> Changes in V4:
>> 	Corrected typos and YAML errors	
> 
> Why are we supposed to ignore the first patch in this series, but pay
> attention to the 10 after this that depend on it?
> 
> totally confused,
> 
> greg k-h

Hello Greg,

I'm sorry that this tag troubles your review. It was first suggested
in [1]. The "IGNORE" means ignore review on this thread, as it is still
under review in another thread (Link in the cover letter). It does not
mean that the content should be ignored for the series. I will change
this to something else as this is obviously confusing the review.

@Oleksii, can we imagine integrating this patch to this series or do
you prefer to keep it apart?

Should I consider a resend with another tag if Oleksii prefers to keep
this patch apart?

[1] 
https://lore.kernel.org/all/1e498b93-d3bd-bd12-e991-e3f4bedf632d@linaro.org/

Best regards,
Gatien
