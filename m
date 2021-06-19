Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDD2C3ADBF1
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jun 2021 00:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbhFSWJX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Jun 2021 18:09:23 -0400
Received: from gloria.sntech.de ([185.11.138.130]:51528 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229477AbhFSWJX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 19 Jun 2021 18:09:23 -0400
Received: from p508fcd5b.dip0.t-ipconnect.de ([80.143.205.91] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1luj7N-0000Yc-VZ; Sun, 20 Jun 2021 00:07:10 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     lee.jones@linaro.org, Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Max Schwarz <max.schwarz@online.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 12/16] i2c: busses: i2c-rk3x: Demote unworthy headers and help more complete ones
Date:   Sun, 20 Jun 2021 00:07:09 +0200
Message-ID: <16288149.tv2OnDr8pf@phil>
In-Reply-To: <20210520190105.3772683-13-lee.jones@linaro.org>
References: <20210520190105.3772683-1-lee.jones@linaro.org> <20210520190105.3772683-13-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Donnerstag, 20. Mai 2021, 21:01:01 CEST schrieb Lee Jones:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/i2c/busses/i2c-rk3x.c:242: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  drivers/i2c/busses/i2c-rk3x.c:261: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  drivers/i2c/busses/i2c-rk3x.c:304: warning: Function parameter or member 'i2c' not described in 'rk3x_i2c_prepare_read'
>  drivers/i2c/busses/i2c-rk3x.c:304: warning: expecting prototype for Setup a read according to i2c(). Prototype was for rk3x_i2c_prepare_read() instead
>  drivers/i2c/busses/i2c-rk3x.c:335: warning: Function parameter or member 'i2c' not described in 'rk3x_i2c_fill_transmit_buf'
>  drivers/i2c/busses/i2c-rk3x.c:335: warning: expecting prototype for Fill the transmit buffer with data from i2c(). Prototype was for rk3x_i2c_fill_transmit_buf() instead
>  drivers/i2c/busses/i2c-rk3x.c:535: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  drivers/i2c/busses/i2c-rk3x.c:552: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  drivers/i2c/busses/i2c-rk3x.c:713: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  drivers/i2c/busses/i2c-rk3x.c:963: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  drivers/i2c/busses/i2c-rk3x.c:973: warning: Function parameter or member 'i2c' not described in 'rk3x_i2c_setup'
> 
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Max Schwarz <max.schwarz@online.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

not sure if this series got already applied, but for this one
Acked-by: Heiko Stuebner <heiko@sntech.de>



