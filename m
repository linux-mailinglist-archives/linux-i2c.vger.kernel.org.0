Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8696F01BE
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Apr 2023 09:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242997AbjD0H3J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Apr 2023 03:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243157AbjD0H2v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Apr 2023 03:28:51 -0400
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E054340F7;
        Thu, 27 Apr 2023 00:28:36 -0700 (PDT)
X-QQ-mid: Yeas3t1682580339t376t10758
Received: from 7082A6556EBF4E69829842272A565F7C (jiawenwu@trustnetic.com [183.129.236.74])
X-QQ-SSF: 00400000000000F0FM9000000000000
From:   =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 1635896112752538152
To:     "'Andy Shevchenko'" <andy.shevchenko@gmail.com>
Cc:     <netdev@vger.kernel.org>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <linux-i2c@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <mengyuanlou@net-swift.com>
References: <20230426071434.452717-1-jiawenwu@trustnetic.com> <20230426071434.452717-3-jiawenwu@trustnetic.com> <ZElCHGho-szyySGC@surfacebook> <013a01d978ae$182104c0$48630e40$@trustnetic.com> <CAHp75Vdnm1bykoX5Dh9nen7jB5bGfLELw0PvXBcqs1PXTf31rA@mail.gmail.com>
In-Reply-To: <CAHp75Vdnm1bykoX5Dh9nen7jB5bGfLELw0PvXBcqs1PXTf31rA@mail.gmail.com>
Subject: RE: [RFC PATCH net-next v5 2/9] i2c: designware: Add driver support for Wangxun 10Gb NIC
Date:   Thu, 27 Apr 2023 15:25:37 +0800
Message-ID: <015801d978d9$7683b640$638b22c0$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQImNz20YbZMzc6JsoYnjpKQN5RngQGupjOHAxyjlVQB6RzklAJXgiIQrlzjerA=
Content-Language: zh-cn
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvr:qybglogicsvr5
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FROM_EXCESS_BASE64,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> You can share a common data structure between the mother driver and
> her children. In that case you may access it via
> `dev_get_drvdata(pdev.dev->parent)` call.
> 

Unfortunately, the driver data already stores the private structure of the
adapter, so no more data can be stored.


