Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA26E271FD1
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgIUKSe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:18:34 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18351 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKSe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:18:34 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687d9d0004>; Mon, 21 Sep 2020 03:17:01 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:18:34 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:18:31 +0000
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
Subject: Re: [PATCH v7 01/34] i2c: tegra: Make tegra_i2c_flush_fifos() usable
 in atomic transfer
In-Reply-To: <20200908224006.25636-2-digetx@gmail.com>
References: <20200908224006.25636-2-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <962981f15b0c46b98ee97a75116a68ad@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683421; bh=71b9OPsGwFjxNUIJyhuwHE6AC7ShbTfyiZBTFJAh67w=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=FqysjnrWVyMFe+xrbIOdgjN86t7L3K40irAfzP3z3qEsUY5ssLRnzyP7vopu0zG9k
         DHWDvKW6l9yAQPJkMTHUN2KzrhyROtvnM+7fusVho8Vx01fF6I/SbS0L78VJN2zMFi
         RB+U62YiTqpD3YSq3PrvOTuY+v2Ueprsw0lvupUYARRPyYETj7BsSvt6m6lUrLp2Qm
         wokFoVBFWRPqOim5YyT97JGEKaTm84xri7tT7s0BdQxD2V250SCwWIqmNynE26+Rwg
         uTeCsy5rN5q8ChBhNcq8o1iytUmf0cgS9bZh/KTkm/mPCaSZ6PMLeRz44ih0GeBPaa
         3LSPKQIlnueFw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:33 +0300, Dmitry Osipenko wrote:
> The tegra_i2c_flush_fifos() shouldn't sleep in atomic transfer and jiffie=
s
> are not updating if interrupts are disabled. Let's switch to use iopoll
> API helpers for register-polling. The iopoll API provides helpers for bot=
h
> atomic and non-atomic cases.
>=20
> Note that this patch doesn't fix any known problem because normally FIFO
> is flushed at the time of starting a new transfer.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
