Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1ED422E00
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Oct 2021 18:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236479AbhJEQda (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Oct 2021 12:33:30 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:40973 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236512AbhJEQd3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Oct 2021 12:33:29 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 39547D5799;
        Tue,  5 Oct 2021 16:28:41 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id CD54AFF806;
        Tue,  5 Oct 2021 16:28:16 +0000 (UTC)
Date:   Tue, 5 Oct 2021 18:28:16 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     =?utf-8?B?UGF3ZcWC?= Anikiel <pan@semihalf.com>,
        jarkko.nikula@linux.intel.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        ka@semihalf.com, Tomasz Nowicki <tn@semihalf.com>,
        jam@semihalf.com, amstan@google.com
Subject: Re: [PATCH v2 2/4] dt-bindings: add bus number property
Message-ID: <YVx9IMk7cJSCK79/@piout.net>
References: <20211005143748.2471647-1-pan@semihalf.com>
 <20211005143748.2471647-3-pan@semihalf.com>
 <CAK8P3a1kj1G3TkM7bK3ckXoG8_PTLURAcpDRmDxdnjutEPMsug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8P3a1kj1G3TkM7bK3ckXoG8_PTLURAcpDRmDxdnjutEPMsug@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05/10/2021 18:22:12+0200, Arnd Bergmann wrote:
> On Tue, Oct 5, 2021 at 4:37 PM Paweł Anikiel <pan@semihalf.com> wrote:
> >
> > On SoCFPGA systems, it's desireable to have fixed numbering for
> > i2c busses, while being able to enable/disable them (e.g. have i2c1
> > be mapped to /dev/i2c-1, even though i2c0 is disabled). This can also
> > be achieved using devicetree aliases (see i2c_add_adapter). However,
> > having the driver be self-contained without relying on aliases is more
> > robust.
> >
> > Signed-off-by: Paweł Anikiel <pan@semihalf.com>
> 
> I don't see how adding a nonstandard property in one of the i2c bus
> drivers helps at all. How do you expect this to work when there are
> multiple i2c controllers in the system using different drivers? What
> should happen if both an alias and the busno property are set?
> 

What happens when two nodes have the same busno property because e.g.
one is in a dtsi and the other one is in a dts?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
