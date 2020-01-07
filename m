Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF4D132CC3
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 18:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbgAGROL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 12:14:11 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37274 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728344AbgAGROK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 12:14:10 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E449C52F;
        Tue,  7 Jan 2020 18:14:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1578417248;
        bh=599MW3bdnVAHt5UaSfBdyBJfsXzHiA2pzVNhVKKIZTU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zyf+70y40awNBfnEBGTowVCZLTGenVxew5JjBQuIZx87BnLJln1VhjcFnrtgH5+12
         QNMOW68iA0sQotLnCzibQboMVgkQDFGb4ueZvVRQWW68Udr+bfssSVKOoJb0Oc812T
         7BP0xl8RI1YOlk1i7oecxe5aEywzDh51u8oFfd9s=
Date:   Tue, 7 Jan 2020 19:13:57 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
Message-ID: <20200107171357.GO4871@pendragon.ideasonboard.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
 <20200101165515.GC6226@pendragon.ideasonboard.com>
 <e008939f-531d-f7dc-4c3c-937476213030@lucaceresoli.net>
 <20200102211327.GB1030@kunai>
 <cc2a10ab-9f05-2c61-3a37-0e5e0184e379@lucaceresoli.net>
 <20200103001056.GJ4843@pendragon.ideasonboard.com>
 <b9394a6c-1268-7cf8-6c00-e914735bc268@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b9394a6c-1268-7cf8-6c00-e914735bc268@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Luca,

On Tue, Jan 07, 2020 at 04:03:29PM +0100, Luca Ceresoli wrote:
> On 03/01/20 01:10, Laurent Pinchart wrote:
> > On Thu, Jan 02, 2020 at 11:27:57PM +0100, Luca Ceresoli wrote:
> >> On 02/01/20 22:13, Wolfram Sang wrote:
> >>>>> This looks quite inefficient, especially if the beginning of the range
> >>>>> is populated with devices. Furthermore, I think there's a high risk of
> >>>>> false negatives, as acquiring a free address and reprogramming the
> >>>>> client to make use of it are separate operations.
> >>>>
> >>>> Right. Applying the alias could raise other errors, thus one would need
> >>>> i2c_new_alias_device() to keep the alias locked until programming it has
> >>>> either failed or has been successfully programmed.
> >>>
> >>> Please see my reply to Laurent, I don't think it is racy. But please
> >>> elaborate if you think I am wrong.
> >>
> >> Uhm, you are right here, it's not racy. Sorry, I had read the code
> >> quickly and didn't notice the i2c_new_dummy_device() call.
> >>
> >> So this means if i2c_new_alias_device() succeeds but the caller later
> >> fails while applying the alias, then it has to call
> >> i2c_unregister_device() to free the alias. Correct?
> > 
> > I was wrong as well, sorry about that.
> > 
> >>>>> What happened to the idea of reporting busy address ranges in the
> >>>>> firmware (DT, ACPI, ...) ?
> >>>>
> >>>> Indeed that's how I remember it as well, and I'm a bit suspicious about
> >>>> sending out probe messages that might have side effects (even if the
> >>>> false negative issue mentioned by Laurent were solved). You know, I've
> >>>> been taught to "expect the worse" :) so I'd like to better understand
> >>>> what are the strong reasons in favor of probing, as well as the
> >>>> potential side effects.
> >>>
> >>> As I said to Laurent, too, I think the risk that a bus is not fully
> >>> described is higher than a device which does not respond to a read_byte.
> >>> In both cases, we would wrongly use an address in use.
> > 
> > I don't fully agree with this, I think we shouldn't impose a penalty on
> > every user because some device trees don't fully describe the hardware.
> > I think we should, at the very least, skip the probe and rely on DT if
> > DT explicitly states that all used addresses are listed. We discussed a
> > property to report addresses used by devices not described in DT, if
> > that property is listed I would prefer trusting DT.
> 
> It would be nice, but I'm not sure this is really doable. Say the DT for
> board X lists all the used slave addresses. Then the kernel would assume
> all the other addresses are available. But then somebody includes the DT
> of board X in the DT for product Z, based on board X + add-on board Y.
> Add-on board Y has 2 I2C chips, but only one is described in DT. Now the
> kernel still thinks it knows all the used address, but this is wrong.

That's the fault of the system integrator though. We can't prevent
people from making incorrect DT, and we shouldn't go to great length to
still support them.

> At my current pondering status, I think only two approaches are doable:
> either assuming all DTs fully describe the hardware (which is still a
> good goal to pursue, generally speaking) or use Wolfram's proposal. The
> difference between the two is the call to i2c_unlocked_read_byte_probe().
> 
> However a hybrid approach is to speak out loud if we get a response from
> an address that is not marked as busy, to invite the developers to fix
> their DT. In other words:
> 
>  ret = i2c_scan_for_client(adap, addr, i2c_unlocked_read_byte_probe);
>  if (ret == -ENODEV) {
>          alias = i2c_new_dummy_device(adap, addr);
>          dev_dbg(&adap->dev, "Found alias: 0x%x\n", addr);
>          break;
> +} else if (ret == 0) {
> +        dev_err(&adap->dev,
> +                "alien found at %02x, please add it to your DT!!!\n",
> +                addr);
>  }
> 
> Wolfram, do think this could work? Do we have all the addresses listed
> in DT marked as busy early enough?

-- 
Regards,

Laurent Pinchart
