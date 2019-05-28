Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF92F2C2C5
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2019 11:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbfE1JJd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 05:09:33 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:51255 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbfE1JJc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 May 2019 05:09:32 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 510A4FF820;
        Tue, 28 May 2019 09:09:27 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 3/6] MAINTAINERS: add DT bindings to i2c-mv64xxx
In-Reply-To: <20190521081509.2586-4-wsa@the-dreams.de>
References: <20190521081509.2586-1-wsa@the-dreams.de> <20190521081509.2586-4-wsa@the-dreams.de>
Date:   Tue, 28 May 2019 11:09:26 +0200
Message-ID: <87blznlzcp.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
> Cc: Gregory CLEMENT <gregory.clement@bootlin.com>

Acked-by Gregory CLEMENT <gregory.clement@bootlin.com>

Gregory

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 071c19f327b2..cd5cc61a98ac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7342,6 +7342,7 @@ I2C MV64XXX MARVELL AND ALLWINNER DRIVER
>  M:	Gregory CLEMENT <gregory.clement@bootlin.com>
>  L:	linux-i2c@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/i2c/i2c-mv64xxx.txt
>  F:	drivers/i2c/busses/i2c-mv64xxx.c
>  
>  I2C OVER PARALLEL PORT
> -- 
> 2.19.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
