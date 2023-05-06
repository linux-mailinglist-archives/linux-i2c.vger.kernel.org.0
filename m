Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2121B6F90E6
	for <lists+linux-i2c@lfdr.de>; Sat,  6 May 2023 11:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjEFJa0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 6 May 2023 05:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjEFJaZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 6 May 2023 05:30:25 -0400
X-Greylist: delayed 93602 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 06 May 2023 02:30:08 PDT
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE13B8A60;
        Sat,  6 May 2023 02:30:07 -0700 (PDT)
X-QQ-mid: Yeas43t1683365356t276t13906
Received: from 7082A6556EBF4E69829842272A565F7C (jiawenwu@trustnetic.com [36.24.99.3])
X-QQ-SSF: 00400000000000F0FMF000000000000
From:   =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 12391180583042309501
To:     <andy.shevchenko@gmail.com>
Cc:     <netdev@vger.kernel.org>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <Jose.Abreu@synopsys.com>, <andrew@lunn.ch>,
        <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <linux-i2c@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <mengyuanlou@net-swift.com>
References: <20230505074228.84679-1-jiawenwu@trustnetic.com> <20230505074228.84679-3-jiawenwu@trustnetic.com> <ZFVPYSKfvQq3WeeO@surfacebook> <ZFViufP6qh79C1-T@surfacebook>
In-Reply-To: <ZFViufP6qh79C1-T@surfacebook>
Subject: RE: [RFC PATCH net-next v6 2/9] i2c: designware: Add driver support for Wangxun 10Gb NIC
Date:   Sat, 6 May 2023 17:29:15 +0800
Message-ID: <000001d97ffd$39ae2db0$ad0a8910$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQDsFpk5SrKUGrGdHIjrRExvlw6PFQJ3wA8LASWLNdABg1HF47D+jr2A
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

On Saturday, May 6, 2023 4:11 AM, andy.shevchenko@gmail.com wrote:
> Fri, May 05, 2023 at 09:48:01PM +0300, andy.shevchenko@gmail.com kirjoitti:
> > Fri, May 05, 2023 at 03:42:21PM +0800, Jiawen Wu kirjoitti:
> 
> ...
> 
> > > +	device_property_read_u32(&pdev->dev, "wx,i2c-snps-model", &dev->flags);
> >
> > I believe in your case it should be named something like
> > "linux,i2c-synopsys-platform". But in any case this I leave
> > to the more experienced people.
> 
> Or "snps,i2c-platform", I dunno...

I thought you wanted me to introduce a property specific to my device,
so I named it "wx,...". But if it's a universal property for platform device,
maybe it's necessary to check if flag is NULL, otherwise the second result
will overwrite it.

