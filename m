Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB2C3D957F
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Jul 2021 20:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbhG1Sre (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Jul 2021 14:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbhG1Sre (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Jul 2021 14:47:34 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E1CC061757;
        Wed, 28 Jul 2021 11:47:31 -0700 (PDT)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id DD0AD82AE5;
        Wed, 28 Jul 2021 20:47:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1627498047;
        bh=zIdPGhc6P9y10bJIyxKHkuhJwK0+TrueUOdXoKwFtoU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=r7jgyxys7q9VpG9O1NdIIO0QwjqKzQJV+BB3gg8qKXsDLzVxmsKMvWb4S1Q63dt3V
         2OnHwL07cAkHeMkeerIsICOU5x2YKMbfCb+3SSaRkKoOtiFTfULGs20NiiCbE76V4y
         FgdDTAA/8WZLN+dk4OwDTti9mRrwdO/1cX+bcTUrC2KybxM+cpJNV16WJxRDsvjGIF
         +b+85cTNKzg5BWsZgAdGT1UX4v1a+MVdRsY8FAnHddLIExSWSN3FfZ744UlCe6YBDl
         WmZPq34hR62de1MQxyE3aPgxBqRa88cf3KcyEUppUf98NO4DDHK11pTchR2L2nXoMN
         7DX/xqnl8CvDw==
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
 <5d49b316-6fcd-e677-578e-64b0ab5520ab@denx.de>
 <SN6PR02MB4093ACD6E6A349BA9740ABB9CAEA9@SN6PR02MB4093.namprd02.prod.outlook.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <d70b569d-a0e3-81b0-a553-ed88423924f7@denx.de>
Date:   Wed, 28 Jul 2021 20:47:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <SN6PR02MB4093ACD6E6A349BA9740ABB9CAEA9@SN6PR02MB4093.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/28/21 12:11 PM, Raviteja Narayanam wrote:
[...]

>>>>>>> I have tested this again on our boards with eeprom and other
>>>>>>> sensors, this
>>>>>> is working fine for us.
>>>>>>
>>>>>> Can you share details of how those tests were performed ?
>>>>>
>>>>> Stress test - 1:
>>>>> Heavy ethernet traffic running in the background.
>>>>> I2c commands script (like below) running. We can see visible stutter
>>>>> in the
>>>> output as expected, but nothing failed.
>>>>>
>>>>> i=0
>>>>> while [ 1 ]
>>>>> do
>>>>> 		i2ctransfer -y -f 2 w1@0X54 0X00 r31@0X54
>>>>> 		i2ctransfer -y -f 2 w1@0X54 0X00 r32@0X54
>>>>> 		i2ctransfer -y -f 2 w1@0X54 0X00 r255@0X54
>>>>> 		i2ctransfer -y -f 2 w1@0X54 0X00 r273@0X54
>>>>>                                 i2ctransfer -y -f 2 w1@0X54 0X00
>>>>> r1@0X54
>>>>
>>>> Could it be that you never see the problem because you always talk to
>>>> one single device ?
>>>
>>> There are transfers to other devices as well.
>>
>> The above test only accesses device at address 0x54, right ?
> 
> Above code is just one part.
> We are doing read/writes to all devices present on this board https://www.xilinx.com/support/documentation/boards_and_kits/zcu102/ug1182-zcu102-eval-bd.pdf

Can you share details of how those tests were performed ?

>>> Our board has multiple power monitors, eeprom and other misc devices
>>> that are accessed through the same driver and are working fine.
>>
>> That does not seem to be what the test above does .
>>
>>>> Do you also test writes which are not 1 byte long ?
>>>>
>>>
>>> Yes, like for eeprom 1 page (16 bytes)  is written.
>>
>> I suspect the atmel mxt does much longer writes, try 255 bytes or so.
> 
> Ok, I will do longer writes (in the range of 255) on supported slave devices.

Thank you
