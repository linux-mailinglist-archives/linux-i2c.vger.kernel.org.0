Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19FBD271FE4
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgIUKTE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:19:04 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18137 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKTC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:19:02 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e090000>; Mon, 21 Sep 2020 03:18:49 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:19:01 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:18:59 +0000
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
Subject: Re: [PATCH v7 08/34] i2c: tegra: Remove error message used for
 devm_request_irq() failure
In-Reply-To: <20200908224006.25636-9-digetx@gmail.com>
References: <20200908224006.25636-9-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <2554947531a14dabbbdbf645a604ad55@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683529; bh=EYXluKNeuIe3zHs5JY57epZrDfqfjkxifV+FFRmET04=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=UwbsKYcI17+XktDKPTKiVmtze1/TBlQ9BxEHOmWkhmRKmoFj1kzfIc8/BVcp+fNTr
         5pqNev2+6PZ3KRIAnpf4Bko5ZyDbQwzvJQ5OM21nfEoxBd5sKbywyHR0wXj1IsMWU/
         +f1UBiqPFFPdVelJXVmx6W9CS5+HJJdiQC06Ky2ArLVQxFPV6tzFKN26Ar5Em7cJgn
         N2XQY3JllXgxb9RORCKzMLUVk6xz1N/CaeghsiyQIPGC88PBwRLYQkG1ZJTBY6McW1
         MkAGMhK7XU9wKOpcNO4zNw+BsC2kJJOL3j5Fzj4srFM1xaFNJkNno/MNl+wIEBPgxV
         8Nx8rmDqUVN5w==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:40 +0300, Dmitry Osipenko wrote:
> The error message prints number of vIRQ, which isn't a useful information=
.
> In practice devm_request_irq() never fails, hence let's remove the bogus
> message in order to make code cleaner.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
