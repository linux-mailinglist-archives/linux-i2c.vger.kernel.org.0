Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 248B1455DCA
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Nov 2021 15:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232915AbhKROUU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 09:20:20 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:17726 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232893AbhKROUT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Nov 2021 09:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1637245039; x=1668781039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PzUjR8CBONAi/Gz8Mh2kN2+XWsTJFNdoE0c4hLDlRM0=;
  b=yrRe01CoYiVNXyuC9qFCJMOtXuZ/C4fyFhkUhdsPhtELpSnyYEB49JAp
   jou4Cx6V0nCbnuuvIZTmLZF1lcYNkHkY4CUtQQbjGwUbFPqIHiqVTMt/c
   00Jr5ckxj7+MjCx6e9tFxa/Yweq6abUMrJ5BZ+SsrEy7TAGJKXig48dwh
   ARGuQrAQFbK1MR28a3NimSPhNXuisHqrTsJz5ZtTA9MVbs15qvVvuKJSx
   FwIM1NshpQVgMDOwsbnUuM6+fnFD/YWxTxpyChnWkA9SM+nocqjMz9Shv
   rilp/gdDcEmWrzs/gWXb6AodUYUvwJNQYVuoA2qHTGMJeqxZuO6cVzJwR
   Q==;
IronPort-SDR: HcP97IVp1dIl8LZuIt6ojMl5MCSqQaLezYIFGTdtkHbbv/kzyCKfxZTP67PHBCaECpLUIpuetw
 yCNmMbfhbnJga3nFpYzefASqwL+0isnxoqEi6F9fMEeIk16gKhqw50AEiEe2716aN9KbD2H2Q+
 kyJZCanjOZbFDHspJZpukMqYMbTxWNU6S9i/WsGDvYd5v+IckiwZV47n0QlGANp5jqOZ8f98nA
 WCkVFjE7oZdgV40LZP8y4ImVLvRt9EeimeijucVviEpNkWvNWvgiMs6sQdX3U0JSloSTaNN9aZ
 FhIVlug6xJk3Ofh0k7T60hFG
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; 
   d="scan'208";a="139582573"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Nov 2021 07:17:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 18 Nov 2021 07:17:17 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Thu, 18 Nov 2021 07:17:17 -0700
Date:   Thu, 18 Nov 2021 15:19:05 +0100
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     Rob Herring <robh@kernel.org>
CC:     <peda@axentia.se>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: i2c-mux: Add property for settle time
Message-ID: <20211118141905.zntm4dwaqlaa5iig@soft-dev3-1.localhost>
References: <20211103091839.1665672-1-horatiu.vultur@microchip.com>
 <20211103091839.1665672-2-horatiu.vultur@microchip.com>
 <YY7FuUKIyZn5892i@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <YY7FuUKIyZn5892i@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The 11/12/2021 13:51, Rob Herring wrote:

Hi Rob,

Sorry for the late reply, I was caught with some other patches.

> 
> On Wed, Nov 03, 2021 at 10:18:38AM +0100, Horatiu Vultur wrote:
> > Some HW requires some time for the signals to settle after the muxing is
> > changed. Allow this time to be specified in device tree.
> >
> > Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-mux.yaml | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> > index 24cac36037f5..4c81e56d02f7 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> > @@ -19,6 +19,11 @@ description: |+
> >    populating the i2c child busses.  If an 'i2c-mux' subnode is present, only
> >    subnodes of this will be considered as i2c child busses.
> >
> > +  Optional properties may not be supported by all drivers. However, if a driver
> > +  wants to support one of the below features, it should adopt these bindings.
> 
> What drivers? Bindings are independent. I don't think you need the
> comment, but this should be a separate change with an explanation along
> the lines of what we discussed.
> 
> > +
> > +select: false
> > +
> >  properties:
> >    $nodename:
> >      pattern: '^(i2c-?)?mux'
> > @@ -29,6 +34,11 @@ properties:
> >    '#size-cells':
> >      const: 0
> >
> > +  settle-time-us:
> > +    default: 0
> > +    description:
> > +      The time required for the signals to settle.
> > +
> >  patternProperties:
> >    '^i2c@[0-9a-f]+$':
> >      $ref: /schemas/i2c/i2c-controller.yaml
> > @@ -41,6 +51,10 @@ patternProperties:
> >
> >  additionalProperties: true
> >
> > +required:
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +
> 
> This too is a separate change.

So just to be sure that I follow up correctly, then there will be one
patch with the 'select: false' explaining why is added and another one
with the new property and the required properties.
Or am I still off?

> 
> >  examples:
> >    - |
> >      /*
> > --
> > 2.33.0
> >
> >

-- 
/Horatiu
