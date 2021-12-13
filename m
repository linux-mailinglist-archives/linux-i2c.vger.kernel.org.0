Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDC9472BB7
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Dec 2021 12:44:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbhLMLoh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Dec 2021 06:44:37 -0500
Received: from mga04.intel.com ([192.55.52.120]:50697 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231463AbhLMLoh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Dec 2021 06:44:37 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="237451255"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; 
   d="scan'208";a="237451255"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 03:44:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; 
   d="scan'208";a="681606545"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 03:44:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mwjk2-005bHS-Kl;
        Mon, 13 Dec 2021 13:43:38 +0200
Date:   Mon, 13 Dec 2021 13:43:38 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     tamal.saha@intel.com
Cc:     wsa@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i2c@vger.kernel.org, bala.senthil@intel.com
Subject: Re: [PATCH v1] i2c: designware: Do not complete i2c read without
 RX_FULL interrupt
Message-ID: <Ybcx6vWEMLE2XlYL@smile.fi.intel.com>
References: <20211211041643.21543-1-tamal.saha@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211211041643.21543-1-tamal.saha@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Dec 11, 2021 at 09:46:43AM +0530, tamal.saha@intel.com wrote:
> From: Tamal Saha <tamal.saha@intel.com>
> 
> Intel Keem Bay platform supports multimaster operations over same i2c
> bus using Synopsis i2c designware IP. When multi masters initiate i2c

Synopsys

DesignWare (and everywhere else in the text and comments).

> operation simultaneously in a loop, SCL line is stucked low forever
> after few i2c operations. Following interrupt sequences are observed
> in:
>   working case: TX_EMPTY, RX_FULL and STOP_DET
>   non working case: TX_EMPTY, STOP_DET, RX_FULL.
> 
> DW_apb_i2c stretches the SCL line when the TX FIFO is empty or when
> RX FIFO is full. The DW_apb_i2c master will continue to hold the SCL
> line LOW until RX FIFO is read.
> 
> Linux kernel i2c designware software does not handle above non working

software --> driver ?

> sequence. TX_EMPTY, RX_FULL and STOP_DET routine execution are required
> in sequence although RX_FULL interrupt is raised after STOP_DET by
> hardware. Clear STOP_DET for following conditions

the following

(and seems the colon is missed at the end of line)

>   (STOP_DET ,RX_FULL, rx_outstanding)
>     Write Operation: (1, 0, 0)
>     Read Operation:
>       RX_FULL followed by STOP_DET: (0, 1, 1) -> (1, 0, 0)
>       STOP_DET followed by RX_FULL: (1, 0, 1) -> (1, 1, 0)
>       RX_FULL and STOP_DET together: (1, 1, 1)
> 
> Signed-off-by: Tamal Saha <tamal.saha@intel.com>
> ---
>  drivers/i2c/busses/i2c-designware-master.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index 9b08bb5df38d..9177463c2cbb 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -701,7 +701,8 @@ static u32 i2c_dw_read_clear_intrbits(struct dw_i2c_dev *dev)
>  		regmap_read(dev->map, DW_IC_CLR_RX_DONE, &dummy);
>  	if (stat & DW_IC_INTR_ACTIVITY)
>  		regmap_read(dev->map, DW_IC_CLR_ACTIVITY, &dummy);
> -	if (stat & DW_IC_INTR_STOP_DET)
> +	if ((stat & DW_IC_INTR_STOP_DET) &&
> +	    ((dev->rx_outstanding == 0) || (stat & DW_IC_INTR_RX_FULL)))
>  		regmap_read(dev->map, DW_IC_CLR_STOP_DET, &dummy);
>  	if (stat & DW_IC_INTR_START_DET)
>  		regmap_read(dev->map, DW_IC_CLR_START_DET, &dummy);
> @@ -723,6 +724,7 @@ static int i2c_dw_irq_handler_master(struct dw_i2c_dev *dev)
>  	if (stat & DW_IC_INTR_TX_ABRT) {
>  		dev->cmd_err |= DW_IC_ERR_TX_ABRT;
>  		dev->status = STATUS_IDLE;
> +		dev->rx_outstanding = 0;
>  
>  		/*
>  		 * Anytime TX_ABRT is set, the contents of the tx/rx
> @@ -745,7 +747,8 @@ static int i2c_dw_irq_handler_master(struct dw_i2c_dev *dev)
>  	 */
>  
>  tx_aborted:
> -	if ((stat & (DW_IC_INTR_TX_ABRT | DW_IC_INTR_STOP_DET)) || dev->msg_err)
> +	if (((stat & (DW_IC_INTR_TX_ABRT | DW_IC_INTR_STOP_DET)) || dev->msg_err) &&
> +	     (dev->rx_outstanding == 0))
>  		complete(&dev->cmd_complete);
>  	else if (unlikely(dev->flags & ACCESS_INTR_MASK)) {
>  		/* Workaround to trigger pending interrupt */
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


