Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 114462CAB6B
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 20:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgLATH3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 14:07:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45722 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbgLATH3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 14:07:29 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8CC91DBD;
        Tue,  1 Dec 2020 20:06:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606849606;
        bh=9z5nUkzAbtzk9GChlVEMcwzq8DFFTconlJjzhX95x04=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZiSHFgmWkByw2sH9cObhUvVmOQmOUMgy5WaVESMS9OXi8zaIgeg/mrjjfkG3jMOG8
         QdP0v52O1/n60WcKKYaqECfHoPhegJUc477Vor2s8e3eR8nfhsyB0a+3Z4oD+S4MCK
         zKHx4/hvySioZ3aeLSTvLuDUdiQHcAJPsuoOR+oM=
Date:   Tue, 1 Dec 2020 21:06:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dan Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
Message-ID: <20201201190638.GZ4569@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <8a1b0f5b-1289-256b-b25d-cf8af43bdc84@gmail.com>
 <20201201185417.GL4077@smile.fi.intel.com>
 <20201201185548.GV4569@pendragon.ideasonboard.com>
 <20201201190523.GO4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201201190523.GO4077@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 01, 2020 at 09:05:23PM +0200, Andy Shevchenko wrote:
> On Tue, Dec 01, 2020 at 08:55:48PM +0200, Laurent Pinchart wrote:
> > On Tue, Dec 01, 2020 at 08:54:17PM +0200, Andy Shevchenko wrote:
> > > On Tue, Dec 01, 2020 at 08:30:03AM +0000, Dan Scally wrote:
> > > > On 30/11/2020 20:07, Andy Shevchenko wrote:
> 
> ...
> 
> > > > >> +static struct int3472_sensor_regulator_map int3472_sensor_regulator_maps[] = {
> > > > >> +	{ "GNDF140809R", 2, miix_510_ov2680 },
> > > > >> +	{ "YHCU", 2, surface_go2_ov5693 },
> > > > >> +	{ "MSHW0070", 2, surface_book_ov5693 },
> > > > >> +};
> > > > >
> > > > > Hmm... Usual way is to use DMI for that. I'm not sure above will not give us
> > > > > false positive matches.
> > > >
> > > > I considered DMI too, no problem to switch to that if it's a better choice.
> > > 
> > > I prefer DMI as it's a standard way to describe platform quirks in x86 world.
> > 
> > Do you think the Windows driver would use DMI ?
> 
> Linux is using DMI for quirks.
> 
> > That seems quite
> > unlikely to me, given how they would have to release a new driver binary
> > for every machine. I'm pretty sure that a different mechanism is used to
> > identify camera integration, and I think it would make sense to follow
> > the same approach. That would allow us to avoid large tables of DMI
> > identifiers that would need to be constently updated, potentially making
> > user experience better.
> 
> All Surface family can be matched in a way as Apple machines [1].
> 
> [1]: https://lkml.org/lkml/2020/4/15/1198

But not all Surface machines necessarily have the same camera
architecture. My point is that there seems to be identifiers reported in
ACPI for the exact purpose of identifying the camera architecture. If we
used DMI instead, we would have to handle each machine individually.

-- 
Regards,

Laurent Pinchart
