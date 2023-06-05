Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 038B47220B8
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 10:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjFEIOa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 04:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbjFEIO3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 04:14:29 -0400
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCFECA1;
        Mon,  5 Jun 2023 01:14:25 -0700 (PDT)
X-QQ-mid: Yeas50t1685952763t318t21946
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [60.177.99.31])
X-QQ-SSF: 00400000000000F0FPF000000000000
From:   =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 11751809325026712248
To:     "'Wolfram Sang'" <wsa@kernel.org>
Cc:     <netdev@vger.kernel.org>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <Jose.Abreu@synopsys.com>, <andrew@lunn.ch>,
        <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <linux-i2c@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <mengyuanlou@net-swift.com>,
        "'Piotr Raczynski'" <piotr.raczynski@intel.com>
References: <20230605025211.743823-1-jiawenwu@trustnetic.com> <20230605025211.743823-3-jiawenwu@trustnetic.com> <ZH2IaM86ei2gQkfA@shikoro> <00c901d9977e$af0dc910$0d295b30$@trustnetic.com> <ZH2UT55SRNwN15t7@shikoro>
In-Reply-To: <ZH2UT55SRNwN15t7@shikoro>
Subject: RE: [PATCH net-next v11 2/9] i2c: designware: Add driver support for Wangxun 10Gb NIC
Date:   Mon, 5 Jun 2023 16:12:42 +0800
Message-ID: <00eb01d99785$8059beb0$810d3c10$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQKoIYpMsU3pQxi84WWC4YPAy6bqVAIyHk5AAe8WB/YDFYJsZwGgoPRlrZgJMUA=
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FROM_EXCESS_BASE64,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Monday, June 5, 2023 3:53 PM, Wolfram Sang wrote:
> > Do you mean the device tree binding? This property in only used in case of software
> > node, for wangxun Soc, which has no device tree structure.
> 
> I see, thanks.
> 
> How is the dependency of these patches? I'd like to take this patch via
> the i2c tree if possible. I guess the other patches will build even if
> this patch is not in the net-tree? Or do we need an immutable branch? Or
> is it really better if all goes in via net? We might get merge conflicts
> then, though. There are other designware patches pending.


Yes, other patches will build even without this patch. But SFP will not work.
This patch series implement I2C, GPIO, SFP and PHYLINK. The support of SFP
is dependent on I2C and GPIO. If these patches will be end up merging in the
same upstream version, it's not a problem to merge them in different trees,
I think.

