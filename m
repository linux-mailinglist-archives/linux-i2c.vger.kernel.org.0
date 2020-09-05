Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19AB425EB52
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 00:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgIEWKp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 18:10:45 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:2432 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728563AbgIEWKp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 5 Sep 2020 18:10:45 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4BkTHN1bC9z2F;
        Sun,  6 Sep 2020 00:09:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1599343792; bh=sCmAZA43hEK5ITAt71q/tlretXbcM8e9LoMlx1QzCXQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ro3pMIse9R3FLxhO0BX8OoOZ3px/+AL9aAaVYSNdPB4yRWqJNqGFLEKYbTC7HJuHm
         jEOAdLNT85fU5pDZnNh+vOW3G7CY3nkrKg06sggSSgxfyQ9NJRMH7witMr0MNS7Tz7
         W7EXNayGQXVFT+2gUfOwoXPtjF0CT4mZWiNEyRi1fnXpKB++ZOOhlJej+KTI6bMyYK
         iqCw7sIrBEr/ip+0QhJJZ0JQVDKquid50GKdjYvbGNy1cAzw9XxltLm1P1rhfO9aiw
         iObmpWze7HWuunQ8LQpE57ACSAXl8mT3AkKF7xhyD6S4YEAN8O2ZPr1WKlAab5gaFQ
         BHs43pcAXVtkA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Sun, 6 Sep 2020 00:10:42 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/31] i2c: tegra: Factor out runtime PM and hardware
 initialization
Message-ID: <20200905221042.GB18554@qmqm.qmqm.pl>
References: <20200905204151.25343-1-digetx@gmail.com>
 <20200905204151.25343-12-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200905204151.25343-12-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Sep 05, 2020 at 11:41:31PM +0300, Dmitry Osipenko wrote:
> Factor out runtime PM and hardware initialization into separate function
> in order have a cleaner error unwinding in the probe function.
[...]
> +	ret = tegra_i2c_init_runtime_pm_and_hardware(i2c_dev);
[...]

This one doesn't improve the code for me. The problems are: 1) putting two
unrelated parts in one function, 2) silently reordered initialization.

Best Regards,
Micha³ Miros³aw
