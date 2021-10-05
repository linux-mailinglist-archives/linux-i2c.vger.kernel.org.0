Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 993AE42211F
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Oct 2021 10:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233277AbhJEIu6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Oct 2021 04:50:58 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:51350 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233325AbhJEIux (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Oct 2021 04:50:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1633423743; x=1664959743;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iZlrk7uywMeq/85KjyVIcfTSnwi5lQWNkV1DMEL7uFo=;
  b=MjinRfiUWdUcnq7yV2Uex0SgD6VWg7KVM75XpVZ86LOsb3pC7rNv2RTY
   h9mpLfJGqEU6WU1e9jFBTpFnOyGMXf2DXeJLQbGCl8TTB3Vvu3aicgTP3
   QdEdNXfAfRlO+Qv+V6SlGBQjqHNhBubmfSq8XnfNp43xGLlL4knwDMb7A
   KsSFkeY4c9E6up4giu/nacstY6nrAMIbmxWrW4k5BfzDWtVOT+p5eyrrN
   pi0fowLnJ0QykhvGIXq5FV3LfIXDEkRB94wOhI5dJd179bpT1hgpGYmW2
   5l1PU5sMI+nkCKlnGmY1+MG9YFttphFuazstFkOycwdygw9iycv1dhuZC
   A==;
IronPort-SDR: ACshjsa+fXZqfl83diuH01xiydt2EfNOLbi1RMCzCrKC+s+M5DAwfcNIxEzwWK8MnnG7yK+Sfu
 shrxOKkzF3Q+1iKrxXARpjWpoYFkyNA+uH1RC/Rg0hLiZpu/Kv7uWpKOJ52EHqSAcCgDv/Xlu+
 xX7U/TMqZXZDBhXgyrP5LiY4u+MTbU1EuUvcGOwahrjT7UFfpLv7SL9juPOIu97j7Ksi4ZmYso
 pnnjcUqCSKEUsqtiLb8tZqgn8sX+QrPFNWt/bg+R2spP9gyv5KXvbtYGn9AviqGYCimt9DqxR3
 cl//dZzIYdv9UDQdWGLIJtii
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; 
   d="scan'208";a="71726345"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Oct 2021 01:48:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 5 Oct 2021 01:48:59 -0700
Received: from CHE-LT-I41642.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 5 Oct 2021 01:48:55 -0700
Message-ID: <43c25d97a64010b9785a4cd75821564d511bc090.camel@microchip.com>
Subject: Re: [PATCH v1 2/2] i2c:busses:Read and Write routines for PCI1XXXX
 I2C module
From:   LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>
To:     Dmitry Osipenko <digetx@gmail.com>, <wsa@kernel.org>,
        <andriy.shevchenko@linux.intel.com>, <treding@nvidia.com>,
        <mirq-linux@rere.qmqm.pl>, <s.shtylyov@omp.ru>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <UNGLinuxDriver@microchip.com>
Date:   Tue, 5 Oct 2021 14:18:54 +0530
In-Reply-To: <ff447184-b510-4e70-c941-1f0c5b7d0fb5@gmail.com>
References: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
         <20210929062215.23905-3-LakshmiPraveen.Kopparthi@microchip.com>
         <ff447184-b510-4e70-c941-1f0c5b7d0fb5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 2021-09-29 at 10:20 +0300, Dmitry Osipenko wrote:
> [Some people who received this message don't often get email from
> digetx@gmail.com. Learn why this is important at 
> http://aka.ms/LearnAboutSenderIdentification.]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> 29.09.2021 09:22, LakshmiPraveen Kopparthi пишет:
> > Read and Write callbacks for PCI1XXXX I2C adapter is added.
> > 
> > Signed-off-by: LakshmiPraveen Kopparthi <
> > LakshmiPraveen.Kopparthi@microchip.com>
> > ---
> >  drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 485
> > +++++++++++++++++++++++++
> >  1 file changed, 485 insertions(+)
> 
> Why this is a separate patch?

I thought of splitting the driver into two patches.
1. Contains the intialisations,ISR, supend and resume callbacks.
2. Contains read and write functions.
If it make sense to merge these into a single patch, I will do it.  

