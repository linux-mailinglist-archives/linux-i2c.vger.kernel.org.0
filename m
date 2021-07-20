Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE613D03FF
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jul 2021 23:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbhGTVDT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Jul 2021 17:03:19 -0400
Received: from phobos.denx.de ([85.214.62.61]:48732 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231395AbhGTVDT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 20 Jul 2021 17:03:19 -0400
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 6F9188203B;
        Tue, 20 Jul 2021 23:43:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1626817436;
        bh=h5XEosukgF25k6st1HMBLCI5Q/k59LxbfCM5pDxEvgY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gLsbZzKhLgh8UO5gw1Eh2lo3dVKEQd0xD7vML9gdyraHkDwUJWBv+k2HXCPtIP/dD
         kQeWXRf4bCccf4tLg/93uPkr1YaEpzx0FVIYczLLZ/qH2HsSxIf/ukZj4qLMBgjB5M
         WYek5HU8pRipqyd7isYGBku+EMjjZMKQu+XEtnwnNSLpaTaqErQgmZql63hgfM4pw7
         LxIRuJm3vCP56TYOz2eCq9krVvSfI449FsB0cCG7L670ysjDs4q/XKsQh/ei73srrE
         Mvlf4xo7dFpy2GiVJ8Z/nyM9dUCgivZFF0E5MpJKL6oF3nNQ2QRtY/6Uu/69LMZUWI
         DyvnpMkkFqZPg==
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
From:   Marek Vasut <marex@denx.de>
Message-ID: <328f6c4e-ff0b-c88f-d246-75b493b67a9a@denx.de>
Date:   Tue, 20 Jul 2021 23:43:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <SN6PR02MB4093C7F2EB59D854D8753A01CAE29@SN6PR02MB4093.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/20/21 4:19 PM, Raviteja Narayanam wrote:

Hi,

[...]

>>> I have tested this again on our boards with eeprom and other sensors, this
>> is working fine for us.
>>
>> Can you share details of how those tests were performed ?
> 
> Stress test - 1:
> Heavy ethernet traffic running in the background.
> I2c commands script (like below) running. We can see visible stutter in the output as expected, but nothing failed.
> 
> i=0
> while [ 1 ]
> do
> 		i2ctransfer -y -f 2 w1@0X54 0X00 r31@0X54
> 		i2ctransfer -y -f 2 w1@0X54 0X00 r32@0X54
> 		i2ctransfer -y -f 2 w1@0X54 0X00 r255@0X54
> 		i2ctransfer -y -f 2 w1@0X54 0X00 r273@0X54
>                               i2ctransfer -y -f 2 w1@0X54 0X00 r1@0X54

Could it be that you never see the problem because you always talk to 
one single device ?

Do you also test writes which are not 1 byte long ?

>          i=$(expr $i + 1)
>          echo "$i"
> done
> 
> Stress test - 2:
> Two i2c scripts running in parallel with commands as shown above with different bus numbers (as a result of mux), but going into same XIIC adapter.
> This is also working fine.

Could it be the i2c-dev serializes each of those transfers , so no race 
can be triggered ?

> Stress test - 3:
> Two i2c scripts running in parallel with same commands in separate terminals. This is also working fine.
> 
>  From your log, the race condition is occurring at boot time during i2c clients registration. I am starting a similar test at my setup
> to reproduce this issue at boot time.

Thank you
