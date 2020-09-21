Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3C53271FD8
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgIUKSq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:18:46 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18382 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKSq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:18:46 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687da90000>; Mon, 21 Sep 2020 03:17:13 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:18:46 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:18:43 +0000
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
Subject: Re: [PATCH v7 04/34] i2c: tegra: Mask interrupt in
 tegra_i2c_issue_bus_clear()
In-Reply-To: <20200908224006.25636-5-digetx@gmail.com>
References: <20200908224006.25636-5-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <9f82f352b66a4fb4a38039c9e9b19dbc@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683433; bh=8qPrLK1vExCoEmwUHQ6NZzP+VQ7Zpg28KkiA/GUuILc=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=FLVIgEFSYdWn1YIXse0gejpRRgZfmr4FTOM4A++/U9Qqo8SMGz49rSoge5IcbWtT/
         xpsUBm0h4EnLY4oblLSw2VeYaKSrEjm7kzhHqQTFtf6+nR7h8HRmOpc6z47+5cBSVv
         wTJZ88tFmjH25NtUx76ckPErDUTx4L+cElg8265nd4uBKzdKe47ARxP7C/LedfpjWS
         DbCAROSUqTSITYX+PYMkwaA1Dj4QuU7d365+8BqaVWuiqEPVeIk6x4P1oAEN180cJ5
         7O+mPihJVP+r60RAwQhy77S76rcJcnSGIVjS1qBW22vFascdgRjC+jlDilkSSJWGlv
         b9P1uwPE2S/+w==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:36 +0300, Dmitry Osipenko wrote:
> The tegra_i2c_issue_bus_clear() may fail and in this case BUS_CLR_DONE
> stays unmasked. Hence let's mask it for consistency. This patch doesn't
> fix any known problems.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 2 ++
>  1 file changed, 2 insertions(+)

Tested-by: Thierry Reding <treding@nvidia.com>
