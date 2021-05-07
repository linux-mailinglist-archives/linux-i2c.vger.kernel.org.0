Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66EC83766EE
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 16:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233086AbhEGOQ5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 10:16:57 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48898 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232425AbhEGOQ5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 May 2021 10:16:57 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 147EFnSf005121;
        Fri, 7 May 2021 09:15:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1620396949;
        bh=4D2+cJcfYR+9E1VxlwKJN1FU3lCcQC3cZ5PS/TtHCdU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ohnf/5FlNU2m4pxCslicxnGFrWwEe0vONbVx6G2MWhTq1GS+40/6KVJH2Hg13ounR
         DVn0uVXJMppfw9GrSWlMTrxXIiO4NdiPyjE05BXJJ2z8vBA+QCTHdWOJKpGwVbpTIQ
         xRlINoQCo21vyi6NgSEDmANDCIU8Ii+gKipms9LU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 147EFnCL044215
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 7 May 2021 09:15:49 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 7 May
 2021 09:15:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 7 May 2021 09:15:49 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 147EFkKP009850;
        Fri, 7 May 2021 09:15:47 -0500
Subject: Re: [PATCH v2] dt-bindings: i2c: Move i2c-omap.txt to YAML format
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-omap@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>
References: <20210506140026.31254-1-vigneshr@ti.com>
 <f7570cb4-8c21-2fa5-bd26-1388f2a4bd6b@ti.com>
From:   Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <429a740a-c2b9-1cf8-ed2b-0fb7b1bea422@ti.com>
Date:   Fri, 7 May 2021 19:45:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f7570cb4-8c21-2fa5-bd26-1388f2a4bd6b@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 5/7/21 12:24 PM, Grygorii Strashko wrote:
> 
> 
> On 06/05/2021 17:00, Vignesh Raghavendra wrote:
>> Convert i2c-omap.txt to YAML schema for better checks and documentation.
>>
>> Following properties were used in DT but were not documented in txt
>> bindings and has been included in YAML schema:
>> 1. Include ti,am4372-i2c compatible
>> 2. Include dmas property used in few OMAP dts files
> 
> The DMA is not supported by i2c-omap driver, so wouldn't be better to
> just drop dmas from DTBs to avoid confusions?
> It can be added later.
> 

Will do.. I will also send patches dropping dmas from dts that currently
have them populated.

Regards
Vignesh
