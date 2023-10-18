Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55F627CD2DB
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Oct 2023 06:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjJRE27 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Oct 2023 00:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjJRE26 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Oct 2023 00:28:58 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CDE1F7
        for <linux-i2c@vger.kernel.org>; Tue, 17 Oct 2023 21:28:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E43AC433C8;
        Wed, 18 Oct 2023 04:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697603336;
        bh=9B6EqMqgsmLPFhuxM/0rKDGbfMI3VcvrIwGwLZ68zvI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c41zRQ/wT0GfnM17U7YfxWsTUFYZz+q3F/8HCfNm0rRPKCrmpocsEmRTAwpBhcFB1
         1x3b4yhHigBxvRRU5zuAiCuhFH1xj/ACWPi19uCpHJ1NArLss92Oo/Mb/pP6cEe3ng
         x9Tkm5OZxuIwR+8B72PBHkvNUDM3cDTFng7vGzVrMulTmyVBHq6Kmd+1gx3J61bQ7y
         5xAU2wawHyAV1JNnxaVuj3Oe426CaO+FMFdfCSfMG7pmGK9kxNn0CKFPIKDQU4orWf
         US59WWUcgmfE70LOcvH9oVwklDH+uDQVrZFwcSZqPbVEpfZ86PLRFBeMJyhh62qrPA
         h8feY7KG/lAgQ==
Date:   Wed, 18 Oct 2023 06:28:52 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Simplify class-based client device
 instantiation
Message-ID: <20231018042852.yjigdm4zbmcg5iqc@zenone.zhora.eu>
References: <2192294e-99ab-4c7d-86b1-edff058d82f3@gmail.com>
 <20231017170608.3c385361@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017170608.3c385361@endymion.delvare>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

On Tue, Oct 17, 2023 at 05:06:08PM +0200, Jean Delvare wrote:
> Hi Heiner, Andi,
> 
> On Tue, 10 Oct 2023 21:27:44 +0200, Heiner Kallweit wrote:
> > Now that the legacy eeprom driver was removed, the only remaining i2c
> > client driver with class SPD autodetection is jc42, and this driver
> > supports also class HWMON. Therefore we can remove class SPD from the
> 
> I did not notice this change when it happened back in 2016. This broke
> the i2c-i801 driver as a side effect, because the Asus-specific mux
> code assumes that no I2C device driver can probe both the SMBus trunk
> and the SMBus segments behind the muxes. This is done (as you must know
> as this patch touches that part of the code) by ensuring that the trunk
> and the muxed segments do not share any class flag. This was sufficient
> as long as all device driver themselves only registered for one class,
> but this is no longer the case of the jc42 driver.
> 
> So loading the jc42 driver on one of these Asus server board systems
> would possibly result in multiple jc42 devices being instantiated for
> the same underlying hardware device. The one instantiated on the trunk
> would return incorrect values or errors depending on the mux setting.
> 
> Probably this went unnoticed because nobody was running such old server
> boards when the change happened, or they would stick to older kernel
> versions.

thanks for clarifying!

Andi

> > supported classes of the i801 adapter driver.
> > Legacy class-based instantiation shouldn't be used in new code, so I
> > think we can remove also the generic logic that ensures that supported
> > classes of parent and muxed adapters don't overlap.
> 
> Agreed. If we were to add support for a new server board with muxed
> SMBus, we would disable class-based probing and instead explicitly
> instantiate devices. To be honest, I don't know why we didn't do that
> for the Asus Z8 series already, as I think it was already available,
> and it would have made the code a lot more simple.
> 
> If anyone ever complains about the bug mentioned above, then we'll have
> to do it anyway.
> 
> > Note: i801 parent supports just class HWMON now, and muxed childs
> 
> "children" ^^
> 
> > class SPD, so the supported classes don't overlap.
> > 
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-i801.c | 38 +++++++----------------------------
> >  1 file changed, 7 insertions(+), 31 deletions(-)
> > (...)
> 
> Fine with me.
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 
> -- 
> Jean Delvare
> SUSE L3 Support
