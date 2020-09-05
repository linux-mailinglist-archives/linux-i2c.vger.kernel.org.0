Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0467625EB96
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 00:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbgIEWv6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 18:51:58 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:31173 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728589AbgIEWv5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 5 Sep 2020 18:51:57 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4BkVBw6Jn1z2F;
        Sun,  6 Sep 2020 00:51:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1599346265; bh=zJOhONpx1TWClrAYIiqACUGxaxZkJvBxBIWyWuZR2wI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bCVJeZfg2Izz7vP+ONVp5VlATPLcB6G0wIO5enYVRqFos496jXxdX/Q45iP/eokp+
         b842quz8hGCN8e3mp51jSxjLo6R7Judq15bgdOqsYNXNrGbc+gQ+Xi8m6/INLkYl8o
         j/g4ZVeFrULvPk1ZnTmVf2Gm6AxcoHTT8nTyN7uEjtGb2DTN3ciUuDGC7IJIMh01Xk
         BPZ4CMbWrxcvqA7Kiu5QoAXc6lylAwxzbqVgoIOGS40iNdjWlMjAKcOkOf+eYHfet7
         lcPrS3E8p1EvKao3fckLc69FyMMX03NIr/tl82JGz5yKgR9AS6o3x2dHhxBqNLEiTs
         pm5W4S3s+Dl8A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Sun, 6 Sep 2020 00:51:53 +0200
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
Message-ID: <20200905225153.GF18554@qmqm.qmqm.pl>
References: <20200905204151.25343-1-digetx@gmail.com>
 <20200905204151.25343-12-digetx@gmail.com>
 <20200905221042.GB18554@qmqm.qmqm.pl>
 <350949de-00ee-a664-d979-fd47803a80e4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <350949de-00ee-a664-d979-fd47803a80e4@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Sep 06, 2020 at 01:24:14AM +0300, Dmitry Osipenko wrote:
> 06.09.2020 01:10, Michał Mirosław пишет:
> > On Sat, Sep 05, 2020 at 11:41:31PM +0300, Dmitry Osipenko wrote:
> >> Factor out runtime PM and hardware initialization into separate function
> >> in order have a cleaner error unwinding in the probe function.
> > [...]
> >> +	ret = tegra_i2c_init_runtime_pm_and_hardware(i2c_dev);
> > [...]
> > 
> > This one doesn't improve the code for me. The problems are: 1) putting two
> > unrelated parts in one function, 2) silently reordered initialization.
> 
> The hardware initialization depends on the resumed RPM and the rest of
> the probe function doesn't care about the RPM. I don't quite understand
> why you're saying that they are unrelated, could you please explain?
> 
> The DMA/RPM initialization is intentionally reordered in order to clean
> up the error handling, like the commit message says. To me it's a clear
> improvement :)

Ok, then wouldn't it be enough to just move this part in the probe()?
A sign of a problem for me is how much information you had to put in
the name of the new function.

Best Regards,
Michał Mirosław
