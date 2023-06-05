Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAA5E721F7A
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 09:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbjFEHY5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 03:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbjFEHY5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 03:24:57 -0400
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1880AD;
        Mon,  5 Jun 2023 00:24:54 -0700 (PDT)
X-QQ-mid: Yeas50t1685949835t198t22141
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [60.177.99.31])
X-QQ-SSF: 00400000000000F0FPF000000000000
From:   =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 10775698858849154079
To:     "'Wolfram Sang'" <wsa@kernel.org>
Cc:     <netdev@vger.kernel.org>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <Jose.Abreu@synopsys.com>, <andrew@lunn.ch>,
        <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <linux-i2c@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <mengyuanlou@net-swift.com>,
        "'Piotr Raczynski'" <piotr.raczynski@intel.com>
References: <20230605025211.743823-1-jiawenwu@trustnetic.com> <20230605025211.743823-3-jiawenwu@trustnetic.com> <ZH2IaM86ei2gQkfA@shikoro>
In-Reply-To: <ZH2IaM86ei2gQkfA@shikoro>
Subject: RE: [PATCH net-next v11 2/9] i2c: designware: Add driver support for Wangxun 10Gb NIC
Date:   Mon, 5 Jun 2023 15:23:54 +0800
Message-ID: <00c901d9977e$af0dc910$0d295b30$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQKoIYpMsU3pQxi84WWC4YPAy6bqVAIyHk5AAe8WB/atva9VMA==
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

On Monday, June 5, 2023 3:02 PM, Wolfram Sang wrote:
> Hi,
> 
> On Mon, Jun 05, 2023 at 10:52:04AM +0800, Jiawen Wu wrote:
> > Wangxun 10Gb ethernet chip is connected to Designware I2C, to communicate
> > with SFP.
> >
> > Introduce the property "wx,i2c-snps-model" to match device data for Wangxun
> 
> Does this not need some binding documentation somewhere?

Do you mean the device tree binding? This property in only used in case of software
node, for wangxun Soc, which has no device tree structure.

> 
> > in software node case. Since IO resource was mapped on the ethernet driver,
> > add a model quirk to get regmap from parent device.
> 
> All the best,
> 
>    Wolfram


