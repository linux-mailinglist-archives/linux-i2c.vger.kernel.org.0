Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 473BA4CAB5
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 11:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbfFTJYG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 05:24:06 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:15092 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfFTJYF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jun 2019 05:24:05 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0b50b30001>; Thu, 20 Jun 2019 02:24:03 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 20 Jun 2019 02:24:04 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 20 Jun 2019 02:24:04 -0700
Received: from [10.19.64.157] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Jun
 2019 09:24:00 +0000
Subject: Re: [PATCH V9] i2c: tegra: remove BUG() macro
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Osipenko <digetx@gmail.com>
References: <1560856182-26072-1-git-send-email-bbiswas@nvidia.com>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
From:   Laxman Dewangan <ldewangan@nvidia.com>
Message-ID: <bac4fc16-858f-0ede-0c36-7c60e215ea77@nvidia.com>
Date:   Thu, 20 Jun 2019 14:53:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1560856182-26072-1-git-send-email-bbiswas@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561022644; bh=rlztNEug3hk4IBq5DjW1s4T+e1rUkPC3E75CrKzHJRY=;
        h=X-PGP-Universal:Subject:To:References:CC:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding;
        b=aFykmx6XFhAy9pbHntU+O7i8L7t2m79gU0JV5gtCDxcImL/RinX1L0IjiqtCmdiiO
         1e+5WzFUMlDlA+2lu0y4gBLm8KHQMBUXZRfXYbCjTTTGDSo2mFYBkJ3aNZUlw6uSmv
         w5YvVpMNG2BqBznTBlil29B7EiuCgNjeW9YBmc0dW494BCP0Ma3xZ4BRfm9Sk/NRod
         aET96y5A888cPGwqbiKZAHacRntZ8Cy4Oc+KS8ORPT7sLDffGZrx9RIGoH7gOz5TAU
         g4f2nX2u6e0BukYgz/LHB8M4GnApanOS7op3xnsZtZ1i9a83tH18ORCXCImbrvRwGA
         3Y60TqFR+Ujcw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On Tuesday 18 June 2019 04:39 PM, Bitan Biswas wrote:
> The usage of BUG() macro is generally discouraged in kernel, unless
> it's a problem that results in a physical damage or loss of data.
> This patch removes unnecessary BUG() macros and replaces the rest
> with warning.
>
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>
Acked By: Laxman Dewangan <ldewangan@nvidia.com>

Thanks,
Laxman
