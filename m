Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0288A24EE9
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 14:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbfEUM0d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 08:26:33 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:41818 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726900AbfEUM0c (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 08:26:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=0mp9IGuJ3Sba8b9fR+6tWUov/QuJqjVhBmqHDQ3pzM8=; b=pVMWY6YLZuSWdCF0NUCOf+T/4b
        IzgHFe9g/LNBC+jDeiu+v0sBF6za3FrUwvZOk0QVHgKgxSE4XBjxJv/kvLd0uY3EMeeEWIeGFlf/Y
        ATKEHJ3pAx/iVyBMwL6X5LD+4vCmRsAa4ZPxZHl+qzot47BQt9S/A39dkL2r/hi9nMhw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hT3qg-0001vx-70; Tue, 21 May 2019 14:26:30 +0200
Date:   Tue, 21 May 2019 14:26:30 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [PATCH 4/6] MAINTAINERS: add DT bindings to i2c-ocores
Message-ID: <20190521122630.GB6577@lunn.ch>
References: <20190521081509.2586-1-wsa@the-dreams.de>
 <20190521081509.2586-5-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521081509.2586-5-wsa@the-dreams.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 21, 2019 at 10:15:07AM +0200, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cd5cc61a98ac..4dd1a31c2667 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11730,6 +11730,7 @@ M:	Peter Korsgaard <peter@korsgaard.com>
>  M:	Andrew Lunn <andrew@lunn.ch>
>  L:	linux-i2c@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/i2c/i2c-ocores.txt
>  F:	Documentation/i2c/busses/i2c-ocores
>  F:	drivers/i2c/busses/i2c-ocores.c
>  F:	include/linux/platform_data/i2c-ocores.h

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
