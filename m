Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFB8654F7E
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Dec 2022 12:13:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbiLWLNm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Dec 2022 06:13:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbiLWLNl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Dec 2022 06:13:41 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDF0533E;
        Fri, 23 Dec 2022 03:13:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4109B61F1F;
        Fri, 23 Dec 2022 11:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86546C433EF;
        Fri, 23 Dec 2022 11:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671794018;
        bh=6k6qPOMW3plUmLr9uKjqG2VachpkpHPBQRLd+3OwQss=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Khjxud6QJi8oVSJXQBZmrqMYL9NAC+3GSwrI48dwsPyr+fbgwyg0MOaaAz+BAluLG
         PRlhI2p2WZfMf3vB4xCAMfw8LhtQSXuT83ggO7UsneOEbGkHcla0M5+A7FLYijZLH0
         45GFDDWnXZ4Hn3TahkVpRQeQ78zDybWLTOIEcCqgMAET1mr8HI5weIX4AyAY2JVHaT
         WTH7JfdjK8bcC5kT5nzIN1/C7jF+Plk+T81oLw+3CQs/NhS4K0B7kKkVOb+QbQK/ho
         SvgzbEzCSljlg3XBEmMB7AvC8TAit6WydPd9AnTB33qCr3OlOmJMXsSyerykOZLnYI
         0f4Z2Wp+0HoHA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1p8g0V-00050v-5Q; Fri, 23 Dec 2022 12:14:31 +0100
Date:   Fri, 23 Dec 2022 12:14:31 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Daniel Beer <daniel.beer@igorinstitute.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Christina Quast <contact@christina-quast.de>,
        linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH] hid-ft260: add UART support.
Message-ID: <Y6WNl6+ySy8zcSyg@hovoldconsulting.com>
References: <638c51a2.170a0220.3af16.18f8@mx.google.com>
 <Y4xX7ILXMFHZtJkv@kroah.com>
 <20221204091247.GA11195@nyquist.nev>
 <Y4xqyRERBdr8fT7F@kroah.com>
 <20221205012403.GA14904@nyquist.nev>
 <Y5G2PBEprjPp3FKR@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5G2PBEprjPp3FKR@kroah.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 08, 2022 at 11:02:36AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Dec 05, 2022 at 02:24:03PM +1300, Daniel Beer wrote:
> > On Sun, Dec 04, 2022 at 10:39:21AM +0100, Greg Kroah-Hartman wrote:
> > > > Thanks for reviewing. This device is quite strange -- it presents itself
> > > > as a USB HID, but it provides both an I2C master and a UART. The
> > > > existing driver supports only the I2C functionality currently.

> > > > > A whole new major for just a single tty port?  Please no, use dynamic
> > > > > majors if you have to, or better yet, tie into the usb-serial
> > > > > implementation (this is a USB device, right?) and then you don't have to
> > > > > mess with this at all.
> > > > 
> > > > As far as I understand it, I don't think usb-serial is usable, due to
> > > > the fact that this is already an HID driver.
> > > 
> > > That should not be a restriction at all.  You are adding a tty device to
> > > this driver, no reason you can't interact with usb-serial instead.  That
> > > way you share the correct userspace tty name and major/minor numbers and
> > > all userspace tools should "just work" as they know that name and how to
> > > interact with it already.
> > > 
> > > Try doing that instead of your own "raw" tty device please.
> > 
> > Maybe I've misunderstood something. The reason I thought usb-serial was
> > unusable in this instance was that I couldn't see a way to create a port
> > except via usb-serial's own probe function (otherwise, the API looked
> > fine).
> > 
> > I don't know whether I'm looking at a serial or an I2C interface until
> > after it's already been probed by HID core, I have a struct hid_device
> > and I've asked what type of interface it is via an HID feature report.
> > This can't be determined otherwise, because strapping pins affect the
> > presentation of interfaces.
> > 
> > At that point, I (currently) call uart_add_one_port. I might have missed
> > it, but I didn't see anything analogous in the usb-serial API. Am I
> > going about this the wrong way?
> 
> I thought that this could be done, but I might be wrong.  Johan, any
> ideas?

It seems to me like this should be implemented as a new tty driver as
neither USB-serial or serial (core) is a good fit for such a HID device.

So this appears to be right approach in general:

	https://lore.kernel.org/all/20221207220617.116082-1-contact@christina-quast.de/

Johan
