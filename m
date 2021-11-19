Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6515456ACA
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Nov 2021 08:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233590AbhKSHUR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Nov 2021 02:20:17 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:47581 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231877AbhKSHUQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Nov 2021 02:20:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1637306235; x=1668842235;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4G1S93gjbwabrmFAdC43P4Mc+uXwLG7qww8pxE91teM=;
  b=ixvpQc5OJsFqVkHuvkCKytxWUz7Nqq/YAeC0q8zy6zwpBaUu5XrbH9cH
   pBNGuxmwTaVFr3DG4jylwNz6veWdpyMhgX6qE2zlfhGOMuOTEPYg0AHd3
   PMUWsxLuK1/IzsN0H51BZjgfiiOqKz97pg2BxHbRlfEcJH/R/WGuwKSRA
   xVdDf4IPf/8fValIrJk+6uy3dqANoT5wm/K/rXskODzVKCyQKP6uTE0HC
   QBkRJRhUJwk8bzV7p3VvBFHg2LZ7zI7UTNcyCK2rbv1CyPVFKz1xTvPcG
   CvBqJSnOX9+S/8/Ty23u7X+gxTuTUjJAT46AYJ8gels3F2RFGujipvOUU
   Q==;
X-IronPort-AV: E=Sophos;i="5.87,246,1631570400"; 
   d="scan'208";a="20555075"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 19 Nov 2021 08:17:14 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 19 Nov 2021 08:17:14 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 19 Nov 2021 08:17:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1637306234; x=1668842234;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4G1S93gjbwabrmFAdC43P4Mc+uXwLG7qww8pxE91teM=;
  b=VonlOVp2ANH6/O0kZw0xhmC6NLmZ2zvq+GuWdc9CAnB1hKOMmlxnFMro
   00P2FzQSZNHB7fE3RC/ljp/qs0fUyOvDzycvh0j1WbBbTTXCtp9B/dNCe
   F4BjQHyQAVVByjOTbSwO7Tim8BPuYG4lww0LjoYVT0C448pC4r1Twx6nY
   cLYmUFjKDHXRY4KHVU1TK+My+dGj+QQ1cjP/ft5gVLQrDgOoTlyDLTuRl
   0a5zjPi2HJCngnihw7/e8y14j4zakqkuT3ZZ1Nc6BWNf6pWSJx5khaDuA
   eckz9nFtL1oUY11jiI0CMa7pdTnKk1NFdD+9DsisShEhJS7gKOiDb7/Es
   Q==;
X-IronPort-AV: E=Sophos;i="5.87,246,1631570400"; 
   d="scan'208";a="20555074"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Nov 2021 08:17:14 +0100
Received: from steina-w (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B802D280065;
        Fri, 19 Nov 2021 08:17:13 +0100 (CET)
Message-ID: <000f8f724ef9a8c2652e9cab0a5bb1f7768869c3.camel@ew.tq-group.com>
Subject: Re: (EXT) Re: [PATCH v4 12/12] dt-bindings: serial: fsl-lpuart: Add
 i.MX8DXL compatible
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rob Herring <robh@kernel.org>, Abel Vesa <abel.vesa@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Date:   Fri, 19 Nov 2021 08:17:11 +0100
In-Reply-To: <YZb4BClv4fXU65yz@robh.at.kernel.org>
References: <1636566415-22750-1-git-send-email-abel.vesa@nxp.com>
         <1636566415-22750-13-git-send-email-abel.vesa@nxp.com>
         <YZb4BClv4fXU65yz@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Donnerstag, dem 18.11.2021 um 19:04 -0600 schrieb Rob Herring:
> On Wed, Nov 10, 2021 at 07:46:55PM +0200, Abel Vesa wrote:
> > Add i.MX8DXL lpuart compatible to the bindings documentation.
> > 
> > Signed-off-by: Abel Vesa <
> > abel.vesa@nxp.com
> > >
> > ---
> >  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/serial/fsl-
> > lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-
> > lpuart.yaml
> > index dc1f0e07cbd4..fa8a602ccb22 100644
> > --- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > @@ -27,6 +27,10 @@ properties:
> >        - items:
> >            - const: fsl,imx8qm-lpuart
> >            - const: fsl,imx8qxp-lpuart
> > +      - items:
> > +          - const: fsl,imx8dxl-lpuart
> > +          - const: fsl,imx8qxp-lpuart
> > +          - const: fsl,imx7ulp-lpuart
> 
> I'm confused why 8dxl is compatible with 7ulp, but 8qm is not? From
> the 
> driver, it looks like the difference is clocks.

There is a difference between 8qm and 7ulp regarding the clocks. Are
they still considered compatible? Depending on the answer [1] might not
be the correct solution for earlycon regression on 8qm.

Best regards,
Alexander

[1] 
http://lists.infradead.org/pipermail/linux-arm-kernel/2021-November/696770.html


