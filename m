Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9EB32FA68D
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 17:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405816AbhARQoH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 11:44:07 -0500
Received: from mga06.intel.com ([134.134.136.31]:8760 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405681AbhARQno (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Jan 2021 11:43:44 -0500
IronPort-SDR: LKD/3STSXLgcOm/e5wTO2Oj+jPwcgmSnPuvK1eo6/1niucmpoZaay+I3vDLw2FYhE57yUcHVC4
 Lcvo/6gjHyHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="240366370"
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="240366370"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 08:41:51 -0800
IronPort-SDR: Op/kjjsZzHuGZ5jUoKNrngn2tFcngTUBJX+xDyw0XNbwjGUJ8h45cHOatY4wKk2Vvbo+l+e9t4
 U1qjLoNC5d1w==
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="500695133"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 08:41:43 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1Xc4-002MIe-SA; Mon, 18 Jan 2021 18:42:44 +0200
Date:   Mon, 18 Jan 2021 18:42:44 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, andy@kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 1/7] acpi: utils: move acpi_lpss_dep() to utils
Message-ID: <20210118164244.GD4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-2-djrscally@gmail.com>
 <20210118122852.GD4077@smile.fi.intel.com>
 <CAJZ5v0hihFa=M658GE2LtoKCnPkMQznXBtq9_+g0_4gFnw6qAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hihFa=M658GE2LtoKCnPkMQznXBtq9_+g0_4gFnw6qAg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 18, 2021 at 05:06:30PM +0100, Rafael J. Wysocki wrote:
> On Mon, Jan 18, 2021 at 1:30 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Mon, Jan 18, 2021 at 12:34:22AM +0000, Daniel Scally wrote:
> > > I need to be able to identify devices which declare themselves to be
> > > dependent on other devices through _DEP; add this function to utils.c
> > > and export it to the rest of the ACPI layer.
> >
> > Prefix -> "ACPI / utils: "
> 
> Preferably "ACPI: utils: " for that matter

Ah, good to know! I was always bending between / and : there.

-- 
With Best Regards,
Andy Shevchenko


