Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9C2625EB67
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 00:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbgIEWXa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 18:23:30 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:5478 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728731AbgIEWX0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 5 Sep 2020 18:23:26 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4BkTZ13ySYz2F;
        Sun,  6 Sep 2020 00:22:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1599344553; bh=iDbtP5Vj3NeZw0UZGfi3cOZkOKeebgGCYPGxEfAoB2M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qIKAAuFnXtiLVefok68uGzU+13OOG2tihFyjqGNC5Jb8QIedWIGiNqNkqxWjRutFV
         2BBAhWt3KZSGuwUKBWIQMOzMjcMoAy+rV37Tceo9loqa0UoMayx3rH+BhzOHUucKT1
         fRm2TLboIj/zeAIpP5Xb3bcdnkl0Ggal/d8BUUTZjmhsELOYAKYRyqsM44Q9lSeEWA
         w9rzV79Bm2T9ISmH149kz0nTHwgT0BrGWPn9oDr+38yvDiCmHD9A6fFi6SmkSx+GR/
         lb9+7t72dV2gaaFc83PYfA8CwjOvU5jGBlLNeRgdk1in7Qlvv0OMfzGYWlf2NDzgia
         uslVUXnpSigrA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Sun, 6 Sep 2020 00:23:23 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 16/31] i2c: tegra: Remove "dma" variable from
 tegra_i2c_xfer_msg()
Message-ID: <20200905222323.GC18554@qmqm.qmqm.pl>
References: <20200905204151.25343-1-digetx@gmail.com>
 <20200905204151.25343-17-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200905204151.25343-17-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Sep 05, 2020 at 11:41:36PM +0300, Dmitry Osipenko wrote:
> The "dma" variable of tegra_i2c_xfer_msg() function doesn't bring much in
> regards to readability and generation of the code, hence let's remove it
> to clean up code a tad.
[...]
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
[...]
> +	if (i2c_dev->is_curr_dma_xfer) {
[...]

In this case I like the previous code better: just because there are
less letters to read. :-)

Best Regards,
Micha³ Miros³aw
