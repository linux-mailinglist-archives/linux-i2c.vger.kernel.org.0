Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 024A14F5CD3
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 13:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbiDFL6X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Apr 2022 07:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232251AbiDFL5o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Apr 2022 07:57:44 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27CA5255D6
        for <linux-i2c@vger.kernel.org>; Wed,  6 Apr 2022 00:26:54 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id bg10so2413787ejb.4
        for <linux-i2c@vger.kernel.org>; Wed, 06 Apr 2022 00:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yuM6R8v8TiPq5FdXnzgHGP6cxLXx2tfXvc1fPQGyPBI=;
        b=p6Pc0ixT7qxKXk+mxDu2v4XYCIZeEosUb3J0LRs+z66/uFVsXJwBQcIHLeAJCLEZqm
         BDP+rEgxhCs10j5/OzaNq75QgoD5JDu54ZWzYoVZGhIEObUWPAbMNWX0eSeBAkgR9QUh
         HmwNWIexmyxLuiIXhCIcls/oPEWhm6QUWRaIefiArso7wXQJT7x9S1c755ixecS9fAZW
         Nb56Ykvbmf3dAY/A8PtcXLpyBHu3vy/jboCZEMr++Db2ISpbG7ZILEf4iyLuOqbz9Cgh
         cfpuxhjQMP26bNGNhfJRM1N1Y+frlLWH7WpI2sGqvy6bqioT9sItLEM9UyNKOafhwh6d
         NJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yuM6R8v8TiPq5FdXnzgHGP6cxLXx2tfXvc1fPQGyPBI=;
        b=Wyui4XEeanjsdyx81V4kDGnE9jGtZvWOETC1tFQM+NMzqjBcEDo4lImDd6hsxyJJLb
         iLz1JJ2DLQkSb3jRvafFU5FUub3OLf+NV/RXVT7VRdd/AX6jFrp0ga8exRcMoTRULD1S
         yIeGKhOZLgsjOZItIXWLYiKS39KPp8VZ1SiS/z5RebFl3g/aekzdNgYYdN+ZMvdw+DNw
         I/ipAET6c+oHPSw3q12K9QGv+TD9OooiwcjjaGPkwSLx7L9Bo2Wstp1L25tCXK3Pt6Yq
         vgKoyR3O9SC4/DwIJpYW2BRJECyHwVahTH4n14UuuMkI4XrjBamQT5BvwOzav7XYnJkT
         W8vg==
X-Gm-Message-State: AOAM533MDk6Z/8YRpFDzF4Qq6JAmMOt874GYlSscOmOL9kktyzoTHOwX
        wNbS4yorOou1fStteUPoJnW7ZWfaP0S1FwBZ
X-Google-Smtp-Source: ABdhPJwkyCtsJH2vwIdQXVVX2u6O4ZU+EN9y3XsOqCwJVzVWy6LcXdfv65/APnX6lC9vhfF9bwaN9Q==
X-Received: by 2002:a17:907:c16:b0:6db:682:c8c9 with SMTP id ga22-20020a1709070c1600b006db0682c8c9mr7206485ejc.153.1649230013464;
        Wed, 06 Apr 2022 00:26:53 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id o12-20020a50c90c000000b0041907e62024sm7510979edh.85.2022.04.06.00.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Apr 2022 00:26:53 -0700 (PDT)
Message-ID: <315c957b-8d22-dcef-a5b8-36e92f0897be@linaro.org>
Date:   Wed, 6 Apr 2022 09:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] i2c: add binding to prevent device detection
Content-Language: en-US
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     "wsa@kernel.org" <wsa@kernel.org>, kernel <kernel@axis.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220405121627.1560949-1-vincent.whitchurch@axis.com>
 <20220405121627.1560949-2-vincent.whitchurch@axis.com>
 <e3247f0f-5d3d-d981-699e-7dcedb30f881@linaro.org>
 <20220405141255.GD28574@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220405141255.GD28574@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05/04/2022 16:12, Vincent Whitchurch wrote:
> On Tue, Apr 05, 2022 at 03:57:16PM +0200, Krzysztof Kozlowski wrote:
>> On 05/04/2022 14:16, Vincent Whitchurch wrote:
>>>  Documentation/devicetree/bindings/i2c/i2c.txt | 4 ++++
>>
>> Use the subject matching the subsystem (git log --oneline -- .......).
> 
> I did look at the git log when writing the subject, but there's a bunch
> of variation there so I went for the subject prefix which Wolfram
> himself used since I assumed he would be the one applying these patches.
> 
> $ git log -n5 --oneline origin/master -- Documentation/devicetree/bindings/i2c/i2c.txt
> 6881e493b08f dt-bindings: net: New binding mctp-i2c-controller
> 168290fb2675 i2c: add binding to mark a bus as supporting SMBus-Alert
> e6277308ac21 i2c: add binding to mark a bus as SMBus
> db36e827d876 dt-bindings: i2c: add generic properties for GPIO bus recovery
> fad5972a1eca i2c: add 'single-master' property to generic bindings

The proper command for a subsystem is:
git log --oneline -- Documentation/devicetree/bindings/i2c/

and then you see mostly different pattern.

Other way, like for example Mark Brown prefers, is:
i2c: dt-bindings:
It would be fine as well, but the point is that you did not include the
dt-bindings prefix here at all and almost always I ignore all such emails.

>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
>>> index fc3dd7ec0445..5f7bdf4851e8 100644
>>> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
>>> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
>>> @@ -72,6 +72,10 @@ wants to support one of the below features, it should adapt these bindings.
>>>  	this information to adapt power management to keep the arbitration awake
>>>  	all the time, for example. Can not be combined with 'single-master'.
>>>  
>>> +- no-detect
>>> +	states that the system should not attempt to automatically detect
>>> +	devices which are not explicitly specified as child nodes.
>>
>> Focus on the hardware, not on system and behavior. The hardware property
>> is that bus is completely described in Devicetree or detection does not
>> work correctly. I guess the property name could stay like this, but the
>> description could be rephrased.
> 
> I'm having a hard time drawing the line between hardware and the
> "system" here.  The bus being completely described in devicetree doesn't
> sound like a hardware property to me, but, yes, I can change the
> description to say that.

Then you need to come up with better description. :) By system I
understood here Operating System, therefore a Software piece or pieces.
Bindings should not rather focus on hardware instead of referencing
software. Software actually not matter for the bindings... There is
quite clear distinction between hardware and operating system...

Can you explain why do you think "bus being completely described" is not
a hardware description? Bindings and DTS describe hardware, so one of
parts of such description is whether nodes and other properties are
present. If all child nodes are present in DT - no-detect - and this is
a purely hardware point of view. No software here.

Best regards,
Krzysztof
