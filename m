Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 763DB52825
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 11:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731588AbfFYJcH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 05:32:07 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:49503 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728768AbfFYJcG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jun 2019 05:32:06 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 96A0224000D;
        Tue, 25 Jun 2019 09:31:57 +0000 (UTC)
Date:   Tue, 25 Jun 2019 11:31:56 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Eugen.Hristev@microchip.com
Cc:     peda@axentia.se, robh+dt@kernel.org, mark.rutland@arm.com,
        Nicolas.Ferre@microchip.com, Ludovic.Desroches@microchip.com,
        wsa@the-dreams.de, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/9] dt-bindings: i2c: at91: add binding for
 enable-ana-filt
Message-ID: <20190625093156.GF5690@piout.net>
References: <1561449642-26956-1-git-send-email-eugen.hristev@microchip.com>
 <1561449642-26956-7-git-send-email-eugen.hristev@microchip.com>
 <4e81d3c9-25f3-ca6e-f2d5-17fad5905bb8@axentia.se>
 <84628b5e-bea7-7d91-f790-f3a2650040fa@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84628b5e-bea7-7d91-f790-f3a2650040fa@microchip.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 25/06/2019 09:14:13+0000, Eugen.Hristev@microchip.com wrote:
> > Perhaps
> > 
> > 	microchip,digital-filter;
> > 	microchip,analog-filter;
> > 
> > ?
> 
> Hi Peter,
> 
> Thanks for reviewing. The name of the property does not matter much to 
> me, and we have properties prefixed with vendor, and some are not.
> 
> @Alexandre Belloni: which name you think it's best ?
> 

I'm not sure, it depends on whether Wolfram thinks it is generic enough
to be used without a vendor prefix.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
