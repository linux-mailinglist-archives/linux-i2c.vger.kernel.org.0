Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95F69CC449
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2019 22:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388204AbfJDUjp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Oct 2019 16:39:45 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38997 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388107AbfJDUjp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Oct 2019 16:39:45 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iGUMQ-00047D-Kn; Fri, 04 Oct 2019 22:39:34 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1iGUMP-0000YC-L0; Fri, 04 Oct 2019 22:39:33 +0200
Date:   Fri, 4 Oct 2019 22:39:33 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Claudiu.Beznea@microchip.com
Cc:     kamel.bouhara@bootlin.com, wsa@the-dreams.de,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        Ludovic.Desroches@microchip.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 2/4] i2c: at91: implement i2c bus recovery
Message-ID: <20191004203933.tfhr6cwbsq2hxrov@pengutronix.de>
References: <20191002144658.7718-1-kamel.bouhara@bootlin.com>
 <20191002144658.7718-3-kamel.bouhara@bootlin.com>
 <08e99a4b-851e-0bee-4c5a-8578b42c283e@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08e99a4b-851e-0bee-4c5a-8578b42c283e@microchip.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Oct 04, 2019 at 09:35:23AM +0000, Claudiu.Beznea@microchip.com wrote:
> Hi Kamel,
> 
> On 02.10.2019 17:46, Kamel Bouhara wrote:
> > +static int at91_init_twi_recovery_info(struct platform_device *pdev,
> > +				       struct at91_twi_dev *dev)
> > +{
> > +	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
> > +
> > +	dev->pinctrl = devm_pinctrl_get(&pdev->dev);
> > +	if (!dev->pinctrl || IS_ERR(dev->pinctrl)) {
> 
> You may use IS_ERR_OR_NULL() here.

Can devm_pinctrl_get return NULL? From a quick look, it cannot.

rule of thumb: IS_ERR_OR_NULL is wrong as it is a sign of poor return
value semantics.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
