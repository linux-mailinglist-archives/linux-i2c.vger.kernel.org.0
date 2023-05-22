Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC20970B88B
	for <lists+linux-i2c@lfdr.de>; Mon, 22 May 2023 11:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbjEVJID (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 May 2023 05:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232447AbjEVJHu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 May 2023 05:07:50 -0400
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50990DC;
        Mon, 22 May 2023 02:07:43 -0700 (PDT)
X-QQ-mid: Yeas5t1684746410t956t64919
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [122.235.247.1])
X-QQ-SSF: 00400000000000F0FNF000000000000
From:   =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 6015390893035020288
To:     "'Andrew Lunn'" <andrew@lunn.ch>,
        "'Michael Walle'" <michael@walle.cc>
Cc:     "'Andy Shevchenko'" <andy.shevchenko@gmail.com>,
        <netdev@vger.kernel.org>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <Jose.Abreu@synopsys.com>, <hkallweit1@gmail.com>,
        <linux@armlinux.org.uk>, <linux-i2c@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <mengyuanlou@net-swift.com>
References: <20230515063200.301026-1-jiawenwu@trustnetic.com> <20230515063200.301026-7-jiawenwu@trustnetic.com> <ZGH-fRzbGd_eCASk@surfacebook> <00cd01d9879f$8e444950$aaccdbf0$@trustnetic.com> <CAHp75VdthEZL6GvT5Q=f7rbcDfA5XX=7-VLfVz1kZmBFem_eCA@mail.gmail.com> <016701d9886a$f9b415a0$ed1c40e0$@trustnetic.com> <90ef7fb8-feac-4288-98e9-6e67cd38cdf1@lunn.ch> <025b01d9897e$d8894660$899bd320$@trustnetic.com> <1e1615b3-566c-490c-8b1a-78f5521ca0b0@lunn.ch> <028601d989f9$230ee120$692ca360$@trustnetic.com> <f0b571ab-544b-49c3-948f-d592f931673b@lunn.ch> <005a01d98c8b$e48d2b60$ada78220$@trustnetic.com>
In-Reply-To: <005a01d98c8b$e48d2b60$ada78220$@trustnetic.com>
Subject: RE: [PATCH net-next v8 6/9] net: txgbe: Support GPIO to SFP socket
Date:   Mon, 22 May 2023 17:06:50 +0800
Message-ID: <005b01d98c8c$be718100$3b548300$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHvj8QD3pC+6Aq9H9h6P1+q5LrHRgMH5FTyAkITzAABJU2Y7wJ7xjhgAYjDQqsBr+FHUgDJ87o1AYTHtNcC/cxtnwIXsv+OAc8FI2Cuj0G0AA==
Content-Language: zh-cn
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

> And I still have doubts about what I said earlier:
> https://lore.kernel.org/netdev/20230515063200.301026-1-
> jiawenwu@trustnetic.com/T/#me1be68e1a1e44426ecc0dd8edf0f6b224e50630d

Sorry for paste error, the true link is:
https://lore.kernel.org/netdev/02ad01d98a2b$4cd080e0$e67182a0$@trustnetic.com/


