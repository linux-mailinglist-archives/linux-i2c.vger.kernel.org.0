Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 335D32CD0BC
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 09:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgLCIDW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Dec 2020 03:03:22 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34292 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbgLCIDW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Dec 2020 03:03:22 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B381DS3099378;
        Thu, 3 Dec 2020 02:01:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606982473;
        bh=t3mia9tWr7VVYPxO7gEa0Qj6gwWziqiiNMTIVqvILto=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=w4mllMSBk8uEIu0v1CEb6TC/dl5nRxvQbXBIfVa9a8BD6UB68310/Wbb0Pw7AQcHY
         1nkWVMF82yEPhdvzAOGM3wZZIaJOmaX9eI7ba3qfmWa5UF243dASBguo1vdBttpTg6
         LdE8cyiSbHSpfES10g3b5JjD5QPYvhjhyiu6uSgU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B381DTi129337
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 3 Dec 2020 02:01:13 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 3 Dec
 2020 02:01:12 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 3 Dec 2020 02:01:12 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B381A2Z066616;
        Thu, 3 Dec 2020 02:01:11 -0600
Subject: Re: [v2] i2c: mediatek: Move suspend and resume handling to NOIRQ
 phase
To:     Qii Wang <qii.wang@mediatek.com>, Wolfram Sang <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>
References: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
 <20201202153543.GG874@kunai> <1606958735.25719.29.camel@mhfsdcap03>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <629d171a-0e77-3d74-ae23-e6439dcf17b7@ti.com>
Date:   Thu, 3 Dec 2020 10:01:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1606958735.25719.29.camel@mhfsdcap03>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 03/12/2020 03:25, Qii Wang wrote:
> On Wed, 2020-12-02 at 16:35 +0100, Wolfram Sang wrote:
>> Hi,
>>
>>> Some i2c device driver indirectly uses I2C driver when it is now
>>> being suspended. The i2c devices driver is suspended during the
>>> NOIRQ phase and this cannot be changed due to other dependencies.
>>> Therefore, we also need to move the suspend handling for the I2C
>>> controller driver to the NOIRQ phase as well.
>>>
>>> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
>>
>> Is this a bugfix and should go into 5.10? Or can it wait for 5.11?
>>
> 
> Yes, Can you help to apply it into 5.10? Thanks

To be honest if you still do have any i2c device which accessing i2c buss after _noirq
stage and your driver does not implement .master_xfer_atomic() - you definitely have a bigger problem.
So adding IRQF_NO_SUSPEND sound like a hack and probably works just by luck.


-- 
Best regards,
grygorii
