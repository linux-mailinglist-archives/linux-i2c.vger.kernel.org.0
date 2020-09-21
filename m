Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8BCD271FFD
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgIUKTp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:19:45 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18218 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKTo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:19:44 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e330000>; Mon, 21 Sep 2020 03:19:31 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:19:43 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:19:41 +0000
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
Subject: Re: [PATCH v7 18/34] i2c: tegra: Remove likely/unlikely from the code
In-Reply-To: <20200908224006.25636-19-digetx@gmail.com>
References: <20200908224006.25636-19-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <70e9d6c46611434da229156f8eb8cd12@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:19:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683571; bh=Yzh8CqOxDaKDYZl1MEmYxPx+5l8xRibyKE2M5BhFfWg=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=lLP9G1Geo1xByyIseefKErqgmGhMmXMFnVbNg+qR+lUWQwIfwFNu8dJGq0DSHQDw9
         EJhRt2MhLkPBJLP8xf05zwZFfdEqK91PW0cuC+h86zechXmKNa741I3Y5ENp9vJUjR
         KNzU43ZBJTIHBtwjUBszlfV4QrnQijsZNfofcPf47w1nHiWSW/iiCuiAdA4/P4TpSt
         k4OTav+vv1yZ3wgCWLfRJuTOk+uI87mP3Ihp8fYkxBcZ2K6zTQqBWAWIipYmfaw5Xp
         iVvhWc1y6lr7dVIw79OtltoAzq/zkbp5O9Ng8oX4HvwZXeTlBB9pbvBaCjRbiSBG2A
         etfKBCymGGynw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:50 +0300, Dmitry Osipenko wrote:
> The likely/unlikely annotations should be used only in a hot paths of
> performance-critical code. The I2C driver doesn't have such paths, and
> thus, there is no justification for usage of likely/unlikely annotations
> in the code. Hence remove them.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
