Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 140287B7452
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Oct 2023 00:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbjJCWyl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Oct 2023 18:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbjJCWyk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Oct 2023 18:54:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDC7FAF;
        Tue,  3 Oct 2023 15:54:37 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8A9C433C7;
        Tue,  3 Oct 2023 22:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696373677;
        bh=9Oft35Q1R1+kG+ADxClgAanF3/fHDbeRHG97EroNmi0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jxK5C/JATXAL5TIu1lyaXWewPzHW/nqlXuV5LlsnA6sfucQfzBrO+HsjJ7aNIK47T
         rlMHv4I27UWPwP8KFeArZ65rAnDybVL5oesYmfAvSWZRYZ4D+3f+oB+n0ArGOK1BpY
         G8I8x27mo15usD5zuQhYcfkxhln4cqshu121eEiGe3C7VB5YvM+/B44bxqlGLahB4G
         IL29143bJIMsHDeAifGLJZ7zkSnIcHcUiPI4DHgABcNAbTr55ZQmBtbmQaOnCBPP/t
         CnfBdCdEMwmiszQTDeW5lSYSvV9GL8DYi4zNZkMx9wQjchjE/04um3CQSabMop+xZW
         EOcExskCuiQNA==
Date:   Wed, 4 Oct 2023 00:54:31 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Jian Zhang <zhangjian.3032@bytedance.com>
Cc:     brendan.higgins@linux.dev, benh@kernel.crashing.org,
        joel@jms.id.au, andrew@aj.id.au, zhangjian3032@gmail.com,
        yulei.sh@bytedance.com, xiexinnan@bytedance.com,
        Tommy Huang <tommy_huang@aspeedtech.com>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [External] Re: [PATCH v2] i2c: aspeed: Fix i2c bus hang in slave
 read
Message-ID: <20231003225431.owtpcds7rrijj7yf@zenone.zhora.eu>
References: <20230927154244.3774670-1-zhangjian.3032@bytedance.com>
 <20230928145128.tjflbgvena4apivs@zenone.zhora.eu>
 <CA+J-oUsgZuFmKor_thfehf2T8Y9T4NHcDp713YHyZC=fQvvZgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+J-oUsgZuFmKor_thfehf2T8Y9T4NHcDp713YHyZC=fQvvZgA@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jian,

On Thu, Sep 28, 2023 at 11:04:23AM -0400, Jian Zhang wrote:
> > From: "Andi Shyti"<andi.shyti@kernel.org>
> > Date:  Thu, Sep 28, 2023, 22:51
> > Subject:  [External] Re: [PATCH v2] i2c: aspeed: Fix i2c bus hang in slave read
> > To: "Jian Zhang"<zhangjian.3032@bytedance.com>
> > Cc: <brendan.higgins@linux.dev>, <benh@kernel.crashing.org>, <joel@jms.id.au>, <andrew@aj.id.au>, <zhangjian3032@gmail.com>, <yulei.sh@bytedance.com>, <xiexinnan@bytedance.com>, "Tommy Huang"<tommy_huang@aspeedtech.com>, "Wolfram Sang"<wsa@kernel.org>, "open list:ARM/ASPEED I2C DRIVER"<linux-i2c@vger.kernel.org>, "moderated list:ARM/ASPEED I2C DRIVER"<openbmc@lists.ozlabs.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"<linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"<linux-aspeed@lists.ozlabs.org>, "open list"<linux-kernel@vger.kernel.org>
> > Hi Jian,
> >
> > On Wed, Sep 27, 2023 at 11:42:43PM +0800, Jian Zhang wrote:
> > > When the `CONFIG_I2C_SLAVE` option is enabled and the device operates
> > > as a slave, a situation arises where the master sends a START signal
> > > without the accompanying STOP signal. This action results in a
> > > persistent I2C bus timeout. The core issue stems from the fact that
> > > the i2c controller remains in a slave read state without a timeout
> > > mechanism. As a consequence, the bus perpetually experiences timeouts.
> > >
> > > In this case, the i2c bus will be reset, but the slave_state reset is
> > > missing.

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

I checked the flow in the driver and makes sense to me. I'd also
love a last minute comment from Brendan or Benjamin or Joel.

> > > Fixes: fee465150b45 ("i2c: aspeed: Reset the i2c controller when timeout occurs")
> > > Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
> >
> > Why I'm failing to find your v1 patch? And where is the
> > changelog?
> Sorry, something was missing,
> v2:
> * remove the i2c slave reset and only move the `bus->slave_state =
> ASPEED_I2C_SLAVE_INACTIVE` to the aspeed_i2c_init
> 
> [0]: https://lore.kernel.org/linux-arm-kernel/20230810072155.3726352-1-zhangjian.3032@bytedance.com/T/

Thanks! I should really check my filters here.

Andi

> Jian
> >
> > Andi
