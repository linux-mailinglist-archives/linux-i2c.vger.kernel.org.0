Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7997E1CE540
	for <lists+linux-i2c@lfdr.de>; Mon, 11 May 2020 22:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729517AbgEKUUT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 16:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbgEKUUT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 May 2020 16:20:19 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25294C061A0C
        for <linux-i2c@vger.kernel.org>; Mon, 11 May 2020 13:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=iG3/sv7Xogk6xWOGx/TUolJGp8UO7rkq/DeL/MjvqyU=; b=Vls7cvByE1m6WrjFwkv3O0k5K
        BjkD0dVSOekhqwEXSoiNJMgVMWd9V9T58B4JOaYvu4AXD2SHYCw021YnMEiQcPjXIz8rvqRjWhME4
        9g86Zb+EdxdZkxGvU/3Fm3uObfLobkXKq2JmT7b6nw+DbxLP0yV4nFIXfLHH2+k4OOR3QzNxztN2H
        knTjJykW0lrhJayr7kBI5f86lXbeRackIk8pRQBnz2IxYfT38ysVKV+oKTdv4s8LC9t/5FbjqrKUl
        w0qLkiEcQINMw6YvGPoSe4xMTcC0sdw1IEHBI15k/QZxmTgc+Oe4w9GfVCnuuqDzdjyghv+J+Vrai
        HlG/UFJ3g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59204)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jYEuM-0007Vm-Ne; Mon, 11 May 2020 21:20:14 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jYEuM-000622-66; Mon, 11 May 2020 21:20:14 +0100
Date:   Mon, 11 May 2020 21:20:14 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/4] i2c: pxa: consolidate i2c_pxa_*xfer() implementations
Message-ID: <20200511202014.GX1551@shell.armlinux.org.uk>
References: <20200506092831.GN1551@shell.armlinux.org.uk>
 <E1jWGMa-0000N1-L6@rmk-PC.armlinux.org.uk>
 <20200511195915.GC8724@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200511195915.GC8724@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 11, 2020 at 09:59:15PM +0200, Wolfram Sang wrote:
> On Wed, May 06, 2020 at 10:29:12AM +0100, Russell King wrote:
> > Most of i2c_pxa_pio_xfer() and i2c_pxa_xfer() are identical; the only
> > differences are that i2c_pxa_pio_xfer() may reset the bus, and they
> > use different underlying transfer functions. The retry loop is the
> > same. Consolidate these two functions.
> > 
> > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> 
> Fails to build here:
> 
> In file included from ./include/linux/device.h:15,
>                  from ./include/linux/acpi.h:15,
>                  from ./include/linux/i2c.h:13,
>                  from drivers/i2c/busses/i2c-pxa.c:23:
> drivers/i2c/busses/i2c-pxa.c: In function ‘i2c_pxa_internal_xfer’:
> drivers/i2c/busses/i2c-pxa.c:1118:13: error: ‘adap’ undeclared (first use in this function); did you mean ‘vmap’?
>     dev_dbg(&adap->dev, "Retrying transmission\n");
> 

I'll take a look at it - it's likely that some changes got missed
while keeping all these patches on top of several different trees.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
