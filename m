Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64DD32742A2
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Sep 2020 15:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbgIVNGI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 09:06:08 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:5966 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726621AbgIVNGI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 09:06:08 -0400
X-Greylist: delayed 2306 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Sep 2020 09:06:06 EDT
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08MCNMXA011348;
        Tue, 22 Sep 2020 14:27:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=PulH8/KyVbosigshNLGhJIIlNKvRQ2+ZYhMzd+2u6PM=;
 b=NP6qtgP1QSa/qjMFU6CLI2hZwWm8WFSUJ72kKEHTIVkON8s5UMLPICHEo+YdL90tbRIv
 b6+9PaFmR98UZZm0fRPEuZ2emg2mvyFBZDULZxnpMNMd0CkTHGpkU9uh1P9jpoOORkH7
 FRrqvwryc34PchpxAbLhPo9j1vrNcqKeVdwVOhS7vKF+ypoy69XLAtLJa4bi5fDW5Gja
 oBC/SwTAkK7/nWcGJxDw48uBeg/G0an6QnGv/97oQhj0S0lXXv0E9uvyKsojQX3yIjJm
 6PION8gp1S70sOAyY4wkdaAB7WF/gQWITKG7UEPga8MJ9ZCN8xHa/VeSm7uHd+hBGFIf IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33n74807gn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Sep 2020 14:27:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B7E4B10002A;
        Tue, 22 Sep 2020 14:27:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A1E5B2AD9FF;
        Tue, 22 Sep 2020 14:27:26 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.46) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Sep
 2020 14:27:25 +0200
Subject: Re: Upstream I2C driver that designed for rpmsg
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tomer Maimon <tmaimon77@gmail.com>
CC:     "wsa@kernel.org" <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "avi.fishman@nuvoton.com" <avi.fishman@nuvoton.com>,
        "eyal.cohen@nuvoton.com" <eyal.cohen@nuvoton.com>
References: <CAP6Zq1jrT-AmNT2J11OEk80=qL04=jCKTBoM-FLEt1na6d00kQ@mail.gmail.com>
 <20200922090956.GK3956970@smile.fi.intel.com>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <fc013df0-b670-eead-4c14-515af474fed3@st.com>
Date:   Tue, 22 Sep 2020 14:27:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922090956.GK3956970@smile.fi.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-22_12:2020-09-21,2020-09-22 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 9/22/20 11:09 AM, Andy Shevchenko wrote:
> On Tue, Sep 22, 2020 at 12:41:35AM +0300, Tomer Maimon wrote:
>> Hello all,
>>
>> Our BMC have two processors
>>
>>    1. main processors  - A35
>>    2. Coprocessor(CP) - M4.
>>
>> The BMC handles more than 30 I2C buses.
>>
>> We like to handle the I2C module in the Coprocessor for offload the i2c
>> transaction from main processor.
>>
>> The main processor is running Linux,
>>
>> The main processor and the CP communicate through rpmsg.
>>
>>  Is an I2C driver that designed for rpmsg will be up-streamed to Linux.Org?
> 
> There are examples in the kernel of indirect access to I2C host controllers
> which are parts of auxiliary micro controllers. I guess in principle it's okay
> and most of the success of the submission depends on implementation.
> 
> Nice to see such requirement.
We developed this type of driver in STMicroelectronics to be able to share an I2C
link between the main processor(Linux) and the coprocessor (Zephyr).
We plan to usptream it but some other patchsets currently in pipe are requested first.

The Linux driver is available here:
https://github.com/arnopo/linux/commit/747a05d4f3a875ff0b6ad3fc57965134d7a02ed3

The full project created for the ELCE 2019 is described in this page:
https://github.com/arnopo?tab=projects

Hope that this can help.

Regards,
Arnaud
