Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62355E3742
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 17:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389405AbfJXP4G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 11:56:06 -0400
Received: from mx2.suse.de ([195.135.220.15]:54970 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389313AbfJXP4G (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 24 Oct 2019 11:56:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D47DFB2D3;
        Thu, 24 Oct 2019 15:56:04 +0000 (UTC)
Date:   Thu, 24 Oct 2019 17:56:23 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     <linux-i2c@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 2/2] i2c: i801: Add support for Intel Comet Lake PCH-H
Message-ID: <20191024175623.2cd9faa6@endymion>
In-Reply-To: <20191024105726.10802-2-jarkko.nikula@linux.intel.com>
References: <20191024105726.10802-1-jarkko.nikula@linux.intel.com>
        <20191024105726.10802-2-jarkko.nikula@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 24 Oct 2019 13:57:26 +0300, Jarkko Nikula wrote:
> Add support for another Intel Comet Lake variant.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 01a29beb5da0..df02040d36d5 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -64,6 +64,7 @@
>   * Cedar Fork (PCH)		0x18df	32	hard	yes	yes	yes
>   * Ice Lake-LP (PCH)		0x34a3	32	hard	yes	yes	yes
>   * Comet Lake (PCH)		0x02a3	32	hard	yes	yes	yes
> + * Comet Lake-H (PCH)		0x06a3	32	hard	yes	yes	yes
>   * Elkhart Lake (PCH)		0x4b23	32	hard	yes	yes	yes
>   * Tiger Lake-LP (PCH)		0xa0a3	32	hard	yes	yes	yes
>   * Jasper Lake-N (PCH)		0x4da3	32	hard	yes	yes	yes
> @@ -206,6 +207,7 @@
>  
>  /* Older devices have their ID defined in <linux/pci_ids.h> */
>  #define PCI_DEVICE_ID_INTEL_COMETLAKE_SMBUS		0x02a3
> +#define PCI_DEVICE_ID_INTEL_COMETLAKE_H_SMBUS		0x06a3
>  #define PCI_DEVICE_ID_INTEL_BAYTRAIL_SMBUS		0x0f12
>  #define PCI_DEVICE_ID_INTEL_CDF_SMBUS			0x18df
>  #define PCI_DEVICE_ID_INTEL_DNV_SMBUS			0x19df
> @@ -1071,6 +1073,7 @@ static const struct pci_device_id i801_ids[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CANNONLAKE_LP_SMBUS) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICELAKE_LP_SMBUS) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_COMETLAKE_SMBUS) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_COMETLAKE_H_SMBUS) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_TIGERLAKE_LP_SMBUS) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_JASPER_LAKE_N_SMBUS) },
> @@ -1753,6 +1756,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	case PCI_DEVICE_ID_INTEL_CDF_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_ICELAKE_LP_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_COMETLAKE_SMBUS:
> +	case PCI_DEVICE_ID_INTEL_COMETLAKE_H_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_TIGERLAKE_LP_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_JASPER_LAKE_N_SMBUS:

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
