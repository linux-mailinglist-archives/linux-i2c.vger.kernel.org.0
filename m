Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE71F6F8A03
	for <lists+linux-i2c@lfdr.de>; Fri,  5 May 2023 22:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbjEEUKk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 May 2023 16:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjEEUKj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 May 2023 16:10:39 -0400
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1983DB1
        for <linux-i2c@vger.kernel.org>; Fri,  5 May 2023 13:10:37 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id e43ea10f-eb80-11ed-a9de-005056bdf889;
        Fri, 05 May 2023 23:10:35 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Fri, 5 May 2023 23:10:33 +0300
To:     andy.shevchenko@gmail.com
Cc:     Jiawen Wu <jiawenwu@trustnetic.com>, netdev@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, mengyuanlou@net-swift.com
Subject: Re: [RFC PATCH net-next v6 2/9] i2c: designware: Add driver support
 for Wangxun 10Gb NIC
Message-ID: <ZFViufP6qh79C1-T@surfacebook>
References: <20230505074228.84679-1-jiawenwu@trustnetic.com>
 <20230505074228.84679-3-jiawenwu@trustnetic.com>
 <ZFVPYSKfvQq3WeeO@surfacebook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFVPYSKfvQq3WeeO@surfacebook>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fri, May 05, 2023 at 09:48:01PM +0300, andy.shevchenko@gmail.com kirjoitti:
> Fri, May 05, 2023 at 03:42:21PM +0800, Jiawen Wu kirjoitti:

...

> > +	device_property_read_u32(&pdev->dev, "wx,i2c-snps-model", &dev->flags);
> 
> I believe in your case it should be named something like
> "linux,i2c-synopsys-platform". But in any case this I leave
> to the more experienced people.

Or "snps,i2c-platform", I dunno...

-- 
With Best Regards,
Andy Shevchenko


