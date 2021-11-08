Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38AA2447CC4
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 10:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236907AbhKHJai (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 04:30:38 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:62927 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236895AbhKHJai (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 04:30:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636363674; x=1667899674;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=74FnR9vgcDFXkuWZQV0hKGDtGOJaEDp/RBJp8o4iChQ=;
  b=jDbSwpV0w/AaDyD2JI4BW1DdC+G/l0niWKVAm+ndovYYlmStDOBr114C
   I2KO68fYTV/Z/spdQIXENdV1rRcfiCxBaLL+G09UJWQjuDV/E2BDUvDo/
   efXDGoHH3MGkYdvljjJ0Z9UXBbC3ua60D1xMg0wrVKPwFRb7oLN4MY5U/
   GaHp8/PkCqUrXyYvhseg1qXCTUX4oP5kIEOPydq7sTx+lyaV4vfKnLD++
   vLCf0Axvh0cbS5kcoJeyUHM37DT/hWeSu9EKC7EMJVvnB6ydXN5ofSD+5
   /ZwmaYFhe4gzVXoqk9JfUkKFELo64nHk4FuVbWN6+CgDkLLfQI9aqWZ1R
   g==;
IronPort-SDR: vMJwi2LmYYOjzTR7IkrCYqi1SeJ6mLD+8iiLx6ZEgHmFM5b5aySwXhtAe5EVEiHJ5ArxelZCsa
 jPB+lUSGQvi50KJyXOcV7+WvHWw8UYyehW6kdtZiJoBlg1mlLFpmkK2xutibkPzpBCtP/ekImF
 gZNJ2OMXCJOxidDeO4Fd3uNm7r5hrPDxCfzZ2wxsBHMhzotfyI8Xde9dLPVTm4GFWhJtRWYzi0
 TUb2FT0xW75FPwlcBPOip11JVk6aaZoSe/jkXfVZOqBbt31cHjJKpCM3r5y2t088MOs6d8/+Jp
 BsNDPPZJyHOn/k0jDodN9mkT
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="75674635"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2021 02:27:53 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 02:27:53 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 8 Nov 2021 02:27:53 -0700
Date:   Mon, 8 Nov 2021 10:29:42 +0100
From:   Horatiu Vultur - M31836 <Horatiu.Vultur@microchip.com>
To:     Codrin Ciubotariu - M19940 <Codrin.Ciubotariu@microchip.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Nicolas Ferre - M43238 <Nicolas.Ferre@microchip.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "Ludovic Desroches - M43218" <Ludovic.Desroches@microchip.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] i2c: at91: Add support for programmable clock source
Message-ID: <20211108092942.uulvtqoi36wnbisg@soft-dev3-1.localhost>
References: <20211012140718.2138278-1-horatiu.vultur@microchip.com>
 <8a775c67-00a3-1dbe-daa3-09a537f482d8@microchip.com>
 <20211013114144.7j4scdaq2rjfmiwn@soft-dev3-1.localhost>
 <YYWmZMc8eVq5SZYj@kunai>
 <eb2120c3-540e-64db-8b70-c2b29f23e3cc@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <eb2120c3-540e-64db-8b70-c2b29f23e3cc@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The 11/08/2021 08:35, Codrin Ciubotariu - M19940 wrote:
> On 05.11.2021 23:47, Wolfram Sang wrote:
> > 
> >> I think actually I will drop this patch series because apparently
> >> lan966x works fine also with the peripheral clock. So then no changes
> >> are required.
> > 
> > Not even patch 1/2?
> > 
> 
> we can keep the new compatible, but patch 2/2 needs to be split.

For me it is OK to use the compatible string 'microchip,sam9x60-i2c'

> 
> Best regards,
> Codrin

-- 
/Horatiu
