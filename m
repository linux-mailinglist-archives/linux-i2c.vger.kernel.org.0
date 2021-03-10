Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA273344EE
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 18:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbhCJRRI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Mar 2021 12:17:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbhCJROs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Mar 2021 12:14:48 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF54CC061760;
        Wed, 10 Mar 2021 09:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=EFmV8kT8hWs8Q9WmFJMbPCHSM86NvMO2yar7iZF5S1k=; b=ps7tDs/cMZWiqdJRx+zNuif1HI
        GAgfTX8IwXp0+C8EFWm88KQVQ2j6bDPCRdKL+hPx3LBtoQmEohxnwyV96rAgxU5pP3uCHHJKsPmXB
        uhpvEAM1nQ7dOr53t7+lGHZuz157ivitLoMCymQdompBnJXp6dnYUNCddHgTP1BbeMk6x4brgI3KI
        BESupa9nOBarcPUGNpxhhxAj7Twma/mGuJEL9gvTV2pzj1iGJ/zUfzU4sYhLYw+SBoP50EaaSifi0
        AsGAGa4e2UPgICaJbj1RzHo8joLv3S2KwMsF6lHfbgtT+3nXoEJT9i8yj3Itol29+XIaZgRfiIkat
        /3qXUKYA==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lK2Pb-0048tD-QG; Wed, 10 Mar 2021 17:14:20 +0000
Date:   Wed, 10 Mar 2021 17:14:19 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>, hdegoede@redhat.com,
        henning.schild@siemens.com
Subject: Re: [PATCH v1 2/7] PCI: Convert __pci_read_base() to
 __pci_bus_read_base()
Message-ID: <20210310171419.GA981289@infradead.org>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
 <20210308122020.57071-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308122020.57071-3-andriy.shevchenko@linux.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> +static inline
>  int __pci_read_base(struct pci_dev *dev, enum pci_bar_type type,
> +		    struct resource *res, unsigned int reg)

This looks weird.  Normal kernel style would be:

static inline int __pci_read_base(struct pci_dev *dev, enum pci_bar_type type,
		struct resource *res, unsigned int reg)

or

static inline int
__pci_read_base(struct pci_dev *dev, enum pci_bar_type type,

that being said, there seems to be no good agument to even make this
and inline function.

> +	return __pci_bus_read_base(dev->bus, dev->devfn, type, res, reg, dev->mmio_always_on);

Please avoid pointless overly long lines.
