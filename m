Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69DFD66582C
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jan 2023 10:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbjAKJyS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Jan 2023 04:54:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235993AbjAKJxo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Jan 2023 04:53:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF3A5D109;
        Wed, 11 Jan 2023 01:51:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9221EB81B76;
        Wed, 11 Jan 2023 09:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F6DC433F1;
        Wed, 11 Jan 2023 09:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1673430685;
        bh=z0ZYgHqL1YLvYl+ue5zNy1KMy+u3shk6BmiAvHiQZSA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xZGcZ5JDRrdXTJbt9tLPDzh24ToBaCeG04aIrg63SxaV0mqioT6pGZXGHiVeh9ZOU
         sO0JuLfJTFUVrJVMPgoU9Fwio7tkoa1uh4VeY/xzIKAbqvAAsfPDw+kuuk3E42lxBv
         sJ9yu85to26aoTWWeVLBJDsI3mtwYFGQ3RchmYyA=
Date:   Wed, 11 Jan 2023 10:51:22 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        Len Brown <lenb@kernel.org>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Wolfram Sang <wsa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Chaitanya Kulkarni <kch@nvidia.com>,
        Ming Lei <ming.lei@redhat.com>,
        Jilin Yuan <yuanjilin@cdjrlc.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ira Weiny <ira.weiny@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Won Chung <wonchung@google.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-block@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-i3c@lists.infradead.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-usb@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Message-ID: <Y76GmvOD9KxSuD7o@kroah.com>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <CAJZ5v0gqD_TW3iGLAiH=us1B0-JLGtv2VGTJjQwiWxCmris9ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0gqD_TW3iGLAiH=us1B0-JLGtv2VGTJjQwiWxCmris9ag@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 23, 2022 at 01:38:05PM +0100, Rafael J. Wysocki wrote:
> On Wed, Nov 23, 2022 at 1:25 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > The uevent() callback in struct device_type should not be modifying the
> > device that is passed into it, so mark it as a const * and propagate the
> > function signature changes out into all relevant subsystems that use
> > this callback.
> >
> > Cc: Jens Axboe <axboe@kernel.dk>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Len Brown <lenb@kernel.org>
> > Cc: Stefan Richter <stefanr@s5r6.in-berlin.de>
> > Cc: Wolfram Sang <wsa@kernel.org>
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: Sean Young <sean@mess.org>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Cc: Maximilian Luz <luzmaximilian@gmail.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Mark Gross <markgross@kernel.org>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> > Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Cc: Sanyog Kale <sanyog.r.kale@intel.com>
> > Cc: Andreas Noever <andreas.noever@gmail.com>
> > Cc: Michael Jamet <michael.jamet@intel.com>
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Cc: Yehezkel Bernat <YehezkelShB@gmail.com>
> > Cc: Jiri Slaby <jirislaby@kernel.org>
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> > Cc: Chaitanya Kulkarni <kch@nvidia.com>
> > Cc: Ming Lei <ming.lei@redhat.com>
> > Cc: Jilin Yuan <yuanjilin@cdjrlc.com>
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ira Weiny <ira.weiny@intel.com>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: Won Chung <wonchung@google.com>
> > Cc: alsa-devel@alsa-project.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-acpi@vger.kernel.org
> > Cc: linux-block@vger.kernel.org
> > Cc: linux-i2c@vger.kernel.org
> > Cc: linux-i3c@lists.infradead.org
> > Cc: linux-input@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linux-serial@vger.kernel.org
> > Cc: linux-usb@vger.kernel.org
> > Cc: linux1394-devel@lists.sourceforge.net
> > Cc: platform-driver-x86@vger.kernel.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> (which my ACPI maintainer hat on).

thanks for the review, I'll add it to the v2 patch.

greg k-h
