Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 388CAA5935
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 16:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731412AbfIBOW6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 10:22:58 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:49011 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbfIBOW6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Sep 2019 10:22:58 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 92B5A6000A;
        Mon,  2 Sep 2019 14:22:54 +0000 (UTC)
Date:   Mon, 2 Sep 2019 16:22:51 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Eugen.Hristev@microchip.com
Cc:     peda@axentia.se, wsa@the-dreams.de, mark.rutland@arm.com,
        Ludovic.Desroches@microchip.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
        robh+dt@kernel.org
Subject: Re: [PATCH v4 2/9] dt-bindings: i2c: add bindings for i2c analog and
 digital filter
Message-ID: <20190902142251.GC21922@piout.net>
References: <1567418773-2427-1-git-send-email-eugen.hristev@microchip.com>
 <1567418773-2427-3-git-send-email-eugen.hristev@microchip.com>
 <9a9c209c-2fb8-0a4c-4e0a-b04fefda3360@axentia.se>
 <b6528812-65d3-6561-38e7-c0545af900d8@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6528812-65d3-6561-38e7-c0545af900d8@microchip.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Eugen,

On 02/09/2019 14:15:14+0000, Eugen.Hristev@microchip.com wrote:
> On 02.09.2019 13:49, Peter Rosin wrote:
> 
> > On 2019-09-02 12:12, Eugen.Hristev@microchip.com wrote:
> >> From: Eugen Hristev <eugen.hristev@microchip.com>
> >>
> >> Some i2c controllers have a built-in digital or analog filter.
> >> This is specifically required depending on the hardware PCB/board.
> >> Some controllers also allow specifying the maximum width of the
> >> spikes that can be filtered. The width length can be specified in nanoseconds.
> >>
> >> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> >> ---
> >>   Documentation/devicetree/bindings/i2c/i2c.txt | 11 +++++++++++
> >>   1 file changed, 11 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> >> index 44efafd..8dbff67 100644
> >> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> >> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> >> @@ -55,6 +55,17 @@ wants to support one of the below features, it should adapt the bindings below.
> >>   	Number of nanoseconds the SDA signal takes to fall; t(f) in the I2C
> >>   	specification.
> >>   
> >> +- i2c-analog-filter
> >> +	Enable analog filter for i2c lines.
> >> +
> >> +- i2c-digital-filter
> >> +	Enable digital filter for i2c lines.
> >> +
> >> +- i2c-filter-width-ns
> >> +	Width of spikes which can be filtered by either digital or analog
> >> +	filters (i2c-analog-filtr or i2c-digital-filtr). This width is specified
> > 
> > filtr -> filter (two instances)
> > 
> > What if you want/need to have different bandwidth for the digital and analog
> > filters? After all, this is a generic binding...
> 
> For our needs, this is enough: the purpose of the filters is to avoid 
> noise on the lines, the noise is as big as it is for the digital and for 
> the analog filters, since we use an absolute measurement for them. So I 
> do not know how useful it would be to make a difference.
> 

You are adding generic properties so they have to be generic and not
tied to your particular use case.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
