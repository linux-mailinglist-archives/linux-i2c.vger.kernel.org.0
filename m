Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF812798DA
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Sep 2020 14:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729184AbgIZMiL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Sep 2020 08:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZMiL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 26 Sep 2020 08:38:11 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B93A9C0613CE
        for <linux-i2c@vger.kernel.org>; Sat, 26 Sep 2020 05:38:10 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id s13so1900165wmh.4
        for <linux-i2c@vger.kernel.org>; Sat, 26 Sep 2020 05:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KgtSP4Z0Xfoyw35f8b4GCJtY2P8zQp4wm4duPeWlJEE=;
        b=KXT3nFO4jXPd36V69sEnZk30UmLvBREHwVHlB3TH+3wpmKUpFw8DeLo8BVOSG6peNg
         3IoDcQztcjZpLwxg3/eESwtkxT6MCkL/6V49hFP3cc9wkuFVVRORRJoMYhtMr+iPIgq6
         bZ6HYgCk9hRwj5MAPMnCuvEOf4vY5hm/qiSJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KgtSP4Z0Xfoyw35f8b4GCJtY2P8zQp4wm4duPeWlJEE=;
        b=UK/yffLZB7xhoSxfM7Jzgo8S28sHNsjaOnZ1mn2kjxUjRqtT/avPYR2OlLvrbaJN7s
         sC4E1oCO/F1y5SBLQWtJIE1Oa7LmkYAILK8du7lJNhf7wdQwxb61y7lZe+Le1NN1/5ad
         /ZrT23ato0hopmXA8+G7Kucwg4t09Xw30DA0p5Ua/6y/tBC0Am53BmWJ6IwYM1erWjVy
         qONQLJsFq7YtlRoIiKJ11gIed/3QoRYHUJMbah0CyuRwX7QxggD11tz4QsyUVRtr7GSZ
         8OeoLskuG4WbU6NuBOAVq4JMMVOi0K4geQLMDFPgGuW3jny6LAVeFQUXhmnfhCXfLfj7
         eTvw==
X-Gm-Message-State: AOAM530+g3l2QDCGd/ZmUFhvniUs5lUmgwW/o8wxAHqtv7kGPsrz0fzh
        XV8z0fjl4+E2NxSZuQNOsop1FQ==
X-Google-Smtp-Source: ABdhPJxfP9extoAxtlybvJJwCF9PVl9y3ORezxLb44zE3bhNs0VshCxTn1vNch8Ls37UAGI8aRftCQ==
X-Received: by 2002:a1c:9c4b:: with SMTP id f72mr2469221wme.188.1601123889345;
        Sat, 26 Sep 2020 05:38:09 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id g8sm2460919wmd.12.2020.09.26.05.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:38:08 -0700 (PDT)
Date:   Sat, 26 Sep 2020 12:38:07 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v8 0/6] Support running driver's probe for a device
 powered off
Message-ID: <20200926123807.GA3781977@chromium.org>
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
 <f4b82baa-66b7-464e-fd39-66d2243a05ef@lucaceresoli.net>
 <20200911130104.GF26842@paasikivi.fi.intel.com>
 <6dea1206-cfaa-bfc5-d57e-4dcddadc03c7@lucaceresoli.net>
 <20200914094727.GM26842@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200914094727.GM26842@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 14, 2020 at 12:47:27PM +0300, Sakari Ailus wrote:
> Hi Luca,
> 
> On Mon, Sep 14, 2020 at 09:58:24AM +0200, Luca Ceresoli wrote:
> > Hi Sakari,
> > 
> > On 11/09/20 15:01, Sakari Ailus wrote:
> > > Hi Luca,
> > > 
> > > On Fri, Sep 11, 2020 at 02:49:26PM +0200, Luca Ceresoli wrote:
> > >> Hi Sakari,
> > >>
> > >> On 03/09/20 10:15, Sakari Ailus wrote:
> > >>>
> > >>> Hi all,
> > >>>
> > >>> These patches enable calling (and finishing) a driver's probe function
> > >>> without powering on the respective device on busses where the practice is
> > >>> to power on the device for probe. While it generally is a driver's job to
> > >>> check the that the device is there, there are cases where it might be
> > >>> undesirable. (In this case it stems from a combination of hardware design
> > >>> and user expectations; see below.) The downside with this change is that
> > >>> if there is something wrong with the device, it will only be found at the
> > >>> time the device is used. In this case (the camera sensors + EEPROM in a
> > >>> sensor) I don't see any tangible harm from that though.
> > >>>
> > >>> An indication both from the driver and the firmware is required to allow
> > >>> the device's power state to remain off during probe (see the first patch).
> > >>>
> > >>>
> > >>> The use case is such that there is a privacy LED next to an integrated
> > >>> user-facing laptop camera, and this LED is there to signal the user that
> > >>> the camera is recording a video or capturing images. That LED also happens
> > >>> to be wired to one of the power supplies of the camera, so whenever you
> > >>> power on the camera, the LED will be lit, whether images are captured from
> > >>> the camera --- or not. There's no way to implement this differently
> > >>> without additional software control (allowing of which is itself a
> > >>> hardware design decision) on most CSI-2-connected camera sensors as they
> > >>> simply have no pin to signal the camera streaming state.
> > >>>
> > >>> This is also what happens during driver probe: the camera will be powered
> > >>> on by the I²C subsystem calling dev_pm_domain_attach() and the device is
> > >>> already powered on when the driver's own probe function is called. To the
> > >>> user this visible during the boot process as a blink of the privacy LED,
> > >>> suggesting that the camera is recording without the user having used an
> > >>> application to do that. From the end user's point of view the behaviour is
> > >>> not expected and for someone unfamiliar with internal workings of a
> > >>> computer surely seems quite suspicious --- even if images are not being
> > >>> actually captured.
> > >>>
> > >>> I've tested these on linux-next master. They also apply to Wolfram's
> > >>> i2c/for-next branch, there's a patch that affects the I²C core changes
> > >>> here (see below). The patches apart from that apply to Bartosz's
> > >>> at24/for-next as well as Mauro's linux-media master branch.
> > >>
> > >> Apologies for having joined this discussion this late.
> > > 
> > > No worries. But thanks for the comments.
> > > 
> > >>
> > >> This patchset seems a good base to cover a different use case, where I
> > >> also cannot access the physical device at probe time.
> > >>
> > >> I'm going to try these patches, but in my case there are a few
> > >> differences that need a better understanding.
> > >>
> > >> First, I'm using device tree, not ACPI. In addition to adding OF support
> > >> similar to the work you've done for ACPI, I think instead of
> > >> acpi_dev_state_low_power() we should have a function that works for both
> > >> ACPI and DT.
> > > 
> > > acpi_dev_state_low_power() is really ACPI specific: it does tell the ACPI
> > > power state of the device during probe or remove. It is not needed on DT
> > > since the power state of the device is controlled directly by the driver.
> > > On I²C ACPI devices, it's the framework that powers them on for probe.
> > 
> > I see, thanks for clarifying. I'm not used to ACPI so I didn't get that.
> > 
> > > You could have a helper function on DT to tell a driver what to do in
> > > probe, but the functionality in that case is unrelated.
> > 
> > So in case of DT we might think of a function that just tells whether
> > the device is marked to allow low-power probe, but it's just an info
> > from DT:
> > 
> > int mydriver_probe(struct i2c_client *client)
> > {
> > 	...
> > 	low_power = of_dev_state_low_power(&client->dev);
> > 	if (!low_power) {
> > 		mydriver_initialize(); /* power+clocks, write regs */
> >  	}
> > 	...
> > }
> > 
> > ...and, if (low_power), call mydriver_initialize() at first usage.
> > 
> > I'm wondering whether this might make sense in mainline.
> 
> Quite possibly, if there are drivers that would need it.
> 
> The function should probably be called differently though as what it does
> is quite different after all.
> 
> Unless... we did the following:
> 
> - Redefine the I²C driver flag added by this patchset into what tells the
>   I²C framework whether the driver does its own power management
>   independently of the I²C framework. It could be called e.g.
>   I2C_DRV_FL_FULL_PM, to indicate the driver is responsible for all power
>   management of the device, and the I²C framework would not power on the
>   device for probe or remove.
> 
> - Add a firmware function to tell whether the device identification should
>   take place during probe or not. For this is what we're really doing here
>   from driver's point of view: lazy device probing.
> 
> There are no dependencies between the two but they can be used together to
> implement the same functionality as this patchset currently does. This way
> also the differences between driver implementations for ACPI and DT can be
> reduced as the logic is the same.
> 
> Further on, with this approach, if other busses happen to need this
> functionality in the future, it would be straightforward to add support ---
> it only takes to query whether it's indicated by the DT or ACPI property.
> 
> Thoughts, opinions?

I think we might be overly complicating things. IMHO the series as is
with the "i2c_" prefix removed from the flags introduced would be
reusable as is for any other subsystem that needs it. Of course, for
now, the handling of the flag would remain implemented only in the I2C
subsystem.

Best regards,
Tomasz
