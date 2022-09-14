Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 289D65B8AEB
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Sep 2022 16:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbiINOpw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Sep 2022 10:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbiINOpq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Sep 2022 10:45:46 -0400
X-Greylist: delayed 1429 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 14 Sep 2022 07:45:44 PDT
Received: from gateway33.websitewelcome.com (gateway33.websitewelcome.com [192.185.146.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D40286DA
        for <linux-i2c@vger.kernel.org>; Wed, 14 Sep 2022 07:45:44 -0700 (PDT)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway33.websitewelcome.com (Postfix) with ESMTP id 4816733990
        for <linux-i2c@vger.kernel.org>; Wed, 14 Sep 2022 09:21:55 -0500 (CDT)
Received: from 162-215-252-169.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id YTH0ofhxj3RgQYTH1o0d9S; Wed, 14 Sep 2022 09:21:55 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=rUdLFHX1mYAXkQlt7ztJE1RiYb3g0U1jBXFOBL0FRDA=; b=ooTvrjtNA5VYXh45ZTEW6RUY/g
        iix7zlnKlPpCfmkRZwtr5UnPX1mrUvM2DklkS+TUa91AGRj5xJD0D54C8DidiuxyFJUKJVwritFRg
        mROlWPwD1xH+/L9BWADfPHD38Bg9UxW7mNtEYBnFZKTTAjLYmUNJ1kOiqiKec2BApqAJ/O67p4cdH
        tWHk6gTCYCPOEG/lr4HMR/Ug/Rb99R6pTga82nS1VZfVZLd46eVVdf5OUzTz4jxuEjfZmV/g6iZTS
        l9EJEVQuwrP0EcLl4/OTCXxWqTGRGlpbdKwz38izSDURj7+NhS/kxqphukJ6at3ZeasS+T3klPyDL
        TpmgllVQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54310 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <linux@roeck-us.net>)
        id 1oYTH0-002OkX-6z;
        Wed, 14 Sep 2022 14:21:54 +0000
Date:   Wed, 14 Sep 2022 07:21:50 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Adam Honse <calcprogrammer1@gmail.com>, linux-i2c@vger.kernel.org,
        Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v2] i2c: New driver for Nuvoton SMBus adapters
Message-ID: <20220914142150.GA4181124@roeck-us.net>
References: <20220907020651.2309354-1-calcprogrammer1@gmail.com>
 <20220914153424.63c957f4@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914153424.63c957f4@endymion.delvare>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1oYTH0-002OkX-6z
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:54310
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 14, 2022 at 03:34:24PM +0200, Jean Delvare wrote:
> Hi Adam,
> 
> On Wed,  7 Sep 2022 02:06:51 +0000, Adam Honse wrote:
> > This patch introduces a new driver for the SMBus adapter that is built in
> > to most Nuvoton Super-IO chips.  This SMBus adapter is used for RGB
> > lighting control on some ASUS motherboards with Intel chipsets.
> > 
> > The interface's register description is available in the supported
> > devices' datasheets.  Operation of this interface has been verified
> > with OpenRGB on an ASUS PRIME Z270-A motherboard.
> 
> Care to point me to one such datasheet?
> 
> The following errors are reported by ./scripts/checkpatch.pl (which I
> invite you to run before posting any patch):
> 
> RROR: "foo * bar" should be "foo *bar"
> #452: FILE: drivers/i2c/busses/i2c-nct6793.c:295:
> +static struct i2c_adapter * nct6793_add_adapter(unsigned short smba, const char *name)
> 
> ERROR: trailing whitespace
> #526: FILE: drivers/i2c/busses/i2c-nct6793.c:369:
> +^I^I$
> 
> ERROR: space required before the open parenthesis '('
> #527: FILE: drivers/i2c/busses/i2c-nct6793.c:370:
> +		if(IS_ERR(sio_data->adapter))
> 
> Please fix before resubmitting.
> 
> Also, would you consider declaring yourself the maintainer of this new
> driver? If so, please add a new entry in MAINTAINERS and add yourself
> there. You can use the "I2C/SMBUS ISMT DRIVER" entry as an example.
> 
> If not, no worry, I'll add the driver to my own list.
> 
> I see that there already seem to be a driver for the SMBus interface of
> Novoton Super-I/O chipsets:
> 
> drivers/hwmon/nct6775-i2c.c
> 
> However that driver seems to be fairly limited in capabilities (on
> purpose). I'm adding the author of this driver and the maintainer of the
> hwmon subsystem to Cc. How do the two drivers relate to each other? Are
> they for the same, or different interfaces? If different, we need to
> come up with names to designate them unambiguously. If the same, then
> I'm afraid both drivers will step on each other's toes?
> 

That driver connects to the I2C slave interface on Nuvoton chips.
The driver here implements support for its I2C master. The driver here
talks to the master interface on the chip through superio, and is
typically connected to the main processor on a system. The other driver
is an I2C slave driver. The slave interface on NCT chips is normally
connected to a BMC.

The i/o address by this driver uses a different base address register
than its hwmon platform driver (which also connects to the chip
through superio), so this driver should hopefully be able to
interoperate with that driver. It would be desirable to confirm that
the two drivers do not step on each other, though (especially since the
sio register page is the same).

Thanks,
Guenter
