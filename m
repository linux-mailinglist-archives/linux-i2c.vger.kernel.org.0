Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 951557CAD31
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Oct 2023 17:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233606AbjJPPTW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Oct 2023 11:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbjJPPTW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Oct 2023 11:19:22 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C0B3AB;
        Mon, 16 Oct 2023 08:19:19 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEDEC433C7;
        Mon, 16 Oct 2023 15:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1697469559;
        bh=IUlcckn2HIZvQSPS1Pli5AoJlsFWzcK+s4pdEgsn3uA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IZxB+S+5f7TG2qX+o3J/cEJG0d4Mm5M/FeuKYss2zs0UgFfcz/wJaTx4+uNG3Djyf
         5fGUnNNij/cz1JMpbR9gRBF0cOwhBWm3s4vmzOlp/EUQkA+JdogYu+8OxgmeIj4Myx
         PVNaWxTBU9KNC84846XlsI2shQg3JBG73yeWwBXE=
Date:   Mon, 16 Oct 2023 17:19:13 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     "Wu, Wentong" <wentong.wu@intel.com>
Cc:     "Shevchenko, Andriy" <andriy.shevchenko@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v20 1/4] usb: Add support for Intel LJCA device
Message-ID: <2023101653-shiftless-scorebook-19e3@gregkh>
References: <1696833205-16716-2-git-send-email-wentong.wu@intel.com>
 <ZSZ3IPgLk7uC5UGI@smile.fi.intel.com>
 <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
 <DM6PR11MB4316BE44F53E276384FF06C88DCCA@DM6PR11MB4316.namprd11.prod.outlook.com>
 <5d2e9eba-a941-ea9a-161a-5b97d09d5d35@redhat.com>
 <ZSmjEKfYzFuAHXW+@smile.fi.intel.com>
 <9a080d06-586d-686f-997e-674cb8d16099@redhat.com>
 <DM6PR11MB43169A9ADDA7681DB7D9347C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <ZSzogNhlX9njvOIU@smile.fi.intel.com>
 <DM6PR11MB4316382324D15985A70E531C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4316382324D15985A70E531C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 16, 2023 at 03:05:09PM +0000, Wu, Wentong wrote:
> > From: Shevchenko, Andriy
> > On Mon, Oct 16, 2023 at 08:52:28AM +0300, Wu, Wentong wrote:
> > > > On 10/13/23 22:05, Shevchenko, Andriy wrote:
> > > > > On Thu, Oct 12, 2023 at 01:14:23PM +0200, Hans de Goede wrote:
> > 
> > <snip>
> > 
> > > > >> Ah ok, I see. So the code:
> > > > >>
> > > > >> 1. First tries to find the matching child acpi_device for the
> > > > >> auxdev by ADR
> > > > >>
> > > > >> 2. If 1. fails then falls back to HID + UID matching
> > > > >>
> > > > >> And there are DSDTs which use either:
> > > > >>
> > > > >> 1. Only use _ADR to identify which child device is which, like the example
> > > > >>    DSDT snippet from the commit msg.
> > > > >>
> > > > >> 2. Only use _HID + _UID like the 2 example DSDT snippets from me
> > > > >> email
> > > > >>
> > > > >> But there never is a case where both _ADR and _HID are used at
> > > > >> the same time (which would be an ACPI spec violation as Andy said).
> > > > >>
> > > > >> So AFAICT there is no issue here since  _ADR and _HID are never
> > > > >> user at the same time and the commit message correctly describes
> > > > >> scenario 1. from above, so the commit message is fine too.
> > > > >>
> > > > >> So I believe that we can continue with this patch series in its
> > > > >> current v20 form, which has already been staged for going into
> > > > >> -next by Greg.
> > > > >>
> > > > >> Andy can you confirm that moving ahead with the current version
> > > > >> is ok ?
> > > > >
> > > > > Yes as we have a few weeks to fix corner cases.
> > > > >
> > > > > What I'm worrying is that opening door for _ADR that seems never
> > > > > used is kinda an overkill here (resolving non-existing problem).
> > > >
> > > > I assume that there actually some DSDTs using the _ADR approach and
> > > > that this support is not there just for fun.
> > >
> > > right, it's not for fun, we use _ADR here is to reduce the maintain
> > > effort because currently it defines _HID for every new platform and
> > > the drivers have to be updated accordingly, while _ADR doesn't have that
> > problem.
> > 
> > But this does not confirm if you have such devices. Moreover, My question
> > about _CID per function stays the same. Why firmware is not using it?
> 
> Yes, both _ADR and _CID can stop growing list in the driver. And for _ADR, it also
> only require one ID per function. I don't know why BIOS team doesn't select _CID,
> but I have suggested use _ADR internally, and , to make things moving forward,
> the driver adds support for _ADR here first. 
> 
> But you're right, _CID is another solution as well, we will discuss it with firmware
> team more.

Should I revert this series now until this gets sorted out?

thanks,

greg k-h
