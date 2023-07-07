Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2C6374B483
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jul 2023 17:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjGGPpJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jul 2023 11:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjGGPpI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jul 2023 11:45:08 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3859F173B;
        Fri,  7 Jul 2023 08:45:07 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 367CH9mW027393;
        Fri, 7 Jul 2023 17:44:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=UirHfJWJ0M0c3P66CSNWUmzBZIs0e0lzSHowOTIQOxY=;
 b=R077onV69jpX15gfnwED6gCxOl6yExQaqxA53M7kAUStTuqI6BK8nT5z07EXtUEmHolY
 riyqdNY+iqw2vdORFsm8Ff3OR9V6cs5mzg/rbN1iDNyCpDtaXAmAKIeIylrkc1PkUjmO
 hchsdwamHlynmEL1RY40fiFNk47LZKTBA5P1Qhnz+JMV18+Ew+dTtXCkzH1eRGffvA8x
 wlSz5XaqZE2Y2se0KTE7WNPLGB6T8d3cDevC2/gA7JAHKnptpGkPK72PlMBcPaae7E88
 vBYPyaIvZL1KHTdsxqUau3JWVd60dpGsiUNHy8ji7tFOVFiy85DSPwi1zOkp0W8r83d2 SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rpjjtsepn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Jul 2023 17:44:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 39181100050;
        Fri,  7 Jul 2023 17:44:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0FC1C22A6F1;
        Fri,  7 Jul 2023 17:44:36 +0200 (CEST)
Received: from [10.201.21.121] (10.201.21.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 7 Jul
 2023 17:44:34 +0200
Message-ID: <c6533f17-6100-5901-7281-256bff5db773@foss.st.com>
Date:   Fri, 7 Jul 2023 17:44:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 05/10] firewall: introduce stm32_firewall framework
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
        <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-media@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-6-gatien.chevallier@foss.st.com>
 <2023070748-false-enroll-e5dc@gregkh>
 <febd65e1-68c7-f9d8-c8a4-3c3e88f15f3e@foss.st.com>
 <2023070744-superjet-slum-1772@gregkh>
From:   Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <2023070744-superjet-slum-1772@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_10,2023-07-06_02,2023-05-22_02
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 7/7/23 17:10, Greg KH wrote:
> On Fri, Jul 07, 2023 at 04:00:23PM +0200, Gatien CHEVALLIER wrote:
>> I'll change to (GPL-2.0-only OR BSD-3-Clause) :)
> 
> If you do that, I'll require a lawyer to sign off on it to verify that
> you all know EXACTLY the work involved in dealing with dual-licensed
> kernel code.  Sorry, licenses aren't jokes.

I was worried about the interactions with software running on BSD
license, hence my (poorly written) proposal. Looking back at it
there's no good reason to use a dual-license here.
GPL-2.0-only is fine.

> 
> thanks,
> 
> greg k-h
