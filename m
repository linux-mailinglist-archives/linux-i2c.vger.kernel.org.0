Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCC89665848
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jan 2023 10:55:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238950AbjAKJzw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Jan 2023 04:55:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238294AbjAKJzY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Jan 2023 04:55:24 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3BD11AA01;
        Wed, 11 Jan 2023 01:52:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 481ADCE1AF0;
        Wed, 11 Jan 2023 09:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55437C433EF;
        Wed, 11 Jan 2023 09:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1673430725;
        bh=oXCi5khh0tLaMHH1zP2nsRJNVvEQa1Cgs0JsEGf4KV0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gPuguIzzFo6WwvkmvdXCcucIdg/z4oenZaHNqVwe0Xv8BUYanHPNMhHieoI3sdeN0
         AsWCf9aLt5wvj+I3NsaGNl6FBV3WWFApXe5DcEO4yauxcgGRjc0UG8e3RtVz8QmvQT
         AEf0sLnzE201I52A5gl+CjVi5n2RuHLZHKH8WrHs=
Date:   Wed, 11 Jan 2023 10:52:02 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Wolfram Sang <wsa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sean Young <sean@mess.org>, Rob Herring <robh+dt@kernel.org>,
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
Message-ID: <Y76Gwna0pihXYQwU@kroah.com>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <20221125115618.14ef8167@sal.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125115618.14ef8167@sal.lan>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 25, 2022 at 11:56:18AM +0000, Mauro Carvalho Chehab wrote:
> Em Wed, 23 Nov 2022 13:25:21 +0100
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:
> 
> > The uevent() callback in struct device_type should not be modifying the
> > device that is passed into it, so mark it as a const * and propagate the
> > function signature changes out into all relevant subsystems that use
> > this callback.
> 
> Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Thanks for the review.
