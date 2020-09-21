Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D434272005
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgIUKUC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:20:02 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18234 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKUB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:20:01 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e440000>; Mon, 21 Sep 2020 03:19:48 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:20:00 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:19:58 +0000
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
Subject: Re: [PATCH v7 22/34] i2c: tegra: Rename wait/poll functions
In-Reply-To: <20200908224006.25636-23-digetx@gmail.com>
References: <20200908224006.25636-23-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <e216fc98c68a416c9301b97130b52ba6@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:19:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683588; bh=jDaS0Nitoz2ddhGNZypIjYRJCFklKul2VHvh3NRsOv4=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=dDmM4T9bGT8eRh3Q5NxOeh7fsJQV/rq3lj9yLqTdPylwRfkYoFPWGLqILCuPbqYE4
         96nHtx/aSj8mzEbF2szOVP1AK7gKvKnlb99vfoW4L1a0aWFWR96tiCc42dgwryhp2U
         t2UnmaL7ACwYq6Vuf5Y7WU2Kjc4eiEOywUMz0W7yLaRZStz7DwFRDIy5tgsyC8y5Pn
         P8rZZj6HH1YQfnTuNAPHVRIeX90HSlVAISrpd+A5dwkBjspxFWwK/TyR7Yu+ZMwFhe
         CnPz6xZ7Lvz5L+ufG3u5op4x9cnk8OfkMor+2CngI8mYkVatOulxW1QUD74dL9P/Xc
         WFHNfkrilSkIA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:54 +0300, Dmitry Osipenko wrote:
> Drop '_timeout' postfix from the wait/poll completion function names in
> order to make the names shorter, making code cleaner a tad.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 32 ++++++++++++++------------------
>  1 file changed, 14 insertions(+), 18 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
