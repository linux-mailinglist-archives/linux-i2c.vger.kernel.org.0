Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8F18271FD4
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgIUKSj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:18:39 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18368 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKSi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:18:38 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687da10002>; Mon, 21 Sep 2020 03:17:05 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:18:38 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:18:35 +0000
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
Subject: Re: [PATCH v7 02/34] i2c: tegra: Add missing pm_runtime_put()
In-Reply-To: <20200908224006.25636-3-digetx@gmail.com>
References: <20200908224006.25636-3-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <5040584440074e0d9f520fcc78dddba6@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683425; bh=N1JX56sJzXuiSlXhrbri5ESKXIIo1qQ/philz7KmChs=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=A7s5uMLQ4mUI3+znIpt6Y0W6vdfMrBTbX057/uoqoihd0bGLeQKcNcQmn4JiEnJMk
         g63v+e6Nt2eta40nI+VMsW6WQCtHIHPwkbc9yYkZ3eHKFkjNG+kOOiTFW1Nzye/8x3
         DfgRtMIY+wrlZH3pueqwECxxevVaQXClSdOBj4DhJMyILPs5sjD/kW5SeMAEjZefE4
         S71JlS3RVco8Lxuy2X3GPxMTT85BwVwBlr3lUcDUl8T0ICf/Y7FyekQbxM4qAdEhpP
         t2qtNwTzEiVOldg5oCJPeYT+GXK583STjKzRpNb3sLckIopvtmjcYb29FDF+xF9vow
         WOGywZ4qGOp6g==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:34 +0300, Dmitry Osipenko wrote:
> The pm_runtime_get_sync() always bumps refcount regardless of whether it
> succeeds or fails. Hence driver is responsible for restoring of the RPM
> refcounting. This patch adds missing RPM puts which restore refcounting
> in a case of pm_runtime_get_sync() error.
> 
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
