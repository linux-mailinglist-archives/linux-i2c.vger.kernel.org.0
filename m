Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD6A47141DA
	for <lists+linux-i2c@lfdr.de>; Mon, 29 May 2023 04:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjE2CGv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 May 2023 22:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjE2CGt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 May 2023 22:06:49 -0400
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90FEB8;
        Sun, 28 May 2023 19:06:47 -0700 (PDT)
X-QQ-mid: Yeas48t1685325967t907t14719
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [183.159.96.128])
X-QQ-SSF: 00400000000000F0FOF000000000000
From:   =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 14564377025718723905
To:     "'Russell King \(Oracle\)'" <linux@armlinux.org.uk>,
        "'kernel test robot'" <lkp@intel.com>
Cc:     <netdev@vger.kernel.org>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <Jose.Abreu@synopsys.com>, <andrew@lunn.ch>,
        <hkallweit1@gmail.com>, <oe-kbuild-all@lists.linux.dev>,
        <linux-i2c@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <mengyuanlou@net-swift.com>,
        "'Piotr Raczynski'" <piotr.raczynski@intel.com>
References: <20230524091722.522118-6-jiawenwu@trustnetic.com> <202305261959.mnGUW17n-lkp@intel.com> <ZHCZ0hLKARXu3xFH@shell.armlinux.org.uk>
In-Reply-To: <ZHCZ0hLKARXu3xFH@shell.armlinux.org.uk>
Subject: RE: [PATCH net-next v9 5/9] net: txgbe: Add SFP module identify
Date:   Mon, 29 May 2023 10:06:06 +0800
Message-ID: <02dd01d991d2$2120fcf0$6362f6d0$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFlCTXCD0V13/nxYaH3lJLB+zCPMgFguorBARt7XSiwRa6NsA==
Content-Language: zh-cn
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,FROM_EXCESS_BASE64,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Friday, May 26, 2023 7:37 PM, Russell King (Oracle) wrote:
> On Fri, May 26, 2023 at 07:30:45PM +0800, kernel test robot wrote:
> > Kconfig warnings: (for reference only)
> >    WARNING: unmet direct dependencies detected for I2C_DESIGNWARE_PLATFORM
> >    Depends on [n]: I2C [=n] && HAS_IOMEM [=y] && (ACPI && COMMON_CLK [=y] || !ACPI)
> >    Selected by [y]:
> >    - TXGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PCI [=y]
> >    WARNING: unmet direct dependencies detected for SFP
> >    Depends on [n]: NETDEVICES [=y] && PHYLIB [=y] && I2C [=n] && PHYLINK [=y] && (HWMON [=n] || HWMON [=n]=n)
> >    Selected by [y]:
> >    - TXGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PCI [=y]
> 
> ... and is basically caused by "select SFP". No. Do not do this unless
> you look at the dependencies for SFP and ensure that those are also
> satisfied - because if you don't you create messes like the above
> build errors.

So how do I make sure that the module I need compiles and loads correctly,
rely on the user to manually select it?

