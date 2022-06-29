Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3BC856031A
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 16:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232169AbiF2Oel (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 10:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232106AbiF2Oeh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 10:34:37 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D1330F50;
        Wed, 29 Jun 2022 07:34:36 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 5AF5C84494;
        Wed, 29 Jun 2022 16:34:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1656513274;
        bh=/Fd+eJIPYTYUSe4sDxSud4LH/iglwDgSy2LCtvqC2x4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=WjALHu6SDZ7B1zMuUWgkLoh2SRn2U8aOqLpHgyo0sJF8iu0gQkAIXJ/UkcRGjK51P
         B8FEYTJJMbZLHrb2XSd/KnnGaiZTIhg4Lov1ii8dv5TjfYpNMkJOpY0hUsstcvDhrF
         dy4ujebJ83wdFQJZXidSrc8HdJsLeKAEzY+YCcfuZWOmy2+GxwPnt2jjeml2bXF3nm
         UzUOADWlknJJNmMTjwPjhJO2DKlfTw/1OasRpipVULUcpxw/wPoLBZRPW8ZZgchLFd
         sBbFnMevUeBHd59By+jB6PxP2WHijXprbFphz0j6zEZKKCY2zsoW71FTRQsA1jymfH
         oMiP9nhCNjKJg==
Message-ID: <49884f95-5d22-ad65-6ea2-69b0277b096a@denx.de>
Date:   Wed, 29 Jun 2022 16:34:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 03/10] i2c: xiic: Switch to Xiic standard mode for
 i2c-read
Content-Language: en-US
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        linux-i2c@vger.kernel.org, michal.simek@xilinx.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com, joe@perches.com
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
 <20210626102806.15402-4-raviteja.narayanam@xilinx.com>
 <ad7626bd-bcbb-48fc-5e32-bc95fafcb917@nokia.com>
 <80c524c3-8c31-346d-2691-48f93fa6001f@denx.de>
 <6cf9647e-10dd-8523-962d-a7c40b532fe2@nokia.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <6cf9647e-10dd-8523-962d-a7c40b532fe2@nokia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/29/22 16:09, Krzysztof Adamski wrote:
> Hi Marek,
> 
> W dniu 29.06.2022 o 16:05, Marek Vasut pisze:
>>> [...]
>>>
>>> If those two modes only differ in software complexity but we are not
>>> able to support only the simpler one and we have support for the more
>>> complicated (standard mode) anyways, we know that standard mode
>>> can handle or the cases while dynamic mode cannot, we also know that
>>> dynamic mode is broken on some versions of the core, why do we actually
>>> keep support for dynamic mode?
>>
>> If I recall it right, the dynamic mode was supposed to handle 
>> transfers longer than 255 Bytes, which the core cannot do in Standard 
>> mode. It is needed e.g. by Atmel MXT touch controller. I spent a lot 
>> of time debugging the race conditions in the XIIC, which I ultimately 
>> fixed (the patches are upstream), but the long transfers I rather 
>> fixed in the MXT driver instead.
>>
>> I also recall there was supposed to be some update for the XIIC core 
>> coming with newer vivado, but I might be wrong about that.
> 
> It seems to be the other way around - dynamic mode is limited to 255 
> bytes - when you trigger dynamic mode you first write the address of the 
> slave to the FIFO, then you write the length as one byte so you can't 
> request more than 255 bytes. So *standard* mode is used for those 
> messages. In other words - dynamic mode is the one that is more limited 
> - everything that you can do in dynamic mode you can also do in standard 
> mode. So why don't we use standard mode always for everything?

Sigh, it's been a year since I looked into this, sorry.

One of the modes is maybe not supported on all the XIIC core instances ?
