Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D19FA271FE8
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgIUKTP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:19:15 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18150 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKTO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:19:14 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e150000>; Mon, 21 Sep 2020 03:19:01 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:19:14 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:19:11 +0000
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
Subject: Re: [PATCH v7 11/34] i2c: tegra: Use platform_get_irq()
In-Reply-To: <20200908224006.25636-12-digetx@gmail.com>
References: <20200908224006.25636-12-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <d25b05e41fe6492b8090cba64289a05a@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683541; bh=gyEur9IkA3VYGv6ZqTnPjZBbU5gp2rBVob0qYmffPak=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=iOLqsL2F5utPTotVCHZD3iw0MgtCuDqEzyWNwabTigo2p3LyZ+x/4ua/AR7+uh9R5
         vT2Z9vTnWzpHqA5cN1WyvaiZhfhsKZ0WPYjx1sy/3IV1AvOROsftC2h+Potyq0oX75
         rY7i304F/FelHrKPQkRhLbUvQ9zZAMiUP2hsoRJZh3+qu7n9NbmNBl+o6m97uIbBb8
         OAGWVGoag553QeyqbVQSwa3tNncUpTVzi7ppVPLb4DedQ3FS2lASZhObafH/GcaKyV
         iW9eMkBwCItExRkaX6Up7qYTBzxn6S2abh3j+AS9bSMkhtQ+AX5FQzEDHeYgD9GeLu
         fJfFmD1i11KbA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:43 +0300, Dmitry Osipenko wrote:
> Use common helper for retrieval of the interrupt number in order to make
> code cleaner. Note that platform_get_irq() prints error message by itself=
.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
