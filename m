Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4489271FDC
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgIUKSu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:18:50 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18391 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKSu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:18:50 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687dad0001>; Mon, 21 Sep 2020 03:17:17 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:18:49 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:18:47 +0000
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
Subject: Re: [PATCH v7 05/34] i2c: tegra: Initialize div-clk rate unconditionally
In-Reply-To: <20200908224006.25636-6-digetx@gmail.com>
References: <20200908224006.25636-6-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <238021dd88bc4ea0b05741e4aaea4a2c@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:18:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683437; bh=GdUdGuEwK3gLtJ5vljhV/GamQM64F2exH2SILqeCkZI=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=Kl787cYK3jlGkLLuCoxeNwNClnukjYYR6R45Qv8r5rpEVYRRYkJXU6gvr9qaxDXON
         YTZWvvC6QTtp/gMj5UeVZhLrzPF37q8d/KVZPP+CrxvYs1sImr2u5cUtV+KZe5S0UC
         vgpPJ8AwMdf7asaRGXyUSyn0pGniUMHqky6t6/7ruPmG1AxYgo6Y+EHmHkDtcTFGxb
         Xsyb5+dBoypvM9iWzMrwdo+D4x6zCRBc3ALvHWMxVdMpqQ351c3TercsQXYQKbZxKb
         x9PaNpwflK4jTNj2hdbZWEcfoUtKvS1Uwze+i3YBgrpGKbxWN2qa22xqK0wgZlJVrm
         qitiFHR0Wybgw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:37 +0300, Dmitry Osipenko wrote:
> It doesn't make sense to conditionalize the div-clk rate changes because
> rate is fixed and it won't ever change once it's set at the driver's prob=
e
> time. All further changes are NO-OPs because CCF caches rate and skips
> rate-change if rate is unchanged.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 34 ++++++++++++++++------------------
>  1 file changed, 16 insertions(+), 18 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
