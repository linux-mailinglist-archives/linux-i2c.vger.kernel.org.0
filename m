Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61EA3D5A18
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jul 2021 15:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232955AbhGZMcS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jul 2021 08:32:18 -0400
Received: from phobos.denx.de ([85.214.62.61]:49434 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231874AbhGZMcR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 26 Jul 2021 08:32:17 -0400
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 9CCA48322E;
        Mon, 26 Jul 2021 15:12:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1627305165;
        bh=p3NJwtM/VyiPbTe+g0orgn6yYw1Z65KQJG09p5d9osY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EyoxrILbR9PbAZcq2HMn6GOro0q/C1VNmRqIKfeNw9+LWjlAyybGmROET692BLD3x
         Ida4B2Y90maJrkeik6BD1OzCazzPrndaQ5ruVF9IWqPygMNDLDGe6fLkLRkP98USH6
         vbtW5HPIqj8+5cP5w6QQaUpgRuGVLpLikrAzBnnNcEF86sCbbWpSeLqijI89R9VqRC
         W3/Q8vI06btYBnHC85lLyQsismf+LbnCnJsj2x3DpPCQ08W6vSegbo2X1Hkh6ssePD
         7XmrEmj0A3Br7U5omFYfR12/FdtwryA8yQaSeLTJ4aTx8jI0KfwaiwAMLCufEWqleh
         BeqOkvCaHwi6Q==
Subject: Re: [PATCH v2 00/10] i2c: xiic: Add features, bug fixes.
To:     Raviteja Narayanam <rna@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>, "joe@perches.com" <joe@perches.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
 <95162fd0-10e6-2bc6-4079-899ac26f66ce@xilinx.com>
 <0c51785f-9763-aebc-a9ea-04337ad1accc@denx.de>
 <SN6PR02MB40933E99A241952502B69F41CAE19@SN6PR02MB4093.namprd02.prod.outlook.com>
 <45aa8d2b-a077-32a2-0608-8f20a5b807a8@denx.de>
 <SN6PR02MB4093C7F2EB59D854D8753A01CAE29@SN6PR02MB4093.namprd02.prod.outlook.com>
 <328f6c4e-ff0b-c88f-d246-75b493b67a9a@denx.de>
 <SN6PR02MB4093E219E0BCE2C3CBCE472CCAE89@SN6PR02MB4093.namprd02.prod.outlook.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <5d49b316-6fcd-e677-578e-64b0ab5520ab@denx.de>
Date:   Mon, 26 Jul 2021 15:12:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <SN6PR02MB4093E219E0BCE2C3CBCE472CCAE89@SN6PR02MB4093.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/26/21 7:26 AM, Raviteja Narayanam wrote:

Hi,

[...]

>>>>> I have tested this again on our boards with eeprom and other
>>>>> sensors, this
>>>> is working fine for us.
>>>>
>>>> Can you share details of how those tests were performed ?
>>>
>>> Stress test - 1:
>>> Heavy ethernet traffic running in the background.
>>> I2c commands script (like below) running. We can see visible stutter in the
>> output as expected, but nothing failed.
>>>
>>> i=0
>>> while [ 1 ]
>>> do
>>> 		i2ctransfer -y -f 2 w1@0X54 0X00 r31@0X54
>>> 		i2ctransfer -y -f 2 w1@0X54 0X00 r32@0X54
>>> 		i2ctransfer -y -f 2 w1@0X54 0X00 r255@0X54
>>> 		i2ctransfer -y -f 2 w1@0X54 0X00 r273@0X54
>>>                                i2ctransfer -y -f 2 w1@0X54 0X00 r1@0X54
>>
>> Could it be that you never see the problem because you always talk to one
>> single device ?
> 
> There are transfers to other devices as well.

The above test only accesses device at address 0x54, right ?

> Our board has multiple power monitors, eeprom and other misc devices that
> are accessed through the same driver and are working fine.

That does not seem to be what the test above does .

>> Do you also test writes which are not 1 byte long ?
>>
> 
> Yes, like for eeprom 1 page (16 bytes)  is written.

I suspect the atmel mxt does much longer writes, try 255 bytes or so.

>>>           i=$(expr $i + 1)
>>>           echo "$i"
>>> done
>>>
>>> Stress test - 2:
>>> Two i2c scripts running in parallel with commands as shown above with
>> different bus numbers (as a result of mux), but going into same XIIC adapter.
>>> This is also working fine.
>>
>> Could it be the i2c-dev serializes each of those transfers , so no race can be
>> triggered ?
>>
> 
> Yes, that is true because all our tests are going through the i2c-core only
> and there is a lock at adapter level in the core.
> It has to be reproducible through the i2c standard interface, which is not
> happening at our setup.
> 
> I can take your patches that are targeted for this issue, rebase, test
> and send them.

I think you and Michal talked about getting the atmel mxt touchscreen, 
so you can test that yourself as well.
