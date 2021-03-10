Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD8CE333F09
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 14:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbhCJN3Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Mar 2021 08:29:25 -0500
Received: from mx2.suse.de ([195.135.220.15]:32862 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233282AbhCJN3H (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Mar 2021 08:29:07 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1C095AC17;
        Wed, 10 Mar 2021 13:29:06 +0000 (UTC)
Date:   Wed, 10 Mar 2021 14:29:04 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     zuoqilin1@163.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        zuoqilin <zuoqilin@yulong.com>
Subject: Re: [PATCH] i2c: sis630: Fix typo issue
Message-ID: <20210310142904.29dd6c62@endymion>
In-Reply-To: <20210301130752.2119-1-zuoqilin1@163.com>
References: <20210301130752.2119-1-zuoqilin1@163.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 01 Mar 2021 21:07:52 +0800, zuoqilin1@163.com wrote:
> From: zuoqilin <zuoqilin@yulong.com>
> 
> Change 'adress' to 'address'.
> 
> Signed-off-by: zuoqilin <zuoqilin@yulong.com>
> ---
>  drivers/i2c/busses/i2c-sis630.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sis630.c b/drivers/i2c/busses/i2c-sis630.c
> index cfb8e04..87d5625 100644
> --- a/drivers/i2c/busses/i2c-sis630.c
> +++ b/drivers/i2c/busses/i2c-sis630.c
> @@ -97,7 +97,7 @@
>  module_param(force, bool, 0);
>  MODULE_PARM_DESC(force, "Forcibly enable the SIS630. DANGEROUS!");
>  
> -/* SMBus base adress */
> +/* SMBus base address */
>  static unsigned short smbus_base;
>  
>  /* supported chips */

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
