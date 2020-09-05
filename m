Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5951C25EB90
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 00:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728740AbgIEWtc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 18:49:32 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:53086 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728103AbgIEWtb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 5 Sep 2020 18:49:31 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4BkV8722snz2F;
        Sun,  6 Sep 2020 00:48:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1599346119; bh=Y4MUi4D1LdGhtlmzuiUdmRhEvW5C8rA1H02gFCm/sKo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YldgAUJeGbeXOHWoL0Rg8hcwOjmg5lO5MdBiLPVqb1S/lRXDtTkgkT1InAEI1Io1t
         BzfkrpipNjuY3NAsQmKHWd5wLFz6gbZshpo5b3PBbi5H0JLf7IiUTC3anaJPtkOneK
         dj0Mtf19O6pHNudn75GWvLJfrRUrNwpSfN637IiBVmvbQhPipV98zn4sRrAG+eTkJG
         p0Crdd3dSMDgKKH7AbbLM4znxNVUqhC5PsrViKA/ViMAhJ9FqFepkzRguE2ChJcyD/
         wN7o7mNNrKFqHI2ffnNkN1J5V8tEnn2rAcwXrQ2u60INk42eW4io71KICPXXiN9Zwy
         419LlthIC7ARg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Sun, 6 Sep 2020 00:49:28 +0200
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
Message-ID: <20200905224928.GE18554@qmqm.qmqm.pl>
References: <20200905204151.25343-1-digetx@gmail.com>
 <20200905204151.25343-17-digetx@gmail.com>
 <20200905222323.GC18554@qmqm.qmqm.pl>
 <7587704b-7bc1-d6a9-19b4-befcbcbce26c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7587704b-7bc1-d6a9-19b4-befcbcbce26c@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Sep 06, 2020 at 01:36:20AM +0300, Dmitry Osipenko wrote:
> 06.09.2020 01:23, Michał Mirosław пишет:
> > On Sat, Sep 05, 2020 at 11:41:36PM +0300, Dmitry Osipenko wrote:
> >> The "dma" variable of tegra_i2c_xfer_msg() function doesn't bring much in
> >> regards to readability and generation of the code, hence let's remove it
> >> to clean up code a tad.
> > [...]
> >> --- a/drivers/i2c/busses/i2c-tegra.c
> >> +++ b/drivers/i2c/busses/i2c-tegra.c
> > [...]
> >> +	if (i2c_dev->is_curr_dma_xfer) {
> > [...]
> > 
> > In this case I like the previous code better: just because there are
> > less letters to read. :-)
> 
> Besides readability, I also don't like much that the is_curr_dma_xfer is
> initialized in tegra_i2c_xfer_msg() and then could be overridden by
> tegra_i2c_config_fifo_trig(). In a result the "dma" variable confuses me
> since it's not instantly obvious why it's set after
> tegra_i2c_config_fifo_trig().
> 
> Looking at the final result, I think it's better to have the variable
> removed. It makes code more consistent, IMO.

If it could be changed in some callee, then indeed it is better. In this
case I would include this information in the commit msg.

Best Regards,
Michał Mirosław
