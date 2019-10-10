Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA39D2117
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2019 08:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732856AbfJJGyL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Oct 2019 02:54:11 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:51758 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727207AbfJJGyL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Oct 2019 02:54:11 -0400
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 56/nY0LiIN/XQ6ARaaD2NWSw2YJpxUgWH2WdPoN9k70jvh2TFLojEBQX4o6320lmoKeMed9Rpe
 GeAzg7PgNmmOPPDAkT0gn0+f18qBXoPv6L+HihKLNKChx3uswal27XjEq/ER5bwYgVQsAch3tZ
 Ga/xMHtPXCwrCtNIyHaeaS69ozV8Mk3/zF2sICBzVXRq/Im/JhvVuFwKJuqrOUu/7V+hD4Ec7h
 lwXsg7VHR2nQzdImqDFhhzh2DLsvBf76It9ZV6JTJcrfGfMbCqOo10VD00cYKVwgsrVfTcMQ9O
 pzY=
X-IronPort-AV: E=Sophos;i="5.67,279,1566889200"; 
   d="scan'208";a="51112714"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Oct 2019 23:54:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 9 Oct 2019 23:54:10 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 9 Oct 2019 23:54:09 -0700
Date:   Thu, 10 Oct 2019 08:54:09 +0200
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Kamel Bouhara <kamel.bouhara@bootlin.com>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>,
        "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/4] i2c: at91: implement i2c bus recovery
Message-ID: <20191010065408.y7i7aywdztgixv47@M43218.corp.atmel.com>
Mail-Followup-To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Kamel Bouhara <kamel.bouhara@bootlin.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20191002144658.7718-1-kamel.bouhara@bootlin.com>
 <20191002144658.7718-3-kamel.bouhara@bootlin.com>
 <20191009135500.ufkxcemccwfcfys7@M43218.corp.atmel.com>
 <20191009140145.GE4254@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191009140145.GE4254@piout.net>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 09, 2019 at 04:01:47PM +0200, Alexandre Belloni wrote:
> 
> On 09/10/2019 15:55:00+0200, Ludovic Desroches wrote:
> > On Wed, Oct 02, 2019 at 04:46:56PM +0200, Kamel Bouhara wrote:
> > > External E-Mail
> > > 
> > > 
> > > Implement i2c bus recovery when slaves devices might hold SDA low.
> > > In this case re-assign SCL/SDA to gpios and issue 9 dummy clock pulses
> > > until the slave release SDA.
> > > 
> > 
> > Hi Kamel,
> > 
> > Thanks for adding this new feature. As I see patches only for sama5d3 and
> > sama5d4, I assume it has not been tested with a sama5d2, isn't it?
> > 
> 
> I there a point having it on sama5d2 as the controller already supports
> this feature?
> 

Right, I was focused on pinctrl and forget we have this feature
supported by the IP.

> > I doubt it works with a sama5d2 because of the pinctrl. I also wonder if it can
> > work if we add .strict = true to pinmux_ops which is something plan for the
> > future...
> > 
> 
> I don't see why it wouldn't work with strict as this is switching muxing
> properly instead of using the pins for two functions at the same time.
> 

Not sure devm_gpiod_get won't fail with strict.

Ludovic
