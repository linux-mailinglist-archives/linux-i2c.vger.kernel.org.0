Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D237C7125B2
	for <lists+linux-i2c@lfdr.de>; Fri, 26 May 2023 13:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242988AbjEZLhi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 May 2023 07:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237023AbjEZLhh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 May 2023 07:37:37 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744CDE7E;
        Fri, 26 May 2023 04:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ywhy2jAO16IXVYxg/uoZkSs55CwHUYJT0FTMuMs35PU=; b=q4+Otp1nBzJ872iRk40XDhqVm5
        Pnaqu/74Mv60CNDyCIQmifA4tZU0wE8FSnDfPgnf3IeOnZY2x3N7vbNjcMevgNwHm2ftr/8NyD9Bg
        K7fZBVwUkXoYfFSHUfF4CjRwa+G37ztEtwYqsy0eLP06pjb3vXPI/W0N3guJ+GbhtE541DVsWqd9F
        M3psTja6WodBPTocofwe9E/kJ0EzZpLqcWhxPtaEeEHH1diJr3mjkBubZ64SOehwEcuwMTrK1Dlqd
        dTONbNltJE8RsuNeqEntz0Cr6pm7WKBn8Ac/A428MjkiW6vogDDg64L883hpiE+4c55md+wuLqJDS
        laIMQ8zw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34414)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1q2Vkf-0005Vs-Ml; Fri, 26 May 2023 12:36:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1q2VkY-0003h7-BQ; Fri, 26 May 2023 12:36:50 +0100
Date:   Fri, 26 May 2023 12:36:50 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     kernel test robot <lkp@intel.com>
Cc:     Jiawen Wu <jiawenwu@trustnetic.com>, netdev@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
        oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, mengyuanlou@net-swift.com,
        Piotr Raczynski <piotr.raczynski@intel.com>
Subject: Re: [PATCH net-next v9 5/9] net: txgbe: Add SFP module identify
Message-ID: <ZHCZ0hLKARXu3xFH@shell.armlinux.org.uk>
References: <20230524091722.522118-6-jiawenwu@trustnetic.com>
 <202305261959.mnGUW17n-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305261959.mnGUW17n-lkp@intel.com>
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

On Fri, May 26, 2023 at 07:30:45PM +0800, kernel test robot wrote:
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for I2C_DESIGNWARE_PLATFORM
>    Depends on [n]: I2C [=n] && HAS_IOMEM [=y] && (ACPI && COMMON_CLK [=y] || !ACPI)
>    Selected by [y]:
>    - TXGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PCI [=y]
>    WARNING: unmet direct dependencies detected for SFP
>    Depends on [n]: NETDEVICES [=y] && PHYLIB [=y] && I2C [=n] && PHYLINK [=y] && (HWMON [=n] || HWMON [=n]=n)
>    Selected by [y]:
>    - TXGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PCI [=y]

... and is basically caused by "select SFP". No. Do not do this unless
you look at the dependencies for SFP and ensure that those are also
satisfied - because if you don't you create messes like the above
build errors.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
