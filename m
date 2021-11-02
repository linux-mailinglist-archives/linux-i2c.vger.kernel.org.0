Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8D144331C
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Nov 2021 17:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234725AbhKBQkg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Nov 2021 12:40:36 -0400
Received: from mga06.intel.com ([134.134.136.31]:15979 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232033AbhKBQjt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 2 Nov 2021 12:39:49 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="292145052"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="292145052"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 09:17:54 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="728408938"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 09:17:49 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 0112D20180;
        Tue,  2 Nov 2021 18:17:46 +0200 (EET)
Date:   Tue, 2 Nov 2021 18:17:46 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v5 10/11] platform/x86: int3472: Pass
 tps68470_regulator_platform_data to the tps68470-regulator MFD-cell
Message-ID: <YYFkqlGkd7Jftcdk@paasikivi.fi.intel.com>
References: <20211102094907.31271-1-hdegoede@redhat.com>
 <20211102094907.31271-11-hdegoede@redhat.com>
 <CAHp75Vd-xY43H8jPOUqJp55Rq3Wuhsdzctfhqq300S0vAKTzpw@mail.gmail.com>
 <1f4377bb-2902-05e9-95c7-ad924477b543@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f4377bb-2902-05e9-95c7-ad924477b543@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 02, 2021 at 03:59:41PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 11/2/21 15:34, Andy Shevchenko wrote:
> > On Tue, Nov 2, 2021 at 11:50 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Pass tps68470_regulator_platform_data to the tps68470-regulator
> >> MFD-cell, specifying the voltages of the various regulators and
> >> tying the regulators to the sensor supplies so that sensors which use
> >> the TPS68470 can find their regulators.
> >>
> >> Since the voltages and supply connections are board-specific, this
> >> introduces a DMI matches int3472_tps68470_board_data struct which
> >> contains the necessary per-board info.
> >>
> >> This per-board info also includes GPIO lookup information for the
> >> sensor IO lines which may be connected to the tps68470 GPIOs.
> > 
> > ...
> > 
> >> +               board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
> >> +               if (!board_data) {
> >> +                       dev_err(&client->dev, "No board-data found for this laptop/tablet model\n");
> >> +                       return -ENODEV;
> > 
> > It's fine to use dev_err_probe() for known error codes.
> > 
> >> +               }
> > 
> > ...
> > 
> >> +               cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
> > 
> > Do we need casting?
> 
> Yes, the cast casts away a "const", the const is correct
> since the data only ever gets read by the regulator driver,
> but platform_data pointers are normally not const, so it
> is either the cast, or loose the const on the definition
> of the struct to which board_data->tps68470_regulator_pdata
> points...
> 
> So not good choice here really, only chosing between bad
> options and I picked the lets do the cast "least worse"
> option (at least to me). I'm open to changing this.

Maybe a comment explaining this briefly?

-- 
Sakari Ailus
