Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 938635967A
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2019 10:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfF1IxF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jun 2019 04:53:05 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36336 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726431AbfF1IxE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jun 2019 04:53:04 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5S8qwtl090825;
        Fri, 28 Jun 2019 03:52:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561711978;
        bh=s6Qrrrvm1pvduF1jVmT3oz+jOvVyYBP1mFLaUgRMnC4=;
        h=From:Subject:To:CC:References:Date:In-Reply-To;
        b=MR7Z+Uer5CDQ9n+64R3MyDIMIQkCO9iM2mXvw1RmdkDc2ATZ2PRIPhSsc3Mk4a4Yl
         nrl0opxBKlNvwBLcwO+R6yxaYRQFJYp9irqxKb+BdJJO0C1j4JAGYZwniLvg6YfL8h
         +/hAnwc4POka+MpGaUVNktkKtYcG2a18Vf5BlOAM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5S8qvkd007561
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 28 Jun 2019 03:52:58 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 28
 Jun 2019 03:52:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 28 Jun 2019 03:52:57 -0500
Received: from [172.24.145.117] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5S8qtjw050681;
        Fri, 28 Jun 2019 03:52:55 -0500
From:   Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] dt-bindings: i2c: omap: Add new compatible for J721E SoCs
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20190605084504.2777-1-vigneshr@ti.com>
 <20190626134302.GM801@ninjato>
Message-ID: <a6cc4e71-e717-2f6e-5662-84067e1b979f@ti.com>
Date:   Fri, 28 Jun 2019 14:22:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190626134302.GM801@ninjato>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 26/06/19 7:13 PM, Wolfram Sang wrote:
> On Wed, Jun 05, 2019 at 02:15:04PM +0530, Vignesh Raghavendra wrote:
>> From: Peter Ujfalusi <peter.ujfalusi@ti.com>
>>
>> J721E SoCs have same I2C IP as OMAP SoCs. Add new compatible to
>> handle J721E SoCs.
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> 
> Applied to for-next, thanks!
> 

Thanks!

> Sorry for the delay, I was waiting for an ack to show up. I totally
> missed you are the maintainer :( Won't happen again!
> 

No worries :)

Regards
Vignesh
