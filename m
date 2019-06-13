Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1C143B10
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 17:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbfFMPZo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 11:25:44 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:10339 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731447AbfFMLwm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jun 2019 07:52:42 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d02390a0000>; Thu, 13 Jun 2019 04:52:42 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 13 Jun 2019 04:52:41 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 13 Jun 2019 04:52:41 -0700
Received: from [10.19.64.157] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Jun
 2019 11:52:38 +0000
Subject: Re: [PATCH V5 6/7] i2c: tegra: fix PIO rx/tx residual transfer check
To:     Wolfram Sang <wsa@the-dreams.de>, Bitan Biswas <bbiswas@nvidia.com>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
 <1560250274-18499-6-git-send-email-bbiswas@nvidia.com>
 <20190612102458.liieiohnprfyyvs6@ninjato>
CC:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Peter Rosin <peda@axentia.se>,
        Dmitry Osipenko <digetx@gmail.com>,
        Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
From:   Laxman Dewangan <ldewangan@nvidia.com>
Message-ID: <5841fe57-fe68-aab3-670c-26b40a5d46ae@nvidia.com>
Date:   Thu, 13 Jun 2019 17:22:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20190612102458.liieiohnprfyyvs6@ninjato>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560426762; bh=4GNpl2C5MkJ7qm6iQsmPTjK0AsO1VZMKhAHhpEoyZFc=;
        h=X-PGP-Universal:Subject:To:References:CC:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding;
        b=Ogs+PHz8UmxItlj3UHUjXm1IcxQEub1X6F4rDj7AoE284OiR19hDtl/yU4ndiZpSN
         RrapEMbC8y2TP39K9oxZ+kgiHZIMNSxH4zLSV6k4JnZM1iZ/Ld1jyUYkDhE0cQhmLk
         tgFSUclCq2G7rxEG+9Cr4PbLsx8oZV3tu/3D+LCzGUSnAY7hM8r0a1Jk3kfnb4dhbG
         uC3uCP2IbEysHvFWHB10QpiYXN+Q3IcwDBmCgJcOpoNa+1sxNyzHXacZTqkQV9S6Pg
         Ny0Nx98ZmrDxNddJ2syngoTigcZ0348R6IgRdDNMRJDQmfITYP4EcHFgD/6hoddAoL
         thvy0McLJhlyw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On Wednesday 12 June 2019 03:54 PM, Wolfram Sang wrote:
> On Tue, Jun 11, 2019 at 03:51:13AM -0700, Bitan Biswas wrote:
>> Fix expression for residual bytes(less than word) transfer
>> in I2C PIO mode RX/TX.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> I applied patches 1-5 to my for-next tree now. No need to resend them
> anymore, you can focus on the remaining patches now.
>
> Question: The nominal maintainer for this driver is
>
>          Laxman Dewangan <ldewangan@nvidia.com> (supporter:TEGRA I2C DRIVER)
>
> I wonder if he is still around and interested?
>
> That aside, thanks a lot Dmitry for the review of this series!
>
Most of patches are coming from the downstream as part of upstream 
effort. Hence not reviewing explicitly.


