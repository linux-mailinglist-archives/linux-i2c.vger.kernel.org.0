Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDA0146E56
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jun 2019 06:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbfFOEgW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jun 2019 00:36:22 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:4963 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbfFOEgV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Jun 2019 00:36:21 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0475c50000>; Fri, 14 Jun 2019 21:36:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 14 Jun 2019 21:36:20 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 14 Jun 2019 21:36:20 -0700
Received: from [10.19.65.14] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 15 Jun
 2019 04:36:17 +0000
Subject: Re: [PATCH V3] i2c: busses: tegra: Add suspend-resume support
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559885867-10190-1-git-send-email-bbiswas@nvidia.com>
 <20190614211129.GG17899@ninjato>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <758d6dc2-f044-6be3-6896-196ef477d393@nvidia.com>
Date:   Fri, 14 Jun 2019 21:36:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614211129.GG17899@ninjato>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560573381; bh=zKvceDuv/JF8j1ssRzcXp5+vH6JuGqO/9rX5bdOKL74=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=pN5YI6SEtJioKgnMxQSNksTu8VtUHWDU7CYkOrkSpXTMTz4Njzu6VLhkUUnYvHGdr
         1EoJKPpZGa+NG4zUqYzeIZiaaQ99XPSRtQD8d/nDjnh61SZf7Eti0wOMy6SzN2Ku/Y
         MwFFC6TaOCzZG+vMv0NJhozaZ3Vp5ydRlSX5qriF9u2QOaQaibg2/LPNQcvNkAsVfJ
         dBIFr5wvUsexDJYADad5O5iLHblplfQimtQsKEhBmeU/49V3BzY5p7DEAWYdg7XvMt
         MwRnglSdp6XBvgOSNuDxKruqCSci2GqQA8AkuD/nfpoczLRAR5iHXzVgfRxs7+hipV
         lsPJd+mn3p+Zg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/14/19 2:11 PM, Wolfram Sang wrote:
> On Thu, Jun 06, 2019 at 10:37:47PM -0700, Bitan Biswas wrote:
>> Post suspend I2C registers have power on reset values. Before any
>> transfer initialize I2C registers to prevent I2C transfer timeout
>> and implement suspend and resume callbacks needed. Fix below errors
>> post suspend:
>>
>> 1) Tegra I2C transfer timeout during jetson tx2 resume:
>>
>> [   27.520613] pca953x 1-0074: calling pca953x_resume+0x0/0x1b0 @ 2939, parent: i2c-1
>> [   27.633623] tegra-i2c 3160000.i2c: i2c transfer timed out
>> [   27.639162] pca953x 1-0074: Unable to sync registers 0x3-0x5. -110
>> [   27.645336] pca953x 1-0074: Failed to sync GPIO dir registers: -110
>> [   27.651596] PM: dpm_run_callback(): pca953x_resume+0x0/0x1b0 returns -110
>> [   27.658375] pca953x 1-0074: pca953x_resume+0x0/0x1b0 returned -110 after 127152 usecs
>> [   27.666194] PM: Device 1-0074 failed to resume: error -110
>>
>> 2) Tegra I2C transfer timeout error on jetson Xavier post resume.
>>
>> Remove i2c bus lock-unlock calls in resume callback as i2c_mark_adapter_*
>> (suspended-resumed) help ensure i2c core calls from client are not
>> executed before i2c-tegra resume.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> 
> Applied to for-next, thanks!
> 
> Without a maintainer ack, this is an exception this time. Should we add
> Dmitry as another maintainer or reviewer at least?
> 
I shall followup with Maintainer for ACK in future I2C tegra patches. 
Probably maintainers or reviewers should comment here.

