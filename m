Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014F6210DDC
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 16:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731431AbgGAOho (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 10:37:44 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:15358 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730264AbgGAOho (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jul 2020 10:37:44 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 061EY0Zq007519;
        Wed, 1 Jul 2020 16:37:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=nqTwUSGOOkfcdg53xwgRfiAKleLNUlDtBuTLOSVoR+g=;
 b=S2U/oXLRa2DTJ2elHQQwScNIzjUCdKD6DpdSOx8sB905hkr0Btwc3xk6Lm6weZugUXF+
 n31zU3fTwW59Gyz7J5+ft41MBoQ2I3zjQ4KHosUyzegHoaMexUToJzugHaGWU2fvn8Mg
 7tlGt1EHAN8UsFhUfNejUVGbON7fUms/Vcu/g9GTFu2BAuxkyTBWq9Co2kOhC871aeQM
 MJBecR0ezA4z68oZWmhCGRJLQhDnHTr3ra6t4xBsr3KL3FowfDb8GAZBz3F9wqYJ5rj9
 DPD4J5AXld34Ziu/2cKZA8Bjf8/EQvEQX+F98cf5PwxM9AjX4JjQgvFxG2dlVmpaUBvL bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31wuk1jq2n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Jul 2020 16:37:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 01A4410002A;
        Wed,  1 Jul 2020 16:37:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EB7B52BC7C0;
        Wed,  1 Jul 2020 16:37:39 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.45) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Jul
 2020 16:37:39 +0200
Date:   Wed, 1 Jul 2020 16:37:38 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC PATCH] WIP: i2c: rcar: add HostNotify support
Message-ID: <20200701143738.GF3457@gnbcxd0016.gnb.st.com>
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
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE2.st.com
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

Hum ... sorry ... I'm having some doubt about such a generic 'smbus' naming.
I mean, stating 'smbus' within the controller node kind of says
"I am working in SMBus mode", and not only "I am supporting Host-Notify & Alert".
In such case, NOT having 'smbus' would mean that the driver do not support
SMBUS and SMBus xfer and all smbus related stuff would get disabled ...
We for sure do not want to have everybody add a smbus property in their DT
if they support SMBus xfer for example.

This is probably too wide, don't you think ?

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
> 


