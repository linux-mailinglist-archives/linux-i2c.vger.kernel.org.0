Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2837314A2D4
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2020 12:17:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729536AbgA0LRY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jan 2020 06:17:24 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42261 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgA0LRY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jan 2020 06:17:24 -0500
Received: by mail-wr1-f65.google.com with SMTP id q6so10703284wro.9;
        Mon, 27 Jan 2020 03:17:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0rZPGktF2ABAmRfi1HI1eeGD5Kif6zMVt4/e43jHA6U=;
        b=Qv7d3k9l9cFgJgWSvOW4gMkjNRDPYG2p/tZkFy1wal6BW1vENy9nVn+9Abo+YtmOmf
         ncvvPt0C5uaOZE9KoqGLYhOFoDdmDSvdCK6EYOsbHW48UlNgdicCACuIdSUfzjl5W0CS
         2s6bSJQ7AMcSG4mU70eTV6AdMUf1oQwGbmNxtOXmrDuwILYEcti2JdmLqwOow0bDRf3L
         q812f+f4y6s73avGQU+T2AD7oxQNzGao86d63NP+BJSWa/hCzJS0bqpAm9r/rFKZObS/
         BfeS1t061wH4HBGtsTcOIMEyT7adEvvmDH8YiNyqs0T+CAgkSOJ1kCy/g9DwSFdEL8+5
         msOA==
X-Gm-Message-State: APjAAAU7nk/0fiA9y5xYnzVG8IJPItgGOhJrxfxAxZ0Zmq1Je9mG9/7y
        pI/Rl216+DanbG0cyw3SxtYfOea2
X-Google-Smtp-Source: APXvYqwgWvkTL1IKXo000lnYqYpXBg2xCDKYF89b3jcQxtCQVDjbbED/2bKHBBe0Tx24hb03q4kTfw==
X-Received: by 2002:a2e:7311:: with SMTP id o17mr10016012ljc.197.1580123502746;
        Mon, 27 Jan 2020 03:11:42 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id a11sm7907961lfb.34.2020.01.27.03.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 03:11:41 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iw2Ix-0003X2-QL; Mon, 27 Jan 2020 12:11:43 +0100
Date:   Mon, 27 Jan 2020 12:11:43 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Colin King <colin.king@canonical.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next][V2] i2c: xiic: fix indentation issue
Message-ID: <20200127111143.GM8375@localhost>
References: <20200127102303.44133-1-colin.king@canonical.com>
 <2dd84ab2-a7a3-fdd8-6bd6-07f1b3d5cd00@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dd84ab2-a7a3-fdd8-6bd6-07f1b3d5cd00@xilinx.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 27, 2020 at 12:03:02PM +0100, Michal Simek wrote:
> On 27. 01. 20 11:23, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > There is a statement that is indented one level too deeply, remove
> > the extraneous tab.
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> > V2: fix type in commit message
> > ---
> >  drivers/i2c/busses/i2c-xiic.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> > index b17d30c9ab40..90c1c362394d 100644
> > --- a/drivers/i2c/busses/i2c-xiic.c
> > +++ b/drivers/i2c/busses/i2c-xiic.c
> > @@ -261,7 +261,7 @@ static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
> >  		xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
> >  		if (time_after(jiffies, timeout)) {
> >  			dev_err(i2c->dev, "Failed to clear rx fifo\n");
> > -				return -ETIMEDOUT;
> > +			return -ETIMEDOUT;
> >  		}
> >  	}
> >  
> > 
> 
> As was suggested by Peter you should also add Fixes: <sha1> ("patch
> subject")

Please stop this silliness. This is not a bug fix and does not need a
Fixes tag.

Johan
