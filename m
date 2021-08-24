Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B893F5765
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Aug 2021 06:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbhHXEt1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Aug 2021 00:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbhHXEt1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Aug 2021 00:49:27 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B445C061575
        for <linux-i2c@vger.kernel.org>; Mon, 23 Aug 2021 21:48:43 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1mIOMa-0007KN-0X; Tue, 24 Aug 2021 06:48:40 +0200
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1mIOMY-0002vE-R0; Tue, 24 Aug 2021 06:48:38 +0200
Date:   Tue, 24 Aug 2021 06:48:38 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Andrew Manley <andrew.manley@sealingtech.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "biwen.li@nxp.com" <biwen.li@nxp.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        Tim Harvey <tharvey@gateworks.com>,
        Embedded Controller <embedded-controller@sealingtech.com>
Subject: Re: I2C_SLAVE_STOP with i.MX 8M Mini I2C driver
Message-ID: <20210824044838.GA14337@pengutronix.de>
References: <MN2PR13MB4208E382DD4A2BE7A4D5A8DFE3FF9@MN2PR13MB4208.namprd13.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MN2PR13MB4208E382DD4A2BE7A4D5A8DFE3FF9@MN2PR13MB4208.namprd13.prod.outlook.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 06:16:43 up 187 days,  7:40, 72 users,  load average: 0.09, 0.08,
 0.09
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andrew,

On Thu, Aug 19, 2021 at 12:23:29PM +0000, Andrew Manley wrote:
> Dear maintainers,
> 
> I have an i.MX 8M Mini and I am running a 5.13 Linux kernel. I am attempting to send IPMI commands to a Supermicro server over I2C. However, I am not sure that the I2C_SLAVE_STOP​ event is triggering when it is supposed to or at least when I assumed it would trigger.
> 
> First, I instantiated an I2C slave backend with its own address. Then I crafted some IPMI messages following the specification, specifying that the server responds to the slave address that I used to create the backend. After that, I can write the bytes to the server as a master on the I2C bus with no problems. As part of the IPMI specification, the server responds to my request by becoming a master on the I2C bus and then writing the response back to us at the address specified.
> 
> At this point, the i2c-imx.c​ driver seems to handle all the slave events related to being written to and the backend driver receives all the bytes as they are being received. However, the backend driver doesn't appear to receive the I2C_SLAVE_STOP​ event when we are finished. This causes a problem as then there is no determinable way to know when the bytes have finished writing. After reading the documentation for the event https://www.kernel.org/doc/html/latest/i2c/slave-interface.html, I assumed it would be triggered after the master is finished writing to us. I also thought as part of the I2C specification that the master was required to send a STOP signal when it was finished. Is it possible that it isn't triggering but should?

From the i2c-imx driver point of view we, detect stop signal on this
path:
i2c_imx_slave_isr()
  if (status & I2SR_IAAS) { /* Addressed as a slave */
    ...
  } else if (!(ctl & I2CR_MTX)) { /* Receive mode */
    if (status & I2SR_IBB) { /* No STOP signal detected */
     ...
    } else { /* STOP signal is detected */

If IBB would change just after we have read it in the interrupt handler,
we would not be able to detect the STOP signal.

This is only my assumption. You will need to compare transfer on the BUS
(with logic analyzer) with kernel traces.

> I noticed that there is a patch ​05ae60bc24f765d0db6b7c6e5acabf22718b823d from December that is supposed to "Synthesize end of transaction events". Is it not possible to figure out when the transmission actually ends?

It depends on actual hardware implementation of the IBB bit. For
example, are we actually able to get IRQ for this bit or we need to poll
it? imx8mm documentation is not very clear about it.

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
