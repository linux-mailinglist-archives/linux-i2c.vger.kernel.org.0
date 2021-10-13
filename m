Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055F342BF0F
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 13:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbhJMLmQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 07:42:16 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:16011 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhJMLmP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 07:42:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634125214; x=1665661214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gIJaKWc3mhoqjpjyoYXjqJKzdlBFVRY8Zq/+CGn0tEE=;
  b=FH2gvz90ipxzgRfDOV+nL3mOF8tLi+sDJ4Ly+SflMznzYaeTepONRY1X
   rEKNlYh8HheutvTIMS+V4ia0v+BNlsICVvko2ZV1bYctrGe9OYt5FHQmk
   LKgVvXUATMR1SpWPpaGd/GUjdzevOh3whIS1D63gOxR/oO7Sg1Ywmen7M
   PT2SLkd3mLazxvHnWt8tey1/3iskVwZY4cFUHUk3etPCI1529U56RM2fJ
   G8apla4e64DgQq2m5u5aPusjsr3kN7TOxvIdtm9JwHDsqECwvNFcAk0an
   z6YEO+6o1QzDxqEpUOLVAUw+dOBsc9DcoXijM9AoZGubEudDT8ZDm5LMk
   g==;
IronPort-SDR: gVgmCvWJ9ecNKu3wuehcCZQzhMW/7yJY52kQ+bFrZme95ab1USK5qJuZn7/b65LJ6L0Fzhc0Vq
 1d6yQc9q6JSUYGa006jwIKW1GmUHauZMppditai1biTGLHXexH4SgrIlT7mEPqawnwtDlUHYj4
 rEawZM7bZXO2Jv4wa+ysS6Bg4M5aAUumwptP30+8Ihp+V4M52mXZmE9em70hS8jGUfpP4oxRMo
 9qGNRfyy2Q2zNRjm1oElLR7KNUynY+jhJHYndB9orr7yfCsveZ42trXMmVfZZc59yOJ8dkphQV
 //LQIUhwz8GplLmfQJ9zfq5M
X-IronPort-AV: E=Sophos;i="5.85,370,1624345200"; 
   d="scan'208";a="139556124"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Oct 2021 04:40:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 13 Oct 2021 04:40:11 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Wed, 13 Oct 2021 04:40:11 -0700
Date:   Wed, 13 Oct 2021 13:41:44 +0200
From:   Horatiu Vultur - M31836 <Horatiu.Vultur@microchip.com>
To:     Codrin Ciubotariu - M19940 <Codrin.Ciubotariu@microchip.com>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Nicolas Ferre - M43238 <Nicolas.Ferre@microchip.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        Ludovic Desroches - M43218 <Ludovic.Desroches@microchip.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] i2c: at91: Add support for programmable clock source
Message-ID: <20211013114144.7j4scdaq2rjfmiwn@soft-dev3-1.localhost>
References: <20211012140718.2138278-1-horatiu.vultur@microchip.com>
 <8a775c67-00a3-1dbe-daa3-09a537f482d8@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <8a775c67-00a3-1dbe-daa3-09a537f482d8@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The 10/13/2021 08:49, Codrin Ciubotariu - M19940 wrote:
> On 12.10.2021 17:07, Horatiu Vultur wrote:
> > Add support to be able to set BRSRCCLK. This feature is support on lan966x
> > 
> > Horatiu Vultur (2):
> >    dt-bindings: i2c: at91: Extend compatible list for lan966x
> >    i2c: at91: add support for brsrcclk
> > 
> >   .../devicetree/bindings/i2c/i2c-at91.txt      |  6 +++--
> >   drivers/i2c/busses/i2c-at91-core.c            | 16 +++++++++++++
> >   drivers/i2c/busses/i2c-at91-master.c          | 23 +++++++++++++++++--
> >   drivers/i2c/busses/i2c-at91.h                 |  1 +
> >   4 files changed, 42 insertions(+), 4 deletions(-)
> > 
> 
> Hi Horatiu,

Hi Codrin,

> 
>  From what I understand, on your DTS, you replaced the peripheral clock 
> with the GCLK in the I2C node. This means that you are forcing all the 
> variants that support clk_brsrcclk to treat the current clock as GCLK. 
> This is not necessarily correct, since this newer variants can also work 
> fine with only the peripheral clock and we should keep these option 
> available.
> 
> I would add an optional GCLK clock binding in the I2C node. This way 
> GCLK will be used only if it is present in DT and clk_brsrcclk set.

Thanks for the explanation.

I think actually I will drop this patch series because apparently
lan966x works fine also with the peripheral clock. So then no changes
are required.

If you think is worth it, I can do another version with the proposed
changes.

> 
> Best regards,
> Codrin

-- 
/Horatiu
