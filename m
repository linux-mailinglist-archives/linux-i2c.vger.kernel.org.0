Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2379919C82F
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Apr 2020 19:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389162AbgDBRj2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Apr 2020 13:39:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:60506 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388677AbgDBRj2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 Apr 2020 13:39:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 3B1E9AD27;
        Thu,  2 Apr 2020 17:39:26 +0000 (UTC)
Date:   Thu, 2 Apr 2020 19:39:25 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Hu Haowen <xianfengting221@163.com>
Cc:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: piix4: remove an empty and redundant comment line
Message-ID: <20200402193925.1e11b336@endymion>
In-Reply-To: <20200402140359.22017-1-xianfengting221@163.com>
References: <20200402140359.22017-1-xianfengting221@163.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu,  2 Apr 2020 22:03:59 +0800, Hu Haowen wrote:
> This line in the comment is empty and redundant, so removed it.
> 
> Signed-off-by: Hu Haowen <xianfengting221@163.com>
> ---
>  drivers/i2c/busses/i2c-piix4.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index 30ded6422e7b..8bdb1d4abac5 100644
> --- a/drivers/i2c/busses/i2c-piix4.c
> +++ b/drivers/i2c/busses/i2c-piix4.c
> @@ -2,7 +2,6 @@
>  /*
>      Copyright (c) 1998 - 2002 Frodo Looijaard <frodol@dds.nl> and
>      Philip Edelbrock <phil@netroedge.com>
> -
>  */
>  
>  /*

No, really, not wasting time reviewing and committing this. If you
really care about these comments then please at least reformat them to
comply with the standard. Stripping one line and leaving the rest
improperly formatted doesn't help at all, sorry.

-- 
Jean Delvare
SUSE L3 Support
