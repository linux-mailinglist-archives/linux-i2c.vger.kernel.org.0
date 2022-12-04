Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C061641C14
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Dec 2022 10:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbiLDJj3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Dec 2022 04:39:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbiLDJj2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Dec 2022 04:39:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF62DC9;
        Sun,  4 Dec 2022 01:39:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 738BD60DE7;
        Sun,  4 Dec 2022 09:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C322C433C1;
        Sun,  4 Dec 2022 09:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1670146765;
        bh=OMWtiiXAHzhURiIHOMIIE59/4R7Q/q1BV3MKZhL2osk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qcGF7b/OUwczNthFH5gBqe6NlbUhtecIvFmf9Efgbr+d7ubKx17PfJensK+hK0qNG
         k5qq5gh93g54EjD6hXtZy0MkfUArOG3+04RptTe+/c/eOEk5wG3fswv+e28AGf9dLf
         tlZunFFXCS6jL6AtAlws8K4f0rd8YAl83lZ0ZQMA=
Date:   Sun, 4 Dec 2022 10:39:21 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Daniel Beer <daniel.beer@igorinstitute.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Christina Quast <contact@christina-quast.de>,
        linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH] hid-ft260: add UART support.
Message-ID: <Y4xqyRERBdr8fT7F@kroah.com>
References: <638c51a2.170a0220.3af16.18f8@mx.google.com>
 <Y4xX7ILXMFHZtJkv@kroah.com>
 <20221204091247.GA11195@nyquist.nev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221204091247.GA11195@nyquist.nev>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Dec 04, 2022 at 10:12:47PM +1300, Daniel Beer wrote:
> On Sun, Dec 04, 2022 at 09:18:52AM +0100, Greg Kroah-Hartman wrote:
> > On Sat, Oct 22, 2022 at 11:19:20AM +1300, Daniel Beer wrote:
> > > Based on an earlier patch submitted by Christina Quast:
> > > 
> > >     https://patches.linaro.org/project/linux-serial/patch/20220928192421.11908-1-contact@christina-quast.de/
> > 
> > Please link to lore.kernel.org, we have no idea what will happen over
> > time to other domains/links.
> > 
> > > Simplified and reworked to use the UART API rather than the TTY layer
> > > directly. Transmit, receive and baud rate changes are supported.
> > 
> > Why use the uart layer?  Did you just change how the existing driver
> > works?
> 
> Hi Greg,
> 
> Thanks for reviewing. This device is quite strange -- it presents itself
> as a USB HID, but it provides both an I2C master and a UART. The
> existing driver supports only the I2C functionality currently.

Lots of devices are a "fake HID" device as other operating systems make
it easy to write userspace drivers that way.  Linux included.  What
userspace programs are going to want to interact with this device and
what api are they going to use?

> > > +struct ft260_configure_uart_request {
> > > +	u8 report;		/* FT260_SYSTEM_SETTINGS */
> > > +	u8 request;		/* FT260_SET_UART_CONFIG */
> > > +	u8 flow_ctrl;		/* 0: OFF, 1: RTS_CTS, 2: DTR_DSR */
> > > +				/* 3: XON_XOFF, 4: No flow ctrl */
> > > +	__le32 baudrate;	/* little endian, 9600 = 0x2580, 19200 = 0x4B00 */
> > 
> > The data structure in the device really looks like this?  Unaligned
> > accesses are odd.
> 
> Yes, that really is the data structure. Is there a better way to do
> this?

No, just checking, it's just a rough thing for processors to handle at
times, but if that's how the device is designed, nothing you can do
about it.

And as this is a structure that comes from the device, you should be
using __u8 and friends.

> > > --- a/include/uapi/linux/major.h
> > > +++ b/include/uapi/linux/major.h
> > > @@ -175,4 +175,6 @@
> > >  #define BLOCK_EXT_MAJOR		259
> > >  #define SCSI_OSD_MAJOR		260	/* open-osd's OSD scsi device */
> > >  
> > > +#define FT260_MAJOR		261
> > 
> > A whole new major for just a single tty port?  Please no, use dynamic
> > majors if you have to, or better yet, tie into the usb-serial
> > implementation (this is a USB device, right?) and then you don't have to
> > mess with this at all.
> 
> As far as I understand it, I don't think usb-serial is usable, due to
> the fact that this is already an HID driver.

That should not be a restriction at all.  You are adding a tty device to
this driver, no reason you can't interact with usb-serial instead.  That
way you share the correct userspace tty name and major/minor numbers and
all userspace tools should "just work" as they know that name and how to
interact with it already.

Try doing that instead of your own "raw" tty device please.

> > > +
> > >  #endif
> > > diff --git a/include/uapi/linux/serial_core.h b/include/uapi/linux/serial_core.h
> > > index 3ba34d8378bd..d9a7025f467e 100644
> > > --- a/include/uapi/linux/serial_core.h
> > > +++ b/include/uapi/linux/serial_core.h
> > > @@ -276,4 +276,7 @@
> > >  /* Sunplus UART */
> > >  #define PORT_SUNPLUS	123
> > >  
> > > +/* FT260 HID UART */
> > > +#define PORT_FT260	124
> > 
> > Why is this required?  What userspace code needs this new id?  I want to
> > remove all of these ids, not add new ones.
> 
> It probably isn't. I'd taken another driver as an example when
> implementing this, and that's what it did. Should I instead set the port
> field to PORT_UNKNOWN and return NULL from uart_type?

No, use the usb-serial api instead please.

thanks,

greg k-h
