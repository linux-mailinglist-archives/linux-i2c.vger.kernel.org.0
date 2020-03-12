Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C041182F7D
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Mar 2020 12:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgCLLog (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Mar 2020 07:44:36 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:54575 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgCLLog (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Mar 2020 07:44:36 -0400
X-Originating-IP: 90.66.181.224
Received: from localhost (lfbn-lyo-1-2013-224.w90-66.abo.wanadoo.fr [90.66.181.224])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7A727240004;
        Thu, 12 Mar 2020 11:44:32 +0000 (UTC)
Date:   Thu, 12 Mar 2020 12:44:32 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [RFC PATCH 3/7] i2c: allow DT nodes without 'compatible'
Message-ID: <20200312114432.GA3384@piout.net>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdWaPfc050dZiRr+gAFzsdjSo9Vo70ztWgrMGPJxLUqupw@mail.gmail.com>
 <e43eaaf1-a294-902f-9a52-ebf8b29acab1@lucaceresoli.net>
 <20200312111950.GA1013@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312111950.GA1013@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/03/2020 12:19:51+0100, Wolfram Sang wrote:
> > Clearly this does not fit the case reported by Alexandre: a device
> > having a driver which is known to be badly buggy, so we don't want to
> > instantiate it. But again, this should not affect DT as it is not
> > describing the HW, but only an implementation detail. Probably disabling
> > or blacklisting the driver would be a better option there?
> 
> "Fixing the driver" is the first thing coming to my mind ;) But yeah,
> blacklisting would be another good solution. With only the information
> above, DT is not the right place to fix a broken driver.
> 

To be clear, the driver is working properly but the HW isn't. It is a
PMIC and we need to avoid linux talking to it so the PMIC doesn't end up
killing the bus.

We end up with a node properly described in the device tree but with
status = "disabled". The relevance to the discussion was that you know
what is there and you want to avoid using its address.

See the pmic node on i2c1 in arch/arm/boot/dts/at91-sama5d3_xplained.dts
for what I'm referring to.

> > My apologies to Wolfram, I appreciate a lot the effort you are doing,
> > but before reviewing this patch I have never realized what I tried to
> > explain above.
> 
> All good, Luca! Talking over code usually brings in viewpoints which
> have been missed so far. This is expected. Actually, I am very happy to
> have this discussion!
> 
> All the best,
> 
>    Wolfram
> 



-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
