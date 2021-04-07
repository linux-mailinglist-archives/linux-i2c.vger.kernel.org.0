Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E88E3565AC
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 09:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244730AbhDGHqC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 03:46:02 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51680 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240787AbhDGHqB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Apr 2021 03:46:01 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1377jaR1054304;
        Wed, 7 Apr 2021 02:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1617781536;
        bh=xJ+7JHvMKy97Iq5jhZv0GDQP4glZmSZPs3NNd9WqIz4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ckOZwBH2lAxhmYfiaQMvHZvGCMcCXLo6tVH2Rw46LA510qJ9FYLYcY8sCgk3FE1nx
         RBRzB3ryvmyrmSBksXNusl5ugom/5swL/M12vVCCphlpXwWs8aQK9QpCJh0pBvMWoi
         8eRCoAENZz3zWSenfUeoo81MWgdYHNmcPgzNAyKA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1377jas6013696
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Apr 2021 02:45:36 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 7 Apr
 2021 02:45:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 7 Apr 2021 02:45:36 -0500
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1377jXEN005249;
        Wed, 7 Apr 2021 02:45:34 -0500
Subject: Re: [PATCH] i2c: omap: Fix rumtime PM imbalance on error
To:     Tony Lindgren <tony@atomide.com>
CC:     Dinghao Liu <dinghao.liu@zju.edu.cn>, <kjlu@umn.edu>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        <linux-omap@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20210407033030.13419-1-dinghao.liu@zju.edu.cn>
 <e2b5dc55-e084-c4e5-4eb0-749e2922a602@ti.com> <YG1Qt56QSjyFqZxd@atomide.com>
From:   Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <30ed0224-fba3-75c6-c4aa-e2d0724c291b@ti.com>
Date:   Wed, 7 Apr 2021 13:15:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YG1Qt56QSjyFqZxd@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 4/7/21 11:57 AM, Tony Lindgren wrote:
> * Vignesh Raghavendra <vigneshr@ti.com> [210407 06:20]:
>> Do we need a Fixes: tag to enable stable backports?
> 
> Well pm_runtime_resume_and_get() was introduced quite recently, and
> we already handle the error and bail out. And likely after an error
> not much works anyways :) So it might be better to add just a stable
> tag v5.10 and later as further backports are not likely needed.
> 

Agree this is not a critical patch for backport. But I do know that
pm_runtime_resume_and_get() is backported to v5.4 stable kernel at least
[1]. So stable tag with v5.4 perhaps would probably help tools looking
for patches to backport.

[1] https://lkml.org/lkml/2020/12/28/588

> Naturally nothing stopping doing separate backports if really needed
> though.
> 
> Regards,
> 
> Tony
> 

Regards
Vignesh
