Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 832C72FBCEB
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 17:51:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390206AbhASQuR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 11:50:17 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55482 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389915AbhASQuC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jan 2021 11:50:02 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9850BA4E;
        Tue, 19 Jan 2021 17:49:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611074959;
        bh=1CtpRSqqqrjLBnzm0zOskfSPhuxfIgbfyljcSVFkVKA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a3ev1gS7FYRk4JOV55TANrPdgNqcjECkvYuR6HbXpX1t2elboozdTnZQ224IcF4yE
         LBQH2LYkknLdbYdLdyPjnOMJo5on6K+/Zvl27v/aq7C52Cg3aTFZJVb2Cr0ceQgGSj
         fJaQMMyFOoHLF/OPxGY7IxVxGd0peaUcwrZRqKZQ=
Date:   Tue, 19 Jan 2021 18:49:02 +0200
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
Message-ID: <YAcNficDLrp8NTx8@pendragon.ideasonboard.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
 <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
 <20210118144606.GO4077@smile.fi.intel.com>
 <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
 <1053125f-7cb2-8aa0-3204-24df62986184@gmail.com>
 <YAZ6Y1QDyWwPGE69@pendragon.ideasonboard.com>
 <20210119093542.GP4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210119093542.GP4077@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 19, 2021 at 11:35:42AM +0200, Andy Shevchenko wrote:
> On Tue, Jan 19, 2021 at 08:21:23AM +0200, Laurent Pinchart wrote:
> > On Tue, Jan 19, 2021 at 12:11:40AM +0000, Daniel Scally wrote:
> > > On 18/01/2021 21:19, Daniel Scally wrote:
> 
> ...
> 
> > > (also, Laurent, if we did it this way we wouldn't be able to also handle
> > > the led-indicator GPIO here without some fairly major rework)
> > 
> > Given the additional complexity I don't think it's worth it, your
> > implementation is fine and code duplication with clk-gpio is minimal.
> 
> Making clk-gpio.c available as a library is a win in long term and reduces a
> possible duplication by others in the future. I bet we even might find already
> clk-gpio parts in some drivers.

How about you submit a patch on top then ? :-) Let's avoid yak shaving.

-- 
Regards,

Laurent Pinchart
