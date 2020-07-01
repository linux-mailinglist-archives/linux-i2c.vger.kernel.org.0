Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E5E210B13
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 14:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730271AbgGAMcP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 08:32:15 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:12084 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730199AbgGAMcO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jul 2020 08:32:14 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 061CLAA7017980;
        Wed, 1 Jul 2020 14:32:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=aRnUGJXPym2nTJ3OV7/xIAapMnyHBhNDTd8+zS4DKDE=;
 b=FYNsolw93kv6ju264IqCMwi2lvNOS2zA/ZNXIQmQFWv4otsvsVPs5ubqUFNgf8H7+Zeg
 z8M4T0Zf2kC3dwPJuA81RmLY2uooKV1Y6cvQ60Loi1j8VGo/DoTH/AS3V9YIeXcBR+Pb
 a1HtHO4QKpkE1B7SAZxRGf2HJ4tOdtuC0yKl50k44VRAoKWywZgMpGgeM0Uf1H0SS3cc
 59H9P8MCgIyQrCksFrdz9SCVckWtQURuXMuyGg6ZTl/bZffMQhkHPJkPU84ecz9Z0p1f
 YFpOYC54evXq0KCt9w99p03EEfKINeCIzG0O40CmLKXjlkvCRlojAeBCVA2/nn9Lz5Id JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31wu89tbnh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Jul 2020 14:32:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B470E10002A;
        Wed,  1 Jul 2020 14:32:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C7E072AFEF9;
        Wed,  1 Jul 2020 14:32:08 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Jul
 2020 14:32:08 +0200
Date:   Wed, 1 Jul 2020 14:32:07 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC PATCH] WIP: i2c: rcar: add HostNotify support
Message-ID: <20200701123207.GC3457@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20200701080904.11022-1-wsa+renesas@sang-engineering.com>
 <20200701092731.GD2261@ninjato>
 <20200701121633.GI2261@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200701121633.GI2261@ninjato>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-01_08:2020-07-01,2020-07-01 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 01, 2020 at 02:16:33PM +0200, Wolfram Sang wrote:
> 
> > BTW I think the DTS additions don't look too bad? It is a grey area,
> > though...
> > 
> >  &i2c3  {
> >         pinctrl-0 = <&i2c3_pins>;
> >         pinctrl-names = "i2c-pwr";
> > +
> > +       enable-host-notify;
> 
> I got another idea. What about a boolean binding "smbus"?
> 
> This describes the bus as SMBus (and not I2C bus), so the additional
> SMBus restrictions/requirements apply. HostNotify is required for SMBus,
> so address 0x08 can't be used. Alert is optional, but still it uses a
> reserved address. SMBus timeouts maybe can be handled through this as
> well (there is the HWMON specific "smbus-timeout-disable" so far).
> 
> So, we have one simple binding for HostNotify and Alert which really
> describes the HW.

I much prefer this solution than the usage of the smbus_alert irq value
(in case of the i2c-stm32f7). In that case, I'd only set smbus boolean
to enable both SMBus Host-Notify & SMBus Alert.
In case of a device having a dedicated irq for SMBus Alert, smbus_alert
irq binding would still be needed.

Just my 2 cents about another aspect regarding SMBus Alert, since alert
is coming from another pin and not the usual SCL / SCK, when SMBus Alert
has to be used, there is a very good chance to have a pinctrl entry which
is different from not using SMBus Alert.
Indeed, even if we need SMBus, but don't need SMBus Alert, the SMBus Alert
input pin might be used for something else.
But this of course doesn't prevent to use the smbus boolean binding.

> 


