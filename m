Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9CE45DB0C
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Nov 2021 14:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355246AbhKYN2f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Nov 2021 08:28:35 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:50000 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352407AbhKYN0f (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Nov 2021 08:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1637846604; x=1669382604;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nalij+YGkHi88VGPLe7ObUzX6oVCCYHDMbRtMDqHOlI=;
  b=gudbu8SDhCiiv8S6nVnHs/7S7NNg97hQycynRKWK2QXp3TkaVTLPU0KT
   4QRaGl3MboVymOZiriiDHynkIyS+5RkzZS+dZagFKQ99qHSKQecemzPAl
   VqqUo2AZgKtg010sGb4wPD7KiGEY7LK2f+ZB2/E5SarLOTnOcTrm0W6fk
   fWDrG+Fbd+YtxAT19m5fzwlKKuI758KvBEbdpQNPRJcVCIKch/k8Q1+/T
   I56o4VfyZQNV/ahK0BmrPrqgUyW4q0ab/6it4JtfovLyafhxmBmB0Ep+N
   UJbzilJcN7+F8XFKVIaX7xIWM4QA806NkUu8QMJEuwH17zy6qvlJLIno7
   Q==;
X-IronPort-AV: E=Sophos;i="5.87,263,1631570400"; 
   d="scan'208";a="20678141"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 25 Nov 2021 14:23:20 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 25 Nov 2021 14:23:21 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 25 Nov 2021 14:23:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1637846601; x=1669382601;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nalij+YGkHi88VGPLe7ObUzX6oVCCYHDMbRtMDqHOlI=;
  b=fCPAMtjC8PAjOxelzYpc7h7A5XGH6N+43E3anLOEPWbuXchHXRZeDygt
   GYP/hbMHoVgUkwQHDuiWn+64oyQDfUc/DDkOVrLxBujfG22o9jt23ZRcm
   nWoNxN8Y9GmfJ3o2UCUv+ToqAecPlqTSBZCvLyop/FUIkppNDCixOyM6J
   4asIChJC+qSIsi+OskIwucMUCuz/I7l86DrrzpqNx1YHSWqmUCv1+guJf
   vurZfYUFTXr618yo1lOxL266/cju8pNusny4Ku0WzASg9yA1a/ENVgPVZ
   LlawK8r/GjyYMpWshY2ZgO558JLOShT5X5SUIPY+4StzPDdXWMuT5uSxd
   g==;
X-IronPort-AV: E=Sophos;i="5.87,263,1631570400"; 
   d="scan'208";a="20678140"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 25 Nov 2021 14:23:20 +0100
Received: from steina-w (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A84D3280065;
        Thu, 25 Nov 2021 14:23:20 +0100 (CET)
Message-ID: <d7ea91a59dc57b4825cc82b18df37b94935d60de.camel@ew.tq-group.com>
Subject: Re: (EXT) Re: (EXT) Re: (EXT) Re: [PATCH v4 12/12] dt-bindings:
 serial: fsl-lpuart: Add i.MX8DXL compatible
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Rob Herring <robh@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Date:   Thu, 25 Nov 2021 14:23:20 +0100
In-Reply-To: <YZ+Nb8vyH/8P5FoF@ryzen>
References: <1636566415-22750-1-git-send-email-abel.vesa@nxp.com>
         <1636566415-22750-13-git-send-email-abel.vesa@nxp.com>
         <YZb4BClv4fXU65yz@robh.at.kernel.org>
         <000f8f724ef9a8c2652e9cab0a5bb1f7768869c3.camel@ew.tq-group.com>
         <YZvJP2ISfc/zyK+4@ryzen>
         <c3fd087edb757a453bc2a2d745f813e834ccf08e.camel@ew.tq-group.com>
         <YZ+Nb8vyH/8P5FoF@ryzen>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Donnerstag, dem 25.11.2021 um 15:19 +0200 schrieb Abel Vesa:
> On 21-11-23 08:30:17, Alexander Stein wrote:
> > Am Montag, dem 22.11.2021 um 18:45 +0200 schrieb Abel Vesa:
> > > On 21-11-19 08:17:11, Alexander Stein wrote:
> > > > Am Donnerstag, dem 18.11.2021 um 19:04 -0600 schrieb Rob
> > > > Herring:
> > > > > On Wed, Nov 10, 2021 at 07:46:55PM +0200, Abel Vesa wrote:
> > > > > > Add i.MX8DXL lpuart compatible to the bindings
> > > > > > documentation.
> > > > > > 
> > > > > > Signed-off-by: Abel Vesa <
> > > > > > abel.vesa@nxp.com
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > > ---
> > > > > >  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml |
> > > > > > 4
> > > > > > ++++
> > > > > >  1 file changed, 4 insertions(+)
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/serial/fsl-
> > > > > > lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-
> > > > > > lpuart.yaml
> > > > > > index dc1f0e07cbd4..fa8a602ccb22 100644
> > > > > > --- a/Documentation/devicetree/bindings/serial/fsl-
> > > > > > lpuart.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/serial/fsl-
> > > > > > lpuart.yaml
> > > > > > @@ -27,6 +27,10 @@ properties:
> > > > > >        - items:
> > > > > >            - const: fsl,imx8qm-lpuart
> > > > > >            - const: fsl,imx8qxp-lpuart
> > > > > > +      - items:
> > > > > > +          - const: fsl,imx8dxl-lpuart
> > > > > > +          - const: fsl,imx8qxp-lpuart
> > > > > > +          - const: fsl,imx7ulp-lpuart
> > > > > 
> > > > > I'm confused why 8dxl is compatible with 7ulp, but 8qm is
> > > > > not?
> > > > > From
> > > > > the 
> > > > > driver, it looks like the difference is clocks.
> > > > 
> > > > There is a difference between 8qm and 7ulp regarding the
> > > > clocks.
> > > > Are
> > > > they still considered compatible? Depending on the answer [1]
> > > > might
> > > > not
> > > > be the correct solution for earlycon regression on 8qm.
> > > > 
> > > 
> > > In NXP's tree, they are not compatible.
> > > 
> > > See here:
> > > 
> > > https://source.codeaurora.org/external/imx/linux-imx/tree/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi?h=lf-5.10.y#n9
> > > 
> > 
> > Well, commit 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b4b844930f27bf7019c0bbd8cc575dde32e00ecc
> > 
> >  says otherwise.
> > This might be true for earlycon only, because clocks should be
> > setup
> > already.
> > 
> > Together with your other mail regarding the imx7ulp fixup,
> > commit b4b844930f27bf7019c0bbd8cc575dde32e00ecc should just be
> > reverted
> > in order to get earlycon running again on imx8qm and imx8qxp, IMHO.
> > 
> 
> I think you're right, the commit b4b844930f27bf7019c should be
> reverted.
> 
> You can send the revert yourself, if you want. If not, let me know.

It's already there:

https://lore.kernel.org/all/20211124073109.805088-1-alexander.stein@ew.tq-group.com/T/

Thanks,
Alexander


