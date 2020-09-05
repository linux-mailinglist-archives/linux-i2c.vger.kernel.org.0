Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3335325EB88
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 00:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728589AbgIEWrG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 18:47:06 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:35934 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728505AbgIEWrG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 5 Sep 2020 18:47:06 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4BkV5K4ydVz2F;
        Sun,  6 Sep 2020 00:46:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1599345973; bh=cXdoLr9r1Y2QHKKy1RKjNqHVui3mw8L8/D8IL2R1Uqo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SkMJgkQRAwDulgzvNMZ8QUJPwuFx5IfH91s/jUH81Da27uepC0u9U54qhjY247JdQ
         6dj3rwI+8UMCY/QFTkMmroIX8HJgoqATMOv9Tp1C+lrQ7Kzb1D+YaQIQaRQT4WbX+u
         37DA5+NDwUfuC9BLD/wFSikx52YnARFXwe5xkqe76EDjLuqFry7lnniMnMyM8KJlmk
         Fm91vit1Cu/1w24f1cqFCnjlUMuzqGlGAVUgE34BdDaNDD0HxcXddncuh312sQXOsz
         q9faAweh+AymTb+WGrCtevn8N5rmBApVvYEytrFYzEBh0+GWxUXv8N7e3OCKxI5kvx
         mDGt3DC4IaUUA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Sun, 6 Sep 2020 00:47:02 +0200
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
Message-ID: <20200905224702.GD18554@qmqm.qmqm.pl>
References: <20200905204151.25343-1-digetx@gmail.com>
 <20200905204151.25343-31-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200905204151.25343-31-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Sep 05, 2020 at 11:41:50PM +0300, Dmitry Osipenko wrote:
> Make all comments to be consistent in regards to capitalization and
> punctuation, correct spelling and grammar errors.
[...]
> -	/* Rounds down to not include partial word at the end of buf */
> +	/* rounds down to not include partial word at the end of buffer */
>  	words_to_transfer = buf_remaining / BYTES_PER_FIFO_WORD;
>  
> -	/* It's very common to have < 4 bytes, so optimize that case. */
> +	/* it's very common to have < 4 bytes, so optimize that case */
>  	if (words_to_transfer) {
>  		if (words_to_transfer > tx_fifo_avail)
>  			words_to_transfer = tx_fifo_avail;
>  
>  		/*
> -		 * Update state before writing to FIFO.  If this casues us
> +		 * Update state before writing to FIFO.  If this causes us
>  		 * to finish writing all bytes (AKA buf_remaining goes to 0) we
>  		 * have a potential for an interrupt (PACKET_XFER_COMPLETE is
>  		 * not maskable).  We need to make sure that the isr sees
> @@ -800,8 +799,8 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	}

Those first letters don't look consistently capitalized. :-)

Best Regards,
Micha³ Miros³aw
