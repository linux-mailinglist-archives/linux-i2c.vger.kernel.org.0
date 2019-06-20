Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4EA94CE93
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 15:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbfFTNYM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 20 Jun 2019 09:24:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:41858 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726404AbfFTNYM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jun 2019 09:24:12 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A4A71AE04;
        Thu, 20 Jun 2019 13:24:11 +0000 (UTC)
Date:   Thu, 20 Jun 2019 15:24:10 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH v2 2/2] i2c: i801: Remove linux/init.h and sort headers
Message-ID: <20190620152410.627ec14b@endymion>
In-Reply-To: <20190619151248.75618-2-andriy.shevchenko@linux.intel.com>
References: <20190619151248.75618-1-andriy.shevchenko@linux.intel.com>
        <20190619151248.75618-2-andriy.shevchenko@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Wed, 19 Jun 2019 18:12:48 +0300, Andy Shevchenko wrote:
> There is no need to include linux/init.h when at the same time
> we include linux/module.h.
> 
> Remove redundant inclusion.
> 
> For more details, refer to the commit
>   0fd972a7d91d ("module: relocate module_init from init.h to module.h")
> where the split had been introduced.

I've read it. It's not a split, it's a move. A move which makes sense
because, as explained in the commit message, module_init() is only
needed by modular code, so including it in init.h was slowing down the
pre-processing of non-modular code.

That being said, this alone does not imply that explicit inclusion of
both linux/init.h and linux/module.h in the same file is wrong. The
only case where this commit would directly lead to the removal of
#include <linux/init.h> from i2c-i801.c is if module_init() was the
only thing from linux/init.h that this driver was using. Which is not
the case, as I see various occurrences of __init and __exit left, and
these are declared in linux/init.h.

As a matter of fact I still count 3921 driver files which include both
linux/init.h and linux/module.h. And I see no comment in either header
file that including one exempts you from including the other.

So I'm not taking this change, sorry. If this is really the direction
you want us to take (and I'm not convinced, but my opinion does not
necessarily matter), then it must be documented first, and I believe it
should then be addressed tree-wide. 3921 individual commits do not seem
to be the most efficient to get it done.

> Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index b9c5d7933d12..69c3ccb69669 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -85,7 +85,6 @@
>  #include <linux/stddef.h>
>  #include <linux/delay.h>
>  #include <linux/ioport.h>
> -#include <linux/init.h>
>  #include <linux/i2c.h>
>  #include <linux/i2c-smbus.h>
>  #include <linux/acpi.h>

-- 
Jean Delvare
SUSE L3 Support
