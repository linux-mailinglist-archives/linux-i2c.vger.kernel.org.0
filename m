Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 026777927A6
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 18:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232138AbjIEQUG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 12:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354259AbjIEKZx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 06:25:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D1B5DB;
        Tue,  5 Sep 2023 03:25:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BAB11B8113E;
        Tue,  5 Sep 2023 10:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6876DC433C7;
        Tue,  5 Sep 2023 10:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693909547;
        bh=s5OcvhMGsauyHDIDghPQ23qUl8W6KKM1Q1jw2SF9yi4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MCmfXrexYhH4Ai/BXu//C7U3rOTpsCWaLsG2uJMmVDnnEHOp1gXStiwclOrtqdLCF
         MncEUQuevfAWcC/UQV5gAuG3WKjdr9gaDPvbVnTVJae/dzpZCdgEXzRv3Cb74PEev5
         +0AAn1NOM6DAmxh0fEreYMJ1dJ8/wZqN5KGGWfc1nsBNPN4G+61Ic8F9Mb5EQWiHca
         hl4iq8ICMou/PeI5bUv9Er9LzY0Ek2BOGGSveOQJFtSxnin4jDb3dngoSq6d1+EPJx
         N4tUUInzW1rehli5Atc4hYch3YUxSuyIuL672CLe1FgME3om0QlqSbN1FrGb9QTkzy
         NbANuoCgERNpg==
Date:   Tue, 5 Sep 2023 12:25:43 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        dmitry.baryshkov@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Liao Chang <liaochang1@huawei.com>,
        Todor Tomov <todor.too@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, vegard.nossum@oracle.com
Subject: Re: [PATCH next] i2c: qcom-cci: Fix error checking in cci_probe()
Message-ID: <20230905102543.54weuecvkcujusip@zenone.zhora.eu>
References: <20230823194202.2280957-1-harshit.m.mogalapalli@oracle.com>
 <47e3acac-7d4f-43bd-bd55-5ae9ab993f2d@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47e3acac-7d4f-43bd-bd55-5ae9ab993f2d@kadam.mountain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dan,

On Tue, Sep 05, 2023 at 12:10:31PM +0300, Dan Carpenter wrote:
> On Wed, Aug 23, 2023 at 12:42:02PM -0700, Harshit Mogalapalli wrote:
> > devm_clk_bulk_get_all() can return zero when no clocks are obtained.
> > Passing zero to dev_err_probe() is a success which is incorrect.
> > 
> > Fixes: 605efbf43813 ("i2c: qcom-cci: Use dev_err_probe in probe function")
> > Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> > ---
> > Only compile tested, found by static analysis with smatch.
> > 
> > https://lore.kernel.org/all/CAA8EJprTOjbOy7N5+8NiJaNNhK+_btdUUFcpHKPkMuCZj5umMA@mail.gmail.com/
> > ^^ I reported initially here, Dmitry suggested we need to fix it in a
> > different patch.
> > 
> > the Fixes commit used above pointed this bug, but the real fixes tag is this:
> > Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> 
> This has already been applied but, for future reference, you should have
> gone with the real fixes tag instead of where the static checker started
> complaining.

yeah... sorry... I normally check all the "Fixes:" tags, but
sometimes, out of sheer laziness, I trust the commit.

Andi
