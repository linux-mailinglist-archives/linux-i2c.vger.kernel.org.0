Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6BD5583B6
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2019 15:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbfF0Njm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jun 2019 09:39:42 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:56719 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbfF0Njm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jun 2019 09:39:42 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id AAFAF60018;
        Thu, 27 Jun 2019 13:39:33 +0000 (UTC)
Date:   Thu, 27 Jun 2019 15:39:32 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Eugen.Hristev@microchip.com, peda@axentia.se, robh+dt@kernel.org,
        mark.rutland@arm.com, Nicolas.Ferre@microchip.com,
        Ludovic.Desroches@microchip.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        pierre-yves.mordret@st.com
Subject: Re: I2C filtering (was Re: [PATCH v2 6/9] dt-bindings: i2c: at91:
 add binding for enable-ana-filt)
Message-ID: <20190627133932.GL3692@piout.net>
References: <1561449642-26956-1-git-send-email-eugen.hristev@microchip.com>
 <1561449642-26956-7-git-send-email-eugen.hristev@microchip.com>
 <4e81d3c9-25f3-ca6e-f2d5-17fad5905bb8@axentia.se>
 <84628b5e-bea7-7d91-f790-f3a2650040fa@microchip.com>
 <20190625093156.GF5690@piout.net>
 <20190625095533.GC1688@kunai>
 <20190627132200.GK3692@piout.net>
 <eb2d87b7-437c-53ee-a1ca-37c4d3fadea6@microchip.com>
 <20190627133440.GA7158@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190627133440.GA7158@ninjato>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 27/06/2019 15:34:40+0200, Wolfram Sang wrote:
> 
> > > Apart from enabling the filter there is indeed one configuration
> > > setting, the maximum pulse width of spikes to be suppressed by the input
> > > filter.
> 
> Yup, this is what I anticipated.
> 
> > This is a number 0 to 7 (3 bits) that represents the width of the spike 
> > in periph clock cycles.
> 
> For a generic binding, we would need some time-value as a parameter and
> convert it to clock cycles in the driver then, I'd think.
> 

Yes, that is what I was going to suggest.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
