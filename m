Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D813B222E93
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 01:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbgGPXIh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 19:08:37 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14623 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgGPXIg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 19:08:36 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f10dd010000>; Thu, 16 Jul 2020 16:04:33 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 16 Jul 2020 16:06:29 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 16 Jul 2020 16:06:29 -0700
Received: from [10.2.163.115] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Jul
 2020 23:06:27 +0000
Subject: Re: [RFC PATCH v3 16/18] gpu: host1x: mipi: Split
 tegra_mipi_calibrate and tegra_mipi_wait
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
 <1594786855-26506-17-git-send-email-skomatineni@nvidia.com>
 <a06dec8f-7042-767b-545b-048685a7683d@gmail.com>
 <20d63eca-4b2b-584e-a391-a4fb64a16b40@nvidia.com>
 <c4945c77-5de1-e9b1-9f4f-cdd78bca18c7@gmail.com>
 <ce0c5ffb-f859-0eab-1ea5-044623dff221@nvidia.com>
 <a2b8169c-c4a3-4862-cd27-8c1a51ddc558@gmail.com>
 <4690e682-8495-2327-87c7-c2f06a7a479d@nvidia.com>
Message-ID: <66812127-38cf-2af3-51c0-50edbe446e73@nvidia.com>
Date:   Thu, 16 Jul 2020 16:09:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4690e682-8495-2327-87c7-c2f06a7a479d@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594940673; bh=Z4JZpBtLsxYQwYWYUS7JvDfbpdedkjBLLYi0PiWmXmk=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=kw25KOP8ZMu/3RgD066xjNLJQmMe1Yn3cDZuI6pFYiSjZP6mRBPPgRhCQQbpAmN3Q
         PRMHAmEOlmegOMdVPB2B7B2WS91FjBaAOAsFq0u7gX+vJ0QbKlLEksLJ2WECLXNpRY
         mPTZMMtIg+piKtlW8nq7wqbWd6v7/kOah8aRXyea0X8tDC8dAHKIFctIbtBiWqQAbz
         AizGcKDNNwHaPBVh7UB41U/Zq/RysGV0dJgV7Q9yT2y35aww8u7MyYqI4JvGsaHBi7
         l06K+Pe6Uhb71lcOxypn3fA+QPLOODOerBWJaN5JB5dCvY42NSgzonbPxwIPKSRSVk
         G39XvkISUav8A==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/16/20 4:06 PM, Sowjanya Komatineni wrote:
>
> On 7/16/20 4:01 PM, Dmitry Osipenko wrote:
>> 17.07.2020 01:49, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> What keeps MIPI clock enabled after completion of the
>>>> tegra_mipi_calibrate() invocation?
>>> MIPI clock is disabled at end of tegra_mipi_calibrate and is re-enabled
>>> during tegra_mipi_wait.
>>>
>>> I think I should fix this to keep the clock enabled till calibration
>>> results are latched.
>>>
>>> All consumers of tegra_mipi_calibrate() will call tegra_mipi_wait().
>>>
>>> So will remove clk_disable mipi clk at end of tegra_mipi_calibrate()=20
>>> and
>>> clk_enable mipi_clk at beginning of tegra_mipi_wait()
>> Isn't it possible to perform the calibration after enabling CSI and
>> before of starting the sensor streaming?
> Currently this is what I am doing. Triggering calibration start during=20
> CSI receiver being ready and then sensor streaming will happen where=20
> internal MIPI CAL detects for LP -> HS transition and applies results=20
> to pads. So checking for calibration results after sensor stream is=20
> enabled

1. Calling tegra_mipi_calibrate() during CSI streaming where CSI pads=20
are enabled and receiver is kept ready

2. Start Sensor stream

3. Calling tegra_mipi_wait() to check for MIPI Cal status.

So as mipi cal clk need to be kept enabled till 3rd step, we can enable=20
clock during tegra_mipi_calibrate() and leave it enabled and disable it=20
in tegra_mipi_wait after status check.

