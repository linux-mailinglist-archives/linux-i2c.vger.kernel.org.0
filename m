Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0C75391103
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 08:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233071AbhEZGyQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 02:54:16 -0400
Received: from muru.com ([72.249.23.125]:60546 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233035AbhEZGyG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 May 2021 02:54:06 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0D2C080AE;
        Wed, 26 May 2021 06:52:38 +0000 (UTC)
Date:   Wed, 26 May 2021 09:52:30 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v2] dt-bindings: i2c: Move i2c-omap.txt to YAML format
Message-ID: <YK3wLgJSy0sVUn51@atomide.com>
References: <20210506140026.31254-1-vigneshr@ti.com>
 <f7570cb4-8c21-2fa5-bd26-1388f2a4bd6b@ti.com>
 <429a740a-c2b9-1cf8-ed2b-0fb7b1bea422@ti.com>
 <20210507163602.219894f4@aktux>
 <1ef076ac-e0de-a0df-a918-aeb8ed6c5956@ti.com>
 <e4fbdf7b-6556-eeba-c1b8-9d48f718437a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4fbdf7b-6556-eeba-c1b8-9d48f718437a@ti.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

* Vignesh Raghavendra <vigneshr@ti.com> [210510 11:06]:
> What do you prefer here? Removing dmas from schema would mean I would
> have to delete dmas property from omap2/3 dtsi files that list dmas
> property today? Note that driver does not support DMA mode today.

If the dma channels are not used by the driver, and not in the binding,
it's unlikely they will ever get used. Sure the dma channels describe
the hardware, and there's a slim chance some other OS needs them, but I
doubt it.

It seems weird we stop describing hardware in the devicetree to avoid
binding check warnings though. Up to you to figure out what you want
to do as far as I'm concerned.

Regards,

Tony
