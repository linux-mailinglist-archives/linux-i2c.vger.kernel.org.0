Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2E872262AB
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jul 2020 16:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgGTO7l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jul 2020 10:59:41 -0400
Received: from mx2.suse.de ([195.135.220.15]:35670 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726506AbgGTO7l (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Jul 2020 10:59:41 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 96548AED7;
        Mon, 20 Jul 2020 14:59:45 +0000 (UTC)
Date:   Mon, 20 Jul 2020 16:59:38 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH][next] i2c: busses: Use fallthrough pseudo-keyword
Message-ID: <20200720165938.31bb6b10@endymion>
In-Reply-To: <20200716220307.GA19706@embeddedor>
References: <20200716220307.GA19706@embeddedor>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Gustavo,

On Thu, 16 Jul 2020 17:03:07 -0500, Gustavo A. R. Silva wrote:
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1].
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/i2c/busses/i2c-amd8111.c | 2 +-
>  drivers/i2c/busses/i2c-i801.c    | 8 ++++----
>  drivers/i2c/busses/i2c-viapro.c  | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-amd8111.c b/drivers/i2c/busses/i2c-amd8111.c
> index 2b14fef5bf26..34862ad3423e 100644
> --- a/drivers/i2c/busses/i2c-amd8111.c
> +++ b/drivers/i2c/busses/i2c-amd8111.c
> @@ -381,7 +381,7 @@ static s32 amd8111_access(struct i2c_adapter * adap, u16 addr,
>  			if (status)
>  				return status;
>  			len = min_t(u8, len, I2C_SMBUS_BLOCK_MAX);
> -			/* fall through */
> +			fallthrough;
>  		case I2C_SMBUS_I2C_BLOCK_DATA:
>  			for (i = 0; i < len; i++) {
>  				status = amd_ec_read(smbus, AMD_SMB_DATA + i,
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 1fc7ae77753d..638e7f7c66cc 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1765,19 +1765,19 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	case PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS_MS1:
>  	case PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS_MS2:
>  		priv->features |= FEATURE_IDF;
> -		/* fall through */
> +		fallthrough;
>  	default:
>  		priv->features |= FEATURE_BLOCK_PROC;
>  		priv->features |= FEATURE_I2C_BLOCK_READ;
>  		priv->features |= FEATURE_IRQ;
> -		/* fall through */
> +		fallthrough;
>  	case PCI_DEVICE_ID_INTEL_82801DB_3:
>  		priv->features |= FEATURE_SMBUS_PEC;
>  		priv->features |= FEATURE_BLOCK_BUFFER;
> -		/* fall through */
> +		fallthrough;
>  	case PCI_DEVICE_ID_INTEL_82801CA_3:
>  		priv->features |= FEATURE_HOST_NOTIFY;
> -		/* fall through */
> +		fallthrough;
>  	case PCI_DEVICE_ID_INTEL_82801BA_2:
>  	case PCI_DEVICE_ID_INTEL_82801AB_3:
>  	case PCI_DEVICE_ID_INTEL_82801AA_3:
> diff --git a/drivers/i2c/busses/i2c-viapro.c b/drivers/i2c/busses/i2c-viapro.c
> index 05aa92a3fbe0..970ccdcbb889 100644
> --- a/drivers/i2c/busses/i2c-viapro.c
> +++ b/drivers/i2c/busses/i2c-viapro.c
> @@ -228,7 +228,7 @@ static s32 vt596_access(struct i2c_adapter *adap, u16 addr,
>  			goto exit_unsupported;
>  		if (read_write == I2C_SMBUS_READ)
>  			outb_p(data->block[0], SMBHSTDAT0);
> -		/* Fall through */
> +		fallthrough;
>  	case I2C_SMBUS_BLOCK_DATA:
>  		outb_p(command, SMBHSTCMD);
>  		if (read_write == I2C_SMBUS_WRITE) {

Looks good to me, thanks for doing that.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

However I see many occurrences in other drivers within
drivers/i2c/busses, which are not covered by this patch:

drivers/i2c/busses/i2c-designware-pcidrv.c
drivers/i2c/busses/i2c-mv64xxx.c
drivers/i2c/busses/i2c-omap.c
drivers/i2c/busses/i2c-synquacer.c
drivers/i2c/busses/i2c-ibm_iic.c
drivers/i2c/busses/i2c-aspeed.c
drivers/i2c/busses/scx200_acb.c
drivers/i2c/busses/i2c-digicolor.c
drivers/i2c/busses/i2c-opal.c

Are they covered by another patch of yours?

Thanks,
-- 
Jean Delvare
SUSE L3 Support
