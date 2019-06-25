Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C894F528E7
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 12:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730100AbfFYKD0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 06:03:26 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:41289 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfFYKD0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jun 2019 06:03:26 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 18F1B20010;
        Tue, 25 Jun 2019 10:03:21 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: i2c: mv64xxx: Add YAML schemas
In-Reply-To: <20190625095728.owvyfkrai4jmitue@flea>
References: <20190611090309.7930-1-maxime.ripard@bootlin.com> <20190611090309.7930-2-maxime.ripard@bootlin.com> <20190625095728.owvyfkrai4jmitue@flea>
Date:   Tue, 25 Jun 2019 12:03:21 +0200
Message-ID: <878stqkmmu.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Maxime,

> Hi,
>
> On Tue, Jun 11, 2019 at 11:03:09AM +0200, Maxime Ripard wrote:
>> Switch the DT binding to a YAML schema to enable the DT validation.
>>
>> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> Any comments on that patch (and the previous one)?



No more comment from me, if you want you can add my

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory

>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
