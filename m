Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCDF3789E5
	for <lists+linux-i2c@lfdr.de>; Mon, 10 May 2021 13:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbhEJLdZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 May 2021 07:33:25 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54176 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236419AbhEJLIF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 May 2021 07:08:05 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14AB6OKS091598;
        Mon, 10 May 2021 06:06:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1620644785;
        bh=kgaF/3mUI0XqQwl5gHvSVaucptcT977BMjdyeZjV5Lk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=sf4ia7RyjblXhg7Bf0hjzbRO0wFizxmPD7/1FSwmMDSAipAbfLIJecmO67YX2Xtgk
         LWVAKi/eTFVM0fIv1I7R7i6gAxbvkjzeixqrhZYHBMnhuSrfc4vmIh4hWUesLaE6WJ
         +eVOnFgmKu7q8GI3ZxPDI61j0bk3aqoNtGXpLTKw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14AB6OAO079251
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 May 2021 06:06:24 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 10
 May 2021 06:06:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 10 May 2021 06:06:24 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14AB6LHt121770;
        Mon, 10 May 2021 06:06:21 -0500
Subject: Re: [PATCH v2] dt-bindings: i2c: Move i2c-omap.txt to YAML format
To:     Tony Lindgren <tony@atomide.com>
CC:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Nishanth Menon <nm@ti.com>
References: <20210506140026.31254-1-vigneshr@ti.com>
 <f7570cb4-8c21-2fa5-bd26-1388f2a4bd6b@ti.com>
 <429a740a-c2b9-1cf8-ed2b-0fb7b1bea422@ti.com> <20210507163602.219894f4@aktux>
 <1ef076ac-e0de-a0df-a918-aeb8ed6c5956@ti.com>
From:   Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <e4fbdf7b-6556-eeba-c1b8-9d48f718437a@ti.com>
Date:   Mon, 10 May 2021 16:36:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1ef076ac-e0de-a0df-a918-aeb8ed6c5956@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tony,

On 5/7/21 10:54 PM, Grygorii Strashko wrote:
> 
> 
> On 07/05/2021 17:36, Andreas Kemnade wrote:
>> On Fri, 7 May 2021 19:45:45 +0530
>> Vignesh Raghavendra <vigneshr@ti.com> wrote:
>>
>>> On 5/7/21 12:24 PM, Grygorii Strashko wrote:
>>>>
>>>>
>>>> On 06/05/2021 17:00, Vignesh Raghavendra wrote:
>>>>> Convert i2c-omap.txt to YAML schema for better checks and
>>>>> documentation.
>>>>>
>>>>> Following properties were used in DT but were not documented in txt
>>>>> bindings and has been included in YAML schema:
>>>>> 1. Include ti,am4372-i2c compatible
>>>>> 2. Include dmas property used in few OMAP dts files
>>>>
>>>> The DMA is not supported by i2c-omap driver, so wouldn't be better to
>>>> just drop dmas from DTBs to avoid confusions?
>>>> It can be added later.
>>>>    
>>>
>>> Will do.. I will also send patches dropping dmas from dts that currently
>>> have them populated.
>>>
>> hmm, we have
>> - DO attempt to make bindings complete even if a driver doesn't
>> support some
>>    features. For example, if a device has an interrupt, then include the
>>    'interrupts' property even if the driver is only polled mode.
>>
>> in Documentation/devicetree/bindings/writing-bindings.rst
>> Shouln't the dma stay there if the hardware supports it? Devicetree
>> should describe the hardware not the driver if I understood things
>> right.
> 
> True.  But my above statement is also valid - it introduces confusion
> from user point of view.
> More over, 'dmas' is not part of original binding and were randomly
> added to some SoCs.
> And it's much more easy to extend binding (in the future) then remove
> something after.
> 
> I leave it to Vignesh, Tony to decide.
> 

What do you prefer here? Removing dmas from schema would mean I would
have to delete dmas property from omap2/3 dtsi files that list dmas
property today? Note that driver does not support DMA mode today.


Regards
Vignesh

