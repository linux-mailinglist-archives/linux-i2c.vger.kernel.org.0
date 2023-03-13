Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05CBB6B71E6
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 10:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjCMJB7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Mar 2023 05:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjCMJBl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Mar 2023 05:01:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3126F5F226;
        Mon, 13 Mar 2023 01:57:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A13A6B80E63;
        Mon, 13 Mar 2023 08:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9392C433EF;
        Mon, 13 Mar 2023 08:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678697864;
        bh=bAgSafl+YS0IHZeCPHn+gGobAbOyUjtbi8a+ReztEEQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KPewxC17XfHmWrbxIvL0bK7PRx0+7nsnfopEfNb4yBVp0t+clPkB/ysY0Q46E32SY
         P+s7O4M8r3GcWeHd+LlRR7x/OvG30oB0AYVzsdkKRfe/R/QfMw/TZzhg3MZVCK9jqu
         PxIvLGa656ps93FGxYsWfO2bS5cj9wEek2Fq4GXI=
Date:   Mon, 13 Mar 2023 09:57:41 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
Cc:     "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "garnermic@fb.com" <garnermic@fb.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Samuel Holland <samuel@sholland.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 3/3] misc: Add meta cld driver
Message-ID: <ZA7lhcfxzhS5Waz/@kroah.com>
References: <20230117094425.19004-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230117094425.19004-4-Delphine_CC_Chiu@Wiwynn.com>
 <Y8Z1JxsLA6UKi805@kroah.com>
 <TY2PR04MB40321968150DC2E6FC2F307683B99@TY2PR04MB4032.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY2PR04MB40321968150DC2E6FC2F307683B99@TY2PR04MB4032.apcprd04.prod.outlook.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 13, 2023 at 08:47:45AM +0000, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
> Hi Greg,
> 
> Thanks for your comment!
> 
> > -----Original Message-----
> > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Sent: Tuesday, January 17, 2023 6:15 PM
> > To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
> > Cc: patrick@stwcx.xyz; Derek Kiernan <derek.kiernan@xilinx.com>; Dragan
> > Cvetic <dragan.cvetic@xilinx.com>; Arnd Bergmann <arnd@arndb.de>;
> > garnermic@fb.com; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> > <krzysztof.kozlowski+dt@linaro.org>; Stanislav Jakubek
> > <stano.jakubek@gmail.com>; Linus Walleij <linus.walleij@linaro.org>; Samuel
> > Holland <samuel@sholland.org>; linux-i2c@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v1 3/3] misc: Add meta cld driver
> > 
> >   Security Reminder: Please be aware that this email is sent by an external
> > sender.
> > 
> > On Tue, Jan 17, 2023 at 05:44:22PM +0800, Delphine CC Chiu wrote:
> > > Add support for meta control-logic-device driver. The CLD manages the
> > > server system power squence and other state such as host-power-state,
> > > uart-selection and presense-slots. The baseboard management controller
> > > (BMC) can access the CLD through I2C.
> > >
> > > The version 1 of CLD driver is supported. The registers number, name
> > > and mode of CLD can be defined in dts file for version 1. The driver
> > > exports the filesystem following the dts setting.
> > >
> > > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > > Tested-by: Bonnie Lo <Bonnie_Lo@Wiwynn.com>
> > > ---
> > >  MAINTAINERS                         |   6 +
> > >  drivers/misc/Kconfig                |   9 +
> > >  drivers/misc/Makefile               |   1 +
> > >  drivers/misc/control-logic-device.c | 443
> > > ++++++++++++++++++++++++++++
> > 
> > That is a very generic name for a very specific driver.  Please make it more
> > hardware-specific.
> 
> In server project, there is a component (control-logic-device). This component manages the server status including whole system power sequence, status and other devices presence status. And baseboard management controller (BMC) on server can acquire the information from CLD device through I2C.
> Currently, our customer plan to follow the spec to design the computing server. 
> We would like to change the naming from CLD to "compute CPLD".
> Do you have any suggestion?

Make it something hardware/vendor specific please.  As is, this is very
generic.  Remember, this is a name you will be using to refer to for the
next 20+ years.

> > Also, you add a bunch of undocumented sysfs files here, which require a
> > Documentation/ABI/ entries so that we can review the code to verify it does
> > what you all think it does.
> 
> We will add the document in Documentation/ABI/testing folder.
> 
> > 
> > And finally, why is this needed to be a kernel driver at all?  Why can't you
> > control this all through the userspace i2c api?
> 
> After discussing with our customer, they prefer the userspace access the physical device through driver not I2C API.
> There is an example on the OpenBMC Gerrit.
> https://gerrit.openbmc.org/c/openbmc/phosphor-buttons/+/60807

I do not understand, if functionalty can be done in userspace, it should
be done there, UNLESS you have a generic way of handling multiple
hardware devices as the same type (i.e. keyboard, sensor, etc.)  There
does not seem to be any generic interface here, so again, why can't you
just do it all in userspace?  What is forcing a kernel driver for this?

> > One review comment:
> > 
> > > +static int cld_remove(struct i2c_client *client) {
> > > +     struct device *dev = &client->dev;
> > > +     struct cld_client *cld = dev_get_drvdata(dev);
> > > +
> > > +     if (cld->task) {
> > > +             kthread_stop(cld->task);
> > > +             cld->task = NULL;
> > > +     }
> > > +
> > > +     devm_kfree(dev, cld);
> > 
> > Whenever you see this line in code, it's almost always a huge red flag that
> > someone is not using the devm_* api properly.  I think that is most certainly
> > the case here.
> 
> Do you mean the dev_free function is no need in this remove function?

Why do you think it is needed here?  If it is needed, please document it
with a comment explaining why this is required as it is not how the api
is designed to be used at all.

thanks,

greg k-h
