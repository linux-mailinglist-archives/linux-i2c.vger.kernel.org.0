Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED23E460C4
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 16:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbfFNOao (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 10:30:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:38656 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728121AbfFNOan (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jun 2019 10:30:43 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C6E78AF31;
        Fri, 14 Jun 2019 14:30:42 +0000 (UTC)
Date:   Fri, 14 Jun 2019 16:30:41 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v1 3/3] i2c: i801: Remove linux/init.h and sort headers
Message-ID: <20190614163041.13d5ee68@endymion>
In-Reply-To: <20190613164529.63482-3-andriy.shevchenko@linux.intel.com>
References: <20190613164529.63482-1-andriy.shevchenko@linux.intel.com>
        <20190613164529.63482-3-andriy.shevchenko@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Thu, 13 Jun 2019 19:45:29 +0300, Andy Shevchenko wrote:
> There is no need to include linux/init.h when at the same time
> we include linux/module.h.
> 
> Remove redundant inclusion.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 03100f5fc0e9..5613c1ef1af4 100644
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

In my books, you should never rely on a header including for you
another header you need. Is there a reason for not following that
principle here?

-- 
Jean Delvare
SUSE L3 Support
