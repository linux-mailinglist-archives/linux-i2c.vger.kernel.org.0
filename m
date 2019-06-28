Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCFEC5A69A
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2019 23:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfF1VzD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jun 2019 17:55:03 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52740 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbfF1VzD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jun 2019 17:55:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=1YowApiCP7t4yhyLsuBrY7Q1RescjtXFLK0Ces5k/yI=; b=KSIL64tdqtX9cRqQtYeK6D9fM
        4kAZVnYOTgI7OBgJUexbUe51eHPQ8UN8CkPdse2vfvXJIUXRCjEcu/X0Pd442Eyf2YfxZVdPW2MGa
        5HOfBZBfOvrFcPXgAQukWdsLqHRtECBHc86yusYZgwFr1l0YN4eUldAEdKCvpc7li44icQKYfTXV4
        CZiG9zdsH5OMhkAU1WYIgmkRhk9hdLUqHr/fdGO9ELPXFLunwX+9EZgz/X31c0t636O4npqKzj0Yr
        AQQLFxAB3QB/LukvEhG3RP/5+ZnFQOfwIDJTx/g/JexwB78mo5kKMlgvwa+wkpA45h7gFXySp93tG
        /3XdVI4aw==;
Received: from [187.113.3.250] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hgypa-0002Bz-IF; Fri, 28 Jun 2019 21:54:54 +0000
Date:   Fri, 28 Jun 2019 18:54:45 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
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
Message-ID: <20190628185445.71eb824b@coco.lan>
In-Reply-To: <20190628214138.GU3692@piout.net>
References: <cover.1561756511.git.mchehab+samsung@kernel.org>
        <3997b54a2e73887b96ec665573f08ded78b71421.1561756511.git.mchehab+samsung@kernel.org>
        <20190628214138.GU3692@piout.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Em Fri, 28 Jun 2019 23:41:38 +0200
Alexandre Belloni <alexandre.belloni@bootlin.com> escreveu:

> On 28/06/2019 18:23:14-0300, Mauro Carvalho Chehab wrote:
> > diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
> > index 225a8df1d4e9..1803f3cab39f 100644
> > --- a/drivers/rtc/rtc-ds1374.c
> > +++ b/drivers/rtc/rtc-ds1374.c
> > @@ -14,7 +14,7 @@
> >   */
> >  /*
> >   * It would be more efficient to use i2c msgs/i2c_transfer directly but, as
> > - * recommened in .../Documentation/i2c/writing-clients section
> > + * recommened in .../Documentation/i2c/writing-clients.rst section
> >   * "Sending and receiving", using SMBus level communication is preferred.
> >   */
> >    
> 
> Honestly, the whole comment could be removed. The current trend is to
> move everything to regmap anyway.
> 
> However, I'm fine with that change if you want to keep it that way (and
> probably scripted).

While the conversion was manually made, the renames were scripted,
and checked with:

	./scripts/documentation-file-ref-check

Otherwise I would very likely fix the typo:

	recommened -> recommended

:-)

I can certainly add new patch at this (before or after patch 3/5 - as you
prefer) in order to get rid of the comment, but I would avoid doing a
somewhat unrelated changes at the same documentation patch.

Thanks,
Mauro
