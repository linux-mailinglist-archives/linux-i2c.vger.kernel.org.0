Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8564E2FA70F
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 18:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406872AbhARRH6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 12:07:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406887AbhARRHo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 12:07:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B685C06179E;
        Mon, 18 Jan 2021 09:06:03 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B63A2BB;
        Mon, 18 Jan 2021 18:06:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610989561;
        bh=hV0WHCjFGw1rTzD++XaJeAj6GzXlQajHsTgjgpBryXs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hNOuPj1h1pmgWY6bY3ZJf0d6zcHBaf2KDadN25ZLRYS3uYrRXRtW4ifFoF3bhFHYL
         GCffXA6cQ4bSUs2nnaCbMH89pxaj2C4s33AF8CV1DbCZq84qvdBHar6S/0GRSdHKLN
         DCD4v5FAjSgMZh9n6G8RDF7w7jSlsArXuLo5u5N8=
Date:   Mon, 18 Jan 2021 19:05:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Daniel Scally <djrscally@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "devel@acpica.org" <devel@acpica.org>,
        "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
        "lenb@kernel.org" <lenb@kernel.org>,
        "andy@kernel.org" <andy@kernel.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "robert.moore@intel.com" <robert.moore@intel.com>,
        "erik.kaneda@intel.com" <erik.kaneda@intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
Message-ID: <YAW/6Ek/j733xzLW@pendragon.ideasonboard.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
 <-GKrxu8GJvGe-PlKkLpblw9N-DtVtS7i87BOCLgJR72yf4hUFpUgiOlGcFero_gqgUxJrX2gxtLOnz_31hJugfam0SXXmXxIzGIhS162mhI=@protonmail.com>
 <20210118135121.GM4077@smile.fi.intel.com>
 <w3qrFtorGLZ_wMnr_Mi7cltli9g8jsMtiQ7Z1Usnj2IKfJ1MJz6-wxlIAEQ-ErgU1x6IBxdAIHBHtQ3OOT_FJOuUYheILlUc20ysNL_zroo=@protonmail.com>
 <20210118152323.GV4077@smile.fi.intel.com>
 <e1032328-c5e8-0bfa-4b87-64207d283d17@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1032328-c5e8-0bfa-4b87-64207d283d17@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Hans,

On Mon, Jan 18, 2021 at 04:32:54PM +0100, Hans de Goede wrote:
> On 1/18/21 4:23 PM, andriy.shevchenko@linux.intel.com wrote:
> > On Mon, Jan 18, 2021 at 02:51:30PM +0000, Barnabás Pőcze wrote:
> >> 2021. január 18., hétfő 14:51 keltezéssel, Andy Shevchenko írta:
> >>
> >>> On Mon, Jan 18, 2021 at 11:12:34AM +0000, Barnabás Pőcze wrote:
> >>>> 2021. január 18., hétfő 1:34 keltezéssel, Daniel Scally írta:
> >>>
> >>>> Have you considered putting the source (and header) files into a dedicated
> >>>> folder? I think it'd help manageability in the long run, and it'd be immediately
> >>>> obvious that these source files form a single "unit".
> >>>
> >>> What would be the folder name? Because, for example, intel_cht_int33fe* have no
> >>> folder (yet?) and here it's kinda similar case when HID describes something
> >>> else than just one IP.
> >>
> >> I think "intel_skl_int3472" would not be a bad name for the folder. And I believe
> >> "intel_cht_int33fe" could be given its own folder as well.
> > 
> > I;m not objecting (at some point in the past I had proposed moving Intel stuff
> > to a separate folder, but at that time PDx86 has no folders at all and Darren
> > was kinda not in favour of creating ones, but things changed), just let's hear
> > Hans on this.
> 
> I'm in favor of using a folder for this and "intel_skl_int3472" is fine with me.
> 
> With that said I'm not entirely sure if I'm in favor of the _skl_ part of
> the folder and driver name or not.
> 
> The INT3472 ACPI device is used with other CPUs, e.g. Apollo Lake too and
> I think the driver should work fine with those.

It should work on Kabylake as well, although there are some differences
in the way the INT3472 device is modelled in the DSDT between those two
platforms. Hopefully nothing that couldn't be supported in a single
driver without adding too many hacks.

> The intel_cht_int33fe case is special because the driver only applies
> to some models with an INT33FE ACPI device (the whole INT33FE ACPI device
> is a horrible thing which seems to stem from Intel rushing Bay Trail to
> market to try and compete on the tablet market).

The INT3472 ACPI device is also horrible. It reminds me of Intercal, the
programming language that was created by gathering features of several
well known languages and then making sure that none of them would be
used: the ACPI model of the device was probably created by someone who
has studied ACPI extensively and decided to break every single best
practice rule. I lack English words strong enough to express my dismay
on this topic (but I still have hope to find solace in Finnish).

> With that all said SKL probably is the first SoC to feature this and I
> guess future IPUs may still use INT3472 given Intel's BAD habit of
> re-using ACPI HIDs for multiple incompatible generations. So I guess
> that keeping it is fine; and if we then need an incompatible INT3472
> driver for newer IPUs we can use a different prefix for those.
> 
> TL;DR:
> 
> 1. Using a folder is fine, desirable even
> 2. I've some concerns about the name, but I'm not really objecting,
> just giving my 2 cents.

-- 
Regards,

Laurent Pinchart
