Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A85DD10BA
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2019 16:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728804AbfJIOBt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Oct 2019 10:01:49 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:36921 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725879AbfJIOBt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Oct 2019 10:01:49 -0400
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id AA1DB200010;
        Wed,  9 Oct 2019 14:01:45 +0000 (UTC)
Date:   Wed, 9 Oct 2019 16:01:45 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Kamel Bouhara <kamel.bouhara@bootlin.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/4] i2c: at91: implement i2c bus recovery
Message-ID: <20191009140145.GE4254@piout.net>
References: <20191002144658.7718-1-kamel.bouhara@bootlin.com>
 <20191002144658.7718-3-kamel.bouhara@bootlin.com>
 <20191009135500.ufkxcemccwfcfys7@M43218.corp.atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009135500.ufkxcemccwfcfys7@M43218.corp.atmel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09/10/2019 15:55:00+0200, Ludovic Desroches wrote:
> On Wed, Oct 02, 2019 at 04:46:56PM +0200, Kamel Bouhara wrote:
> > External E-Mail
> > 
> > 
> > Implement i2c bus recovery when slaves devices might hold SDA low.
> > In this case re-assign SCL/SDA to gpios and issue 9 dummy clock pulses
> > until the slave release SDA.
> > 
> 
> Hi Kamel,
> 
> Thanks for adding this new feature. As I see patches only for sama5d3 and
> sama5d4, I assume it has not been tested with a sama5d2, isn't it?
> 

I there a point having it on sama5d2 as the controller already supports
this feature?

> I doubt it works with a sama5d2 because of the pinctrl. I also wonder if it can
> work if we add .strict = true to pinmux_ops which is something plan for the
> future...
> 

I don't see why it wouldn't work with strict as this is switching muxing
properly instead of using the pins for two functions at the same time.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
