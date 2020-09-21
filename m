Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E37702720C8
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgIUKZS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:25:18 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9226 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbgIUKZR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:25:17 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e330002>; Mon, 21 Sep 2020 03:19:31 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:20:17 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:20:14 +0000
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
Subject: Re: [PATCH v7 25/34] i2c: tegra: Factor out register polling into
 separate function
In-Reply-To: <20200908224006.25636-26-digetx@gmail.com>
References: <20200908224006.25636-26-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <3691cc9d954a494cbc6824140a917daa@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683572; bh=c5Igq8ioAsj14gym8ERaC83PFVIAMv37rIM9yR5E22c=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=ndtZJnTZ3eXI/0e4f6giPi4ycjVW+mm6yA7o6/LbX0ghvEMYcuHhu+pMuKm6Ew0Q5
         +JiVZxuLf/qTBszr+22o4tqH/TM89Q//jhFV8IY543EeTQcWoblCahecXWD+yVyfEv
         DW+Cb2AWeXWSnd2yn3uY+g5i5Ap4SblY6l4Z1AU7Wnng1ypUGnM3HGI+yfHbjCqlzC
         bWxho2qgBX6EEcQceupdG2tyPfgYUpXdnNO2NcZFIqYS4AiVrXA8VEp2VIWtT8Mdux
         zkjVEUFmGTDOIKyADj8+HiD1r1+IsRLS9a7FeaYJU2x6tN3F8EoJP6N+mpLZqVCseB
         K2oW0JAdefpcw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:57 +0300, Dmitry Osipenko wrote:
> Factor out register polling into a separate function in order to remove
> boilerplate code and make code cleaner.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 57 +++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 32 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
