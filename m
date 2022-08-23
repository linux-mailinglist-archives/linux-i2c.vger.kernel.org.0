Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2869159E627
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 17:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240327AbiHWPjw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Aug 2022 11:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241871AbiHWPjd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Aug 2022 11:39:33 -0400
X-Greylist: delayed 5721 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 23 Aug 2022 04:31:57 PDT
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D102EFC13E;
        Tue, 23 Aug 2022 04:31:55 -0700 (PDT)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 87DF1C0732;
        Tue, 23 Aug 2022 08:35:26 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 5F52DC000A;
        Tue, 23 Aug 2022 08:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1661243643;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D9E0UhmB4IGyBAfhDmQBffQboxHt0fdw9tb81qz3IyY=;
        b=UVo6Te/TryI77O+Fu64mjRwl4J2NAo4CVfBGyEo4QUjsSfIyBqMxbsvA81U32afl6dNXqX
        9gPvL1gV2eieNePOw6aTlla1OiNLarx93c4O5uCiUNPA6TzvtW2HqDdokl5ybT3MztAoq2
        Y+Juy4Zd3CXQgg0gbeY6Rf+NpJPAzB3Bm3T1PbxuLa0/542BuX00uRxgut3EYHmRMDWOJb
        PcEyj0kh/L+BnAqhCivkdpiz9K19fXV3yEWaruuKUlXxqSKOd5X4PBmyLvtA3CLEaR6pQC
        XtGKJer+LaiDa26+PV693oDzU3eSQOXgOSYyxRQbsSinZQv3I5TJy77+F+D1Ew==
Date:   Tue, 23 Aug 2022 10:33:59 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] docs: i2c: i2c-topology: fix typo
Message-ID: <20220823103359.1462755e@booty>
In-Reply-To: <78a90d0a-e0ba-0189-aa84-4ce2952e33f3@gmail.com>
References: <20220822091050.47099-1-luca.ceresoli@bootlin.com>
        <20220822091050.47099-4-luca.ceresoli@bootlin.com>
        <78a90d0a-e0ba-0189-aa84-4ce2952e33f3@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bagas,

On Mon, 22 Aug 2022 20:40:56 +0700
Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> On 8/22/22 16:10, luca.ceresoli@bootlin.com wrote:
> > From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > "intension" should have probably been "intention", however "intent" seems
> > even better.
> > 
> > Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >   
> 
> The typo error is introduced in [2/3], so it makes sense to squash this
> to the errored patch.

Patch 2 just reformats the text. "intension" was there before patch 2
and got unmodified. But if it is useful I can send a v3 with the typo
fix in patch 1 and the other two patches following.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
