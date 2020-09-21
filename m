Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0F92720D9
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgIUKZp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:25:45 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9292 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgIUKZn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:25:43 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e4b0001>; Mon, 21 Sep 2020 03:19:55 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:20:41 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:20:38 +0000
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
Subject: Re: [PATCH v7 31/34] i2c: tegra: Clean up printk messages
In-Reply-To: <20200908224006.25636-32-digetx@gmail.com>
References: <20200908224006.25636-32-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <ab7711a60a9a440f94265c54d3881224@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683595; bh=/Ugr82sB17LFR5yWeYKXhNUkT1TUPGfjJTRK8nmXEJQ=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=HuE/qa9Ug/Ya86iXfOBbcHq6sUf+7cKMtSd3He2q+UN9zM9atP+jpK4xCclKKZir+
         Kf+ELsZlxKl52hTJqh/Zpp9Zqtelg016JdCb1p3mDk2/H45IycPraGshAYPI+XWPL8
         pM/uLbQVI6yNQRshROekXI5XFQ7xaW5Aa24B+YDNfaciWmpEMbCi9B81BF3xH1cLZ6
         idg4+Tt50WG7OsiH4gSMaTvzouGGF7SicHKEh8rNaF2ZARD2p5JvZD57IfkVj8bIWz
         1MUbOiu4ux9UXiZC78Qa318LxO1oeNV4pThbNHfgJcFrfqjSbXLNf52jmNm3IjuRAq
         vhLIyYkImb/Ow==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:40:03 +0300, Dmitry Osipenko wrote:
> This patch unifies style of all messages in the driver by starting them
> with a lowercase letter and using consistent capitalization and wording
> for all messages.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 37 +++++++++++++---------------------
>  1 file changed, 14 insertions(+), 23 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
