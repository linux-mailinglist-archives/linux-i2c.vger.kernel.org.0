Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F69B63C056
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Nov 2022 13:53:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234652AbiK2MxR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Nov 2022 07:53:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234622AbiK2MxQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Nov 2022 07:53:16 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8069ACE35;
        Tue, 29 Nov 2022 04:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669726395; x=1701262395;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4TIcraaCxf/dMYd1sdlaTzEiJLlznhpgFTgyakz4LBY=;
  b=FjdccjaDWoEKM+s63Ts/JlMlIlbgWny8we3oQ9a01Ksb/AWKxJjbkvmc
   hWFQA2Dfqt3Ggd3NBJEIe2uW96Gmry7deCqLZR2OiOwCra27YQkx0T1Dm
   Rm0452OyddNXp2++HcWEiBXPngvLCDTUbdUKhA5FjNQl03FL555eDlKcI
   EYW2T1SriLSRf1J12xYe+w+8dr1xhbOKhr3T5JjBR0GslFOE8c9wavK8l
   gZ+rWy2eL0AXmM4MGZfiE5lnLTZn9r2xwx2B2VYg53RuD0cmlOs7l+g5e
   RHstbEPmraxHkUZXVV23iZlPSKkLhq+ftU4F0GQq71B7Q9WC5g3LhkYi1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="401389048"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="401389048"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2022 04:53:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="637581976"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="637581976"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 29 Nov 2022 04:53:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p006n-001hw1-2a;
        Tue, 29 Nov 2022 14:53:09 +0200
Date:   Tue, 29 Nov 2022 14:53:09 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
Subject: Re: [PATCH V3 4/5] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
 controller
Message-ID: <Y4YAtWgQieDJV1bG@smile.fi.intel.com>
References: <cover.1669359515.git.zhoubinbin@loongson.cn>
 <822356908305580d601e5b3e424371ed7f220b85.1669359515.git.zhoubinbin@loongson.cn>
 <Y4Cb19PM97M9HaiB@smile.fi.intel.com>
 <8b0e2e61-2e54-127e-7cb8-9e1068dbc390@loongson.cn>
 <Y4S2cnlAm3YYvZ8E@smile.fi.intel.com>
 <ada74168-4aef-b73e-ec47-437dfcdcea77@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ada74168-4aef-b73e-ec47-437dfcdcea77@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 29, 2022 at 07:34:58PM +0800, Binbin Zhou wrote:
> 在 2022/11/28 21:24, Andy Shevchenko 写道:
> > On Mon, Nov 28, 2022 at 08:03:40PM +0800, Binbin Zhou wrote:
> > > 在 2022/11/25 18:41, Andy Shevchenko 写道:
> > > > On Fri, Nov 25, 2022 at 04:55:20PM +0800, Binbin Zhou wrote:

...

> > > > > +static int ls2x_i2c_start(struct i2c_adapter *adap, struct i2c_msg *msgs)
> > > > > +{
> > > > > +	struct ls2x_i2c_dev *dev = i2c_get_adapdata(adap);
> > > > > +	unsigned char addr = i2c_8bit_addr_from_msg(msgs);
> > > > > +
> > > > > +	reinit_completion(&dev->cmd_complete);
> > > > > +	addr |= (msgs->flags & I2C_M_RD) ? 1 : 0;
> > > > Why is this needed?
> > > In the ls2x I2C controller, the bit 0 of TXR indicates the read/write status
> > > when transferring the address.
> > Yes, I understand this. I don't understand why do you need this twice.
> 
> Are you saying that the "is_read" variable in ls2x_i2c_xfer_one() already
> indicates the read/write state of data transfer?
> 
> I just didn't think it was necessary to take "is_read" as an argument to
> ls2x_i2c_start() at the time, since we could get it from "msg".

Have you checked what i2c_8bit_addr_from_msg() is doing?

-- 
With Best Regards,
Andy Shevchenko


