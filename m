Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D039EE3740
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 17:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409830AbfJXPzi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 11:55:38 -0400
Received: from mx2.suse.de ([195.135.220.15]:54630 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2405564AbfJXPzi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 24 Oct 2019 11:55:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 0F698B230;
        Thu, 24 Oct 2019 15:55:37 +0000 (UTC)
Date:   Thu, 24 Oct 2019 17:55:50 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     <linux-i2c@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/2] i2c: i801: Add support for Intel Jasper Lake
Message-ID: <20191024175550.5dd6d2b1@endymion>
In-Reply-To: <20191024105726.10802-1-jarkko.nikula@linux.intel.com>
References: <20191024105726.10802-1-jarkko.nikula@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 24 Oct 2019 13:57:25 +0300, Jarkko Nikula wrote:
> Add support for SMBus controller on Intel Jasper Lake PCH-N.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  Documentation/i2c/busses/i2c-i801.rst | 1 +
>  drivers/i2c/busses/Kconfig            | 1 +
>  drivers/i2c/busses/i2c-i801.c         | 4 ++++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
> index 2a570c214880..aa4a0e26e9b9 100644
> --- a/Documentation/i2c/busses/i2c-i801.rst
> +++ b/Documentation/i2c/busses/i2c-i801.rst
> @@ -42,6 +42,7 @@ Supported adapters:
>    * Intel Comet Lake (PCH)
>    * Intel Elkhart Lake (PCH)
>    * Intel Tiger Lake (PCH)
> +  * Intel Jasper Lake (PCH)
>  
>     Datasheets: Publicly available at the Intel website
>  
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 146ce40d8e0a..89cb8d7c4853 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -145,6 +145,7 @@ config I2C_I801
>  	    Comet Lake (PCH)
>  	    Elkhart Lake (PCH)
>  	    Tiger Lake (PCH)
> +	    Jasper Lake (PCH)
>  
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-i801.
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index f1c714acc280..01a29beb5da0 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -66,6 +66,7 @@
>   * Comet Lake (PCH)		0x02a3	32	hard	yes	yes	yes
>   * Elkhart Lake (PCH)		0x4b23	32	hard	yes	yes	yes
>   * Tiger Lake-LP (PCH)		0xa0a3	32	hard	yes	yes	yes
> + * Jasper Lake-N (PCH)		0x4da3	32	hard	yes	yes	yes
>   *
>   * Features supported by this driver:
>   * Software PEC				no
> @@ -223,6 +224,7 @@
>  #define PCI_DEVICE_ID_INTEL_ICELAKE_LP_SMBUS		0x34a3
>  #define PCI_DEVICE_ID_INTEL_5_3400_SERIES_SMBUS		0x3b30
>  #define PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS		0x4b23
> +#define PCI_DEVICE_ID_INTEL_JASPER_LAKE_N_SMBUS		0x4da3
>  #define PCI_DEVICE_ID_INTEL_BROXTON_SMBUS		0x5ad4
>  #define PCI_DEVICE_ID_INTEL_LYNXPOINT_SMBUS		0x8c22
>  #define PCI_DEVICE_ID_INTEL_WILDCATPOINT_SMBUS		0x8ca2
> @@ -1071,6 +1073,7 @@ static const struct pci_device_id i801_ids[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_COMETLAKE_SMBUS) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_TIGERLAKE_LP_SMBUS) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_JASPER_LAKE_N_SMBUS) },
>  	{ 0, }
>  };
>  
> @@ -1752,6 +1755,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	case PCI_DEVICE_ID_INTEL_COMETLAKE_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_TIGERLAKE_LP_SMBUS:
> +	case PCI_DEVICE_ID_INTEL_JASPER_LAKE_N_SMBUS:
>  		priv->features |= FEATURE_BLOCK_PROC;
>  		priv->features |= FEATURE_I2C_BLOCK_READ;
>  		priv->features |= FEATURE_IRQ;

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
