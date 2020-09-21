Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 387DD271FED
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgIUKTY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:19:24 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18452 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKTY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:19:24 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687dcf0000>; Mon, 21 Sep 2020 03:17:51 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:19:21 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:19:19 +0000
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
Subject: Re: [PATCH v7 13/34] i2c: tegra: Move out all device-tree parsing
 into tegra_i2c_parse_dt()
In-Reply-To: <20200908224006.25636-14-digetx@gmail.com>
References: <20200908224006.25636-14-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <19175b319a4f4a1597166fbcf7589b7c@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683471; bh=zPtpHNHtwtwV+cVnE2eWDeUsfs3YDmXUey/enFBXyLM=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=XXtwK9O84BLh21QBDrZJsXXu6ync75tKlL1hVShAfkTJFs0IRSLs0lPPCgPd2LqOA
         kJg+NHNAHJC7p5X2hQ+CMSkf5H0jrjgHOMw4bUhvTGuwz5NrPuZLCn/rKK8we6igg4
         hkiYWZ+/AYlJy2Z9gQZcs2eAa18r2cMObZ12X2x3lZO9e9yBRZzlRzqd3V5InzANCI
         ycRpUD/pCcs/U5r1spq/kIHEPQNzaBA1OGogE9lhMnLmMSYfbB+Wr+yy49ftZPiuG2
         BYa4kFFYeCNAAQG+QzOQwThwv7VVY+eWddkuUozXdsM0T+mp4fr0+LeG7Ojg8SIuOY
         2KtQsgmErMHcw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:45 +0300, Dmitry Osipenko wrote:
> Move out code related to device-tree parsing from the probe function into
> tegra_i2c_parse_dt() in order to make code more consistent.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
