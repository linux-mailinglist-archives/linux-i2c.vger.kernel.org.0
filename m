Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE6B271FEB
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgIUKTT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:19:19 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18173 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKTS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:19:18 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e190001>; Mon, 21 Sep 2020 03:19:05 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:19:18 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:19:15 +0000
From:   Thierry Reding <treding@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 12/34] i2c: tegra: Use clk-bulk helpers
In-Reply-To: <20200908224006.25636-13-digetx@gmail.com>
References: <20200908224006.25636-13-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <0799b40862af4a09b7af1611aaa87180@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683545; bh=zRPJTEsnmRU5IqT3OerrwBeHVjixnFZGCq2uCc5M6to=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=BbuxaQrL0z/1DUQp+HvXVoz8OCxuyiUhLh815+5UfAd2LTz50EvtsN7qVWX9j6F2h
         QSSTWVhnqrqjAMHoomnfOVj5L7gYkKa6cZWiDbxUnU8gfB7EH9bJGvkmtXe9496C/C
         xdJrpnXcgUPC1vWJ1juO3CV68aiPwsev+qkM1I/4XE9gZV77g+uemS+/dHJg5va1CG
         w+cnPX5QEvw4+XqC936tuEK072jOESxgkc4B9lecDnfsV3dP+wEshaYo+xAE/C8D13
         aWdY9RO0mR3I3WvU+0lT5j+wLnrjsZn4Rr2Odc7BsHItPbi+s23cqHOpGIslwkFLrX
         oARATL72bPQUw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:44 +0300, Dmitry Osipenko wrote:
> Use clk-bulk helpers and factor out clocks initialization into separate
> function in order to make code cleaner.
> 
> The clocks initialization now performed after reset-control initialization
> in order to avoid a noisy -PROBE_DEFER errors on T186+ from the clk-bulk
> helper which doesn't silence this error code. Hence reset_control_get()
> now may return -EPROBE_DEFER on newer Tegra SoCs because they use BPMP
> driver that provides reset controls and BPMP doesn't come up early during
> boot. Previously rst was protected by the clocks retrieval and now this
> patch makes dev_err_probe() to be used for the rst error handling.
> 
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 187 ++++++++++++---------------------
>  1 file changed, 67 insertions(+), 120 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
