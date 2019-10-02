Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79972C8784
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2019 13:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbfJBLpu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Oct 2019 07:45:50 -0400
Received: from mx2.suse.de ([195.135.220.15]:37452 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725875AbfJBLpu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Oct 2019 07:45:50 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id E126CAC67;
        Wed,  2 Oct 2019 11:45:48 +0000 (UTC)
Date:   Wed, 2 Oct 2019 13:46:00 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     <linux-i2c@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: i801: Bring back Block Process Call support for
 certain platforms
Message-ID: <20191002134600.2cc00e30@endymion>
In-Reply-To: <20190927110911.23045-1-jarkko.nikula@linux.intel.com>
References: <20190927110911.23045-1-jarkko.nikula@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 27 Sep 2019 14:09:11 +0300, Jarkko Nikula wrote:
> Commit b84398d6d7f9 ("i2c: i801: Use iTCO version 6 in Cannon Lake PCH
> and beyond") looks like to drop by accident Block Write-Block Read Process
> Call support for Intel Sunrisepoint, Lewisburg, Denverton and Kaby Lake.

And I reviewed that one :( Sorry for letting it slip through, and
thanks for catching it.

> That support was added for above and newer platforms by the commit
> 315cd67c9453 ("i2c: i801: Add Block Write-Block Read Process Call
> support") so bring it back for above platforms.
> 
> Fixes: b84398d6d7f9 ("i2c: i801: Use iTCO version 6 in Cannon Lake PCH and beyond")
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index a4608a047468..1fed7bf00a6d 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1736,6 +1736,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	case PCI_DEVICE_ID_INTEL_LEWISBURG_SSKU_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_DNV_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_KABYLAKE_PCH_H_SMBUS:
> +		priv->features |= FEATURE_BLOCK_PROC;
>  		priv->features |= FEATURE_I2C_BLOCK_READ;
>  		priv->features |= FEATURE_IRQ;
>  		priv->features |= FEATURE_SMBUS_PEC;

Too late but still

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
