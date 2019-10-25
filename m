Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05C2BE4815
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2019 12:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436711AbfJYKEk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Oct 2019 06:04:40 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:8121 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390461AbfJYKEj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Oct 2019 06:04:39 -0400
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: Vo2odXphj/KVzfXpt/vKYWCW+4NLpQZ99A9C2N47hGAgQ0jNaDTC8qQIVcS3vhFkuqMNxJAyH9
 gFEI/d4dEZ7ZrILkTkBR/pEiN3r89MWShBO9WOVcAkJ9NZmFHXLGhySop1YGD2YsFfn9nTb0uT
 3wDmeijlf+5LRnAto2lZjBDiMeoFeIIYqktYNkhkaqE3PQuZA/1LdbtVZ/j8SNsd/clchTL6LP
 QEk01eLvH6ul2ZewjsSeeNBiBhq9rrgC51Gdm7nlKo4haN5u3WzwP+68JkVqMxuIIf57IKqGpJ
 O9k=
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; 
   d="scan'208";a="54399032"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Oct 2019 03:04:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 25 Oct 2019 03:04:38 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 25 Oct 2019 03:04:37 -0700
Date:   Fri, 25 Oct 2019 12:05:43 +0200
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <Eugen.Hristev@microchip.com>, <peda@axentia.se>,
        <mark.rutland@arm.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>, <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v5 0/9] i2c: add support for filters
Message-ID: <20191025100542.licpieymkbsbm5cd@M43218.corp.atmel.com>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Eugen.Hristev@microchip.com, peda@axentia.se, mark.rutland@arm.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        Nicolas.Ferre@microchip.com
References: <1568189911-31641-1-git-send-email-eugen.hristev@microchip.com>
 <20191024183035.GA1870@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191024183035.GA1870@kunai>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 24, 2019 at 08:30:35PM +0200, Wolfram Sang wrote:
> On Wed, Sep 11, 2019 at 08:24:14AM +0000, Eugen.Hristev@microchip.com wrote:
> > From: Eugen Hristev <eugen.hristev@microchip.com>
> > 
> > Hello,
> > 
> > This series adds support for analog and digital filters for i2c controllers
> > 
> > This series is based on the series:
> > [PATCH v2 0/9] i2c: at91: filters support for at91 SoCs
> > and later
> > [PATCH v4 0/9] i2c: add support for filters
> > and enhanced to add the bindings for all controllers plus an extra bindings
> > for the width of the spikes in nanoseconds (digital filters) and cut-off
> > frequency (analog filters)
> > 
> > First, bindings are created for
> > 'i2c-analog-filter'
> > 'i2c-digital-filter'
> > 'i2c-digital-filter-width-ns'
> > 'i2c-analog-filter-cutoff-frequency'
> > 
> > The support is added in the i2c core to retrieve filter width/cutoff frequency
> > and add it to the timings structure.
> > Next, the at91 driver is enhanced for supporting digital filter, advanced
> > digital filter (with selectable spike width) and the analog filter.
> > 
> > Finally the device tree for two boards are modified to make use of the
> > new properties.
> > 
> > This series is the result of the comments on the ML in the direction
> > requested: to make the bindings globally available for i2c drivers.
> 
> Applied patches 1-7 to for-next (patch 3 is v6). Thanks for your
> patience and thanks to Ludovic and Peter for the review! Patches 8-9
> should go via the at91 tree.
> 

Thanks, patch 8 and 9 applied to at91-dt.

Regards

Ludovic
