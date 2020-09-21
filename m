Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49AAA271FDD
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgIUKSy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:18:54 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18118 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKSy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:18:54 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e010001>; Mon, 21 Sep 2020 03:18:41 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:18:53 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:18:51 +0000
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
Subject: Re: [PATCH v7 06/34] i2c: tegra: Remove
 i2c_dev.clk_divisor_non_hs_mode member
In-Reply-To: <20200908224006.25636-7-digetx@gmail.com>
References: <20200908224006.25636-7-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <0c69ae5704544812a6debe02a5dee178@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:18:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683521; bh=gB+wpNxpnLYbrWlLpieJ3HTcd+AvEi8XiWeUQ8CXHy8=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=bd7zBJo0N6FE9aNxCxymw6Hu5Ka22T2fhvgI67E0zqrNztBhB3RF9ezr6AxXGSfuB
         Mpb+21t8c1/tbFXg4L4SwHruUzGZYl28JF3FOXRv3UyyuOHg35ZrhhcHXeT7vRBmQC
         weNHf/IfWdCLwu7A+LZjfhFa6yYx/1edvt1rbG7Nlh+rc1Y9VoVcMxa5Gss0b3x/I0
         x5uWNASyYVEjUjY2GNba7t6GWBff5SBySGZD2a4AiRPjiN2wuP6woTQySLq6VyJYAH
         pugTU/348/s1FmiuFY01P4OI3zmdOwkIIkCF12++XUk/tKgBbUTkIKT0FQB2uAZNCs
         M+0b0NHTbPF1w==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:38 +0300, Dmitry Osipenko wrote:
> The "non_hs_mode" divisor value is fixed, thus there is no need to have
> the variable i2c_dev.clk_divisor_non_hs_mode struct member. Let's remove
> it and move the mode selection into tegra_i2c_init() where it can be
> united with the timing selection.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 46 ++++++++++++++++------------------
>  1 file changed, 21 insertions(+), 25 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
