Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B05BC5A136B
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Aug 2022 16:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235500AbiHYOXN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Aug 2022 10:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240597AbiHYOW5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Aug 2022 10:22:57 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47DC1B6002;
        Thu, 25 Aug 2022 07:22:54 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="294250050"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="294250050"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 07:22:53 -0700
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="678478234"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 07:22:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1oRDks-003QS2-37;
        Thu, 25 Aug 2022 17:22:46 +0300
Date:   Thu, 25 Aug 2022 17:22:46 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Tharunkumar.Pasumarthi@microchip.com
Cc:     jsd@semihalf.com, wsa@kernel.org, krzk@kernel.org,
        sven@svenpeter.dev, linux-kernel@vger.kernel.org,
        semen.protsenko@linaro.org, robh@kernel.org, olof@lixom.net,
        UNGLinuxDriver@microchip.com, jarkko.nikula@linux.intel.com,
        arnd@arndb.de, linux-i2c@vger.kernel.org, rafal@milecki.pl
Subject: Re: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Message-ID: <YweFttaSE2GOoW83@smile.fi.intel.com>
References: <20220823145603.2606475-1-tharunkumar.pasumarthi@microchip.com>
 <YwTsnCdxM5I6BoJu@smile.fi.intel.com>
 <80debd4bbf819cbfa16681172919436df476558a.camel@microchip.com>
 <CAHp75VevAifCp_Bz5HN1MmGm7UEJWFR017kngzARfBh+Z8aAAA@mail.gmail.com>
 <787644272b3b260980ff8b9efc317ce3194b0acc.camel@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <787644272b3b260980ff8b9efc317ce3194b0acc.camel@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 25, 2022 at 01:15:42PM +0000, Tharunkumar.Pasumarthi@microchip.com wrote:
> On Wed, 2022-08-24 at 21:31 +0300, Andy Shevchenko wrote:
> > On Wed, Aug 24, 2022 at 6:04 PM <Tharunkumar.Pasumarthi@microchip.com> wrote:
> > > On Tue, 2022-08-23 at 18:05 +0300, Andy Shevchenko wrote:
> > > > On Tue, Aug 23, 2022 at 08:26:03PM +0530, Tharun Kumar P wrote:

...

> > > > > +#define SMB_IDLE_SCALING_100KHZ              0x03E803C9
> > > > > +#define SMB_IDLE_SCALING_400KHZ              0x01F4009D
> > > > > +#define SMB_IDLE_SCALING_1000KHZ     0x01F4009D
> > > > 
> > > > Shouldn't these magics be decimals?
> > 
> > This Q seems unanswered.
> 
> These magic numbers need not be decimals. Configuring registers with these
> values in driver will set the time in device. However, these values do not
> convey any meaning when represented in decimals.

Hmm... Maybe you don't see this, but I see the following:

0x03E803C9 = 65536 (i.e. 2^16) * 1000 + 969
0x01F4009D = 32768 (i.e. 2^15) * 1000 + 157

Pretty much sounds like a bit 15 for standard mode and bit 16 for fast modes
shifted by 1000 to have a room for the time in presumably nanoseconds up to 1
us.

Please, dig up into the documentation, vendor chat, etc to get more information
on these values.

> > > > Ditto for the rest similar stuff.
> > > 
> > > There is no direct correlation between the hex value and time. Configuring
> > > registers with these values in driver will set the time in device.

...

> > > > > +#define I2C_DIR_WRITE                0
> > > > > +#define I2C_DIR_READ         1
> > 
> > https://elixir.bootlin.com/linux/v6.0-rc2/source/include/uapi/linux/i2c.h#L24
> 
> I2C_M_RD is used in driver. But the purpose of these MACROs is different.
> I2C_DIR_WRITE is used inside both pci1xxxx_i2c_write as well as in
> pci1xxxx_i2c_read (for sending slave address). Thus these MACROs are required

OK. Name collision still stays.

> > > > Namespace collision. Doesn't I²C core provide these?
> > > 
> > > I am unable to find any existing MACROs for WRITE and READ in I2C core.
> > > Kindly let me know the MACROs

-- 
With Best Regards,
Andy Shevchenko


