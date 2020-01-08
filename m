Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 329481343E8
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2020 14:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbgAHNfC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jan 2020 08:35:02 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46856 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgAHNfC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jan 2020 08:35:02 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 551A252F;
        Wed,  8 Jan 2020 14:34:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1578490499;
        bh=jbLlVNKkGLVxypHxH6YqRqkkTKsMSdWIrRDZdJhWYiA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H7wpInwZV5RUfVE/uesvodZK7eSOo26vDFC0bD2qEMM+3gaH2Pl6ItYvUx6OJH52b
         2b90tw1DzakdI4lUWFp9mhQ27N4C0PRavBwknGoUy8QaDZGSeizN+JOTrLU2WGmDUO
         E/F9yOkdv1irhEf0Bh6/nceMeso8udppnm4GK1O0=
Date:   Wed, 8 Jan 2020 15:34:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
Message-ID: <20200108133447.GC4884@pendragon.ideasonboard.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
 <20200101165515.GC6226@pendragon.ideasonboard.com>
 <e008939f-531d-f7dc-4c3c-937476213030@lucaceresoli.net>
 <20200102211327.GB1030@kunai>
 <cc2a10ab-9f05-2c61-3a37-0e5e0184e379@lucaceresoli.net>
 <20200103001056.GJ4843@pendragon.ideasonboard.com>
 <20200108131929.GA834@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200108131929.GA834@kunai>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 08, 2020 at 02:19:29PM +0100, Wolfram Sang wrote:
> 
> > > > As I said to Laurent, too, I think the risk that a bus is not fully
> > > > described is higher than a device which does not respond to a read_byte.
> > > > In both cases, we would wrongly use an address in use.
> > 
> > I don't fully agree with this, I think we shouldn't impose a penalty on
> > every user because some device trees don't fully describe the hardware.
> 
> I haven't decided yet. However, my general preference is that for a
> generic OS like Linux, saftey comes first, then performance. If you have
> a fully described DT, then the overhead will be 1 read_byte transaction
> per requested alias at probe time. We could talk about using quick_read
> to half the overhead. You could even patch it away, if it is too much
> for $customer.
> 
> > I think we should, at the very least, skip the probe and rely on DT if
> > DT explicitly states that all used addresses are listed. We discussed a
> > property to report addresses used by devices not described in DT, if
> > that property is listed I would prefer trusting DT.
> 
> Yeah, we discussed this property and I have no intentions of dropping
> it. I haven't though of including it into this series, but it probably
> makes sense. We don't have to define much anyhow, just state what
> already exists, I guess.
> 
> From Documentation/devicetree/bindings/i2c/i2c-ocores.txt:
> 
> 	dummy@60 {
> 		compatible = "dummy";
> 		reg = <0x60>;
> 	};
> 
> I think "dummy" is generic enough to be described in i2c.txt.

We may want a compatible value that guarantees noone will ever match it
:-) I was imagining a single property at the bus level with multiple
ranges instead, but dummy nodes could be OK too.


-- 
Regards,

Laurent Pinchart
