Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAC047416
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2019 12:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbfFPKAB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Sun, 16 Jun 2019 06:00:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:38148 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725888AbfFPKAA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 16 Jun 2019 06:00:00 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 9DAE7AE2C;
        Sun, 16 Jun 2019 09:59:59 +0000 (UTC)
Date:   Sun, 16 Jun 2019 11:59:57 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v1 1/3] i2c: i801: Fix kernel crash in
 is_dell_system_with_lis3lv02d()
Message-ID: <20190616115957.661f1a7c@endymion>
In-Reply-To: <20190613164529.63482-1-andriy.shevchenko@linux.intel.com>
References: <20190613164529.63482-1-andriy.shevchenko@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 13 Jun 2019 19:45:27 +0300, Andy Shevchenko wrote:
> The commit
> 
>   19b07cb4a187 ("i2c: i801: Register optional lis3lv02d I2C device on Dell machines")
> 
> introduced a new check in order to enumerate some slave devices on Dell
> machines. Though, it brings a regression on machines where DMI vendor is not set.
> 
>  BUG: kernel NULL pointer dereference, address: 0000000000000000
>  #PF: supervisor read access in kernel mode
>  #PF: error_code(0x0000) - not-present page
>  PGD 0 P4D 0
>  Oops: 0000 [#1] SMP PTI
>  CPU: 8 PID: 1 Comm: swapper/0 Not tainted 5.2.0-rc4-next-20190613+ #317
>  RIP: 0010:strcmp+0xc/0x20
> 
> To fix this crash, check if vendor field is present before accessing to it.
> 
> Fixes: 19b07cb4a187 ("i2c: i801: Register optional lis3lv02d I2C device on Dell machines")

Are we certain it will be the same commit ID in the upstream kernel
tree?

> Cc: Pali Rohár <pali.rohar@gmail.com>
> Cc: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 2d9f77ea02e4..694eb636b40b 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1180,7 +1180,7 @@ static bool is_dell_system_with_lis3lv02d(void)
>  	const char *vendor;
>  
>  	vendor = dmi_get_system_info(DMI_SYS_VENDOR);
> -	if (strcmp(vendor, "Dell Inc.") != 0)
> +	if (!vendor || strcmp(vendor, "Dell Inc."))
>  		return false;
>  
>  	/*

Good catch, thanks.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
