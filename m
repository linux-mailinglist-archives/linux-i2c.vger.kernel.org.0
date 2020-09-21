Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63BA12720A1
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgIUKXt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:23:49 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9066 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbgIUKXo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:23:44 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687dd40001>; Mon, 21 Sep 2020 03:17:56 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:18:42 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:18:39 +0000
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
Subject: Re: [PATCH v7 03/34] i2c: tegra: Handle potential error of
 tegra_i2c_flush_fifos()
In-Reply-To: <20200908224006.25636-4-digetx@gmail.com>
References: <20200908224006.25636-4-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <6f29761e17f1461ab21d6e9bcd6d3713@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:18:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683476; bh=VwxWUvvCDE3896KMNP0fBhjI2samcfhvauxAGLDWspc=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=NyV4Fl3zuc3mcxm1IFkyYiPOuU5Uu46R4QXrYk7JsqbaaXs0hnTLKW6xivismTjpI
         FStG80Nn41/Lk+TEtvbvD2K+pz7iZeFgxaa6zE92cfsWw3T9hErOsy+MsWOe6Fbx6D
         AbPKMwep/Uleot1EUJQDP4cV321EsPTzvPfoL/opx/hAjkM0hwCH6K7SPz3hWf8W+P
         G6Z+5TiHRhM2M7OiY2P3rOwD/1pDDCbZBjnvKwSZlhvrI9mtLPIZfc/c4WiiTZJHA4
         xbOHcEqUDGASm1OdqFuuCAwgYILcBYoG01uLSOFXmfdaao0I16BQ6YMWiRpAXlW8YO
         nLNmdVsmUhLOQ==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:35 +0300, Dmitry Osipenko wrote:
> Technically the tegra_i2c_flush_fifos() may fail and transfer should be
> aborted in this case, but this shouldn't ever happen in practice unless
> there is a bug somewhere in the driver. Let's add the error check just
> for completeness.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Tested-by: Thierry Reding <treding@nvidia.com>
