Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF4A1E907E
	for <lists+linux-i2c@lfdr.de>; Sat, 30 May 2020 12:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgE3KY0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 30 May 2020 06:24:26 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:52716 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbgE3KY0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 30 May 2020 06:24:26 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id BF0378030772;
        Sat, 30 May 2020 10:24:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id iejhn9xxlnym; Sat, 30 May 2020 13:24:20 +0300 (MSK)
Date:   Sat, 30 May 2020 13:24:19 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        <linux-mips@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 01/11] dt-bindings: i2c: Convert DW I2C binding to DT
 schema
Message-ID: <20200530102419.gtgh77eaxoort3zh@mobilestation>
References: <20200528093322.23553-1-Sergey.Semin@baikalelectronics.ru>
 <20200528093322.23553-2-Sergey.Semin@baikalelectronics.ru>
 <20200530093942.GB1038@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200530093942.GB1038@ninjato>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Wolfram

On Sat, May 30, 2020 at 11:39:42AM +0200, Wolfram Sang wrote:
> 
> Just double checking:
> 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Rob, what about this checkpatch warning?
> 
> WARNING: DT binding documents should be licensed (GPL-2.0-only OR BSD-2-Clause)
> 

Hope you don't mind me answering on a question for Rob. That warning concerns
new bindings and bindings converted by a person eligible to change the license.
Otherwise by default any converted binding is supposed to be left under pure
GPL as the rest of kernel code.

-Sergey
