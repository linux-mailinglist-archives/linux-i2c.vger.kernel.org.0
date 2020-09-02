Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C1E25B593
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Sep 2020 23:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgIBVGQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 17:06:16 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:14909 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726226AbgIBVGP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Sep 2020 17:06:15 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4Bhc1K1S1dz98;
        Wed,  2 Sep 2020 23:06:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1599080773; bh=4Q6tnyuAu+zTSkHMFyyH05pZbDuBraods2UoZtxr+qE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GSUZUTLAJRUWcWTMsqtlP5NPVAFNSMOkO+EoJGEb6qZVij8rMZpHRxzIhN1FrUuT4
         2tqgWNFgNHKS+IHTbMhUb6GrI3osDQw4d6+58toMy9i7JvwfX8QdHfFNSxhatO3bh6
         pJAmPm4MLOEvpFu0iTDY/S0Em0FfC86u8nrFCskrXv+3p3jpCsuvSoZupuOvD+XRjz
         Oa+c6w78vQ9BZi4ci1rjHBUuqYiVttTkT27Xg4S9sS3k1gIkLqbG0hRn9zZc8T5HEb
         A0J76ijajgsWKmepDtbdukQ9MmhvS/v6esQUe6ysKI7A1VcO6krG3Vqf5xqSbMNEwF
         8ClTNyXb1X/4Q==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Wed, 2 Sep 2020 23:06:11 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 09/12] i2c: tegra: Clean up probe function
Message-ID: <20200902210611.GC1624@qmqm.qmqm.pl>
References: <20200831202303.15391-1-digetx@gmail.com>
 <20200831202303.15391-10-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200831202303.15391-10-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 31, 2020 at 11:23:00PM +0300, Dmitry Osipenko wrote:
> The driver's probe function code is difficult to read and follow. This
> patch splits probe function into several logical parts that are easy to
> work with.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 398 ++++++++++++++++++++-------------
>  1 file changed, 240 insertions(+), 158 deletions(-)
[...]

I can see why you want to extract clock setup and combine DT-parsing parts,
but the rest is not that clear. At least the clock setup split should be
a separate patch, as it seems to require massive code motion.
For eg. runtime PM setup/disable or interrupt setup, I would actually suggest
to drop the parts as they make the code harder to follow (you have
a function doing nothing but calling another one).

Best Regards,
Micha³ Miros³aw
