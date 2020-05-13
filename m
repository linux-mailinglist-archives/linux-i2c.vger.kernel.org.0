Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B091D15BC
	for <lists+linux-i2c@lfdr.de>; Wed, 13 May 2020 15:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387937AbgEMNhf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 May 2020 09:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgEMNhf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 May 2020 09:37:35 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCFE5C061A0C;
        Wed, 13 May 2020 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=CT8QafuNU7nLW58gRG75IH2d/SNOoLj5Pkh6RsDK2u0=; b=DB1u96VASarFExlYVvTN2K4FF
        YcWgO4N/Pv/7rjUwfqYgwZzwFq83aUexyQlS0nCAYIIXLmIB+NxaVmv4qU+wi8Gg9CjGaX/JyUX5f
        KfEkgGylGwbYY1gc5y+4a3myt/YWd09VH4dnEhbYWl3ZT3wAo9hJCw51Q2bm/7feFrrai2HMkHBSV
        +rhzet+/uD9KCl+EkC/RpgUKU27k9nbKLwfvMorD16UTwETE/H3U/9TiQTJjqZsPm2BYynJ5ALsfz
        smTKoZptXIo9MJ7w/bvIachtZYcbNozvC47ygP4FLFac2zgGFgVCjdEgoiydosTgWsg4SosQaQv7o
        K2jOKiUZg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59948)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jYrZe-0004jS-7F; Wed, 13 May 2020 14:37:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jYrZb-0007oW-Ux; Wed, 13 May 2020 14:37:23 +0100
Date:   Wed, 13 May 2020 14:37:23 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vladimir Vid <vladimir.vid@sartura.hr>
Subject: Re: [PATCH] i2c: pxa: implement generic i2c bus recovery
Message-ID: <20200513133722.GJ1551@shell.armlinux.org.uk>
References: <E1jYnlI-0002Nw-83@rmk-PC.armlinux.org.uk>
 <20200513131843.GB499265@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513131843.GB499265@lunn.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 13, 2020 at 03:18:43PM +0200, Andrew Lunn wrote:
> On Wed, May 13, 2020 at 10:33:12AM +0100, Russell King wrote:
> > Implement generic GPIO-based I2C bus recovery for the PXA I2C driver.
> 
> Hi Russell
> 
> I assume this is going to be merged via i2c? So Wolfram Sang?  He is
> not on To: or Cc:

Yes, just as my other patches I've posted to the linux-i2c list that
Wolfram has picked up.  I think he works from patchwork.

I assume Wolfram doesn't want to be Cc'd, as per the current setup in
MAINTAINERS.  If that's not the case, MAINTAINERS needs to be fixed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
