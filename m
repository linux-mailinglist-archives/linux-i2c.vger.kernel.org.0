Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDEF22720CA
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgIUKZW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:25:22 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9234 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbgIUKZV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:25:21 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e370001>; Mon, 21 Sep 2020 03:19:35 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:20:21 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:20:18 +0000
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
Subject: Re: [PATCH v7 26/34] i2c: tegra: Factor out hardware initialization
 into separate function
In-Reply-To: <20200908224006.25636-27-digetx@gmail.com>
References: <20200908224006.25636-27-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <c43429ecf87e46479fd9845eb1e92a38@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:20:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683575; bh=z5UvWyt1/Ey1+Ib6ltESDj67xyNJ+4zyx4L9BW4flVI=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=VSAdqYKJzMD8K6Gbr+k4hh5uVKn67Jd/CpUVWT1rHx0hFrY+OnEDRSmA61Vrpmka2
         4wA1nP0cLobkkK38VpJr7/lApdz8EZeF2SYmeo8LMLzU6aEEe+pst2+xUBifya8Ome
         +mI8V9Jig0I81ChSOJXZib6y9wV1ilarXjdwxuWNe3WPDsHhHTnNO3eC48acXIgvn2
         OZP2XOlU0bj7eE0rAS+AK0nRWR7SRUOdHbHSj12TGCOhvaXCg+kFCfLZULldhKzzHq
         XvIbDmPAWywD6nwsQtrS87AXSwF3TwIIzviiO/wSq9Ee+I+1+yw8Q0Bl6yCRKBEyc4
         FqK+xbwtyMXkw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:58 +0300, Dmitry Osipenko wrote:
> Factor out hardware initialization into a separate function from the probe
> function. The only place where runtime PM needs to be resumed during probe
> is the place of hardware initialization, hence it makes sense to factor
> out it in order to have a bit cleaner error handling in tegra_i2c_probe().
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
