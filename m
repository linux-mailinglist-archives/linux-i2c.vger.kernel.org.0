Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFB423406AD
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 14:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbhCRNR2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 09:17:28 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:26268 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230458AbhCRNRC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Mar 2021 09:17:02 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12ID1rwX030658;
        Thu, 18 Mar 2021 14:16:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Q3fg+ZhC8rZuokIL+rmXhyDST60kwy28bssDlRJCJTs=;
 b=UI1PqTnpEkDEbAg4dEZJeMIWaZqEa+9pMo6F9AzVYrmqtw7DheWkSTRf2jSnjNDRQnJ1
 zJF7ADFpgt8BjmYD80UNPbt+CgoHNJjNr58JVxdBrER4m0Mmi/hRjmjih3m4HRawkg7A
 csqhnLwzNBoCVRJeNplZF3ZIy00hTZNQJZnxCK++djXmqP9Wg91pP3v5vje3USFr82bw
 gxRBW2mOYvMKJKbS28lIr9jK4zl+N90pg6Iur7viWaCc+T0mfRR5nFVW6QKkpwyikSOs
 FcwuFd04eU2WolVY+PsdFLaNIQhX541kbImpg6oo0p36b3rD26UdaIHs50FD/uW1pGHe 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37a8prbg9q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 Mar 2021 14:16:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 51B6210002A;
        Thu, 18 Mar 2021 14:16:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1086824E75B;
        Thu, 18 Mar 2021 14:16:46 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 18 Mar
 2021 14:16:45 +0100
Subject: Re: [PATCH 4/5] ARM: dts: stm32: enable the analog filter for all I2C
 nodes in stm32mp151
To:     Wolfram Sang <wsa@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <pierre-yves.mordret@foss.st.com>, <mcoquelin.stm32@gmail.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-5-git-send-email-alain.volmat@foss.st.com>
 <20210318105537.GF974@ninjato>
From:   Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <52fc8d91-8799-65fd-a72a-1707ae3e3a10@foss.st.com>
Date:   Thu, 18 Mar 2021 14:16:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210318105537.GF974@ninjato>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-18_07:2021-03-17,2021-03-18 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram

On 3/18/21 11:55 AM, Wolfram Sang wrote:
> On Fri, Feb 05, 2021 at 09:51:43AM +0100, Alain Volmat wrote:
>> Enable the analog filter for all I2C nodes of the stm32mp151.
>>
>> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> I usually don't take DTS patches, but they can go in now via arm-soc as
> I applied the patches to the driver.
> 

I'll take it in my stm32 tree.

Thanks
Alex

