Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14CD237697B
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 19:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbhEGR0U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 13:26:20 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45282 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232915AbhEGR0T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 May 2021 13:26:19 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 147HPA4M066732;
        Fri, 7 May 2021 12:25:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1620408310;
        bh=Mfe3VzxO5eVTgpcrjkbuWFbFY3AOvc+A6TkDDBQODfw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=wxkOJ9i3ToJ/P/tUmQgTIBndTsX7BGuoRHm4aSOLU+yK2W8nJ4qHCB3Z4w3SHGjFB
         0QSBLPalZP6KnIZyQ/qHWY/8vl2ZPezMEGJ65dJtpqQuwphIBOQrWcTbk6VqXqSRc2
         rWc8kFZ+sULQooEDGjtm3FepemCYpNf7wVlRKckU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 147HPAlJ042114
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 7 May 2021 12:25:10 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 7 May
 2021 12:25:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 7 May 2021 12:25:09 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 147HP62T106353;
        Fri, 7 May 2021 12:25:06 -0500
Subject: Re: [PATCH v2] dt-bindings: i2c: Move i2c-omap.txt to YAML format
To:     Andreas Kemnade <andreas@kemnade.info>,
        Vignesh Raghavendra <vigneshr@ti.com>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>
References: <20210506140026.31254-1-vigneshr@ti.com>
 <f7570cb4-8c21-2fa5-bd26-1388f2a4bd6b@ti.com>
 <429a740a-c2b9-1cf8-ed2b-0fb7b1bea422@ti.com> <20210507163602.219894f4@aktux>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <1ef076ac-e0de-a0df-a918-aeb8ed6c5956@ti.com>
Date:   Fri, 7 May 2021 20:24:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210507163602.219894f4@aktux>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 07/05/2021 17:36, Andreas Kemnade wrote:
> On Fri, 7 May 2021 19:45:45 +0530
> Vignesh Raghavendra <vigneshr@ti.com> wrote:
> 
>> On 5/7/21 12:24 PM, Grygorii Strashko wrote:
>>>
>>>
>>> On 06/05/2021 17:00, Vignesh Raghavendra wrote:
>>>> Convert i2c-omap.txt to YAML schema for better checks and documentation.
>>>>
>>>> Following properties were used in DT but were not documented in txt
>>>> bindings and has been included in YAML schema:
>>>> 1. Include ti,am4372-i2c compatible
>>>> 2. Include dmas property used in few OMAP dts files
>>>
>>> The DMA is not supported by i2c-omap driver, so wouldn't be better to
>>> just drop dmas from DTBs to avoid confusions?
>>> It can be added later.
>>>    
>>
>> Will do.. I will also send patches dropping dmas from dts that currently
>> have them populated.
>>
> hmm, we have
> - DO attempt to make bindings complete even if a driver doesn't support some
>    features. For example, if a device has an interrupt, then include the
>    'interrupts' property even if the driver is only polled mode.
> 
> in Documentation/devicetree/bindings/writing-bindings.rst
> Shouln't the dma stay there if the hardware supports it? Devicetree
> should describe the hardware not the driver if I understood things
> right.

True.  But my above statement is also valid - it introduces confusion from user point of view.
More over, 'dmas' is not part of original binding and were randomly added to some SoCs.
And it's much more easy to extend binding (in the future) then remove something after.

I leave it to Vignesh, Tony to decide.

-- 
Best regards,
grygorii
