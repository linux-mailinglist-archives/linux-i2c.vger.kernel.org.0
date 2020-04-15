Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F342F1A9BE9
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 13:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896822AbgDOLOQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 07:14:16 -0400
Received: from mx2.suse.de ([195.135.220.15]:38830 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896818AbgDOLN5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 07:13:57 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 19A44AD0E;
        Wed, 15 Apr 2020 10:59:00 +0000 (UTC)
Date:   Wed, 15 Apr 2020 12:58:59 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Cc:     <linux-kernel@lists.codethink.co.uk>, <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c-amd756: share definition of amd756_smbus
Message-ID: <20200415125859.5d6297b2@endymion>
In-Reply-To: <20191220105954.382490-1-ben.dooks@codethink.co.uk>
References: <20191220105954.382490-1-ben.dooks@codethink.co.uk>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ben,

On Fri, 20 Dec 2019 10:59:54 +0000, Ben Dooks (Codethink) wrote:
> Add a shared header to declare amd756_smbus that is used
> by two files, to remove the following sparse warning:
> 
> drivers/i2c/busses/i2c-amd756.c:286:20: warning: symbol 'amd756_smbus' was not declared. Should it be static?

I can't see this warning, not even with W=1. What did you do to see it?

> 
> Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
> ---
> 
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: linux-i2c@vger.kernel.org
> ---
>  drivers/i2c/busses/i2c-amd756-s4882.c | 2 +-
>  drivers/i2c/busses/i2c-amd756.c       | 2 ++
>  drivers/i2c/busses/i2c-amd756.h       | 4 ++++
>  3 files changed, 7 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/i2c/busses/i2c-amd756.h
> 
> diff --git a/drivers/i2c/busses/i2c-amd756-s4882.c b/drivers/i2c/busses/i2c-amd756-s4882.c
> index 063274388a75..741b9309d8b6 100644
> --- a/drivers/i2c/busses/i2c-amd756-s4882.c
> +++ b/drivers/i2c/busses/i2c-amd756-s4882.c
> @@ -27,7 +27,7 @@
>  #include <linux/i2c.h>
>  #include <linux/mutex.h>
>  
> -extern struct i2c_adapter amd756_smbus;
> +#include "i2c-amd756.h"
>  
>  static struct i2c_adapter *s4882_adapter;
>  static struct i2c_algorithm *s4882_algo;
> diff --git a/drivers/i2c/busses/i2c-amd756.c b/drivers/i2c/busses/i2c-amd756.c
> index ef1307a258e9..86ee8d102d69 100644
> --- a/drivers/i2c/busses/i2c-amd756.c
> +++ b/drivers/i2c/busses/i2c-amd756.c
> @@ -32,6 +32,8 @@
>  #include <linux/acpi.h>
>  #include <linux/io.h>
>  
> +#include "i2c-amd756.h"
> +
>  /* AMD756 SMBus address offsets */
>  #define SMB_ADDR_OFFSET		0xE0
>  #define SMB_IOSIZE		16
> diff --git a/drivers/i2c/busses/i2c-amd756.h b/drivers/i2c/busses/i2c-amd756.h
> new file mode 100644
> index 000000000000..f3db35939b5c
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-amd756.h
> @@ -0,0 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* Copyright (c) 2019 Ben Dooks <ben.dooks@codetrhink.co.uk> */
> +
> +extern struct i2c_adapter amd756_smbus;

Please add this new file to MAINTAINERS in section "I2C/SMBUS
CONTROLLER DRIVERS FOR PC".

If this driver needs this then i2c-nforce2 needs the same as it exposes
nforce2_smbus to i2c-nforce2-s4985 in the very same way.

Ideally both drivers would be reworked to use the standard I2C
multiplexing framework, then we could get rid of the extra
pseudo-drivers.

-- 
Jean Delvare
SUSE L3 Support
