Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82AA725EB21
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 23:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728713AbgIEV4O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 17:56:14 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:58754 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728103AbgIEV4N (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 5 Sep 2020 17:56:13 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4BkSyb1Nssz2F;
        Sat,  5 Sep 2020 23:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1599342919; bh=rYmTcMELA+20hqUbQWfmBH4UEfHZtGVP6M4zSQre8g0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SL9c69woItKdVhfLH3GN0w/HQlpEgbLwfHlR88bWj7wIyurTVKSglqkqBC5l6wLIQ
         8SdAOuL18OwfK+8fEAxlA3nWDXcJN+P2YRsHsWqe5CswV/2EveQJ8exEBJyIP/v1vO
         aGhhcKpMm9brvgP/MpRidyot+XR9Br3bC+BKPj4DSnxhzQZpdAQEekWe2EY5XUOA3d
         5dbgDrAIBuOb5F1IoILH18UsUoFO++eYZfVw8jusyS2USY8A5d9B4N074e7kGZKz8e
         UVvoFGS0ZX/CWBmFnwrflnDdghMjIveDWCykPuWKBrbIgeViN3MRTymub9ru+NmMFh
         RUX3exYuRYxsg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Sat, 5 Sep 2020 23:56:08 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/31] i2c: tegra: Use clk-bulk helpers
Message-ID: <20200905215608.GA18554@qmqm.qmqm.pl>
References: <20200905204151.25343-1-digetx@gmail.com>
 <20200905204151.25343-11-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200905204151.25343-11-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Sep 05, 2020 at 11:41:30PM +0300, Dmitry Osipenko wrote:
> Use clk-bulk helpers and factor out clocks initialization into separate
> function in order to make code cleaner.
[...]
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
[...]
>  static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
>  	.has_continue_xfer_support = true,
>  	.has_per_pkt_xfer_complete_irq = true,
> -	.has_single_clk_source = true,
>  	.clk_divisor_hs_mode = 1,
>  	.clk_divisor_std_mode = 0x4f,
>  	.clk_divisor_fast_mode = 0x3c,
[...]
> +static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
> +{
> +	unsigned int i;
> +	int err;
> +
> +	err = devm_clk_bulk_get_all(i2c_dev->dev, &i2c_dev->clocks);
> +	if (err < 0)
> +		return err;
> +
> +	i2c_dev->nclocks = err
[...]

You loose checking whether number of clocks matches the device version.
Is this intended?

Best Regards,
Micha³ Miros³aw
