Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE761995B
	for <lists+linux-i2c@lfdr.de>; Fri, 10 May 2019 10:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbfEJIM3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 May 2019 04:12:29 -0400
Received: from mx2.suse.de ([195.135.220.15]:41590 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726984AbfEJIM1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 10 May 2019 04:12:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 1A2D1AF41;
        Fri, 10 May 2019 08:12:26 +0000 (UTC)
Date:   Fri, 10 May 2019 10:12:24 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Vignesh R <vigneshr@ti.com>,
        Eddie James <eajames@linux.vnet.ibm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Juergen Fitschen <jfi@ssv-embedded.de>,
        Elie Morisse <syniurge@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: Allow selecting BCM2835 I2C controllers on
 ARCH_BRCMSTB
Message-ID: <20190510101224.3cd5d0f9@endymion>
In-Reply-To: <20190509210438.28223-1-f.fainelli@gmail.com>
References: <20190509210438.28223-1-f.fainelli@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu,  9 May 2019 14:04:36 -0700, Florian Fainelli wrote:
> From: Kamal Dasu <kdasu.kdev@gmail.com>
> 
> ARCH_BRCMSTB platforms have the BCM2835 I2C controllers, allow
> selecting the i2c-bcm2835 driver on such platforms.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  drivers/i2c/busses/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 26186439db6b..7277c1051ca2 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -435,7 +435,7 @@ config I2C_AXXIA
>  
>  config I2C_BCM2835
>  	tristate "Broadcom BCM2835 I2C controller"
> -	depends on ARCH_BCM2835
> +	depends on ARCH_BCM2835 || ARCH_BRCMSTB
>  	help
>  	  If you say yes to this option, support will be included for the
>  	  BCM2835 I2C controller.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks,
-- 
Jean Delvare
SUSE L3 Support
