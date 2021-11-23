Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 672CC459CC3
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 08:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233985AbhKWHd3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 02:33:29 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:5894 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233890AbhKWHd3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 02:33:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1637652621; x=1669188621;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tFJXfZ52umANdWH1SSIASpr2VZIUDRLoZZDdNaHo0a0=;
  b=RWTt+D78dEKyQnaC+NtuvCgAXS+7Qk5+uLqw88/i7IiQz0l+k4zZBFOd
   9BiBLDDq+vbKoQGaJDt2VBWInnMRzDVCcFMtR1yEYBquZw5dbvdnxzVY0
   +g+TuB0usZEiz0OYTVo6mxoNfrSdVybjfW6UDSFp2oxPYwAtChUCdhlyN
   ArbIQeCW6w1OPT/31CG06+3iOQDEn7KgriHWWbeVHPxkQ+0knZgIglpSX
   MO+4s3xLYfseGW+1XZrDhAISOiQIi0avE+WgosjcV54kVR22NJ+O/I10c
   LrDcCgknaLWTL4PaiZ/ZMF9qXriYvojtxukJElRy1Ehq271Ge2WV/jAo9
   g==;
X-IronPort-AV: E=Sophos;i="5.87,257,1631570400"; 
   d="scan'208";a="20611135"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Nov 2021 08:30:20 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 23 Nov 2021 08:30:20 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 23 Nov 2021 08:30:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1637652620; x=1669188620;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tFJXfZ52umANdWH1SSIASpr2VZIUDRLoZZDdNaHo0a0=;
  b=jRmoK7Ae3heTJf3H0pKuMoJRF35i2IdZUEgkd8X1AUVSxljDH+nrGjMI
   f813cVujWThLMLGRNQzjJuLn96p2p7vtgrfrm8oLlX7RXggK3VpLnAe15
   QvN06Pb1wxB5qqliw300BkVI81Wpvd2mM3+XE71JM1hZ8jQC6tQrCCSS5
   mpqhSj1vm3DDvDQ9vOHY1YlTBAUg7UyDEOQibeIwupDWMd3APW1WkTPkq
   13SVM8qreoHszTmfTEyXZrC/9lsgbEMs7UgQCqmA2fvvV7kHxJnLzPrlc
   69aKBgfas/Bca+CyP2Ox6Tz5FAhU9biNBtBnCDTICE2/Clc2qqK5mG/i+
   g==;
X-IronPort-AV: E=Sophos;i="5.87,257,1631570400"; 
   d="scan'208";a="20611134"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Nov 2021 08:30:20 +0100
Received: from steina-w (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id CCE71280065;
        Tue, 23 Nov 2021 08:30:19 +0100 (CET)
Message-ID: <c3fd087edb757a453bc2a2d745f813e834ccf08e.camel@ew.tq-group.com>
Subject: Re: (EXT) Re: (EXT) Re: [PATCH v4 12/12] dt-bindings: serial:
 fsl-lpuart: Add i.MX8DXL compatible
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
Date:   Tue, 23 Nov 2021 08:30:17 +0100
In-Reply-To: <YZvJP2ISfc/zyK+4@ryzen>
References: <1636566415-22750-1-git-send-email-abel.vesa@nxp.com>
         <1636566415-22750-13-git-send-email-abel.vesa@nxp.com>
         <YZb4BClv4fXU65yz@robh.at.kernel.org>
         <000f8f724ef9a8c2652e9cab0a5bb1f7768869c3.camel@ew.tq-group.com>
         <YZvJP2ISfc/zyK+4@ryzen>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Montag, dem 22.11.2021 um 18:45 +0200 schrieb Abel Vesa:
> On 21-11-19 08:17:11, Alexander Stein wrote:
> > Am Donnerstag, dem 18.11.2021 um 19:04 -0600 schrieb Rob Herring:
> > > On Wed, Nov 10, 2021 at 07:46:55PM +0200, Abel Vesa wrote:
> > > > Add i.MX8DXL lpuart compatible to the bindings documentation.
> > > > 
> > > > Signed-off-by: Abel Vesa <
> > > > abel.vesa@nxp.com
> > > > 
> > > > 
> > > > ---
> > > >  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 4
> > > > ++++
> > > >  1 file changed, 4 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/serial/fsl-
> > > > lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-
> > > > lpuart.yaml
> > > > index dc1f0e07cbd4..fa8a602ccb22 100644
> > > > --- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > > > +++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > > > @@ -27,6 +27,10 @@ properties:
> > > >        - items:
> > > >            - const: fsl,imx8qm-lpuart
> > > >            - const: fsl,imx8qxp-lpuart
> > > > +      - items:
> > > > +          - const: fsl,imx8dxl-lpuart
> > > > +          - const: fsl,imx8qxp-lpuart
> > > > +          - const: fsl,imx7ulp-lpuart
> > > 
> > > I'm confused why 8dxl is compatible with 7ulp, but 8qm is not?
> > > From
> > > the 
> > > driver, it looks like the difference is clocks.
> > 
> > There is a difference between 8qm and 7ulp regarding the clocks.
> > Are
> > they still considered compatible? Depending on the answer [1] might
> > not
> > be the correct solution for earlycon regression on 8qm.
> > 
> 
> In NXP's tree, they are not compatible.
> 
> See here:
> 
> https://source.codeaurora.org/external/imx/linux-imx/tree/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi?h=lf-5.10.y#n9

Well, commit 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b4b844930f27bf7019c0bbd8cc575dde32e00ecc
 says otherwise.
This might be true for earlycon only, because clocks should be setup
already.

Together with your other mail regarding the imx7ulp fixup,
commit b4b844930f27bf7019c0bbd8cc575dde32e00ecc should just be reverted
in order to get earlycon running again on imx8qm and imx8qxp, IMHO.

Best regards,
Alexander


