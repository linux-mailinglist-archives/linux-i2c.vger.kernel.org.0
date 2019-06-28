Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3B05A098
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2019 18:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbfF1QOZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jun 2019 12:14:25 -0400
Received: from charlotte.tuxdriver.com ([70.61.120.58]:33694 "EHLO
        smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbfF1QOZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jun 2019 12:14:25 -0400
Received: from cpe-2606-a000-111b-405a-0-0-0-162e.dyn6.twc.com ([2606:a000:111b:405a::162e] helo=localhost)
        by smtp.tuxdriver.com with esmtpsa (TLSv1:AES256-SHA:256)
        (Exim 4.63)
        (envelope-from <nhorman@tuxdriver.com>)
        id 1hgtVq-0004MM-RK; Fri, 28 Jun 2019 12:14:13 -0400
Date:   Fri, 28 Jun 2019 12:13:43 -0400
From:   Neil Horman <nhorman@tuxdriver.com>
To:     Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Seth Heasley <seth.heasley@intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 19/87] i2c: busses: Remove call to memset after
 dmam_alloc_coherent
Message-ID: <20190628161343.GB14635@hmswarspite.think-freely.org>
References: <20190627173653.2833-1-huangfq.daxian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190627173653.2833-1-huangfq.daxian@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Spam-Score: -2.9 (--)
X-Spam-Status: No
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 28, 2019 at 01:36:51AM +0800, Fuqian Huang wrote:
> In commit af7ddd8a627c
> ("Merge tag 'dma-mapping-4.21' of git://git.infradead.org/users/hch/dma-mapping"),
> dmam_alloc_coherent has already zeroed the memory.
> So memset is not needed.
> 
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---
>  drivers/i2c/busses/i2c-ismt.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
> index 02d23edb2fb1..2f95e25a10f7 100644
> --- a/drivers/i2c/busses/i2c-ismt.c
> +++ b/drivers/i2c/busses/i2c-ismt.c
> @@ -781,8 +781,6 @@ static int ismt_dev_init(struct ismt_priv *priv)
>  	if (!priv->hw)
>  		return -ENOMEM;
>  
> -	memset(priv->hw, 0, (ISMT_DESC_ENTRIES * sizeof(struct ismt_desc)));
> -
>  	priv->head = 0;
>  	init_completion(&priv->cmp);
>  
> -- 
> 2.11.0
> 
> 
Acked-by: Neil Horman <nhorman@tuxdriver.com>
