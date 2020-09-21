Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DAD7272002
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgIUKT5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:19:57 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18229 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKT5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:19:57 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e400000>; Mon, 21 Sep 2020 03:19:44 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:19:56 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:19:54 +0000
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
Subject: Re: [PATCH v7 21/34] i2c: tegra: Don't fall back to PIO mode if DMA
 configuration fails
In-Reply-To: <20200908224006.25636-22-digetx@gmail.com>
References: <20200908224006.25636-22-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <c6a6c72998a045398bbd40d7672457ef@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683584; bh=rj4+M6DD6otkwDGZkPtBHSzGMkXryvZLbVWueeLZG8A=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=YIlbcdmfvAOSf6IRQiDvnctM4mFiaFDgvqCZLM+Ie38OJYsafI0u1Zjt3lTXCcfKM
         XwWqIjV6F8LhEEcJoBE6CdisPfp+k7SUe/6MvaMxyB85+qlyUK9u8JePSQNb5Qwynk
         NEpLjRy/g2l6rQL9+XkTazAz9EYh2ApW6OFYirmM7ykmq7cZIbtfLqReGJQeQCnkQi
         rI+mPO7hJRn3iiMP+yYcFPrLCvZhI4H6EN3XmhqpXLx2ILu1gMkYYA/utOZSh3/+wb
         0rZfJfq5h61NFPkqOeuJ4Npo9okSiacxoO6+MJ4JAoAN/nxTWjpxAHdhWkE0sLHjLy
         6g4jKs6bc36QA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:53 +0300, Dmitry Osipenko wrote:
> The DMA code path has been tested well enough and the DMA configuration
> performed by tegra_i2c_config_fifo_trig() shouldn't ever fail in practice.
> Hence let's remove the obscure transfer-mode switching in order to have a
> cleaner and simpler code. Now I2C transfer will be failed if DMA
> configuration fails.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
