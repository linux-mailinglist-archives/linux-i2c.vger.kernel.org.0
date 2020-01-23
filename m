Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96C12146853
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 13:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgAWMq0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 07:46:26 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53115 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgAWMq0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jan 2020 07:46:26 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iubsM-0004im-Jb; Thu, 23 Jan 2020 13:46:22 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1iubsI-000588-JH; Thu, 23 Jan 2020 13:46:18 +0100
Date:   Thu, 23 Jan 2020 13:46:18 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg KH <greg@kroah.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] i2c: Enable compile testing for some of drivers
Message-ID: <20200123124618.ijzasifjbbmzyh4d@pengutronix.de>
References: <1578384779-15487-1-git-send-email-krzk@kernel.org>
 <20200123091228.GB1105@ninjato>
 <20200123093120.GA2365@pi3>
 <20200123094107.GD1105@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200123094107.GD1105@ninjato>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 23, 2020 at 10:41:07AM +0100, Wolfram Sang wrote:
> On Thu, Jan 23, 2020 at 10:31:20AM +0100, Krzysztof Kozlowski wrote:
> > On Thu, Jan 23, 2020 at 10:12:28AM +0100, Wolfram Sang wrote:
> > > 
> > > >  config I2C_ZX2967
> > > >  	tristate "ZTE ZX2967 I2C support"
> > > > -	depends on ARCH_ZX
> > > > -	default y
> > > > +	depends on ARCH_ZX || (COMPILE_TEST && (ARC || ARM || ARM64 || M68K || RISCV || SUPERH || SPARC))
> > > > +	# COMPILE_TEST needs architectures with readsX()/writesX() primitives
> > > 
> > > The list of archs neither looks pretty nor very maintainable. My
> > > suggestion is that we leave this out of COMPILE_TEST until we have
> > > something like ARCH_HAS_READS or something. What do you think?
> > 
> > Indeed it does not look good. However having compile testing allows
> > kbuild to run sparse and smatch which already started pointing minor
> > issues in existing drivers.
> > 
> > Yeah... pros and cons... I don't have a strong opinion to keep it. Since
> > patch is important, maybe let's just skip this part?
> 
> Yeah, let's skip it for now. If you or someone is keen on having it,
> something like ARCH_HAS_READS (<- needs better name) should be
> introduced so we can use it here. But that can/should be handled
> incrementally.

Isn't this "HAS_IOMEM" already today? The driver compiles for me on
amd64, too, so ...

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
