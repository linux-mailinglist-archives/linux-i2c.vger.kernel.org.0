Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6CC07B268F
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 22:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbjI1U0j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 16:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbjI1U0i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 16:26:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39294180
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 13:26:36 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E989FC433C7;
        Thu, 28 Sep 2023 20:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695932795;
        bh=FS3sH94yl1Azl4Y+uPxaFjwt89YdUp60REGNHcFwC1Y=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=UYOIZr6mcdO0YUFDokEqyzS8Z08k1oA4ZL465RGrud7+ADD6jowcwqT9CBgODztgh
         BKQUGcbpPvyl5Vl+oa54oOIJGFLoUk62fZQze9JAa4AiKZloMdDIl98QhCcdKUUGB7
         1NLGzcF39lInvbhWLv4x8v2UeADlAhE6R/Y+M2WtqprUj/Kc84+OiNNzmP0T+biCHJ
         2/fiX9wE15btl0hK8bTEUZIrEQM/5iH1xP2HpXQBH2cpy9su59SLAPRw515K8RtgQD
         2Jkz81iYoqlgqMb+OL/tQJWZADyqa3RMWA3QJwjcf+vx/qIwA3vIVhTz3+pkZvAG4c
         fIxpQ/wEHj42A==
Date:   Thu, 28 Sep 2023 22:26:30 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2] i2c: Drop legacy muxing pseudo-drivers
Message-ID: <20230928202630.pyccrhc5j6g5svs7@zenone.zhora.eu>
References: <20230928101655.47d3dd2a@endymion.delvare>
 <20230928150323.7modfno7snqccpzd@zenone.zhora.eu>
 <ZRWXMRpkO3tOwW1Z@ninjato>
 <ZRWuILREQejwvM7X@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRWuILREQejwvM7X@shikoro>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Thu, Sep 28, 2023 at 06:47:28PM +0200, Wolfram Sang wrote:
> On Thu, Sep 28, 2023 at 05:09:37PM +0200, Wolfram Sang wrote:
> > 
> > > I think I commented here that I had double thoughts on this. I
> > 
> > Didn't you get Jean's and my reply?
> 
> I have been notified that this message could be seen as impolite. It was
> *totally* not meant this way. I was really wondering if the mails didn't
> get through. Such things happen, so I wanted to rule them out. It maybe
> was too brief. I really appreciate Andi's effort in the I2C subsystem
> and have zero bad feelings or whatsoever. So, if it sounded otherwise, I
> am sorry. I try to add a few more words in the future.

Thanks for the clarification and thanks for the kind words.

I didn't actually read it as unpolite.

I haven't received your replies and Jean's either, indeed I was
surprised to see this patch again. Maybe my notmuch filters need
to be a bit refined.

Anyway I will go hunt for them :)

Thanks again,
Andi
