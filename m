Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0BE66FD87F
	for <lists+linux-i2c@lfdr.de>; Wed, 10 May 2023 09:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235856AbjEJHrn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 May 2023 03:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235609AbjEJHrm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 May 2023 03:47:42 -0400
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C2AE5D
        for <linux-i2c@vger.kernel.org>; Wed, 10 May 2023 00:47:40 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id eeae663e-ef06-11ed-a9de-005056bdf889;
        Wed, 10 May 2023 10:47:38 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Wed, 10 May 2023 10:47:37 +0300
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     'Piotr Raczynski' <piotr.raczynski@intel.com>,
        netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com
Subject: Re: [PATCH net-next v7 2/9] i2c: designware: Add driver support for
 Wangxun 10Gb NIC
Message-ID: <ZFtMGTLiivnlrN1e@surfacebook>
References: <20230509022734.148970-1-jiawenwu@trustnetic.com>
 <20230509022734.148970-3-jiawenwu@trustnetic.com>
 <ZFpQF4hi0FciwQsj@nimitz>
 <009d01d9830a$c7c6dab0$57549010$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <009d01d9830a$c7c6dab0$57549010$@trustnetic.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wed, May 10, 2023 at 02:43:50PM +0800, Jiawen Wu kirjoitti:
> On Tuesday, May 9, 2023 9:52 PM, Piotr Raczynski wrote:
> > On Tue, May 09, 2023 at 10:27:27AM +0800, Jiawen Wu wrote:

...

> > >  	/*
> > > -	 * Initiate I2C message transfer when AMD NAVI GPU card is enabled,
> > > +	 * Initiate I2C message transfer when polling mode is enabled,
> > >  	 * As it is polling based transfer mechanism, which does not support
> > >  	 * interrupt based functionalities of existing DesignWare driver.
> > >  	 */
> > > -	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
> > > +	switch (dev->flags & MODEL_MASK) {
> > > +	case MODEL_AMD_NAVI_GPU:
> > >  		ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
> > >  		goto done_nolock;
> > > +	case MODEL_WANGXUN_SP:
> > > +		ret = txgbe_i2c_dw_xfer_quirk(adap, msgs, num);
> > > +		goto done_nolock;
> > > +	default:
> > > +		break;
> > >  	}
> > Nit pick, when I first saw above code it looked a little weird,
> > maybe it would be a little clearer with:
> > 
> > 	if (i2c_dw_is_model_poll(dev)) {
> > 		switch (dev->flags & MODEL_MASK) {
> > 		case MODEL_AMD_NAVI_GPU:
> > 			ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
> > 			break;
> > 		case MODEL_WANGXUN_SP:
> > 			ret = txgbe_i2c_dw_xfer_quirk(adap, msgs, num);
> > 			break;
> > 		default:
> > 			break;
> > 		}
> > 		goto done_nolock;
> > 	}
> > 
> > I do not insist though.
> 
> Sure, it looks more obvious as polling mode quirk.

I don't think we need a double checks. The i2c_dw_is_model_poll() will repeat
the switch. Please, leave it as is in your current version.


-- 
With Best Regards,
Andy Shevchenko


