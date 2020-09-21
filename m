Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0041271FF5
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgIUKTd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:19:33 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18191 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKTc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:19:32 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e270000>; Mon, 21 Sep 2020 03:19:19 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:19:31 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:19:28 +0000
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
Subject: Re: [PATCH v7 15/34] i2c: tegra: Reorder location of functions in the code
In-Reply-To: <20200908224006.25636-16-digetx@gmail.com>
References: <20200908224006.25636-16-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <693e4100dd4e4eeb8f4fd7b01e06eceb@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683559; bh=0bXWyzNHvFqSIb2XM2TK8NiDitmS5pfOW/DFfHnDFK0=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=haFrtCpN1lPkI35VQDRVS1ElcUP3PhFlZ995OCmRmLe2oLCcWwNq3GXWZzkmbgMcq
         oFuEJcbYHSLQs6yXo6Ius2UEvLOLLMVsFtyxIxWu5SvlddJUWyUtaNUgu82PCqqXv9
         rAGpZPULFMNLiLSwVPRHS1t1NytxIiohZ/Y+yX0SLbSvjyqKZDeIYkqDWxzr2qakZx
         DA9ljlHxVuLxb3qpZ9aSx86ICZims+nnZKu9T/+oNDSLBCWxV3uXpVAi5HAoIdGmSi
         os99MdrKCa+OhL88snuZXz1Hqk9oG6pSc5xsOfcmUw7/xp3fmQWwtiXZSUS95bg7Ol
         wxky2ZSfopBsw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:47 +0300, Dmitry Osipenko wrote:
> Reorder location of functions in the code in order to have definition
> of functions closer to the place of the invocation. This change makes
> easier to navigate around the code and removes the need to have a
> prototype for tegra_i2c_init().
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 486 ++++++++++++++++-----------------
>  1 file changed, 242 insertions(+), 244 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
