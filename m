Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A187C2720B2
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgIUKYM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:24:12 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9083 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727265AbgIUKYH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:24:07 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687dec0000>; Mon, 21 Sep 2020 03:18:20 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:19:05 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:19:03 +0000
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
Subject: Re: [PATCH v7 09/34] i2c: tegra: Use reset_control_reset()
In-Reply-To: <20200908224006.25636-10-digetx@gmail.com>
References: <20200908224006.25636-10-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <b5125a8e9d83491cbd03b9817cde2b76@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683500; bh=i70FCSUV9flyEkpXv9CHGczlPR4717jAf2IAWaY1S94=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=jle6ucdkcjOgIIDkZMOYDIL2DC+x+Jw4z555oxmiWyLiw4/o0SsV62yXCSCbleLf0
         tRxT6i70POpp6RucfbJ9Wvxm/FhzHC9RqQNZRWF3uI+0MPa74WqnmAcUkAFI4xRzmj
         OtCrfCXwWl9q8UVr13/A5BgA8MoOLx0lxEoqVTxHMtNaBxMNkFp6vk+qPGUYsViQT7
         tIFX07mUAMqkGtvK7nGhPI1twszA/mkazvx0EC/QLauOWl66CvZVESSKo/7YJYFNrn
         47RjIK4sYQvK1+kmae0xe/cE/N/St8l2MERyZrEEwbMbKqJIR8ShvV9fI5EmM/079w
         dgnXmII5zGhCA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:41 +0300, Dmitry Osipenko wrote:
> Use a single reset_control_reset() instead of assert/deasset couple in
> order to make code cleaner a tad. Note that the reset_control_reset()
> uses 1 microsecond delay instead of 2 that was used previously, but this
> shouldn't matter because one microsecond is a default reset time for most
> of Tegra peripherals and TRM doesn't mention anything special in regards
> to I2C controller's reset propagation time.
>=20
> In addition don't ignore potential error of the reset control by emitting
> a noisy warning if it fails, which will indicate an existence of a severe
> problem, while still allow machine to boot up.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
