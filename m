Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D04872720D0
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgIUKZe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:25:34 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9249 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgIUKZe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:25:34 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e430000>; Mon, 21 Sep 2020 03:19:47 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:20:33 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:20:30 +0000
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
Subject: Re: [PATCH v7 29/34] i2c: tegra: Improve formatting of variables
In-Reply-To: <20200908224006.25636-30-digetx@gmail.com>
References: <20200908224006.25636-30-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <b8e728f7d160463b8b8216940325c37b@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683587; bh=faxYS4QlKCGz6Mgx3etZMrswGKpjdpFCa3JfYOnhQRE=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=F4fkjOlZ1wOvL9mBeE+sHwjr2S7J6juyGMyMxvOwZEe76Nx6t3ed4+Qr2UEPVEgaf
         eLQlAfNH8yhrTB3UF0QaOqCDI2bNBEs8Ujbq4CqkJQskrXS+nWHSwBsW+uQPqfjr70
         +4wm+RC6lT4Wdd8WRCMcLtlFrgdpAOQbo/9IMXTFN/wg0K4GyQDexI8Tqtn2VRZO/T
         wpdK8ja2neAbFshMeWXYnShFVxCsEfs1fVHkMee8QhyyzElyGnqSNBhm8+bnqTuveY
         +m7MXMJ49OWLda/oWsBUuZMdulP0AhySIQQSnDXRtnGBj+tK+96cQRwMD58LRHB8jy
         YfLl0ps4G018w==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:40:01 +0300, Dmitry Osipenko wrote:
> Reorder definition of variables in the code to have them sorted by length
> and grouped logically, also replace "unsigned long" with "u32". Do this in
> order to make code easier to read.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 97 ++++++++++++++++------------------
>  1 file changed, 45 insertions(+), 52 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
