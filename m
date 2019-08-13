Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5908ADCA
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 06:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725867AbfHMEfJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 00:35:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:57678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725298AbfHMEfJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Aug 2019 00:35:09 -0400
Received: from localhost (unknown [106.201.103.22])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0CF7F20644;
        Tue, 13 Aug 2019 04:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565670907;
        bh=1QF8LnDZ64amqs4h5il803zrynaMgoHJi17yPftxaSg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WiNrdly0SGH+qgh7K05jjboaTUe0d97OVHB2yZqrF9QRXStmPvvlV1CdeRylT5m6O
         7X/TZ/tIzOTEvhZIHlQWgkCuzoYMVehzc96AxQqLIizHy4Ng8RBdCZFS4kMY7CHJWz
         CKNCmf4LrQlAd7LYAoPa38aQR2pDUl5IEy7Oq1tY=
Date:   Tue, 13 Aug 2019 10:03:55 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     soc@kernel.org, Russell King <linux@armlinux.org.uk>,
        Dan Williams <dan.j.williams@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/7] dma: iop-adma: use correct printk format strings
Message-ID: <20190813043355.GO12733@vkoul-mobl.Dlink>
References: <20190809162956.488941-1-arnd@arndb.de>
 <20190809163334.489360-1-arnd@arndb.de>
 <20190809163334.489360-3-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809163334.489360-3-arnd@arndb.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09-08-19, 18:33, Arnd Bergmann wrote:
> When compile-testing on other architectures, we get lots of warnings
> about incorrect format strings, like:
> 
>    drivers/dma/iop-adma.c: In function 'iop_adma_alloc_slots':
>    drivers/dma/iop-adma.c:307:6: warning: format '%x' expects argument of type 'unsigned int', but argument 6 has type 'dma_addr_t {aka long long unsigned int}' [-Wformat=]
> 
>    drivers/dma/iop-adma.c: In function 'iop_adma_prep_dma_memcpy':
> >> drivers/dma/iop-adma.c:518:40: warning: format '%u' expects argument of type 'unsigned int', but argument 5 has type 'size_t {aka long unsigned int}' [-Wformat=]
> 
> Use %zu for printing size_t as required, and cast the dma_addr_t
> arguments to 'u64' for printing with %llx. Ideally this should use
> the %pad format string, but that requires an lvalue argument that
> doesn't work here.

Please change title to "dmaengine: iop-adma: use correct printk format strings"

After that:

Acked-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/dma/iop-adma.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/dma/iop-adma.c b/drivers/dma/iop-adma.c
> index 7857b54770d1..aebdd671651a 100644
> --- a/drivers/dma/iop-adma.c
> +++ b/drivers/dma/iop-adma.c
> @@ -117,9 +117,9 @@ static void __iop_adma_slot_cleanup(struct iop_adma_chan *iop_chan)
>  	list_for_each_entry_safe(iter, _iter, &iop_chan->chain,
>  					chain_node) {
>  		pr_debug("\tcookie: %d slot: %d busy: %d "
> -			"this_desc: %#x next_desc: %#x ack: %d\n",
> +			"this_desc: %#x next_desc: %#llx ack: %d\n",
>  			iter->async_tx.cookie, iter->idx, busy,
> -			iter->async_tx.phys, iop_desc_get_next_desc(iter),
> +			iter->async_tx.phys, (u64)iop_desc_get_next_desc(iter),
>  			async_tx_test_ack(&iter->async_tx));
>  		prefetch(_iter);
>  		prefetch(&_iter->async_tx);
> @@ -307,9 +307,9 @@ iop_adma_alloc_slots(struct iop_adma_chan *iop_chan, int num_slots,
>  				int i;
>  				dev_dbg(iop_chan->device->common.dev,
>  					"allocated slot: %d "
> -					"(desc %p phys: %#x) slots_per_op %d\n",
> +					"(desc %p phys: %#llx) slots_per_op %d\n",
>  					iter->idx, iter->hw_desc,
> -					iter->async_tx.phys, slots_per_op);
> +					(u64)iter->async_tx.phys, slots_per_op);
>  
>  				/* pre-ack all but the last descriptor */
>  				if (num_slots != slots_per_op)
> @@ -517,7 +517,7 @@ iop_adma_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dma_dest,
>  		return NULL;
>  	BUG_ON(len > IOP_ADMA_MAX_BYTE_COUNT);
>  
> -	dev_dbg(iop_chan->device->common.dev, "%s len: %u\n",
> +	dev_dbg(iop_chan->device->common.dev, "%s len: %zu\n",
>  		__func__, len);
>  
>  	spin_lock_bh(&iop_chan->lock);
> @@ -550,7 +550,7 @@ iop_adma_prep_dma_xor(struct dma_chan *chan, dma_addr_t dma_dest,
>  	BUG_ON(len > IOP_ADMA_XOR_MAX_BYTE_COUNT);
>  
>  	dev_dbg(iop_chan->device->common.dev,
> -		"%s src_cnt: %d len: %u flags: %lx\n",
> +		"%s src_cnt: %d len: %zu flags: %lx\n",
>  		__func__, src_cnt, len, flags);
>  
>  	spin_lock_bh(&iop_chan->lock);
> @@ -583,7 +583,7 @@ iop_adma_prep_dma_xor_val(struct dma_chan *chan, dma_addr_t *dma_src,
>  	if (unlikely(!len))
>  		return NULL;
>  
> -	dev_dbg(iop_chan->device->common.dev, "%s src_cnt: %d len: %u\n",
> +	dev_dbg(iop_chan->device->common.dev, "%s src_cnt: %d len: %zu\n",
>  		__func__, src_cnt, len);
>  
>  	spin_lock_bh(&iop_chan->lock);
> @@ -621,7 +621,7 @@ iop_adma_prep_dma_pq(struct dma_chan *chan, dma_addr_t *dst, dma_addr_t *src,
>  	BUG_ON(len > IOP_ADMA_XOR_MAX_BYTE_COUNT);
>  
>  	dev_dbg(iop_chan->device->common.dev,
> -		"%s src_cnt: %d len: %u flags: %lx\n",
> +		"%s src_cnt: %d len: %zu flags: %lx\n",
>  		__func__, src_cnt, len, flags);
>  
>  	if (dmaf_p_disabled_continue(flags))
> @@ -684,7 +684,7 @@ iop_adma_prep_dma_pq_val(struct dma_chan *chan, dma_addr_t *pq, dma_addr_t *src,
>  		return NULL;
>  	BUG_ON(len > IOP_ADMA_XOR_MAX_BYTE_COUNT);
>  
> -	dev_dbg(iop_chan->device->common.dev, "%s src_cnt: %d len: %u\n",
> +	dev_dbg(iop_chan->device->common.dev, "%s src_cnt: %d len: %zu\n",
>  		__func__, src_cnt, len);
>  
>  	spin_lock_bh(&iop_chan->lock);
> -- 
> 2.20.0

-- 
~Vinod
