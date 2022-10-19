Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8E9960519C
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Oct 2022 22:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbiJSUwq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 16:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbiJSUwp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 16:52:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 291F48B2EC;
        Wed, 19 Oct 2022 13:52:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B8AD3619A9;
        Wed, 19 Oct 2022 20:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEA9C433D7;
        Wed, 19 Oct 2022 20:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666212763;
        bh=vUMA+KIEyk/mYPhfmyufPAgBG9tekFxdVUbAeXTernc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p172OvXvWm/p6RKTQNulUGe+kEr9zh/MoX+B0PaLbFGYaCtEweB95zPuTVG2Dib1l
         3eFX65O9mcEtg8K+ZGAP095XFU0sXw8WRMWUB1ahMLe9bQd30eACPNLy1SGojiJ6bx
         2StzfEOxWFj/VapNszY8oJR1iiJPt3PHwx2aWbocpq77QdoMKxwwEFwaP8jdMHxKFW
         BLIMJ0d2sj7YrHYnxwofGtxSkWk12SozvzcJoSBDOoKNbhjPQ+Fn4L2r5tOLk3vRor
         wJzNnjI+xMcY8a4H4hUgt1TzUcJMmSSPrjaYmE/uZPclQaORMCIQ6T1/DwThLhI9xM
         QLVU4ggVcN+MQ==
Received: by pali.im (Postfix)
        id 07FC13AC; Wed, 19 Oct 2022 22:52:39 +0200 (CEST)
Date:   Wed, 19 Oct 2022 22:52:39 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Nam Cao <namcaov@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: add lis3lv02d's I2C address for Vostro 5568
Message-ID: <20221019205239.6n5sfqejtljlpyci@pali>
References: <20221006145440.10281-1-namcaov@gmail.com>
 <20221018193951.40787445@endymion.delvare>
 <20221018180051.236tz4yxsdzrgguq@pali>
 <20221019203403.GA149239@nam-dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221019203403.GA149239@nam-dell>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wednesday 19 October 2022 22:34:03 Nam Cao wrote:
> On Tue, Oct 18, 2022 at 08:00:51PM +0200, Pali Rohár wrote:
> > On Tuesday 18 October 2022 19:39:51 Jean Delvare wrote:
> > > On Thu, 06 Oct 2022 16:54:40 +0200, Nam Cao wrote:
> > > > Dell Vostro 5568 laptop has lis3lv02d, but its i2c address is not known
> > > > to the kernel. Add this address.
> > > > 
> > > > Output of "cat /sys/devices/platform/lis3lv02d/position" on Dell Vostro
> > > > 5568 laptop:
> > > >     - Horizontal: (-18,0,1044)
> > > >     - Front elevated: (522,-18,1080)
> > > >     - Left elevated: (-18,-360,1080)
> > > >     - Upside down: (36,108,-1134)
> > > > 
> > > > Signed-off-by: Nam Cao <namcaov@gmail.com>
> > > > ---
> > > >  drivers/i2c/busses/i2c-i801.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> > > > index a176296f4fff..e46561e095c6 100644
> > > > --- a/drivers/i2c/busses/i2c-i801.c
> > > > +++ b/drivers/i2c/busses/i2c-i801.c
> > > > @@ -1243,6 +1243,7 @@ static const struct {
> > > >  	 */
> > > >  	{ "Latitude 5480",      0x29 },
> > > >  	{ "Vostro V131",        0x1d },
> > > > +	{ "Vostro 5568",        0x29 },
> > > >  };
> > > >  
> > > >  static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
> > > 
> > > Fine with me.
> > > 
> > > Reviewed-by: Jean Delvare <jdelvare@suse.de>
> > > 
> > > Pali, OK with you?
> > 
> > Yes, nice to see that other people discovered another hidden hardware
> > devices in their own laptops :-)
> > 
> > Reviewed-by: Pali Rohár <pali@kernel.org>
> > 
> > 
> > Nam Cao, could you check your ACPI DSDT table if there is not specified
> > this smbus/i2c address 0x29? Autodiscovery would be better than
> > hardcoding. At least for E6440 I was told that BIOS does not provide it.
> 
> My reply got rejected by mailing list because the attachment was too big.
> So I re-send this without the attachment, so that everyone can see.
> 
> I searched the DSDT table for "29", but none of them looks like an i2c
> address.
> 
> But this is the first time I hear about ACPI DSDT table, so I may did
> something incorrectly. I did:
>         - cp /sys/firmware/acpi/tables/DSDT table
>         - iasl -d table
>         - Search through table.dsl
> 
> Best regards,
> Nam

You did it correctly. I'm not surprised that you have not found
anything. When I did experiments in the past, I was not able too...
That is why there is that harcoded table...

It just means that Dell did not fixed it or they perfectly hidden it.
