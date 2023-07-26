Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDD6B7633CF
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 12:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233882AbjGZKdd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 06:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233978AbjGZKdO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 06:33:14 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DC42126;
        Wed, 26 Jul 2023 03:33:12 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q7mv1w023788;
        Wed, 26 Jul 2023 12:32:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=9yD7Nv7FYCjZKupHugyp8v0ln3IVhj6t3qswQoubo9I=;
 b=rBYW43mlRrhhdX9YMbXL6MMRxpbClCpyZo8hKb2ZeqvJnN4hLiJ2zeBKq1nRYtvi538r
 wZRLFFB+hcO6jGWBE42hoauMRye1r0di2ci68xHmuXMBhqPc9es8J2VAp8e/Xn9KPSte
 l8ORxx9XceUspSSRZ487Vufjk+kxD0ko5guDlsgfccvfgAJ155tYfRqh+OhAicoocP+x
 itOth/GA8OgZa/04xw6Sqt8HEcnfENZuQBt6mj3giT0jhnaxxpZXbOdb1bLXv7yoxEEu
 Ej29kl9hMVZKhi1F/gCpeDX96ei7fWdwUQwULwbKeZsSUoCDj08qQyAZzARRd4+m3C0B Bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s2ye8h9ag-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Jul 2023 12:32:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 22EAF10002A;
        Wed, 26 Jul 2023 12:32:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EFB91216ED5;
        Wed, 26 Jul 2023 12:32:33 +0200 (CEST)
Received: from [10.201.21.121] (10.201.21.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 26 Jul
 2023 12:32:31 +0200
Message-ID: <46d4b5d2-55ca-0af3-bb02-7d49d9d2d4fa@foss.st.com>
Date:   Wed, 26 Jul 2023 12:32:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 07/11] bus: rifsc: introduce RIFSC firewall controller
 driver
Content-Language: en-US
To:     Simon Horman <simon.horman@corigine.com>
CC:     <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <vkoul@kernel.org>, <jic23@kernel.org>,
        <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
        <mchehab@kernel.org>, <fabrice.gasnier@foss.st.com>,
        <andi.shyti@kernel.org>, <ulf.hansson@linaro.org>,
        <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
        <hugues.fruchet@foss.st.com>, <lee@kernel.org>, <will@kernel.org>,
        <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
        <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-media@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <20230725164104.273965-1-gatien.chevallier@foss.st.com>
 <20230725164104.273965-8-gatien.chevallier@foss.st.com>
 <ZMD027pTNT/HCLe6@corigine.com>
From:   Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <ZMD027pTNT/HCLe6@corigine.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_04,2023-07-25_01,2023-05-22_02
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 7/26/23 12:26, Simon Horman wrote:
> On Tue, Jul 25, 2023 at 06:41:00PM +0200, Gatien Chevallier wrote:
> 
> ...
> 
>> diff --git a/drivers/bus/stm32_rifsc.c b/drivers/bus/stm32_rifsc.c
> 
> ...
> 
>> +static int stm32_rif_acquire_semaphore(struct stm32_firewall_controller *stm32_firewall_controller,
>> +				       int id)
>> +{
>> +	void __iomem *addr = stm32_firewall_controller->mmio + RIFSC_RISC_PER0_SEMCR + 0x8 * id;
>> +
>> +	__set_bit(SEMCR_MUTEX, addr);
> 
> Hi Gatien,
> 
> Sparse seem a bit unhappy about this.
> 
>   .../stm32_rifsc.c:83:9: warning: cast removes address space '__iomem' of expression
>   .../stm32_rifsc.c:83:9: warning: incorrect type in argument 2 (different address spaces)
>   .../stm32_rifsc.c:83:9:    expected unsigned long volatile *addr
>   .../stm32_rifsc.c:83:9:    got void [noderef] __iomem *addr
>   .../stm32_rifsc.c:83:9: warning: incorrect type in argument 2 (different address spaces)
>   .../stm32_rifsc.c:83:9:    expected unsigned long volatile *addr
>   .../stm32_rifsc.c:83:9:    got void [noderef] __iomem *addr
> 
> But it's not immediately apparent to me what a good solution is.
> 

Hi Simon,

This is indeed incorrect, set_bit is used to modify bit fields, not
writing to a register. I'll change to writel, as in
stm32_rif_release_semaphore(). Thank you for pointing this out.

Best regards,
Gatien
>> +
>> +	/* Check that CID1 has the semaphore */
>> +	if (stm32_rifsc_is_semaphore_available(addr) ||
>> +	    FIELD_GET(RIFSC_RISC_SCID_MASK, readl(addr)) != RIF_CID1)
>> +		return -EACCES;
>> +
>> +	return 0;
>> +}
> 
> ...
