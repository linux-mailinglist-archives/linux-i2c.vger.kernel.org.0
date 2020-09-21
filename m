Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3174C27204E
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbgIUKU7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:20:59 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18636 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726859AbgIUKUx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:20:53 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e280001>; Mon, 21 Sep 2020 03:19:20 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:20:52 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:20:50 +0000
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
Subject: Re: [PATCH v7 34/34] i2c: tegra: Improve driver module description
In-Reply-To: <20200908224006.25636-35-digetx@gmail.com>
References: <20200908224006.25636-35-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <979bf43ec4464d7eaf1faad1624da909@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683560; bh=r7hV7geTIPWWjapSsPszm7ku9wfmxtyKThkmFc9nZxQ=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=q6cX4ZRaIprEJQ3dl7obVBglQPQjM4duT+b+xgNzBjQ3w/FvGobLYPB42IhR/oXdg
         QHbTlF14c9TfTUOC4X5TbX82P3T+v4iB/iFo0dZ2NgbvG5qvHvpl34PNVCY3AS+h79
         PMw44smol8ahpoh7N7ZpnFYAN4kF8sl7ib8bo5At9t7HIyQvx7NMPAHVemY001nUFg
         e0skSZm0aoD8hGSpS36o44G6gMRHaT4Y+PPm3VqC/3fUdIXqFpztwx3FG41mBkUYjH
         ExN0ksX6KlbHOJW6U55tXraPiyE3SpxrZqt7wQwttndyDaYF86wJv2TKJa+TmpSOFR
         duSPnuwVq4TxQ==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:40:06 +0300, Dmitry Osipenko wrote:
> Use proper spelling of "NVIDIA" and don't designate driver as Tegra2-only
> since newer SoC generations are supported as well.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Tested-by: Thierry Reding <treding@nvidia.com>
