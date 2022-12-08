Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B637D646C58
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Dec 2022 11:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbiLHKCo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 05:02:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiLHKCn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 05:02:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B9511475;
        Thu,  8 Dec 2022 02:02:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7B25AB821EB;
        Thu,  8 Dec 2022 10:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2286C433C1;
        Thu,  8 Dec 2022 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1670493759;
        bh=Gy+VgX0A4ENpBxacWi8qufdiwf6E1nyIHkyJFa2kRvo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S1zrO28RXl8xwIP2Ft5ugtlkCew3ye1WFfBtszRmbL9ok+4nuZfBVCEffyrccbCEa
         CDQwpA55KrzTDhJ0gfDlxtY51ZNsrZnorZVH31dEuPbCibcK7wCBNsbgLN9cJjdkJM
         DX3LYQnu40eskXmUlUk5F76TqjTU115nYx9nva1Y=
Date:   Thu, 8 Dec 2022 11:02:36 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>,
        Daniel Beer <daniel.beer@igorinstitute.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Christina Quast <contact@christina-quast.de>,
        linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH] hid-ft260: add UART support.
Message-ID: <Y5G2PBEprjPp3FKR@kroah.com>
References: <638c51a2.170a0220.3af16.18f8@mx.google.com>
 <Y4xX7ILXMFHZtJkv@kroah.com>
 <20221204091247.GA11195@nyquist.nev>
 <Y4xqyRERBdr8fT7F@kroah.com>
 <20221205012403.GA14904@nyquist.nev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205012403.GA14904@nyquist.nev>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 05, 2022 at 02:24:03PM +1300, Daniel Beer wrote:
> On Sun, Dec 04, 2022 at 10:39:21AM +0100, Greg Kroah-Hartman wrote:
> > > Thanks for reviewing. This device is quite strange -- it presents itself
> > > as a USB HID, but it provides both an I2C master and a UART. The
> > > existing driver supports only the I2C functionality currently.
> > 
> > Lots of devices are a "fake HID" device as other operating systems make
> > it easy to write userspace drivers that way.  Linux included.  What
> > userspace programs are going to want to interact with this device and
> > what api are they going to use?
> 
> Hi Greg,
> 
> The application I'm looking at uses it as a debug console, so personally
> I'd like to be able to use it with picocom and other terminal programs.
> 
> > > > > --- a/include/uapi/linux/major.h
> > > > > +++ b/include/uapi/linux/major.h
> > > > > @@ -175,4 +175,6 @@
> > > > >  #define BLOCK_EXT_MAJOR		259
> > > > >  #define SCSI_OSD_MAJOR		260	/* open-osd's OSD scsi device */
> > > > >  
> > > > > +#define FT260_MAJOR		261
> > > > 
> > > > A whole new major for just a single tty port?  Please no, use dynamic
> > > > majors if you have to, or better yet, tie into the usb-serial
> > > > implementation (this is a USB device, right?) and then you don't have to
> > > > mess with this at all.
> > > 
> > > As far as I understand it, I don't think usb-serial is usable, due to
> > > the fact that this is already an HID driver.
> > 
> > That should not be a restriction at all.  You are adding a tty device to
> > this driver, no reason you can't interact with usb-serial instead.  That
> > way you share the correct userspace tty name and major/minor numbers and
> > all userspace tools should "just work" as they know that name and how to
> > interact with it already.
> > 
> > Try doing that instead of your own "raw" tty device please.
> 
> Maybe I've misunderstood something. The reason I thought usb-serial was
> unusable in this instance was that I couldn't see a way to create a port
> except via usb-serial's own probe function (otherwise, the API looked
> fine).
> 
> I don't know whether I'm looking at a serial or an I2C interface until
> after it's already been probed by HID core, I have a struct hid_device
> and I've asked what type of interface it is via an HID feature report.
> This can't be determined otherwise, because strapping pins affect the
> presentation of interfaces.
> 
> At that point, I (currently) call uart_add_one_port. I might have missed
> it, but I didn't see anything analogous in the usb-serial API. Am I
> going about this the wrong way?

I thought that this could be done, but I might be wrong.  Johan, any
ideas?

thanks,

greg k-h
