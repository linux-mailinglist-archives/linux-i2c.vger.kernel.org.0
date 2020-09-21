Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA87C2720C2
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbgIUKY4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:24:56 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9152 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726748AbgIUKYu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:24:50 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e170000>; Mon, 21 Sep 2020 03:19:03 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:19:47 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:19:45 +0000
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
Subject: Re: [PATCH v7 19/34] i2c: tegra: Remove redundant check in
 tegra_i2c_issue_bus_clear()
In-Reply-To: <20200908224006.25636-20-digetx@gmail.com>
References: <20200908224006.25636-20-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <63f5c911fd24425fbe8bab250fa922d0@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683543; bh=2Cx9emq6T9X3oRhp18fLwghcsvBkqu6hxKg8UDlIHc8=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=T+T0tKEhsKsOgZeIwhUtc0zmwxecYXCojZEayJJ8uU/5lz4JDL8llKGQc3PsaBdqQ
         MU91PuaCO77W1gA/+3AjwOY2ruV825Md//hFb0i5iPP/5C29Gqg4WVXR8zT9nOiDW3
         D1SmTNDZthJ493VYuczQLyxu1/nr2GWrrYbhMePPkmONPAlJNSShwwLUswNjh4F0BC
         M8jshjWpFdk7S37ckGPERDOURBjtRIQxLAapDT+iOdq4cl6xygw9zc5vnoSCUz+lcC
         DJf5mp/+XCqL4DBHkhLv9dUZBWpqrX5gPbpac5Va0fS0scmzZZOI2dQX69PYYMfG6h
         a0ECyQGBxDo0g==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:51 +0300, Dmitry Osipenko wrote:
> The tegra_i2c_wait_for_config_load() checks for 'has_config_load_reg' by
> itself, hence there is no need to duplicate the check.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
