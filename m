Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 682C3271FF6
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgIUKTh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:19:37 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18472 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKTg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:19:36 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687ddb0002>; Mon, 21 Sep 2020 03:18:03 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:19:35 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:19:33 +0000
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
Subject: Re: [PATCH v7 16/34] i2c: tegra: Clean up variable types
In-Reply-To: <20200908224006.25636-17-digetx@gmail.com>
References: <20200908224006.25636-17-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <a2d6f9acbb0e452297e9c8b8ade65cec@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683483; bh=oKA2RxM08FLdHAyfPhw63WhhoW/4kYG1DUlqtBDN8nc=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=SEQd0HBYE/mFq+pYlv6kvOcvE4I2esS8z0WbtoULozj6nBMhWfRuVOrvtTSdc2qql
         v6MQQJsq9eP8AraY01eOgP63YmpC6P9cyNi2PWEuHENuIq+5lPua8r2HsL9pHa9SAD
         iR/SCYwQNp1fc7jvJO389Gs8GSsvaDXWSPPNkbeww+lVGSMi9ZzhY/WxiZHaiZMoF/
         +V8U40az3a6lAYtixK9zTpvi4anS4igbVzi4rHWvAbvGufMviuWJWziKmTHe5omppf
         5nqxO+JJ7o6ViAY9LuQO4Oudeu3jTlA0zf46q1vos6la3ZK7j7fECW3G48GabPDX8y
         E3yjH8+jNbfOA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:48 +0300, Dmitry Osipenko wrote:
> Don't use signed types for unsigned values and use consistent types
> for sibling variables.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 38 +++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 19 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
