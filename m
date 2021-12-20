Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE14B47B061
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Dec 2021 16:35:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235609AbhLTPfS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Dec 2021 10:35:18 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:60748 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234992AbhLTPfS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Dec 2021 10:35:18 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 595A2B80EEE;
        Mon, 20 Dec 2021 15:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439A0C36AE8;
        Mon, 20 Dec 2021 15:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1640014515;
        bh=SOzeN0WwnW9H1fyfGCy8xSJMHoba/7/d6z4gmjyyVAI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FuWHV4csDxjfV+sevtASLOn0z4jC3I23F4ZysylQ8RHqMhcJ3Ln/DpUaHqBrBjvWw
         N60WkVQRjcoQADpm9oIZp0ixGkmbcy8RgcONi6LYPND0lNSPKBXSC2Fl0AI1qwljb0
         2tKkvQYIfGqeSbJwmNwqJul7iiru9vRGBzYtpqZM=
Date:   Mon, 20 Dec 2021 16:35:12 +0100
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
Message-ID: <YcCisM3BqM984k/1@kroah.com>
References: <1639680494-23183-1-git-send-email-abel.vesa@nxp.com>
 <1639680494-23183-11-git-send-email-abel.vesa@nxp.com>
 <YbzB7mspRBonT9jJ@kroah.com>
 <Yb5ZlnEm3EYCD9h8@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yb5ZlnEm3EYCD9h8@ryzen>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Dec 18, 2021 at 11:58:46PM +0200, Abel Vesa wrote:
> On 21-12-17 17:59:26, Greg Kroah-Hartman wrote:
> > On Thu, Dec 16, 2021 at 08:48:14PM +0200, Abel Vesa wrote:
> > > Add i.MX8DXL lpuart compatible to the bindings documentation.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > > index fa23c60a01d0..ee37aa125c86 100644
> > > --- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > > +++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > > @@ -29,6 +29,10 @@ properties:
> > >        - items:
> > >            - const: fsl,imx8qm-lpuart
> > >            - const: fsl,imx8qxp-lpuart
> > > +      - items:
> > > +          - const: fsl,imx8dxl-lpuart
> > > +          - const: fsl,imx8qxp-lpuart
> > > +          - const: fsl,imx7ulp-lpuart
> > 
> > Why is "- items:" listed twice here?
> 
> There are actually 3 "- items:" and there is a "oneOf:" 
> that encloses all of these.
> 
> Unfortunately, there are special cases within the driver
> that forces the devicetree nodes to have a different list of
> compatibles for almost each SoC.

Ah.  Can you resend it as it is long-gone from my queue now.

thanks,

greg k-h
