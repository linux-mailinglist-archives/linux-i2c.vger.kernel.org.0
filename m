Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 482EA6FD764
	for <lists+linux-i2c@lfdr.de>; Wed, 10 May 2023 08:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235969AbjEJGtN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 May 2023 02:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236114AbjEJGtM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 May 2023 02:49:12 -0400
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD004230;
        Tue,  9 May 2023 23:49:08 -0700 (PDT)
X-QQ-mid: Yeas54t1683701271t870t28039
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [125.119.253.217])
X-QQ-SSF: 00400000000000F0FNF000000000000
From:   =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 306390345786609964
To:     "'Simon Horman'" <simon.horman@corigine.com>
Cc:     <netdev@vger.kernel.org>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <Jose.Abreu@synopsys.com>, <andrew@lunn.ch>,
        <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <linux-i2c@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <mengyuanlou@net-swift.com>
References: <20230509022734.148970-1-jiawenwu@trustnetic.com> <20230509022734.148970-4-jiawenwu@trustnetic.com> <ZFpnfNy2NSYNwUyI@corigine.com>
In-Reply-To: <ZFpnfNy2NSYNwUyI@corigine.com>
Subject: RE: [PATCH net-next v7 3/9] net: txgbe: Register fixed rate clock
Date:   Wed, 10 May 2023 14:47:50 +0800
Message-ID: <009e01d9830b$56f1daf0$04d590d0$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJdw4zS3rpHMobUlf9gBLGLbLpYXQIKQeubAeFNPY+uKzJMoA==
Content-Language: zh-cn
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FROM_EXCESS_BASE64,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tuesday, May 9, 2023 11:32 PM, Simon Horman wrote:
> On Tue, May 09, 2023 at 10:27:28AM +0800, Jiawen Wu wrote:
> > In order for I2C to be able to work in standard mode, register a fixed
> > rate clock for each I2C device.
> >
> > Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>
> 
> ...
> 
> > @@ -70,6 +72,32 @@ static int txgbe_swnodes_register(struct txgbe *txgbe)
> >  	return software_node_register_node_group(nodes->group);
> >  }
> >
> > +static int txgbe_clock_register(struct txgbe *txgbe) {
> > +	struct pci_dev *pdev = txgbe->wx->pdev;
> > +	struct clk_lookup *clock;
> > +	char clk_name[32];
> > +	struct clk *clk;
> > +
> > +	snprintf(clk_name, sizeof(clk_name), "i2c_designware.%d",
> > +		 (pdev->bus->number << 8) | pdev->devfn);
> > +
> > +	clk = clk_register_fixed_rate(NULL, clk_name, NULL, 0, 156250000);
> > +	if (IS_ERR(clk))
> > +		return PTR_ERR(clk);
> > +
> > +	clock = clkdev_create(clk, NULL, clk_name);
> > +	if (!clock) {
> > +		clk_unregister(clk);
> > +		return PTR_ERR(clock);
> 
> Hi Jiawen,
> 
> Sorry for missing this earlier, but the above error handling doesn't seem right.
> 
>    * This error condition is met if clock == NULL
>    * So the above is returning PTR_ERR(NULL), which is a yellow flag to me.
>      In any case, PTR_ERR(NULL) => 0 is returned on error.
>    * The caller treats a 0 return value as success.
> 
>    Perhaps this should be: return -ENOMEM?

No problem, I will fix it in patch v8.

> 
> > +	}
> > +
> > +	txgbe->clk = clk;
> > +	txgbe->clock = clock;
> > +
> > +	return 0;
> > +}
> > +
> >  int txgbe_init_phy(struct txgbe *txgbe)  {
> >  	int ret;
> > @@ -80,10 +108,23 @@ int txgbe_init_phy(struct txgbe *txgbe)
> >  		return ret;
> >  	}
> >
> > +	ret = txgbe_clock_register(txgbe);
> > +	if (ret) {
> > +		wx_err(txgbe->wx, "failed to register clock: %d\n", ret);
> > +		goto err_unregister_swnode;
> > +	}
> > +
> >  	return 0;
> 
> ...
> 

