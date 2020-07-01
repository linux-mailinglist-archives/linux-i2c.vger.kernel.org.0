Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E290221062E
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 10:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728581AbgGAIaj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 04:30:39 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:40414 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726715AbgGAIai (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jul 2020 04:30:38 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0618Q4om008746;
        Wed, 1 Jul 2020 10:30:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=lccEOlxQxFzw45KRX2pXiooxr5LjxjijYmCVHK/nHhc=;
 b=j9C4Y8qewcW0RvlBMpgp8uYf3mKksokwI02DLEa/z07xRr0dAlaYQic4maoSN6Dilf6k
 /jImCsYPTMT33XHs/S8R/5oioZ8mLycSMmZm1i28Nz94BFJh2grXJX/BIt61ILmyzSOI
 zQpjKdLhCGjhkA3loewbs/F78hVli9aVVi7BEdQljFjkZlBZZYfN5WBg5MV0zh2CjQxy
 pp2w32ZSgdi+BLy5wBJdtnOUvzo7FslrgXkanQGQRkqbl3cuZu/BId3VFa7YBrtXsy9e
 evk0W8kUyJ8ImlXVpywCUcbNncyQ9C1mm3aPWnN+mzovbtnGGopEuHBCvM5tiTzfpqvQ nA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31wuk1ghsf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Jul 2020 10:30:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2948F10002A;
        Wed,  1 Jul 2020 10:30:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3C882A6D17;
        Wed,  1 Jul 2020 10:30:32 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Jul
 2020 10:30:32 +0200
Date:   Wed, 1 Jul 2020 10:30:24 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH RFC 0/1] i2c: add slave testunit driver
Message-ID: <20200701083024.GA3457@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20200629185318.23381-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200629185318.23381-1-wsa+renesas@sang-engineering.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-01_04:2020-07-01,2020-07-01 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Mon, Jun 29, 2020 at 06:53:17PM +0000, Wolfram Sang wrote:
> Motivated by a series by Alain Volmat which implements SMBus Host Notify
> support as a slave backend[1], I wondered how I could actually test it.
> Then, I picked up my old idea of a "custom remote device" and
> implemented it as another slave backend. This is the first draft and it
> works quite well on my Renesas Lager board where I connected two I2C
> busses where both I2C controllers are master and slave. One slave is the
> testunit, one slave is the HostNotify listener.
> 
> While I really like Alain's approach, there is still some more testing
> needed. So, I already release my testing environment, maybe other people
> are interested, too. This patch depends on a documentation update. Also,
> for Renesas R-Car SoCs, some fixes are needed. I suggest you simply pull
> this branch here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/slave-testunit
> 
> As mentioned elsewhere, support for SMBus Alert and I2C_M_RECV_LEN are
> already planned. But I guess you can do much more.
> 
> Ideas and comments welcome!

Very good idea to use a slave to send the Host-Notify command to the host
for testing. Later on, for SMBus-Alert, a GPIO can be used to loop it back
to the tested master to verify that SMBus-Alert is working fine.

What you implemented is the "remote" side which I understood is meant to
replace a "real" device for those features which are not that common.
Shouldn't we also have the "master" side loopback test driver as well to
work with this test slave driver ?
For example for the Host-Notify that master side loopback test driver would
perform the request_irq allowing it to be called back when the slave test
driver sends the host-notify command.
In case of SMBus-Alert, that would be implementing the .alert function that
would be called when the SMBus-Alert is received ..

With that the whole loop can be automatically tested. This kind of stuff
can of course be enhanced to a LOT of cases .... basically something similar
to spi-loopback driver for example except that in case of i2c it needs 2
I2C controllers instead of one for the SPI.

> 
> Happy hacking,
> 
>    Wolfram
> 
> [1] http://patchwork.ozlabs.org/project/linux-i2c/list/?series=185718&state=*
> 
> Wolfram Sang (1):
>   i2c: add slave testunit driver
> 
>  Documentation/i2c/slave-testunit-backend.rst |  48 ++++++
>  drivers/i2c/Kconfig                          |   8 +
>  drivers/i2c/Makefile                         |   1 +
>  drivers/i2c/i2c-slave-testunit.c             | 146 +++++++++++++++++++
>  4 files changed, 203 insertions(+)
>  create mode 100644 Documentation/i2c/slave-testunit-backend.rst
>  create mode 100644 drivers/i2c/i2c-slave-testunit.c
> 
> -- 
> 2.20.1
> 
