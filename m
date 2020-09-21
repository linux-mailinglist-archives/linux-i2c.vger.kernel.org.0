Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFE6272000
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgIUKTx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:19:53 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18491 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKTx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:19:53 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687dec0002>; Mon, 21 Sep 2020 03:18:20 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:19:52 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:19:49 +0000
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
Subject: Re: [PATCH v7 20/34] i2c: tegra: Remove "dma" variable from
 tegra_i2c_xfer_msg()
In-Reply-To: <20200908224006.25636-21-digetx@gmail.com>
References: <20200908224006.25636-21-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <6df73f9b69434fc38411cd69172d7d57@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:19:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683500; bh=PZMqJ0mpdlsSF2NWXXssuKNHeJDSYSa+NGTCLXbuSCU=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=LpbK+MdEHG29iXnQSuXVwb+MjbYA0pClsbeCHaj3N2kD7RUlSaNePb/RFzuWyI1VN
         Vie4zmFXxjVT2qpSxoBWjXir0i19qrcqa2QM3HqY2DP6rwWmhTTSQefAmh8Ng5TV7v
         Hgb20NfDHJyz8gYQw1EjiobxtFu+3v06xGlhP60vs2QmnejpP4ndrU945Vb9Bh95Tz
         N6cE8GeX3RjM9ZseO6UCLZCcVExHQwwUYm43gaiLnfTnFA64UuQzTudWWBmVqiKX0u
         VmlLSrtlJDOUjEcY/8r9S6BphLYcKRxIBi/0yVZQ4xjLbOfV7bXQ+21qLT/nREFlBv
         mpnnJWPziAWLg==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:52 +0300, Dmitry Osipenko wrote:
> The "dma" variable of tegra_i2c_xfer_msg() function doesn't bring much in
> regards to readability and generation of the code.
> 
> Besides readability, it's also not very nice that the is_curr_dma_xfer
> is initialized in tegra_i2c_xfer_msg() and then could be overridden by
> tegra_i2c_config_fifo_trig(). In a result, the "dma" variable creates
> slight confusion since it's not instantly obvious why it's set after
> tegra_i2c_config_fifo_trig().
> 
> Hence should be better to have the variable removed. This makes code
> more consistent.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
