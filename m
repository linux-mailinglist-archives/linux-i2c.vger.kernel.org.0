Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A318251327
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 09:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729209AbgHYH2L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 03:28:11 -0400
Received: from mx2.suse.de ([195.135.220.15]:57792 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729194AbgHYH2L (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 03:28:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 88229AD39;
        Tue, 25 Aug 2020 07:28:40 +0000 (UTC)
Date:   Tue, 25 Aug 2020 09:28:09 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] i2c: Remove 'default n' from busses/Kconfig
Message-ID: <20200825092809.2d826758@endymion>
In-Reply-To: <20200820080525.2767120-1-jarkko.nikula@linux.intel.com>
References: <20200820080525.2767120-1-jarkko.nikula@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 20 Aug 2020 11:05:25 +0300, Jarkko Nikula wrote:
> The default value for a config option defaults to 'n' so it doesn't need
> to be set here.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i2c/busses/Kconfig | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 085ca9b009ed..9731121ec561 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -840,7 +840,6 @@ config I2C_PASEMI
>  config I2C_PCA_PLATFORM
>  	tristate "PCA9564/PCA9665 as platform device"
>  	select I2C_ALGOPCA
> -	default n
>  	help
>  	  This driver supports a memory mapped Philips PCA9564/PCA9665
>  	  parallel bus to I2C bus controller.
> @@ -1251,7 +1250,6 @@ config I2C_TAOS_EVM
>  	depends on TTY
>  	select SERIO
>  	select SERIO_SERPORT
> -	default n
>  	help
>  	  This supports TAOS evaluation modules on serial port. In order to
>  	  use this driver, you will need the inputattach tool, which is part
> @@ -1335,7 +1333,6 @@ config I2C_PCA_ISA
>  	tristate "PCA9564/PCA9665 on an ISA bus"
>  	depends on ISA
>  	select I2C_ALGOPCA
> -	default n
>  	help
>  	  This driver supports ISA boards using the Philips PCA9564/PCA9665
>  	  parallel bus to I2C bus controller.

Definitely a good move, this was on my informal to-do list for some
time already...

Option I2C_STUB suffers from the same but uses a different syntax,
which may explain why you missed it.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
