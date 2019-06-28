Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C98D85A6BB
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2019 00:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbfF1WKa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jun 2019 18:10:30 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:43695 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbfF1WK3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jun 2019 18:10:29 -0400
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 47A3B24000B;
        Fri, 28 Jun 2019 22:10:10 +0000 (UTC)
Date:   Sat, 29 Jun 2019 00:10:10 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andreas Werner <andreas.werner@men.de>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rudolf Marek <r.marek@assembler.cz>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Michael Shych <michaelsh@mellanox.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Jim Cromie <jim.cromie@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 3/5] docs: i2c: convert to ReST and add to driver-api
 bookset
Message-ID: <20190628221010.GV3692@piout.net>
References: <cover.1561756511.git.mchehab+samsung@kernel.org>
 <3997b54a2e73887b96ec665573f08ded78b71421.1561756511.git.mchehab+samsung@kernel.org>
 <20190628214138.GU3692@piout.net>
 <20190628185445.71eb824b@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190628185445.71eb824b@coco.lan>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 28/06/2019 18:54:45-0300, Mauro Carvalho Chehab wrote:
> Em Fri, 28 Jun 2019 23:41:38 +0200
> Alexandre Belloni <alexandre.belloni@bootlin.com> escreveu:
> 
> > On 28/06/2019 18:23:14-0300, Mauro Carvalho Chehab wrote:
> > > diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
> > > index 225a8df1d4e9..1803f3cab39f 100644
> > > --- a/drivers/rtc/rtc-ds1374.c
> > > +++ b/drivers/rtc/rtc-ds1374.c
> > > @@ -14,7 +14,7 @@
> > >   */
> > >  /*
> > >   * It would be more efficient to use i2c msgs/i2c_transfer directly but, as
> > > - * recommened in .../Documentation/i2c/writing-clients section
> > > + * recommened in .../Documentation/i2c/writing-clients.rst section
> > >   * "Sending and receiving", using SMBus level communication is preferred.
> > >   */
> > >    
> > 
> > Honestly, the whole comment could be removed. The current trend is to
> > move everything to regmap anyway.
> > 
> > However, I'm fine with that change if you want to keep it that way (and
> > probably scripted).
> 
> While the conversion was manually made, the renames were scripted,
> and checked with:
> 
> 	./scripts/documentation-file-ref-check
> 
> Otherwise I would very likely fix the typo:
> 
> 	recommened -> recommended
> 
> :-)
> 
> I can certainly add new patch at this (before or after patch 3/5 - as you
> prefer) in order to get rid of the comment, but I would avoid doing a
> somewhat unrelated changes at the same documentation patch.
> 

I'm okay with that.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
