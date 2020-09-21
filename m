Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7876327200C
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgIUKUN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:20:13 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18271 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKUN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:20:13 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e500001>; Mon, 21 Sep 2020 03:20:00 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:20:12 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:20:06 +0000
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
Subject: Re: [PATCH v7 24/34] i2c: tegra: Factor out packet header setup from
 tegra_i2c_xfer_msg()
In-Reply-To: <20200908224006.25636-25-digetx@gmail.com>
References: <20200908224006.25636-25-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <6b1242e1dc9e4f3b9236c3f21adad8da@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:20:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683600; bh=B8Vh7zhkbIZwjqsB9fLKohr/wmJ9rfYxnN0j217utpA=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=iFjM+n7D1ylqHjCzZ8z7LwAU96Mh5VXikso5Ksvz8k91M41E44LBQUFaeZQ/o10KU
         ncxF+WkLebWWhndiHWBGTTGs4c+bBQ0q+L7uz0i4+ZaPzmnXWJVTp4fP5BFIod49RJ
         uAzQ526N83v0Vf+gUpdVHk5iBEXi7QQr8bWu2ao63DXnmqkIRAsBRZVhla8dmTZOq3
         /9qn/qzkmKF7FSnLWaD2VyqV/gFfDkEAvey3wDwchtFXIvQvXLr0W80MQ2A1YVOjC5
         43x260z4lwgLc5Cgst+CKVrt84DJ3zBVkwTMXUIkdMo/SupB2U3Mzhq6ThZJN+6YQw
         hpJgxYoIpzxtA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:56 +0300, Dmitry Osipenko wrote:
> The code related to packet header setting up is a bit messy and makes
> tegra_i2c_xfer_msg() more difficult to read than it could be. Let's
> factor the packet header setup from tegra_i2c_xfer_msg() into separate
> function in order to make code easier to read and follow.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 92 ++++++++++++++++++++--------------
>  1 file changed, 53 insertions(+), 39 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
