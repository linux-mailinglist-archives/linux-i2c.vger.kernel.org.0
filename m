Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A815F503744
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Apr 2022 17:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbiDPPTM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Apr 2022 11:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbiDPPTG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Apr 2022 11:19:06 -0400
X-Greylist: delayed 341 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 16 Apr 2022 08:16:33 PDT
Received: from eu-shark1.inbox.eu (eu-shark1.inbox.eu [195.216.236.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1725FDB9
        for <linux-i2c@vger.kernel.org>; Sat, 16 Apr 2022 08:16:32 -0700 (PDT)
Received: from eu-shark1.inbox.eu (localhost [127.0.0.1])
        by eu-shark1-out.inbox.eu (Postfix) with ESMTP id 35DD06C006BD;
        Sat, 16 Apr 2022 18:10:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
        t=1650121848; x=1650123648;
        bh=KK9C41l79QaB3TJiC3RV4T0lUXme7J8u5KVG2q+8QHw=;
        h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
         Content-Type:X-ESPOL:From:Date:To:Cc:Message-ID:Subject:Reply-To;
        b=xTU201XbBCuHBaMi53sGK3esB55DOtLIPvaHFo22pPPWz2qZSznD+rEVYMWNc+b7L
         Q83hIyigv8kkN4aQ9KGne/eiHNvXE9L3d61rQzI1fMrnCe3fWim4FU30ceXatdCK1h
         Plm6r52aJ7zINqDq7DfUPiYQoYqNMLmP8vn4HtQ0=
Received: from localhost (localhost [127.0.0.1])
        by eu-shark1-in.inbox.eu (Postfix) with ESMTP id 254D86C006BE;
        Sat, 16 Apr 2022 18:10:48 +0300 (EEST)
Received: from eu-shark1.inbox.eu ([127.0.0.1])
        by localhost (eu-shark1.inbox.eu [127.0.0.1]) (spamfilter, port 35)
        with ESMTP id DgtGkDb-qW45; Sat, 16 Apr 2022 18:10:48 +0300 (EEST)
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
        by eu-shark1-in.inbox.eu (Postfix) with ESMTP id E05746C006BD;
        Sat, 16 Apr 2022 18:10:47 +0300 (EEST)
Date:   Sat, 16 Apr 2022 18:10:41 +0300
From:   Boris Lysov <arzamas-16@mail.ee>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, qii.wang@mediatek.com
Subject: Re: [PATCH 0/2] i2c: mediatek: remove mt6577 support
Message-ID: <20220416181041.31ec5f65@pc>
In-Reply-To: <YjRodtoWRhlNUg14@shikoro>
References: <20220120185853.24266-1-arzamas-16@mail.ee>
        <Yh45nDwqnLInrzzE@ninjato>
        <YjRodtoWRhlNUg14@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: OK
X-ESPOL: 885mlYNLBD+si0CgRH7ABAc3s1k3Ua26u/vYoxBcgBmOPC+Bd04PWBSzmW9qPg+1ykoX
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 18 Mar 2022 12:09:42 +0100
Wolfram Sang <wsa@kernel.org> wrote:

> On Tue, Mar 01, 2022 at 04:19:56PM +0100, Wolfram Sang wrote:
> > On Thu, Jan 20, 2022 at 09:58:51PM +0300, Boris Lysov wrote:
> > > This small patch series removes mt6577 support from the i2c-mt65xx driver
> > > and devicectree binding documentation.
> > > 
> > > The existing i2c-mt65xx driver relies on DMA since it was first
> > > introduced. mt6577 does not support DMA [1] for I2C and SoC's Generic DMA
> > > engine cannot be used for this purpose, too, which makes this particular
> > > driver incompatible with mt6577 and other similar SoCs with same I2C IP.
> > 
> > Qii Wang, what do you think about this series?
> 
> This series makes sense to me. If you do not disagree, Qii Wang, I will
> apply it soon. All the best, everyone.

Hello! I'm kindly pinging you on this series. Has it been applied?
