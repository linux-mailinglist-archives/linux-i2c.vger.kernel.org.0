Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7630792636
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 18:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240471AbjIEQUD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 12:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354171AbjIEKEU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 06:04:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F1E198;
        Tue,  5 Sep 2023 03:04:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E6B0FB81104;
        Tue,  5 Sep 2023 10:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134C4C433C8;
        Tue,  5 Sep 2023 10:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1693908253;
        bh=cQTnkMhDRy5JwEJ7hQwW45cTKaEjXmpkptxk9UnTN9c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gX2uxS5VVjeEKiCCpQxqG55A1d6tr08FU879bG5+NXYZLFyFaMPppX3z5yy4yLqod
         dNwYiKnW4TFGr/ImkTHkmpe/bve7rwiugwIiFQfqwrKvi/9HkBUuW6mmPCH3GfZ6Tf
         q5pVNKTsBUkwS9aQg+3O3Ii2W/CsulKJysn/CMDM=
Date:   Tue, 5 Sep 2023 11:04:10 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     "Wu, Wentong" <wentong.wu@intel.com>
Cc:     Oliver Neukum <oneukum@suse.com>, "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
        "lee@kernel.org" <lee@kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "kfting@nuvoton.com" <kfting@nuvoton.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "maz@kernel.org" <maz@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: Re: [PATCH v14 1/4] usb: Add support for Intel LJCA device
Message-ID: <2023090530-cleft-chivalry-b59f@gregkh>
References: <1693806261-12958-1-git-send-email-wentong.wu@intel.com>
 <1693806261-12958-2-git-send-email-wentong.wu@intel.com>
 <a8c8af1b-9399-6ca9-ea3d-b71e6ee68cad@suse.com>
 <DM6PR11MB43166D27FB15905CB02DBC5B8DE9A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <7755c3ee-9d7e-8ae5-1cf7-a5247cc4e6e5@suse.com>
 <DM6PR11MB4316C70D7C14B56ED349F01F8DE8A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <f6f8a9c4-faf1-f9da-e688-a29eb267fabc@suse.com>
 <DM6PR11MB4316F903C524668BA35707398DE8A@DM6PR11MB4316.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4316F903C524668BA35707398DE8A@DM6PR11MB4316.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 05, 2023 at 08:53:43AM +0000, Wu, Wentong wrote:
> > From: Oliver Neukum <oneukum@suse.com>
> > 
> > On 05.09.23 04:20, Wu, Wentong wrote:
> > 
> > Hi,
> > 
> > >> That is that you will hang arbitrarily long in disconnect?
> > > This routine isn't called in an interrupt context, and it allows sleep
> > > or wait something before the real shutdown like many drivers' remove()
> > > or
> > > disconnect() do.
> > 
> > It is, however, in the context of a kernel thread. We can wait, but not for
> > arbitrary periods.
> 
> AFAIK, this is very common.
> 
> > 
> > > If we want to speed up the disconnect(), below changes is to complete
> > > the cmd_completion if usb_kill_urb() has been called, but there is
> > > still possibility ljca client init one more transfer before
> > > auxiliary_device_delete()
> > >
> > > @@ -206,7 +206,11 @@ static void ljca_recv(struct urb *urb)
> > >
> > >          if (urb->status) {
> > >                  /* sync/async unlink faults aren't errors */
> > > -               if (urb->status == -ENOENT || urb->status == -ECONNRESET ||
> > > +               if (urb->status == -ENOENT) {
> > > +                       complete(&adap->cmd_completion);
> > > +                       return;
> > 
> > I'd say you'd break suspend() by such a change.
> > You cannot complete in the interrupt handler, unless you can determine why the
> > URB is killed.
> 
> With below status field in ljca_adapter to determine if it's killed by disconnect().
> 
> If this is preferred, I could cook the patch for review.
> 
> If this is fixed, could you please help merge this usb-ljca driver so that it won't
> block others which depends on this driver?

Please relax, we can't do anything until after -rc1 is out, and for me,
that includes reviewing the code.

There is no rush, or deadline, here at all.  It will be merged when it
is acceptable.

thanks,

greg k-h
