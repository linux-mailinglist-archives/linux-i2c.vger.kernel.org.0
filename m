Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359BC1E9A05
	for <lists+linux-i2c@lfdr.de>; Sun, 31 May 2020 21:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728327AbgEaTHI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 31 May 2020 15:07:08 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:45952 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbgEaTHI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 31 May 2020 15:07:08 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id E97B18030866;
        Sun, 31 May 2020 19:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Y9PNAVpwnQW7; Sun, 31 May 2020 22:07:05 +0300 (MSK)
Date:   Sun, 31 May 2020 22:07:04 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        <devicetree-compiler@vger.kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] check: Add 10bit/slave i2c reg flags support
Message-ID: <20200531190704.2kluwj3nipvdfccs@mobilestation>
References: <20200527122525.6929-1-Sergey.Semin@baikalelectronics.ru>
 <20200527141517.22677-1-Sergey.Semin@baikalelectronics.ru>
 <20200530093152.GA1038@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200530093152.GA1038@ninjato>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, May 30, 2020 at 11:31:52AM +0200, Wolfram Sang wrote:
> 
> > +	addr = reg & 0x3FFFFFFFU;
> > +	snprintf(unit_addr, sizeof(unit_addr), "%x", addr);
> 
> Hmm, this hardcoded value will not work if we ever need to add another
> bit. I hope this will never happen, though.
> 
> > +		if ((reg & (1U << 31)) && addr > 0x3ff)
> 
> Same here with bit 31.

I'd be glad to use a macro or some helper here, but alas there is no
ready-to-use i2c-related one in the dtc code. See, there are hard-coded
literals in the PCI nodes checkers (check_pci_device_reg(),
check_pci_device_bus_num()) and the hard-coded literals've been in the
i2c-nodes checkers even before this patch.

> I haven't checked DTC but can't we import the
> header with the defines into the project? Or is this then a circular
> dependency?
> 

I guess importing header would be much better than the hard-coded values
currently used. What do the code maintainers say about that? Any idea how it
is supposed to be implemented?

-Sergey
