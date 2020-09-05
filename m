Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6511525EBA3
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 00:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgIEW6r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 18:58:47 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:56107 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728103AbgIEW6r (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 5 Sep 2020 18:58:47 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4BkVLp56Y3z2F;
        Sun,  6 Sep 2020 00:57:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1599346674; bh=Cr7UUwOAJTHJIlLTZTCRD6A0e7iY66Q1N3t4oUbjHYU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oR1N/+ByNPJNtu5Ip2qm6b3/x3JM54nwL/yEW3TP7r73c9E4n73DUjIQsqoQjdhPf
         j6vgIig32leDRBk/l+Fze/U4D0zlf7iTDRqw17SV5KY3SqpC6r6nLCw3JzPSOgWNZY
         wL/TRi7IlQJjeM0KIRiUrwRPU64+WDwhDRKhchqQwHVSZ1/uWp3Php6uOtad4a5IzG
         48jN0/TNSzvbIj9efCe4871aU0iQlLiBxJsv3hhgC9t6HEMwiE9TDI0tTwOuZAzKjQ
         fo8Wq4NS+h1/lRVs6Ib7Zm9m95KjchBEvCb/Ws/KJTN2Eil9Kd7HLsSquGQFVCI+nX
         patqbiSp1wzCA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Sun, 6 Sep 2020 00:58:40 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 30/31] i2c: tegra: Clean up and improve comments
Message-ID: <20200905225840.GG18554@qmqm.qmqm.pl>
References: <20200905204151.25343-1-digetx@gmail.com>
 <20200905204151.25343-31-digetx@gmail.com>
 <20200905224702.GD18554@qmqm.qmqm.pl>
 <45bd0bc9-a3a8-c9fa-24aa-23ae7a4182c2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45bd0bc9-a3a8-c9fa-24aa-23ae7a4182c2@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Sep 06, 2020 at 01:53:56AM +0300, Dmitry Osipenko wrote:
> 06.09.2020 01:47, Michał Mirosław пишет:
> > On Sat, Sep 05, 2020 at 11:41:50PM +0300, Dmitry Osipenko wrote:
> >> Make all comments to be consistent in regards to capitalization and
> >> punctuation, correct spelling and grammar errors.
> > [...]
> >> -	/* Rounds down to not include partial word at the end of buf */
> >> +	/* rounds down to not include partial word at the end of buffer */
> >>  	words_to_transfer = buf_remaining / BYTES_PER_FIFO_WORD;
> >>  
> >> -	/* It's very common to have < 4 bytes, so optimize that case. */
> >> +	/* it's very common to have < 4 bytes, so optimize that case */
> >>  	if (words_to_transfer) {
> >>  		if (words_to_transfer > tx_fifo_avail)
> >>  			words_to_transfer = tx_fifo_avail;
> >>  
> >>  		/*
> >> -		 * Update state before writing to FIFO.  If this casues us
> >> +		 * Update state before writing to FIFO.  If this causes us
> >>  		 * to finish writing all bytes (AKA buf_remaining goes to 0) we
> >>  		 * have a potential for an interrupt (PACKET_XFER_COMPLETE is
> >>  		 * not maskable).  We need to make sure that the isr sees
> >> @@ -800,8 +799,8 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
> >>  	}
> > 
> > Those first letters don't look consistently capitalized. :-)
> 
> In my experience, the more common kernel style is a lowercase for
> single-line comments and the opposite for the multi-line comments.
> Hence, should be good. If you're meaning something else, then please
> clarify.

I don't have a strong opinion about this, but my preference is: If it's
a full sentence, make it look so.

Best Regards,
Michał Mirosław
