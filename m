Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68C167124F8
	for <lists+linux-i2c@lfdr.de>; Fri, 26 May 2023 12:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjEZKmj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 May 2023 06:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbjEZKmi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 May 2023 06:42:38 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B97F7;
        Fri, 26 May 2023 03:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=TYBe5AFwuX4MXC+/3wWMZkQ5/KmJbSdQayPMBQLdxS8=; b=rBsiChtclHsPj528BCJQJWA2P7
        79bIuwrvmxDEuzW7uTbXHUTtru38R+IPEGxDXkSqdWCmpbKbFArCOZWpT3uMigQ/2vzBTEubor04i
        rCEVJOuH7CPr0kxo5gOKoK+kCu30KwvWtzwI+Nu+Gj/ma58ToW3b6ub8PIFPG0G894HniUlnXC9Ds
        2EeU3o74LwpK+2LxVlJH6afwrg5YLg/zewpO1nKBCaTAxkECocbt4mlXJV04LMaZJFiBcNQMVE5Og
        ezZAmB0rI8EiQ1od0m1cSBomPOjLb4Fii2a+7JkQOym14HiDm8f50KDjZYfmOxUxYYXy+ugZDtRdk
        p1nJgRoQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42072)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1q2Uty-0005Sj-Pq; Fri, 26 May 2023 11:42:30 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1q2Uts-0003fN-6a; Fri, 26 May 2023 11:42:24 +0100
Date:   Fri, 26 May 2023 11:42:24 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     'Jakub Kicinski' <kuba@kernel.org>, netdev@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com
Subject: Re: [PATCH net-next v9 8/9] net: txgbe: Implement phylink pcs
Message-ID: <ZHCNEACuJB4EkZG9@shell.armlinux.org.uk>
References: <20230524091722.522118-1-jiawenwu@trustnetic.com>
 <20230524091722.522118-9-jiawenwu@trustnetic.com>
 <20230525211403.44b5f766@kernel.org>
 <022201d98f9a$4b4ccc00$e1e66400$@trustnetic.com>
 <ZHBxJP4DXevPNpab@shell.armlinux.org.uk>
 <026901d98fb0$b5001d80$1f005880$@trustnetic.com>
 <ZHB2vXBP1B2iHXBl@shell.armlinux.org.uk>
 <026a01d98fb3$97e3d8b0$c7ab8a10$@trustnetic.com>
 <ZHB9wJSgfQctd2aX@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHB9wJSgfQctd2aX@shell.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 26, 2023 at 10:37:04AM +0100, Russell King (Oracle) wrote:
> I'm just creating a patch series for both xpcs and lynx, which this
> morning have had patches identifying similar problems with creation
> and destruction.

https://lore.kernel.org/all/ZHCGZ8IgAAwr8bla@shell.armlinux.org.uk/

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
