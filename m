Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B44642FA066
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 13:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391552AbhARMvg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 07:51:36 -0500
Received: from mga18.intel.com ([134.134.136.126]:61139 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404184AbhARMmU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Jan 2021 07:42:20 -0500
IronPort-SDR: SkGcwupswNGLQHSWriIwCxt/klL562MaRnnjTh7+xVxtMqeT6WnviWT3XkCugn/4Bqb6srGNlK
 47DOW7X3VVsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9867"; a="166464352"
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="166464352"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 04:40:26 -0800
IronPort-SDR: oSWFvo61tofrjLPCFH97dQVRoKqzgpBmXaWc5zc2ABj9doVVZ9Q01N2m5WSRfDbiFzx8e0AEkl
 eMnEkW8tszEA==
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="569180584"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 04:40:21 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1TqV-0028Bt-5G; Mon, 18 Jan 2021 14:41:23 +0200
Date:   Mon, 18 Jan 2021 14:41:23 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Subject: Re: [PATCH v2 3/7] i2c: i2c-core-base: Use format macro in
 i2c_dev_set_name()
Message-ID: <20210118124123.GH4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-4-djrscally@gmail.com>
 <YAU4ol/X3QF2eS9/@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YAU4ol/X3QF2eS9/@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 18, 2021 at 09:28:34AM +0200, Laurent Pinchart wrote:
> On Mon, Jan 18, 2021 at 12:34:24AM +0000, Daniel Scally wrote:

> I'd change the subject line to say "Add a format macro for I2C device
> names", as that's the most important part of the patch. Apart from that,


Actually prefix can be "i2c: core: ".

Hint: look at the git history to find what was lately used mostly.

	% git log --oneline -- drivers/i2c/i2c-*

-- 
With Best Regards,
Andy Shevchenko


