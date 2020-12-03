Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE64A2CDA6F
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 16:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728701AbgLCPzV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Dec 2020 10:55:21 -0500
Received: from mga07.intel.com ([134.134.136.100]:32094 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726578AbgLCPzU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Dec 2020 10:55:20 -0500
IronPort-SDR: BO1oBHTY7uY7qy5BVEzCwRFkW60r4oH0H/W4c/cEu8bbe7ZKMqTYUpEOmehlme+sCYH9B0yhix
 Co42dOcMpxPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9824"; a="237335303"
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; 
   d="scan'208";a="237335303"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2020 07:53:39 -0800
IronPort-SDR: PtPnG4dfNIwKfQPF6H00vjVTc05nFy3Jkb4/ELhZ3Tuokf9I195ccMbx2Yy+UZB8KWvPz/HPto
 F+2zfi2ZkrAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; 
   d="scan'208";a="365879536"
Received: from unknown (HELO localhost.localdomain) ([10.23.185.145])
  by fmsmga004.fm.intel.com with ESMTP; 03 Dec 2020 07:53:39 -0800
Message-ID: <989a41d4e72610c8ddf36372e9a84de48f27c246.camel@linux.intel.com>
Subject: Re: [PATCH v1] i2c: ismt: Adding support for
 I2C_SMBUS_BLOCK_PROC_CALL
From:   Seth Heasley <seth.heasley@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Cc:     mario.posso.escobar@intel.com, seth.heasley@intel.com
Date:   Thu, 03 Dec 2020 00:51:02 -0800
In-Reply-To: <20201116153245.24083-1-andriy.shevchenko () linux ! intel ! com>
References: <20201116153245.24083-1-andriy.shevchenko () linux ! intel ! com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-8.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 2020-11-16 at 15:32 +0000, Andy Shevchenko wrote:
> From: Mario Alejandro Posso Escobar <mario.posso.escobar@intel.com>
> 
> Expand the driver to support I2C_SMBUS_BLOCK_PROC_CALL since
> HW supports it already.
> 
> Co-developed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Mario Alejandro Posso Escobar 
> mario.posso.escobar@intel.com>
 Reviewed-by: Seth Heasley <seth.heasley@linux.intel.com>

> ---
>  drivers/i2c/busses/i2c-ismt.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-
> ismt.c
> index a35a27c320e7..a6187cbec2c9 100644
> --- a/drivers/i2c/busses/i2c-ismt.c
> +++ b/drivers/i2c/busses/i2c-ismt.c
> @@ -53,7 +53,7 @@
>   *  Features supported by this driver:
>   *  Hardware PEC                     yes
>   *  Block buffer                     yes
> - *  Block process call transaction   no
> + *  Block process call transaction   yes
>   *  Slave mode                       no
>   */
>  
> @@ -332,7 +332,8 @@ static int ismt_process_desc(const struct
> ismt_desc *desc,
>  
>  	if (desc->status & ISMT_DESC_SCS) {
>  		if (read_write == I2C_SMBUS_WRITE &&
> -		    size != I2C_SMBUS_PROC_CALL)
> +		    size != I2C_SMBUS_PROC_CALL &&
> +		    size != I2C_SMBUS_BLOCK_PROC_CALL)
>  			return 0;
>  
>  		switch (size) {
> @@ -345,6 +346,7 @@ static int ismt_process_desc(const struct
> ismt_desc *desc,
>  			data->word = dma_buffer[0] | (dma_buffer[1] <<
> 8);
>  			break;
>  		case I2C_SMBUS_BLOCK_DATA:
> +		case I2C_SMBUS_BLOCK_PROC_CALL:
>  			if (desc->rxbytes != dma_buffer[0] + 1)
>  				return -EMSGSIZE;
>  
> @@ -518,6 +520,18 @@ static int ismt_access(struct i2c_adapter *adap,
> u16 addr,
>  		}
>  		break;
>  
> +	case I2C_SMBUS_BLOCK_PROC_CALL:
> +		dev_dbg(dev, "I2C_SMBUS_BLOCK_PROC_CALL\n");
> +		dma_size = I2C_SMBUS_BLOCK_MAX;
> +		desc->tgtaddr_rw = ISMT_DESC_ADDR_RW(addr, 1);
> +		desc->wr_len_cmd = data->block[0] + 1;
> +		desc->rd_len = dma_size;
> +		desc->control |= ISMT_DESC_BLK;
> +		dma_direction = DMA_BIDIRECTIONAL;
> +		dma_buffer[0] = command;
> +		memcpy(&dma_buffer[1], &data->block[1], data-
> >block[0]);
> +		break;
> +
>  	case I2C_SMBUS_I2C_BLOCK_DATA:
>  		/* Make sure the length is valid */
>  		if (data->block[0] < 1)
> @@ -624,6 +638,7 @@ static u32 ismt_func(struct i2c_adapter *adap)
>  	       I2C_FUNC_SMBUS_BYTE_DATA		|
>  	       I2C_FUNC_SMBUS_WORD_DATA		|
>  	       I2C_FUNC_SMBUS_PROC_CALL		|
> +	       I2C_FUNC_SMBUS_BLOCK_PROC_CALL	|
>  	       I2C_FUNC_SMBUS_BLOCK_DATA	|
>  	       I2C_FUNC_SMBUS_I2C_BLOCK		|
>  	       I2C_FUNC_SMBUS_PEC;

