Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA9343B22
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 17:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727290AbfFMP0b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 11:26:31 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:8638 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729165AbfFMLnm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jun 2019 07:43:42 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0236ed0000>; Thu, 13 Jun 2019 04:43:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 13 Jun 2019 04:43:41 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 13 Jun 2019 04:43:41 -0700
Received: from [10.19.65.14] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Jun
 2019 11:43:37 +0000
Subject: Re: [PATCH V5 6/7] i2c: tegra: fix PIO rx/tx residual transfer check
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Peter Rosin <peda@axentia.se>,
        "Dmitry Osipenko" <digetx@gmail.com>,
        Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
 <1560250274-18499-6-git-send-email-bbiswas@nvidia.com>
 <20190612102458.liieiohnprfyyvs6@ninjato>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <2157c7f9-fe83-2fd6-745e-4a4283a2293f@nvidia.com>
Date:   Thu, 13 Jun 2019 04:43:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612102458.liieiohnprfyyvs6@ninjato>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560426221; bh=OTRRal3/SqNWKvrRP4mxKVhuOpOkfAWN1luMPgJFCbs=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=UOJA6IDRtWFI9H69sNPaAuTN/acWQ0Njt5onyc0RtodwSJxDqqxHde2JIhCU0bxx/
         R6KdysrodVxr1qSNnttlsUgv+kOdsoSIuq9ZtG3gwQPlrW6bsahI5jgY7PFGPWXrV1
         UTZBFQMa5FvlDDpwEJQ0ryf9QYQCvam6EyiKdR8YLHvB5TJGbAGuhQEwa8Cf4VXIgs
         pcvkZHSU3gYKy2xfXpqddYOxKPpDmTpan9gJZPt1hrcgXKmuzU8rC901FE8fUtsRwu
         o5efMpAJn+wM44xF5m/fNEuFuSNl6EkeWk4VAyLBB2p49C4rx7AT5dww0RTcxsEqBL
         57yk4Lpwb46Mw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/12/19 3:24 AM, Wolfram Sang wrote:
> On Tue, Jun 11, 2019 at 03:51:13AM -0700, Bitan Biswas wrote:
>> Fix expression for residual bytes(less than word) transfer
>> in I2C PIO mode RX/TX.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> 
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
Thanks Wolfram. I shall work on remaining patches.



