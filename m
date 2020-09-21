Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B16E271FE3
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgIUKS6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:18:58 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18405 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKS6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:18:58 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687db50000>; Mon, 21 Sep 2020 03:17:25 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:18:57 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:18:55 +0000
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
Subject: Re: [PATCH v7 07/34] i2c: tegra: Runtime PM always available on Tegra
In-Reply-To: <20200908224006.25636-8-digetx@gmail.com>
References: <20200908224006.25636-8-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <ea6d5580a0f040caac30d70533814c40@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:18:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683445; bh=ie8rGEINW3MKCgc0UrTv0/7rjOA56FJ+kaUHyLL1zms=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=nh80Wb8rQ0RWHlDqFjPTpRrAYMlcrnqNqyOvTqzXQBUKCQW7ogUv3uGxvPotud8Gv
         ddCbCrZJoNDymsogIHKeMOEdLHZGXWUD9jwpiMms+frzdjiZ062jG2eewDwVC2okOZ
         ofsxvu4D2/Oi99a2XkUa//HqZldeB47TdwDBy4gg5TvQjnWjUdy4eICXx21FWP6cBs
         Z6S9ZiuQdwduwHX4Lq8b2NWxvhkSrJAr4LJwS2L0cxheWQ/PulI5iGnMOR4hDDEeks
         vq6O4tDkof2nIT337TWmEyxvbNsVghS6DUv/dWGEY8hAfpx3eZ2GmLn2jE0MwnorNA
         gcr+YW0R3k6xw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:39 +0300, Dmitry Osipenko wrote:
> The runtime PM is guaranteed to be always available on Tegra after commit
> 40b2bb1b132a ("ARM: tegra: enforce PM requirement"). Hence let's remove
> all the RPM-availability checking and handling from the code.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 29 ++++++-----------------------
>  1 file changed, 6 insertions(+), 23 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
