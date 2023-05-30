Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E83F2715C24
	for <lists+linux-i2c@lfdr.de>; Tue, 30 May 2023 12:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbjE3KqZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 May 2023 06:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231689AbjE3Kps (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 May 2023 06:45:48 -0400
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7965B102
        for <linux-i2c@vger.kernel.org>; Tue, 30 May 2023 03:45:29 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id 0eace6de-fed7-11ed-a9de-005056bdf889;
        Tue, 30 May 2023 13:45:15 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Tue, 30 May 2023 13:45:13 +0300
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>,
        'Hans de Goede' <hdegoede@redhat.com>,
        netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, mengyuanlou@net-swift.com,
        'Piotr Raczynski' <piotr.raczynski@intel.com>
Subject: Re: [PATCH net-next v9 1/9] net: txgbe: Add software nodes to
 support phylink
Message-ID: <ZHXTuejpG6OfipUw@surfacebook>
References: <20230524091722.522118-1-jiawenwu@trustnetic.com>
 <20230524091722.522118-2-jiawenwu@trustnetic.com>
 <ZHHC6OGH9NJZgRfA@smile.fi.intel.com>
 <038901d992bd$863a6b30$92af4190$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <038901d992bd$863a6b30$92af4190$@trustnetic.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Tue, May 30, 2023 at 02:11:08PM +0800, Jiawen Wu kirjoitti:
> On Saturday, May 27, 2023 4:44 PM, Andy Shevchenko wrote:
> > On Wed, May 24, 2023 at 05:17:14PM +0800, Jiawen Wu wrote:

...

> > > +int txgbe_init_phy(struct txgbe *txgbe)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = txgbe_swnodes_register(txgbe);
> > > +	if (ret) {
> > > +		wx_err(txgbe->wx, "failed to register software nodes\n");
> > 
> > > +		return ret;
> > > +	}
> > > +
> > > +	return 0;
> > 
> > These 4 lines can be as simple as
> > 
> > 	return ret;
> 
> This function is going to be extended with later patches, is it necessary to
> simply it here?

Nope, thank you for elaboration.

> > > +}

-- 
With Best Regards,
Andy Shevchenko


