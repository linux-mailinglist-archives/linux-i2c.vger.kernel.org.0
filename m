Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77E1D8ADC5
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 06:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbfHMEeh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 00:34:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:57400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725298AbfHMEeh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Aug 2019 00:34:37 -0400
Received: from localhost (unknown [106.201.103.22])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D145A20644;
        Tue, 13 Aug 2019 04:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565670876;
        bh=LeDopwTuWI+vg3sAxESkUP1Ad5woiNmLizqxL2IUUjM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2m6MPJ5tm+CEzskDxqHh9F5ecwuPmPFOBWaBViK3MhhhWAkFnTetCXd5ZZllNn9EW
         EvujBk4rI/uez+gJqjt7AKpovUYUPsV8xcNohYbUEs89CXz7wyihUSeXqeEWSDZQ6a
         gd+NmLgXwRhYiYmrZZWdTko2muDs9IZgs4W+WBH0=
Date:   Tue, 13 Aug 2019 10:03:24 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     soc@kernel.org, Russell King <linux@armlinux.org.uk>,
        Dan Williams <dan.j.williams@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 2/7] dma: iop-adma: include prefetch.h
Message-ID: <20190813043324.GN12733@vkoul-mobl.Dlink>
References: <20190809162956.488941-1-arnd@arndb.de>
 <20190809163334.489360-1-arnd@arndb.de>
 <20190809163334.489360-2-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809163334.489360-2-arnd@arndb.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09-08-19, 18:33, Arnd Bergmann wrote:
> Compile-testing this driver fails on m68k without the
> extra header inclusion.

Please change title to "dmaengine: iop-adma: include prefetch.h"

After that:

Acked-by: Vinod Koul <vkoul@kernel.org>

> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/dma/iop-adma.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/dma/iop-adma.c b/drivers/dma/iop-adma.c
> index c6c0143670d9..7857b54770d1 100644
> --- a/drivers/dma/iop-adma.c
> +++ b/drivers/dma/iop-adma.c
> @@ -16,6 +16,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/interrupt.h>
>  #include <linux/platform_device.h>
> +#include <linux/prefetch.h>
>  #include <linux/memory.h>
>  #include <linux/ioport.h>
>  #include <linux/raid/pq.h>
> -- 
> 2.20.0

-- 
~Vinod
