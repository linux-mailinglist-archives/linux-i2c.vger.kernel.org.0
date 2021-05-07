Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3355376718
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 16:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236059AbhEGOhG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 10:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235979AbhEGOhG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 May 2021 10:37:06 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F10C061574;
        Fri,  7 May 2021 07:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=6dJeir0IllpcdJngtcLUhx28M8f0bZ1rEecS6mnPMAs=; b=XsIzQqwqFhMZf7LU5FDeojUy7k
        8llJzvi5yXUosajW6swvsE/Jso1PgUkwgSGJT3Pgii9lJzxYCi9QezFuDr9xgBCOjV+SLVWDIa2F0
        Ob0snjTJFualyIE4AVggR8HWxgGKGTn1H/aH0bWugFp15lfcp2anetHR06IXSjsfE89w=;
Received: from p200300ccff0fc8001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0f:c800:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1lf1aF-0004Wz-57; Fri, 07 May 2021 16:36:03 +0200
Date:   Fri, 7 May 2021 16:36:02 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v2] dt-bindings: i2c: Move i2c-omap.txt to YAML format
Message-ID: <20210507163602.219894f4@aktux>
In-Reply-To: <429a740a-c2b9-1cf8-ed2b-0fb7b1bea422@ti.com>
References: <20210506140026.31254-1-vigneshr@ti.com>
        <f7570cb4-8c21-2fa5-bd26-1388f2a4bd6b@ti.com>
        <429a740a-c2b9-1cf8-ed2b-0fb7b1bea422@ti.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 7 May 2021 19:45:45 +0530
Vignesh Raghavendra <vigneshr@ti.com> wrote:

> On 5/7/21 12:24 PM, Grygorii Strashko wrote:
> > 
> > 
> > On 06/05/2021 17:00, Vignesh Raghavendra wrote:  
> >> Convert i2c-omap.txt to YAML schema for better checks and documentation.
> >>
> >> Following properties were used in DT but were not documented in txt
> >> bindings and has been included in YAML schema:
> >> 1. Include ti,am4372-i2c compatible
> >> 2. Include dmas property used in few OMAP dts files  
> > 
> > The DMA is not supported by i2c-omap driver, so wouldn't be better to
> > just drop dmas from DTBs to avoid confusions?
> > It can be added later.
> >   
> 
> Will do.. I will also send patches dropping dmas from dts that currently
> have them populated.
> 
hmm, we have
- DO attempt to make bindings complete even if a driver doesn't support some
  features. For example, if a device has an interrupt, then include the
  'interrupts' property even if the driver is only polled mode.

in Documentation/devicetree/bindings/writing-bindings.rst
Shouln't the dma stay there if the hardware supports it? Devicetree
should describe the hardware not the driver if I understood things
right.

Regards,
Andreas
