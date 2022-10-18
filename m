Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBA5E6031E6
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Oct 2022 20:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiJRSA7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Oct 2022 14:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbiJRSA6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Oct 2022 14:00:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E1D1147;
        Tue, 18 Oct 2022 11:00:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4B67DB8207D;
        Tue, 18 Oct 2022 18:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46F6C433C1;
        Tue, 18 Oct 2022 18:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666116055;
        bh=3T28Y+zOxmUbU8OV16B+xWWanpzLbMaHuPZMIF80EN8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KBmlmwt0ZvXgt16D8nxRoISWImyUZW+gDM0QFdUMNw/wwih2r4GVJ1GTM2PN/9omw
         wmid0NRPvJ70AlvPxjghdQhGRd6Klqs8lpb7Q+N687iDgPX46RCzx2fV9Q1kCUP0T0
         n4W6ySZpg1VTUoFTEHkSaaaDnw9d9bCSai5wH4Fd5ehZZ+MJFbsOJAJbl0E1I7FDIw
         qMxOX1nlVgvMRnihHtMBraFpA4JQgDvnn4riFhGG197fDKnJkvChH72GL0sYNT6Dqv
         /lpo+2QIEkT17sMYIlV/xZ3qkYdH2AIIzfIvXKOEM/fDXrdt0EI9auqMzBeJNpfQye
         QLERzYkv3+H/A==
Received: by pali.im (Postfix)
        id D84D476B; Tue, 18 Oct 2022 20:00:51 +0200 (CEST)
Date:   Tue, 18 Oct 2022 20:00:51 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Nam Cao <namcaov@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: add lis3lv02d's I2C address for Vostro 5568
Message-ID: <20221018180051.236tz4yxsdzrgguq@pali>
References: <20221006145440.10281-1-namcaov@gmail.com>
 <20221018193951.40787445@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221018193951.40787445@endymion.delvare>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tuesday 18 October 2022 19:39:51 Jean Delvare wrote:
> On Thu, 06 Oct 2022 16:54:40 +0200, Nam Cao wrote:
> > Dell Vostro 5568 laptop has lis3lv02d, but its i2c address is not known
> > to the kernel. Add this address.
> > 
> > Output of "cat /sys/devices/platform/lis3lv02d/position" on Dell Vostro
> > 5568 laptop:
> >     - Horizontal: (-18,0,1044)
> >     - Front elevated: (522,-18,1080)
> >     - Left elevated: (-18,-360,1080)
> >     - Upside down: (36,108,-1134)
> > 
> > Signed-off-by: Nam Cao <namcaov@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-i801.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> > index a176296f4fff..e46561e095c6 100644
> > --- a/drivers/i2c/busses/i2c-i801.c
> > +++ b/drivers/i2c/busses/i2c-i801.c
> > @@ -1243,6 +1243,7 @@ static const struct {
> >  	 */
> >  	{ "Latitude 5480",      0x29 },
> >  	{ "Vostro V131",        0x1d },
> > +	{ "Vostro 5568",        0x29 },
> >  };
> >  
> >  static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
> 
> Fine with me.
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 
> Pali, OK with you?

Yes, nice to see that other people discovered another hidden hardware
devices in their own laptops :-)

Reviewed-by: Pali Rohár <pali@kernel.org>


Nam Cao, could you check your ACPI DSDT table if there is not specified
this smbus/i2c address 0x29? Autodiscovery would be better than
hardcoding. At least for E6440 I was told that BIOS does not provide it.

> -- 
> Jean Delvare
> SUSE L3 Support
