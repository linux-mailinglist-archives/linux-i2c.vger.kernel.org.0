Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05E9D9C9BF
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2019 09:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729684AbfHZHAQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Aug 2019 03:00:16 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:39759 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729437AbfHZHAQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Aug 2019 03:00:16 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1i28z8-0006xP-TA; Mon, 26 Aug 2019 09:00:14 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1i28z8-00063b-If; Mon, 26 Aug 2019 09:00:14 +0200
Date:   Mon, 26 Aug 2019 09:00:14 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: i2c testing
Message-ID: <20190826070014.gwb2uaxtxt7lm227@pengutronix.de>
References: <45126965-fb48-d5a1-d3c7-9bedb6a23d9c@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45126965-fb48-d5a1-d3c7-9bedb6a23d9c@pengutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Oleksij,

On Mon, Aug 26, 2019 at 07:58:22AM +0200, Oleksij Rempel wrote:
> can you recommend some thing for i2c-imx regression testing? I assume some
> i2c storage devices should be good enough. At least, it is possible to test
> data integrity.
> 
> Any other ideas?

you could use two Linux machines, one acting master one acting client.
Maybe there is even an adapter that can do both at the same time; or a
machine with two adapters that you can just interconnect :-)

Best regards from Freiburg
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
