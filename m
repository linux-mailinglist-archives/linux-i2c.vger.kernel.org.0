Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1003472D304
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 23:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbjFLVPx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jun 2023 17:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236108AbjFLVOs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 17:14:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3A33AA3;
        Mon, 12 Jun 2023 14:08:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 37F3062110;
        Mon, 12 Jun 2023 21:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3C5C433D2;
        Mon, 12 Jun 2023 21:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686604109;
        bh=+sPCGwyaFUvjlItw/v+ZV6iTtIKsVpMJmiUlliD0EvI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=omUsr9Xi3VuGOzEud62gWD9yMZyzCDoddle3pOpwIhoqcAJbggH4bAoI7A+YHaIXp
         EcwSDvfNzveFqfWgrDCTambJAQ021CEVAeXxS93Sbwo1F5+63M4fx4K6tosrs291Wv
         k/NAQDfQXX2As7BWokCdb6npF7NBaqBLUV9qIbd2DcC13j5hSUy9JYoQitD2WmQY1b
         zYbZtWnFROQVDNmGPgN9a6qEQ0cdrRWOWvKsF38josbYutX4ndwLemRa0AtQKdSSwD
         1gWNrP7prYYBdNrGlMcewVsOWb4vk+xCKJRxiZsaZqKoCjIQJ3M0cE56Nfj8dpNIuL
         v15GcyOqoEzXg==
Date:   Mon, 12 Jun 2023 23:08:26 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mpc: Use of_property_read_reg() to parse "reg"
Message-ID: <20230612210826.gmgrwjyu2g7jrysh@intel.intel>
References: <20230609183044.1764951-1-robh@kernel.org>
 <20230610093625.gvgbt7g4xvnuuog6@intel.intel>
 <CAL_JsqL9ax73zdn148S_7M0SyZqQfWh1Hr_yY5Vary3qye7bjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqL9ax73zdn148S_7M0SyZqQfWh1Hr_yY5Vary3qye7bjQ@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rob,

On Mon, Jun 12, 2023 at 01:27:03PM -0600, Rob Herring wrote:
> On Sat, Jun 10, 2023 at 3:36 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> >
> > Hi Rob,
> >
> > On Fri, Jun 09, 2023 at 12:30:44PM -0600, Rob Herring wrote:
> > > Use the recently added of_property_read_reg() helper to get the
> > > untranslated "reg" address value.
> > >
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  drivers/i2c/busses/i2c-mpc.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
> > > index cfd074ee6d54..595dce9218ad 100644
> > > --- a/drivers/i2c/busses/i2c-mpc.c
> > > +++ b/drivers/i2c/busses/i2c-mpc.c
> > > @@ -316,9 +316,10 @@ static void mpc_i2c_setup_512x(struct device_node *node,
> > >       if (node_ctrl) {
> > >               ctrl = of_iomap(node_ctrl, 0);
> > >               if (ctrl) {
> > > +                     u64 addr;
> > >                       /* Interrupt enable bits for i2c-0/1/2: bit 24/26/28 */
> > > -                     pval = of_get_property(node, "reg", NULL);
> > > -                     idx = (*pval & 0xff) / 0x20;
> > > +                     of_property_read_reg(node, 0, &addr, NULL);
> >
> > because of_property_read_reg() can return error, can we check
> > also the error value here?
> 
> Why?

Because if a function can return an error, the error must be
checked. Even if the property is "reg" and the binding says that
it's required. Otherwise let's make those functions void.

> The old code wasn't worried about of_get_property() returning
> NULL on the same possible errors.

Sure! Checking the error comes for free. The patch is fine as it
is, mine was a little improvement I asked for. I can still ack
it and add the error handling later myself :)

> If anyone is still actually using
> mpc512x, I don't think their DTB will have an error at this point.
> IOW, is improving the error handling on this really worth it?

In my view, every error needs to be checked as every error is
unlikely to happen: it makes the code future proof and makes sure
other components failure don't impact the normal functioning of
this driver.

Anyway, the patch is doing what you described and for the sole
economy of this change:

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Thank you,
Andi
