Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B501B479232
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 17:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239548AbhLQQ7e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 11:59:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239499AbhLQQ7b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 11:59:31 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4598CC061401;
        Fri, 17 Dec 2021 08:59:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 100C0B828D4;
        Fri, 17 Dec 2021 16:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5371CC36AE7;
        Fri, 17 Dec 2021 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1639760368;
        bh=cePM4fZOqSweG5iqCi/Kt1W2jaOm1RFO9qvsPI2XcWA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VdZLuFsU9lyrlY2yPcKsrCzQOkO3cluzqCdatXRPcVQvtZGafITBtMUxliJiU8Gqo
         Lf5VrpbIkhBHvetwzqccD+La9h6uoEj06/aYzXqUDTlcLCTxRMu/3Sg73FpaFikqFt
         LRgdgZUIXp6faqaTVM67qeGT8+M2E9cjZZY8QG+E=
Date:   Fri, 17 Dec 2021 17:59:26 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Rob Herring <robh@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [RESEND v4 10/10] dt-bindings: serial: fsl-lpuart: Add i.MX8DXL
 compatible
Message-ID: <YbzB7mspRBonT9jJ@kroah.com>
References: <1639680494-23183-1-git-send-email-abel.vesa@nxp.com>
 <1639680494-23183-11-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1639680494-23183-11-git-send-email-abel.vesa@nxp.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 16, 2021 at 08:48:14PM +0200, Abel Vesa wrote:
> Add i.MX8DXL lpuart compatible to the bindings documentation.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> index fa23c60a01d0..ee37aa125c86 100644
> --- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> +++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> @@ -29,6 +29,10 @@ properties:
>        - items:
>            - const: fsl,imx8qm-lpuart
>            - const: fsl,imx8qxp-lpuart
> +      - items:
> +          - const: fsl,imx8dxl-lpuart
> +          - const: fsl,imx8qxp-lpuart
> +          - const: fsl,imx7ulp-lpuart

Why is "- items:" listed twice here?

thanks,

greg k-h
