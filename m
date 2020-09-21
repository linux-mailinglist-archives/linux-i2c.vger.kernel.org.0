Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE36271FF2
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgIUKT3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:19:29 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18186 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKT2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:19:28 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e230000>; Mon, 21 Sep 2020 03:19:15 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:19:27 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:19:24 +0000
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
Subject: Re: [PATCH v7 14/34] i2c: tegra: Clean up probe function
In-Reply-To: <20200908224006.25636-15-digetx@gmail.com>
References: <20200908224006.25636-15-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <e7db95a61e1c495e918eee3be165af53@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683555; bh=m4ZtxThMDRUEldsklh9qQCucht6X8R5Fx1EEDuEgQ3k=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=bXiXu9NB+GTm1r4pcRmY9g3+RwwQHi2O4dyBESUlYMA7ETlNMxt4/4tqdaNAJzMVh
         AVK0w3vousGaS2r9sq65MFE+jjC/VJTrqvHxbbxwqSN1j12lmaBP3qfMM3Y97M8VtA
         CQkQ8J0SQ7YWDjy3p+y91vzPV0G74VLQlO5mhIVVtVJ95zkhUOA3GvNzn/ACoQGhuH
         PTNyEVmTK6w7KMHn6t8Yuq+8SQVgY+5jMoF2RA/Z3w9A2ppVlaIQ6mzQdpmX1crZv4
         csNCJbwTavrMVDqJbqT9f5k5DYAeXoPAD/VaqLXh8qQ7UR9rNTsyFqp4RBK2c3daVD
         10yEPsWhDcT6Q==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:46 +0300, Dmitry Osipenko wrote:
> The driver's probe function code is a bit difficult to read. This patch
> reorders code of the probe function, forming groups of code that are easy
> to work with. The probe tear-down order now matches the driver-removal
> order.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 100 ++++++++++++++++-----------------
>  1 file changed, 49 insertions(+), 51 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
