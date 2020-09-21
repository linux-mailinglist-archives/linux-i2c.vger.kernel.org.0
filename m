Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B582720B4
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgIUKYN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:24:13 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9091 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727276AbgIUKYK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:24:10 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687df00003>; Mon, 21 Sep 2020 03:18:24 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:19:09 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:19:07 +0000
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
Subject: Re: [PATCH v7 10/34] i2c: tegra: Use devm_platform_get_and_ioremap_resource()
In-Reply-To: <20200908224006.25636-11-digetx@gmail.com>
References: <20200908224006.25636-11-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <4d954388499e4499a86a1f0bf03f59ea@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:19:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683504; bh=oFIkYpjTxeNbvN+wHYAPcdazlkcTZgVsdBYwQPQHa6E=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=VhjP6V0Izu2gGSkkaiB30tRqIjxD9snkxts2CT2LG02Owv6xAm5cqKkb/MGSVhOX2
         ju+DDGILvQbSTV/0Bk6/JMkoeE+K3c8MyPAPYVqfb6N4hx60qe59SXwbr31JnBZATP
         CnKfNa6qfPYqHDjaN7TFPI6KiHUnG+5+TQJOoJ7Pz07Kox9HCY4lNDjMsihV4P1X/G
         aoA0jxzAb9/XFbviLLZOhBWxNE9ndJ2NRV+bHCMlw+V0gycgm5gn3QLnxD1aEy7AJr
         QodZRiJQtEtaGuEEPstrogzZfrmyLpcrNaAFIxcLKybnJIUL8qnp3xNn0C4WauBS6S
         kWbWWWHF3nQbg==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:42 +0300, Dmitry Osipenko wrote:
> Driver now uses devm_platform_get_and_ioremap_resource() which replaces
> the typical boilerplate code and makes code cleaner.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
