Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D947F3747D4
	for <lists+linux-i2c@lfdr.de>; Wed,  5 May 2021 20:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234421AbhEESHH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 May 2021 14:07:07 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51260 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234699AbhEESFt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 May 2021 14:05:49 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 145I4oiF022670;
        Wed, 5 May 2021 13:04:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1620237890;
        bh=voglt/7KPPYLxmIoYxRRKgvVDOk+aVkXcY+27aQZalQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=K1iQ0xebp3qm7TvCAVKd4h2bd7QUm3B+P/aE6OyfSMV1bgtjIvaLoGOrm6z6f+UAG
         D4Y6gtXy7laHD2fK3vlA5U27qaQQLzmuy51Lv5z8Txu/iIu1Xz3Ssv79WC6MWEsoYj
         8v0hgM2utrh1yKGS32z1B9spDaRtn97SFbmoe1Co=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 145I4oJL062506
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 5 May 2021 13:04:50 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 5 May
 2021 13:04:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 5 May 2021 13:04:49 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 145I4ksL068808;
        Wed, 5 May 2021 13:04:47 -0500
Subject: Re: [PATCH] dt-bindings: i2c: Move i2c-omap.txt to YAML format
To:     Tony Lindgren <tony@atomide.com>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>
References: <20210505065511.918-1-vigneshr@ti.com>
 <YJJGsGXBz56Nhe8z@atomide.com>
From:   Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <ade03294-6c1a-ce10-1ac9-c67c8e51b137@ti.com>
Date:   Wed, 5 May 2021 23:34:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YJJGsGXBz56Nhe8z@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 5/5/21 12:48 PM, Tony Lindgren wrote:
> Hi,
> 
> * Vignesh Raghavendra <vigneshr@ti.com> [210505 06:55]:
>> Convert i2c-omap.txt to YAML schema for better checks and documentation.
> 
> Nice to see this happening, few minor comments below on handling the
> legacy devices.
> 
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: ti,omap2420-i2c
>> +      - const: ti,omap2430-i2c
>> +      - const: ti,omap3-i2c
>> +      - const: ti,omap4-i2c
>> +      - items:
>> +          - enum:
>> +              - ti,am4372-i2c
>> +              - ti,am64-i2c
>> +              - ti,am654-i2c
>> +              - ti,j721e-i2c
>> +          - const: ti,omap4-i2c
> 
> I wonder if we should just add all the compatible options to the
> driver, and have all these as oneOf?
> 

This would also need updates to dts files too. Also not a fan of adding
all compatibles to driver code unless required.

>> +  ti,hwmods:
>> +    description:
>> +      Must be "i2c<n>", n being the instance number (1-based)
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    items:
>> +      - pattern: "^i2c([1-9])$"
> 
> The ti,hwmods is a legacy property that is only needed for omap2/3 and
> ti81xx. At least the description should mention that to avoid folks
> adding it accidentally.
> 

Sure, will do in v2. Thanks for the review!


Regards
Vignesh
