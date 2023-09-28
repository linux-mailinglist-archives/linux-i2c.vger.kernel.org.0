Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 039647B1C28
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 14:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbjI1MY5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 08:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbjI1MY4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 08:24:56 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56BA2180;
        Thu, 28 Sep 2023 05:24:55 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA6BC433C8;
        Thu, 28 Sep 2023 12:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1695903895;
        bh=VdQJXoutEQpOtTd+m9BGJ50ShPHnlgq7hEcgGVkkVJw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KsF+2Dk90ZaJcFShmmixw3CC1NX18AJeE26vsX6jUAdO2xNppEUBABp2KAp9aJ9Ml
         Vj1Y7PoT4ODACUjSakeLq1zVMkhUWZOS212vKElbqhEaERGixaIlwgMqoIWbW4iR2P
         Be4E8CDjKdXwzaNuWxoiv4oktIieFqmVbxdwPGSc=
Date:   Thu, 28 Sep 2023 14:24:13 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Wentong Wu <wentong.wu@intel.com>, arnd@arndb.de,
        mka@chromium.org, lee@kernel.org, wsa@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        maz@kernel.org, brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
        srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
Subject: Re: [PATCH v19 0/4] Add Intel LJCA device driver
Message-ID: <2023092850-alumni-flanking-77d6@gregkh>
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <2023091704-nape-coconut-af6c@gregkh>
 <f576c346-db6c-dded-1502-c87d5e58fa39@redhat.com>
 <95ce1e2f-eb60-46fc-bced-06b8a150cbfb@suse.com>
 <1e7c1c28-5bbe-49b5-f5ff-8cc84039f34f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e7c1c28-5bbe-49b5-f5ff-8cc84039f34f@redhat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 28, 2023 at 02:20:04PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 9/28/23 12:18, Oliver Neukum wrote:
> > On 17.09.23 13:26, Hans de Goede wrote:
> >  
> >> Note I did not ask for a new version to be send right away, but
> >> I'm afraid there has been a bit of miscommunication and instead
> >> of rebasing the next version based on further review Wentong has
> >> send out a new rebased version immediately, sorry about that.
> > 
> > Hi,
> > 
> > what to do now? It's been ten days.
> > I am sure this driver has been very thoroughly reviewed by now.
> > We are dragging this out. Do we want the developer to do another release
> > or do we ask Greg to take it as is?
> > This is becoming almost comical, but that is not what we want driver
> > submission to be.
> > 
> > As far as I am concerned on the USB side everything is fine now.
> > Hans? Greg?
> 
> Note I have been mostly involved in testing these patches I have
> *not* thoroughly reviewed them. I have taken a quick(ish) look
> which did not find anything obviously wrong.
> 
> I agree that at least patch 1/4 is ready for merging. I'm
> not sure if Greg should pick-up the entire series or if
> the rest should be merged through there relevant subsystems
> to also give the relevant subsys maintainer tree.
> 
> For the series:
> 
> Acked-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com>

Ok, I'll take a look at these again next week when I return home and
catch up on my pending patch review queue.

thanks for the review!

greg k-h
