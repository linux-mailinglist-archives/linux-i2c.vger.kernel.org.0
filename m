Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0958138B6CE
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 21:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236775AbhETTOP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 15:14:15 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:49852 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233891AbhETTOL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 May 2021 15:14:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=cGw0j3P5SU7zt1q+cDmxpJKsarFcBobz/o56K1XZ/fM=; b=oidm6O8Ayml7oqE416ieS3XpCE
        avFo9NlMkK9Epm5NZRONxUOYBI7pPiryGaKg+2nBZpMb0zvQiJ0NzXiarU92UPfADY4O6sQdyWqI8
        phDvt0pJQFFLRM9NynJM0D5/GTX2PyOQUV2M5rc9UvhQY15aChPRXWRkJgl6XW3xYyHU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1ljo65-0059qC-Tt; Thu, 20 May 2021 21:12:41 +0200
Date:   Thu, 20 May 2021 21:12:41 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Peter Korsgaard <peter@korsgaard.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 10/16] i2c: busses: i2c-ocores: Place the expected
 function names into the documentation headers
Message-ID: <YKa0qSttQKoSn/XY@lunn.ch>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-11-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520190105.3772683-11-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 20, 2021 at 08:00:59PM +0100, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/i2c/busses/i2c-ocores.c:253: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  drivers/i2c/busses/i2c-ocores.c:267: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  drivers/i2c/busses/i2c-ocores.c:299: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  drivers/i2c/busses/i2c-ocores.c:347: warning: expecting prototype for It handles an IRQ(). Prototype was for ocores_process_polling() instead
> 
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Andreas Larsson <andreas@gaisler.com>
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
