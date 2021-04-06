Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5778235558E
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 15:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344675AbhDFNor (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 09:44:47 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:43233 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344659AbhDFNon (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 09:44:43 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 136DhfCQ018008
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 6 Apr 2021 15:43:41 +0200
Received: from md1za8fc.ad001.siemens.net ([167.87.42.66])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 136De2KZ031989;
        Tue, 6 Apr 2021 15:40:02 +0200
Date:   Tue, 6 Apr 2021 15:40:01 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        "Lee Jones" <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        "Jim Quinlan" <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pci@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>, <hdegoede@redhat.com>
Subject: Re: [PATCH v1 3/7] PCI: New Primary to Sideband (P2SB) bridge
 support library
Message-ID: <20210406154001.3eec0698@md1za8fc.ad001.siemens.net>
In-Reply-To: <3f33a178-3002-e93e-89f1-8cf05097da25@metux.net>
References: <YEZ4IitUa+I9HM5F@smile.fi.intel.com>
        <20210309014221.GA1831206@bjorn-Precision-5520>
        <20210309094252.396b7f2d@md1za8fc.ad001.siemens.net>
        <3f33a178-3002-e93e-89f1-8cf05097da25@metux.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Fri, 2 Apr 2021 15:09:12 +0200
schrieb "Enrico Weigelt, metux IT consult" <lkml@metux.net>:

> On 09.03.21 09:42, Henning Schild wrote:
> 
> > The device will respond to MMIO while being hidden. I am afraid
> > nothing stops a collision, except for the assumption that the BIOS
> > is always right and PCI devices never get remapped. But just
> > guessing here.  
> 
> What could go wrong if it is remapped, except that this driver would
> write to the wrong mmio space ?
> 
> If it's unhidden, pci-core should see it and start the usual probing,
> right ?

I have seen this guy exposed to Linux on coreboot machines. No issues.
But i can imagine BIOSs that somehow make use of the device and assume
it wont move. So we would at least need a parameter to allow keeping
that device hidden, or "fixed" in memory.

Henning

> 
> --mtx
> 

