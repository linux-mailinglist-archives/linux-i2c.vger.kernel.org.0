Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E746A6FFA26
	for <lists+linux-i2c@lfdr.de>; Thu, 11 May 2023 21:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239078AbjEKTeD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 May 2023 15:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232629AbjEKTeC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 May 2023 15:34:02 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 491735BBD;
        Thu, 11 May 2023 12:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=RkGmYCCswpnJVF63DZkpYZ3U9ILFcaWvTWc6uYhsnE4=; b=dngZJKeVZf7NZGAhz5bgj1XpA2
        khxacQpmYHCgBvpAb26umYOrRr4x18JNBZGrSWJHDs7l0zxfdky6VoCz+CLKIbnS/CaMHSLFjJG74
        rAxPsFw4xkLttWrurQDvneOaDe66c/Ntluhl2N5EQjQJNZiwcMAC26S8B0goYXe/hOYc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1pxC2r-00CaPt-DY; Thu, 11 May 2023 21:33:45 +0200
Date:   Thu, 11 May 2023 21:33:45 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, mengyuanlou@net-swift.com
Subject: Re: [PATCH net-next v7 8/9] net: txgbe: Implement phylink pcs
Message-ID: <a49b0cff-dd1c-4d89-8287-2909942d718f@lunn.ch>
References: <20230509022734.148970-1-jiawenwu@trustnetic.com>
 <20230509022734.148970-9-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509022734.148970-9-jiawenwu@trustnetic.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> +static int txgbe_pcs_read(struct mii_bus *bus, int addr, int devnum, int regnum)
> +{
> +	struct wx *wx  = bus->priv;
> +	u32 offset, val;
> +
> +	offset = devnum << 16 | regnum;
> +
> +	/* Set the LAN port indicator to IDA_ADDR */
> +	wr32(wx, TXGBE_XPCS_IDA_ADDR, offset);
> +
> +	/* Read the data from IDA_DATA register */
> +	val = rd32(wx, TXGBE_XPCS_IDA_DATA);

addr is ignored here. So i assume the hardware only supports a single
address? Please add a check for address. If it is 0, do the read,
otherwise return either -EOPNOTSUPP, or 0xffff. What we don't want is
it to appear there are 32 PCS devices.

   Andrew
