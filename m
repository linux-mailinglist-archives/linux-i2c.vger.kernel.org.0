Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD8B70433D
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 04:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjEPCGy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 May 2023 22:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjEPCGw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 May 2023 22:06:52 -0400
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B11E7170C;
        Mon, 15 May 2023 19:06:48 -0700 (PDT)
X-QQ-mid: Yeas53t1684202741t978t35480
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [115.200.228.151])
X-QQ-SSF: 00400000000000F0FNF000000000000
From:   =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 15439936890566492054
To:     "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
Cc:     <netdev@vger.kernel.org>, <jarkko.nikula@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <Jose.Abreu@synopsys.com>, <andrew@lunn.ch>,
        <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <linux-i2c@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <mengyuanlou@net-swift.com>
References: <20230515063200.301026-1-jiawenwu@trustnetic.com> <20230515063200.301026-7-jiawenwu@trustnetic.com> <ZGKlzFXfqCuq3s8u@smile.fi.intel.com>
In-Reply-To: <ZGKlzFXfqCuq3s8u@smile.fi.intel.com>
Subject: RE: [PATCH net-next v8 6/9] net: txgbe: Support GPIO to SFP socket
Date:   Tue, 16 May 2023 10:05:41 +0800
Message-ID: <00c601d9879a$ea72dd90$bf5898b0$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQHvj8QD3pC+6Aq9H9h6P1+q5LrHRgMH5FTyAp2u/k6vAui8QA==
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

On Tuesday, May 16, 2023 5:36 AM, Andy Shevchenko wrote:
> On Mon, May 15, 2023 at 02:31:57PM +0800, Jiawen Wu wrote:
> > Register GPIO chip and handle GPIO IRQ for SFP socket.
> 
> ...
> 
> > +	spin_lock_init(&wx->gpio_lock);
> 
> Almost forgot to ask, are you planning to use this GPIO part on PREEMPT_RT
> kernels? Currently you will get a splat in case IRQ is fired.

Hmmm, I don't know much about this. Should I use raw_spinlock_t instead of
spinlock_t?

