Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC20271FFA
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgIUKTm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:19:42 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18209 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKTk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:19:40 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e2f0000>; Mon, 21 Sep 2020 03:19:27 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:19:39 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:19:37 +0000
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
Subject: Re: [PATCH v7 17/34] i2c: tegra: Remove outdated barrier()
In-Reply-To: <20200908224006.25636-18-digetx@gmail.com>
References: <20200908224006.25636-18-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <9d02d4c6e1c44493af80e992ef911eb6@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:19:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683567; bh=lmbI4GAmfwbliMzyWCpPL2R4fY4K5nxPT6aSjRsZxd0=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=WS7Wr/eazE/Mq9dKr/I7kYwowRwndM4bQOADj8GxEGJV0F+IcK07dJgqbF1pwQN94
         cPvdz/CN+ySGCS7LFzXnYzXRUOaTfEnNe+yr/tsnSGb9zxXzSKRv5tttgUgw59x0tm
         MhQtjy3M/vDO22OIQ2qvGtpEmUCPkCzhN6PXX4V2Mo+tlVyv8fJnkammW/bwAoYRNQ
         0dqfRw2xk/EnlCi0MDG76fXxKhWnYjjPbSjtj0Tv6qtglupQOeus6vXPBLnLOfUpYP
         2ueCc72J1iuwUkwEG86nXs3U9YPSfuNHj5j1IIyf/6xH2JX/niKqMno9cqaNnZaJLT
         GStCNexGVFPhQ==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:49 +0300, Dmitry Osipenko wrote:
> The barrier() was intended to reduce possibility of racing with the
> interrupt handler, but driver's code evolved significantly and today's
> driver enables interrupt only when it waits for completion notification.
> Hence barrier() has no good use anymore, let's remove it.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
