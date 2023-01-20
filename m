Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D88B4675960
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 16:58:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbjATP6n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 10:58:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjATP6n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 10:58:43 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 275FF6A31C;
        Fri, 20 Jan 2023 07:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674230322; x=1705766322;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Z1ku4uTRLmE2Qthefs6EE2L2camUPt4LfocOJrWd2s=;
  b=dYt2OO4ORh9En/jpT8+4G2wsjnoHzGqbIc+ODnHa1TM+6eor5qeMv1Sj
   F5pgl8px8wP69/cBgHEvby6vTdTIR9MHMuYKowk/k/PSOrcsdhbW4kuah
   CAgJymgQgxZHCRxhidLYubmT6vmXjtVysKmwT+4s9JDUWou0A79omtGg9
   PyfGxXBU1xquLGNyyZBFke8pulH9JcKw3muGonWIuhj2wI23EWnvutuKj
   Zjq0khP5vWseXkeeOqFHBJiOjSOiIf88D197reigEyi2SCDKm0rt8Wb1c
   +vKXGbCdYAT+nWfeirvR7+iP+80D1i2TfwQQiwqoVRw/AfMXrgb99Ov/W
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="305280674"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="305280674"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 07:58:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="610515331"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="610515331"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 20 Jan 2023 07:58:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pItmg-00CIcD-1H;
        Fri, 20 Jan 2023 17:58:30 +0200
Date:   Fri, 20 Jan 2023 17:58:30 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v7 1/7] i2c: add I2C Address Translator (ATR) support
Message-ID: <Y8q6JsDD7c0QCOq5@smile.fi.intel.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <20230118124031.788940-2-tomi.valkeinen@ideasonboard.com>
 <Y8gA+cz9m7PaEhfP@smile.fi.intel.com>
 <31562353-0794-8ad4-d609-3c117dd28d46@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31562353-0794-8ad4-d609-3c117dd28d46@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 19, 2023 at 12:01:33PM +0200, Tomi Valkeinen wrote:
> On 18/01/2023 16:23, Andy Shevchenko wrote:
> > On Wed, Jan 18, 2023 at 02:40:25PM +0200, Tomi Valkeinen wrote:

...

> > > +	/* Ensure we have enough room to save the original addresses */
> > > +	if (unlikely(chan->orig_addrs_size < num)) {
> > > +		u16 *new_buf;
> > > +
> > > +		new_buf = kmalloc_array(num, sizeof(*new_buf), GFP_KERNEL);
> > 
> > I remember that I asked why we don't use krealloc_array() here... Perhaps
> > that we don't need to copy the old mapping table? Can we put a short comment
> > to clarify this in the code?
> 
> Yes, we don't care about the old data, we just require the buffer to be
> large enough.
> 
> I'm not sure what kind of comment you want here. Isn't this a common idiom,
> where you have a buffer for temporary data, but you might need to resize at
> some point if you need a larger one?

Then why not krealloc_array()? That's the question I want to see the answer for
in the comments:

	/* We don't care about old data, hence no realloc() */

> > > +		if (!new_buf)
> > > +			return -ENOMEM;
> > > +
> > > +		kfree(chan->orig_addrs);
> > > +		chan->orig_addrs = new_buf;
> > > +		chan->orig_addrs_size = num;
> > > +	}

-- 
With Best Regards,
Andy Shevchenko


