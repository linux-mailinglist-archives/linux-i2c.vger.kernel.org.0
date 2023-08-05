Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22460771099
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 18:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbjHEQkp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Aug 2023 12:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjHEQko (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Aug 2023 12:40:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA3710F8;
        Sat,  5 Aug 2023 09:40:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5AD9060AF0;
        Sat,  5 Aug 2023 16:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F80FC433C8;
        Sat,  5 Aug 2023 16:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691253641;
        bh=ykPFYyhRYBB3T6oKUZ9VYmG082m8qU1MrJwEqVFoxak=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WP5x6kWVnd2Us8o3Ut65Dto87uu1msoCvvHK/Mmpx1cMcYnLJ0ZUyarkV8fEb8sFN
         /qCyJRSCBVRBsQDzd1Hqg92DuRuEQk9+zoxcC3SplmHDmiAkMWgybyqHnCPvGdkUZS
         mlSoXa66Py9AJk21AwDKEm33NmuG2uJVRktc4GMrVg9lGGN4lkB1EwgqJn6g+68cfr
         j4wFmgM583kbfr06/KqTzglNRgaJQkP4hsXWlQq0MNgZ1IQgdoZMG42VPtbDFNcjLu
         5I2jqnlhY7SHbnRckdbzbIRvSHdXu23DnE7h2YJIs37OYu1V2vQBU1K0M7yFnr3/HC
         a5ufNQFh2Z/+Q==
Date:   Sat, 5 Aug 2023 17:40:36 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-rtc@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct
 bus_type
Message-ID: <20230805174036.129ffbc2@jic23-huawei>
In-Reply-To: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
References: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri,  4 Aug 2023 17:17:24 +0100
Biju Das <biju.das.jz@bp.renesas.com> wrote:

> This patch series extend device_get_match_data() to struct bus_type,
> so that buses like I2C can get matched data.
> 
> There is a plan to replace i2c_get_match_data()->device_get_match_data()
> later, once this patch hits mainline as it is redundant.

Are we sure we don't have any instances left of the pattern that
used to be common (typically for drivers where dt tables were added
later) of

	chip_info = device_get_match_data();
	if (!chip_info) {
		chip_info = arrayofchipinfo[id->driver_data];	
	}

Looks like the first driver I checked, iio/adc/max1363.c does
this still and will I think break with this series.

Or am I missing some reason this isn't a problem?

Clearly this only matters if we get to the bus callback, but
enabling that is the whole point of this series.  Hence
I think a lot of auditing is needed before this can be safely applied.

Jonathan

> v6->v7:
>  * Added ack from Greg Kroah-Hartman for patch#1
>  * Swapped patch#2 and patch#3 from v6.
>  * Added Rb tag from Andy for patch#2 and patch#4
>  * Updated commit description of patch#2 by removing unnecessary wrapping.
>  * Updated typo in commit description struct bus_type()->struct bus_type.
> v5->v6:
>  * Cced linux-rtc and linux-iio as these subsytems uses i2c_get_match_
>    data() and this function become redundant once this patch series hits
>    mainline.
>  * Added Rb tag from Sakari for patch#1.
>  * Moved patch#3 from v5 to patch#2 and patch#2 from v5 to patch#4.
>  * Added Rb tag from Andy for patch#2
>  * Separate patch#3 to prepare for better difference for
>    i2c_match_id() changes.
>  * Merged patch#4 from v5 with patch#4.
> v4->v5:
>  * Added const struct device_driver variable 'drv' in i2c_device_get_match
>    _data().
>  * For code readability and maintenance perspective, added separate NULL
>    check for drv and client variable and added comment for NULL check for
>    drv variable.
>  * Created separate patch for converting i2c_of_match_device_sysfs() to
>    non-static.
>  * Removed export symbol for i2c_of_match_device_sysfs().
>  * Replaced 'dev->driver'->'drv'.
>  * Replaced return value data->NULL to avoid (potentially) stale pointers,
>    if there is no match.
> v3->v4:
>  * Documented corner case for device_get_match_data()
>  * Dropped struct i2c_driver parameter from i2c_get_match_data_helper()
>  * Split I2C sysfs handling in separate patch(patch#3)
>  * Added space after of_device_id for i2c_of_match_device_sysfs()
>  * Added const parameter for struct i2c_client, to prevent overriding it's
>    pointer.
>  * Moved declaration from public i2c.h->i2c-core.h
> v2->v3:
>  * Added Rb tag from Andy for patch#1.
>  * Extended to support i2c_of_match_device() as suggested by Andy.
>  * Changed i2c_of_match_device_sysfs() as non-static function as it is
>    needed for i2c_device_get_match_data().
>  * Added a TODO comment to use i2c_verify_client() when it accepts const
>    pointer.
>  * Added multiple returns to make code path for device_get_match_data()
>    faster in i2c_get_match_data().
> RFC v1->v2:
>  * Replaced "Signed-off-by"->"Suggested-by" tag for Dmitry.
>  * Documented device_get_match_data().
>  * Added multiple returns to make code path for generic fwnode-based
>    lookup faster.
>  * Fixed build warnings reported by kernel test robot <lkp@intel.com>
>  * Added const qualifier to return type and parameter struct i2c_driver
>    in i2c_get_match_data_helper().
>  * Added const qualifier to struct i2c_driver in i2c_get_match_data()
>  * Dropped driver variable from i2c_device_get_match_data()
>  * Replaced to_i2c_client with logic for assigning verify_client as it
>    returns non const pointer.
> 
> Biju Das (4):
>   drivers: fwnode: Extend device_get_match_data() to struct bus_type
>   i2c: Enhance i2c_get_match_data()
>   i2c: i2c-core-of: Convert i2c_of_match_device_sysfs() to non-static
>   i2c: Add i2c_device_get_match_data() callback
> 
>  drivers/base/property.c     | 27 ++++++++++++++++-
>  drivers/i2c/i2c-core-base.c | 60 ++++++++++++++++++++++++++++++-------
>  drivers/i2c/i2c-core-of.c   |  4 +--
>  drivers/i2c/i2c-core.h      |  9 ++++++
>  include/linux/device/bus.h  |  3 ++
>  5 files changed, 90 insertions(+), 13 deletions(-)
> 

