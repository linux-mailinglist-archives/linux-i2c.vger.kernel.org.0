Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6388210C98
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 15:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731032AbgGANq0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 09:46:26 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:28772 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729503AbgGANqZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jul 2020 09:46:25 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 061DYoHx019485;
        Wed, 1 Jul 2020 15:46:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=FJmGhKHomz9VRsQNoRhWK0YM3NrKvRqtHv8g2rvubOk=;
 b=pumgQNTW1GYjwqSd0hoo8H1KgkkaT+KMexTlEXTZy4pDkjObcRKJ+w9DokH6ahsf1l17
 tZy7VemcG5KIS8x1s2JwfMCDBGg7NcfsNzJeUito4Fb+ujvJteS05kItQ92NPtnMqN3Z
 Yh4392l5eZmTsddDBjFDfREPBcXZbujeKebrGoENkif/LtZSA8h5B6prz5AZ+ElruYb8
 kvbgDdAXDERrIs9z0W9iMzAptyM/DDA1JtFvEqJuNwQJWEsr5bnVsg4GnMzrNDmVRM4A
 09Skw6rjrI0HYsYOyBOtuZ/NKqny4zDXYg7dn0ICJJ8QBOt+PCubCBXXTiF+urhgIwMj Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31wuvwacj2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Jul 2020 15:46:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E22E110002A;
        Wed,  1 Jul 2020 15:46:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3B8B2B723B;
        Wed,  1 Jul 2020 15:46:20 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Jul
 2020 15:46:20 +0200
Date:   Wed, 1 Jul 2020 15:46:19 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC PATCH] WIP: i2c: rcar: add HostNotify support
Message-ID: <20200701134619.GD3457@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20200701080904.11022-1-wsa+renesas@sang-engineering.com>
 <20200701092731.GD2261@ninjato>
 <20200701121633.GI2261@ninjato>
 <20200701123207.GC3457@gnbcxd0016.gnb.st.com>
 <20200701132145.GJ2261@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200701132145.GJ2261@ninjato>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-01_08:2020-07-01,2020-07-01 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 01, 2020 at 03:21:45PM +0200, Wolfram Sang wrote:
> 
> > > I got another idea. What about a boolean binding "smbus"?
> ...
> > 
> > I much prefer this solution than the usage of the smbus_alert irq value
> > (in case of the i2c-stm32f7). In that case, I'd only set smbus boolean
> > to enable both SMBus Host-Notify & SMBus Alert.
> 
> Correct.
> 
> > In case of a device having a dedicated irq for SMBus Alert, smbus_alert
> > irq binding would still be needed.
> 
> Yes, that was my idea. Let's use "smbus".

Yes, good. I change the binding to this one then.

> 
> > Just my 2 cents about another aspect regarding SMBus Alert, since alert
> > is coming from another pin and not the usual SCL / SCK, when SMBus Alert
> > has to be used, there is a very good chance to have a pinctrl entry which
> > is different from not using SMBus Alert.
> > Indeed, even if we need SMBus, but don't need SMBus Alert, the SMBus Alert
> > input pin might be used for something else.
> > But this of course doesn't prevent to use the smbus boolean binding.
> 
> I am not sure if I fully get this point. Either we have a dedicated line
> (your case) or we need to use a GPIO as an interrupt line (my case). So,
> either this is configured correctly in DT and added as a "smbus_alert"
> irq. Or this irq is missing and then the driver will ignore SMBusAlert
> and the GPIO can be freely used/muxed. Or?

Well yes and no (for my case). I am NOT relying on GPIO for the SMBus Alert,
this is handled by the I2C controller itself via a dedicated input into the
controller. However, the pin itself can still be shared with other IPs,
depending on how the DT is configured. Just usual pinmux stuff. So I was
just mentioning that the pinctrl should also be correct to properly configure
the pinmuxing for that SMBus Alert input signal as well.
Sorry, this is just making the story more confusing for something which in
fact wasn't important in the first place probably. There is no real issue
here.

> 


