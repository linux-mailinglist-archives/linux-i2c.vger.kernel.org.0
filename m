Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50BF3706412
	for <lists+linux-i2c@lfdr.de>; Wed, 17 May 2023 11:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbjEQJ0f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 May 2023 05:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbjEQJ0X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 May 2023 05:26:23 -0400
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E38A1BDF;
        Wed, 17 May 2023 02:26:16 -0700 (PDT)
X-QQ-mid: Yeas43t1684315520t373t35437
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [115.200.228.151])
X-QQ-SSF: 00400000000000F0FNF000000000000
From:   =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 8844894636701214289
To:     "'Jarkko Nikula'" <jarkko.nikula@linux.intel.com>,
        <andy.shevchenko@gmail.com>
Cc:     <netdev@vger.kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <Jose.Abreu@synopsys.com>, <andrew@lunn.ch>,
        <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <linux-i2c@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <mengyuanlou@net-swift.com>,
        "'Piotr Raczynski'" <piotr.raczynski@intel.com>
References: <20230515063200.301026-1-jiawenwu@trustnetic.com> <20230515063200.301026-3-jiawenwu@trustnetic.com> <ZGH6TmeiR0icT6Tc@surfacebook> <85d058cd-2dd9-2a7b-efd0-e4c8d512ae29@linux.intel.com>
In-Reply-To: <85d058cd-2dd9-2a7b-efd0-e4c8d512ae29@linux.intel.com>
Subject: RE: [PATCH net-next v8 2/9] i2c: designware: Add driver support for Wangxun 10Gb NIC
Date:   Wed, 17 May 2023 17:25:19 +0800
Message-ID: <018c01d988a1$7f97fe80$7ec7fb80$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQHvj8QD3pC+6Aq9H9h6P1+q5LrHRgKu1PaqAbSfKI4Bi4y3m68Cpizw
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

On Wednesday, May 17, 2023 4:49 PM, Jarkko Nikula wrote:
> On 5/15/23 12:24, andy.shevchenko@gmail.com wrote:
> > Mon, May 15, 2023 at 02:31:53PM +0800, Jiawen Wu kirjoitti:
> >> Wangxun 10Gb ethernet chip is connected to Designware I2C, to communicate
> >> with SFP.
> >>
> >> Introduce the property "snps,i2c-platform" to match device data for Wangxun
> >> in software node case. Since IO resource was mapped on the ethernet driver,
> >> add a model quirk to get regmap from parent device.
> >>
> >> The exists IP limitations are dealt as workarounds:
> >> - IP does not support interrupt mode, it works on polling mode.
> >> - Additionally set FIFO depth address the chip issue.
> >
> > ...
> >
> >>   	dev->flags = (uintptr_t)device_get_match_data(&pdev->dev);
> >> +	if (device_property_present(&pdev->dev, "snps,i2c-platform"))
> >> +		dev->flags |= MODEL_WANGXUN_SP;
> >
> > What I meant here is to use device_property_present() _iff_ you have decided to
> > go with the _vendor-specific_ property name.
> >
> > Otherwise it should be handled differently, i.e. with reading the actual value
> > of that property. Hence it should correspond the model enum, which you need to
> > declare in the Device Tree bindings before use.
> >
> > So, either
> >
> > 	if (device_property_present(&pdev->dev, "wx,..."))
> > 		dev->flags |= MODEL_WANGXUN_SP;
> >
> > or
> >
> > 	if ((dev->flags & MODEL_MASK) == MODEL_NONE) {
> > 	// you now have to distinguish that there is no model set in driver data
> > 		u32 model;
> >
> > 		ret = device_property_read_u32(dev, "snps,i2c-platform");
> > 		if (ret) {
> > 			...handle error...
> > 		}
> > 		dev->flags |= model
> >
> I'm not a device tree expert but I wonder would it be possible somehow
> combine this and compatible properties in dw_i2c_of_match[]? They set
> model flag for MODEL_MSCC_OCELOT and MODEL_BAIKAL_BT1.

Maybe the table could be changed to match device property, instead of relying
on DT only. Or device_get_match_data() could be also implemented in
software node case?

> 
> Then I'm thinking is "snps,i2c-platform" descriptive enough name for a
> model and does it confuse with "snps,designware-i2c" compatible property?

I'd like to change the name back to "wx,i2c-snps-model" for the specific one.


