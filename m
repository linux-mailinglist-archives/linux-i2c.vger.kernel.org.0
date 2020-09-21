Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D40252720CE
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgIUKZZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:25:25 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9237 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgIUKZZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:25:25 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e3b0003>; Mon, 21 Sep 2020 03:19:39 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:20:25 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:20:22 +0000
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
Subject: Re: [PATCH v7 27/34] i2c: tegra: Check errors for both positive and
 negative values
In-Reply-To: <20200908224006.25636-28-digetx@gmail.com>
References: <20200908224006.25636-28-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <71a199bf16044d93a952fc4f27f28426@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683579; bh=i/TazrAKHvxh+5rLEbVuNQITG8MRoX5xzCTI5hmigPY=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=JNSBViVRORvPhtQH4ZS+uZn6uVl6d014Li4B7HkLGggmbkICWL+0gxzQP8ORBd+nt
         uHApiz3mO1uGzllgP1nF3Wb+gZiALe7Eb+G71nWUmGK97j0Q9weuYd08PCk7hin0hp
         KarPB+KtN+JbnDjDnyybxxMoYO4hSqjcYbnDRSyWF5X8GuLQLNUaQr8IHrCVROs2qU
         cAm6JYdT1zs2EgI4cSTYAFF8/QxcBTLW379YVDwh8g1Hp5e1kTShSuzD1kS4opFYtf
         w8+H5IsJ7igZmn/QKFrmDmupXbynshynu6DzIkcaOGsxCGUY0t4GOWXbBPgdvJV8b7
         DwyqYyIQfnGYA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:59 +0300, Dmitry Osipenko wrote:
> The driver's code is inconsistent in regards to the error values checking=
.
> The correct way should be to check both positive and negative values.
> This patch cleans up the error-checks in the code. Note that the
> pm_runtime_get_sync() could return positive value on success, hence only
> relevant parts of the code are changed by this patch.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
