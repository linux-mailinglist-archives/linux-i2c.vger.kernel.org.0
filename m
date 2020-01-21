Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 901BC1438FA
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2020 10:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbgAUJFP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jan 2020 04:05:15 -0500
Received: from mx2.suse.de ([195.135.220.15]:54184 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbgAUJFP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Jan 2020 04:05:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id BF639BA96;
        Tue, 21 Jan 2020 09:05:13 +0000 (UTC)
Date:   Tue, 21 Jan 2020 10:05:12 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     <linux-i2c@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: i801: Add support for Intel Comet Lake PCH-V
Message-ID: <20200121100512.7da72467@endymion>
In-Reply-To: <20200116074651.529380-1-jarkko.nikula@linux.intel.com>
References: <20200116074651.529380-1-jarkko.nikula@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 16 Jan 2020 09:46:51 +0200, Jarkko Nikula wrote:
> Add support for Intel Comet Lake PCH-V which is based on Intel Kaby
> Lake. Difference between it and other Comet Lake variants is that former
> uses previous iTCO version 4 and latter use version 6 like Intel Cannon
> Lake PCH.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 44db3a91d32d..ca4f096fef74 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -68,6 +68,7 @@
>   * Elkhart Lake (PCH)		0x4b23	32	hard	yes	yes	yes
>   * Tiger Lake-LP (PCH)		0xa0a3	32	hard	yes	yes	yes
>   * Jasper Lake (SOC)		0x4da3	32	hard	yes	yes	yes
> + * Comet Lake-V (PCH)		0xa3a3	32	hard	yes	yes	yes
>   *
>   * Features supported by this driver:
>   * Software PEC				no
> @@ -244,6 +245,7 @@
>  #define PCI_DEVICE_ID_INTEL_LEWISBURG_SSKU_SMBUS	0xa223
>  #define PCI_DEVICE_ID_INTEL_KABYLAKE_PCH_H_SMBUS	0xa2a3
>  #define PCI_DEVICE_ID_INTEL_CANNONLAKE_H_SMBUS		0xa323
> +#define PCI_DEVICE_ID_INTEL_COMETLAKE_V_SMBUS		0xa3a3
>  
>  struct i801_mux_config {
>  	char *gpio_chip;
> @@ -1074,6 +1076,7 @@ static const struct pci_device_id i801_ids[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICELAKE_LP_SMBUS) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_COMETLAKE_SMBUS) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_COMETLAKE_H_SMBUS) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_COMETLAKE_V_SMBUS) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_TIGERLAKE_LP_SMBUS) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS) },
> @@ -1742,6 +1745,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	case PCI_DEVICE_ID_INTEL_LEWISBURG_SSKU_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_DNV_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_KABYLAKE_PCH_H_SMBUS:
> +	case PCI_DEVICE_ID_INTEL_COMETLAKE_V_SMBUS:
>  		priv->features |= FEATURE_BLOCK_PROC;
>  		priv->features |= FEATURE_I2C_BLOCK_READ;
>  		priv->features |= FEATURE_IRQ;

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
