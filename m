Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E9B2FC9E5
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Jan 2021 05:24:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729221AbhATEUH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 23:20:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728955AbhATET7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jan 2021 23:19:59 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96526C061575;
        Tue, 19 Jan 2021 20:19:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E0E950E;
        Wed, 20 Jan 2021 05:19:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611116351;
        bh=/u6ACn8JudCBdtoWSDxgfBNPy7loyRUePjkonbjkqBg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y0f6DpKSI+V13GQrc86YT8aW2WGtSJsvZl9BIQRXfAf4dLHqNUhgW0xt8UaauZDgp
         0HaR2yUR58QtBnZS+If4liTjkzAKm7XeeSdpRg943TbY6964xYiYFthTaaQVnU0iin
         Z1J7r/mkEuGCyjLTmvySVPGfSAxGJ9FhNDB1s3Ms=
Date:   Wed, 20 Jan 2021 06:18:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        andy@kernel.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, lee.jones@linaro.org, hdegoede@redhat.com,
        mgross@linux.intel.com, robert.moore@intel.com,
        erik.kaneda@intel.com, sakari.ailus@linux.intel.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
Message-ID: <YAevLTVlUSXMylWL@pendragon.ideasonboard.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
 <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
 <20210118144606.GO4077@smile.fi.intel.com>
 <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
 <1053125f-7cb2-8aa0-3204-24df62986184@gmail.com>
 <20210119093358.GO4077@smile.fi.intel.com>
 <YAcKj9fyNZY8QETd@pendragon.ideasonboard.com>
 <YAcaM9Tcif1rS3V/@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YAcaM9Tcif1rS3V/@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Tue, Jan 19, 2021 at 07:43:15PM +0200, Andy Shevchenko wrote:
> On Tue, Jan 19, 2021 at 06:36:31PM +0200, Laurent Pinchart wrote:
> > On Tue, Jan 19, 2021 at 11:33:58AM +0200, Andy Shevchenko wrote:
> > > On Tue, Jan 19, 2021 at 12:11:40AM +0000, Daniel Scally wrote:
> > > > On 18/01/2021 21:19, Daniel Scally wrote:
> 
> ...
> 
> > > See my previous reply. TL;DR: you have to modify clk-gpio.c to export couple of
> > > methods to be able to use it as a library.
> > 
> > That seems really overkill given the very simple implementation of the
> > clock provided here.
> 
> Less code in the end is called an overkill? Hmm...
> I think since we in Linux it's better to utilize what it provides. Do you want
> me to prepare a patch to show that there is no overkill at all?

The amount of code we would save it very small. It's not necessarily a
bad idea, but I think such an improvement could be made on top, it
shouldn't block this series.

> ...
> 
> > > > (also, Laurent, if we did it this way we wouldn't be able to also handle
> > > > the led-indicator GPIO here without some fairly major rework)
> > > 
> > > LED indicators are done as LED class devices (see plenty of examples in PDx86
> > > drivers: drivers/platform/x86/)
> > 
> > How do you expose the link between the sensor and its indicator LED to
> > userspace ? Isn't it better to handle it in the kernel to avoid rogue
> > userspace turning the camera on without notifying the user ?
> 
> I didn't get this. It's completely a LED handling driver business. We may
> expose it to user space or not, but it's orthogonal to the usage of LED class
> IIUC. Am I mistaken here?

If it stays internal to the kernel and is solely controlled from the
int3472 driver, there's no need to involve the LED class. If we want to
expose the privacy LED to userspace then the LED framework is the way to
go, but we will also need to find a way to expose the link between the
camera sensor and the LED to userspace. If there are two privacy LEDs,
one for the front sensor and one for the back sensor, userspace will
need to know which is which.

-- 
Regards,

Laurent Pinchart
