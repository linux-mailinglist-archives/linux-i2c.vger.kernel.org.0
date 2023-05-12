Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0BB8700394
	for <lists+linux-i2c@lfdr.de>; Fri, 12 May 2023 11:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240120AbjELJXS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 May 2023 05:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240134AbjELJXR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 May 2023 05:23:17 -0400
Received: from smtpbg153.qq.com (smtpbg153.qq.com [13.245.218.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE86510E6E;
        Fri, 12 May 2023 02:23:09 -0700 (PDT)
X-QQ-mid: Yeas47t1683883342t577t04990
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [125.119.253.217])
X-QQ-SSF: 00400000000000F0FNF000000000000
From:   =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 8874636376421433107
To:     "'Piotr Raczynski'" <piotr.raczynski@intel.com>
Cc:     <netdev@vger.kernel.org>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <Jose.Abreu@synopsys.com>, <andrew@lunn.ch>,
        <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <linux-i2c@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <mengyuanlou@net-swift.com>
References: <20230509022734.148970-1-jiawenwu@trustnetic.com> <20230509022734.148970-9-jiawenwu@trustnetic.com> <ZF1Q9Tc6wHKhnp/q@nimitz>
In-Reply-To: <ZF1Q9Tc6wHKhnp/q@nimitz>
Subject: RE: [PATCH net-next v7 8/9] net: txgbe: Implement phylink pcs
Date:   Fri, 12 May 2023 17:22:21 +0800
Message-ID: <000101d984b3$4185cb00$c4916100$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQJdw4zS3rpHMobUlf9gBLGLbLpYXQKo2A7sAqLh+tmuI4Dp8A==
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FROM_EXCESS_BASE64,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Friday, May 12, 2023 4:33 AM, Piotr Raczynski wrote:
> > +static int txgbe_mdio_pcs_init(struct txgbe *txgbe)
> > +{
> > +	struct mdio_device *mdiodev;
> > +	struct wx *wx = txgbe->wx;
> > +	struct mii_bus *mii_bus;
> > +	struct dw_xpcs *xpcs;
> > +	struct pci_dev *pdev;
> > +	int ret = 0;
> > +
> > +	pdev = wx->pdev;
> > +
> > +	mii_bus = devm_mdiobus_alloc(&pdev->dev);
> > +	if (!mii_bus)
> > +		return -ENOMEM;
> > +
> > +	mii_bus->name = "txgbe_pcs_mdio_bus";
> > +	mii_bus->read_c45 = &txgbe_pcs_read;
> > +	mii_bus->write_c45 = &txgbe_pcs_write;
> > +	mii_bus->parent = &pdev->dev;
> > +	mii_bus->phy_mask = ~0;
> > +	mii_bus->priv = wx;
> > +	snprintf(mii_bus->id, MII_BUS_ID_SIZE, "txgbe_pcs-%x",
> > +		 (pdev->bus->number << 8) | pdev->devfn);
> > +
> > +	ret = devm_mdiobus_register(&pdev->dev, mii_bus);
> > +	if (ret)
> > +		return ret;
> > +
> > +	mdiodev = mdio_device_create(mii_bus, 0);
> > +	if (IS_ERR(mdiodev))
> > +		return PTR_ERR(mdiodev);
> > +
> > +	xpcs = xpcs_create(mdiodev, PHY_INTERFACE_MODE_10GBASER);
> > +	if (IS_ERR_OR_NULL(xpcs)) {
> > +		mdio_device_free(mdiodev);
> > +		return PTR_ERR(xpcs);
> > +	}
> 
> xpcs_create does not seem to return NULL but if it would then you'd
> return success here. Is this intentional?

Should be if (IS_ERR(xpcs)) ...

> 
> > +
> > +	txgbe->mdiodev = mdiodev;
> > +	txgbe->xpcs = xpcs;
> > +
> > +	return 0;
> > +}
> 

