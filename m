Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5A54289AA
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 11:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235476AbhJKJdI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 05:33:08 -0400
Received: from mga01.intel.com ([192.55.52.88]:48063 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235452AbhJKJdI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Oct 2021 05:33:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10133"; a="250221457"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; 
   d="scan'208";a="250221457"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2021 02:30:50 -0700
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; 
   d="scan'208";a="479785314"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2021 02:30:44 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 11 Oct 2021 12:30:41 +0300
Date:   Mon, 11 Oct 2021 12:30:41 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 01/11] ACPI: delay enumeration of devices with a _DEP
 pointing to an INT3472 device
Message-ID: <YWQEQVzF2nMjE10y@lahna>
References: <20211010185707.195883-1-hdegoede@redhat.com>
 <20211010185707.195883-2-hdegoede@redhat.com>
 <YWPXixp/J6KIzWp6@lahna>
 <0c08069e-7758-fc09-c200-d867d097b499@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c08069e-7758-fc09-c200-d867d097b499@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 11, 2021 at 09:11:05AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 10/11/21 8:19 AM, Mika Westerberg wrote:
> > Hi,
> > 
> > On Sun, Oct 10, 2021 at 08:56:57PM +0200, Hans de Goede wrote:
> >> +/* List of HIDs for which we honor deps of matching ACPI devs, when checking _DEP lists. */
> >> +static const char * const acpi_honor_dep_ids[] = {
> >> +	"INT3472", /* Camera sensor PMIC / clk and regulator info */
> > 
> > Is there some reason why we can't do this for all devices with _DEP?
> > That way we don't need to maintain lists like this.
> 
> Up until now the ACPI core deliberate mostly ignores _DEP-s because the
> _DEP method may point to pretty much any random ACPI object and Linux does
> not necessarily have a driver for all ACPI objects the driver points too,
> which would lead to the devices never getting instantiated.
> 
> In hindsight this might not have been the best solution (1), but if we
> now start honoring _DEP-s for all devices all of a sudden then this
> will almost certainly lead to a whole bunch of regressions.
> 
> Note that in this case the HID which triggers this is for the device
> being depended upon and for all camera sensors used with the IPU3 and
> IPU4 Intel camera blocks this is the INT3472 device. By triggering on
> this HID (rather then on the sensor HIDs) I expect that we will not
> need to update this list all that often.

I see and agree. Thanks for the explanation!

No objections from my side then :)
