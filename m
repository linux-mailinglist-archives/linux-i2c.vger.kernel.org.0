Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A123722342
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 12:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjFEKTL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 06:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbjFEKTL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 06:19:11 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00AF0F7;
        Mon,  5 Jun 2023 03:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=p/ThtqXlxQtrcnrvqmZOqjpuo/YqpptOZz7Fr421+9o=; b=uiqRJYRejBbo8oUNmEKoivRBGk
        5C6UoHwgaStNtX0g7f7P0U0RxE7CghBgwP5I1CTYn7ypl1yYpkk/ipN2JlYGu5YeYkACMIAiT5Q9Z
        I6vgUeEM10braPk+cVSB+rGF4xpTLX9+opofMWteWJHhORzbPdO8QYgf1ySHtmkHcPTagzCGVoewl
        Raf/wC0Nrkb7XDipb+ZPDxG+2R5AVQ6ytPF5Ntrwosrk6mswHN0pSt7v0Cq3lqjdX4Y2dWG/QuNzz
        XUQHlA5PaVbb363pG4tphHnPOEdiq6ztW1EFFSzwzZaAdOko1zKGI+YmU3nhn6WZ9hUAUcoGun97h
        lbCKZ7xw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48754)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1q67Ij-0003mx-1r; Mon, 05 Jun 2023 11:19:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1q67Ib-000611-Kh; Mon, 05 Jun 2023 11:18:53 +0100
Date:   Mon, 5 Jun 2023 11:18:53 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     'Wolfram Sang' <wsa@kernel.org>
Cc:     Jiawen Wu <jiawenwu@trustnetic.com>, netdev@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com,
        'Piotr Raczynski' <piotr.raczynski@intel.com>
Subject: Re: [PATCH net-next v11 2/9] i2c: designware: Add driver support for
 Wangxun 10Gb NIC
Message-ID: <ZH22jS7KPPBEVS2a@shell.armlinux.org.uk>
References: <20230605025211.743823-1-jiawenwu@trustnetic.com>
 <20230605025211.743823-3-jiawenwu@trustnetic.com>
 <ZH2IaM86ei2gQkfA@shikoro>
 <00c901d9977e$af0dc910$0d295b30$@trustnetic.com>
 <ZH2UT55SRNwN15t7@shikoro>
 <00eb01d99785$8059beb0$810d3c10$@trustnetic.com>
 <ZH2zb7smT/HbFx9k@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH2zb7smT/HbFx9k@shikoro>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 05, 2023 at 12:05:35PM +0200, 'Wolfram Sang' wrote:
> 
> > Yes, other patches will build even without this patch. But SFP will not work.
> > This patch series implement I2C, GPIO, SFP and PHYLINK. The support of SFP
> > is dependent on I2C and GPIO. If these patches will be end up merging in the
> > same upstream version, it's not a problem to merge them in different trees,
> > I think.
> 
> That's how I saw it as well.
> 
> Applied to for-next, thanks!

Be careful... net-next uses patchwork, and I suspect as this is posted
as a series which the subject line states as being destined by the
author for the "net-next" tree, the entire series will end up being
slurped into the net-next tree.

https://www.kernel.org/doc/html/v5.10/networking/netdev-FAQ.html#q-how-do-i-indicate-which-tree-net-vs-net-next-my-patch-should-be-in

This patch is still marked as "new" in patchwork:

https://patchwork.kernel.org/project/netdevbpf/patch/20230605025211.743823-3-jiawenwu@trustnetic.com/

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
