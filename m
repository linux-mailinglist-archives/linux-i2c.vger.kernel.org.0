Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7485F272008
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgIUKUH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:20:07 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18536 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKUF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:20:05 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687df80002>; Mon, 21 Sep 2020 03:18:32 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:20:04 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:20:02 +0000
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
Subject: Re: [PATCH v7 23/34] i2c: tegra: Factor out error recovery from
 tegra_i2c_xfer_msg()
In-Reply-To: <20200908224006.25636-24-digetx@gmail.com>
References: <20200908224006.25636-24-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <518eefbffc5c435ca46f848ad91f79a1@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683512; bh=JRtGlRzMLbjSdLy2bE6vbzTj6xlNlZirvf8wSZQrHtI=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=jxzqM1bJWjSKXt8Lnwd1BnxEcZemAc/llKkCA3D2yKQFlIVGjBT/V9KjJzvunBObL
         +vZSVRAJr2vUwmJzs/FxrlwcQTT1lFnd8K81JvCH7FrBCupxBnMHPhsydoohzM7sNL
         USTQihFEVPQVVsviHtN1C2VmNvCPHFwpH8XGfEVT31Tl4MvrKAu8Huhtt14EgWc/ro
         BxCaQOVvPAqa6rsmUjtvfSgDykp/wI38qm4QmckGUJBrqlTKrFl092sRlO26jZ6ibC
         0njblRYD2zDR+16wLBL8P07ZrgHdRhwIKl6cxvSMDAUulCPVF7B0gCrQ6fZiVopynQ
         IU/302UKnDfkQ==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:55 +0300, Dmitry Osipenko wrote:
> Factor out error recovery code from tegra_i2c_xfer_msg() in order to
> make this function easier to read and follow.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 46 ++++++++++++++++++++++------------
>  1 file changed, 30 insertions(+), 16 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
