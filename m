Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 676788D23B
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 13:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbfHNLdr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 07:33:47 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35169 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbfHNLdr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Aug 2019 07:33:47 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1hxrXF-00013H-3s; Wed, 14 Aug 2019 13:33:45 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hxrXE-0001HE-D6; Wed, 14 Aug 2019 13:33:44 +0200
Date:   Wed, 14 Aug 2019 13:33:44 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Chris Healy <cphealy@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] MAINTAINERS: i2c-imx: take over maintainership
Message-ID: <20190814113344.5j7zh37nm36rlagr@pengutronix.de>
References: <20190812050817.23279-1-o.rempel@pengutronix.de>
 <20190812064811.427cy7ahim54odkk@pengutronix.de>
 <20190814100224.GE1511@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190814100224.GE1511@ninjato>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 14, 2019 at 12:02:25PM +0200, Wolfram Sang wrote:
> 
> > Even without this patch the generic "ARM/FREESCALE IMX / MXC ARM
> > ARCHITECTURE" entry matches the i2c-imx driver.
> 
> It matches, but it didn't work well, I am afraid.

I didn't intend to imply it worked well. Just thought it was sensible to
point out that even with the newly added entry in MAINTAINERS the old
entry still matches.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
