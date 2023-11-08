Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 223E77E534A
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 11:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235509AbjKHK1C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 05:27:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235492AbjKHK1B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 05:27:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F2E61BD6
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 02:26:59 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E32C433C8;
        Wed,  8 Nov 2023 10:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699439219;
        bh=Ochv7qbrkCkJCpD/5Tq/zLOl+ukhyiXgyla4BOI3Jzs=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=RaGAiwLJDC4XSzWUQEKut3IEdGWgEKWOp85heq6TTNRKVggVRmv3xcu6Uc0JMqtAj
         /kr1NhiG34L87cUMkyzimcohkCR8GSc+Je6x6JMQsnQm2Pbq1U//MCbPXCAEgZsOBj
         oV0dbSu+ju98c+3JDUhSPCA+LTnrakA4z22XbRrPWZzzH+pYhYMApGaseP4miz8ikD
         s5WbIRL7dJAkhxlD3HC7rHT8ArO/67u3r+7ejS+C9bHybXkHGoBNvjUhXdQWdU8jrx
         xpYyFk8bqvBWY/7hFaq2eTwuHcorJGDz2hvNa88ovDhDwLVOI4Md0bdkyd6BATmByu
         UqZc2M3PtuLwQ==
Date:   Wed, 8 Nov 2023 11:26:56 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/1] i2c: lpi2c: use clk notifier for rate changes
Message-ID: <20231108102656.txcwn5clrkvkv6x4@zenone.zhora.eu>
References: <20231107141201.623482-1-alexander.stein@ew.tq-group.com>
 <20231107212049.csimqzzvim5uecpa@zenone.zhora.eu>
 <22082032.EfDdHjke4D@steina-w>
 <20231108091513.6ddwhu6o6lbvvmag@zenone.zhora.eu>
 <ZUtSVr/cI/EVgq0M@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUtSVr/cI/EVgq0M@ninjato>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> > If you see your part in my reply down here you see that some
> > parts are missing. Perhaps there is a bug in lei that has missed
> > the top part of your patch because in lore I see that, indeed,
> > there is nothing wrong with your mail.
> 
> Seems to be a lei bug, indeed. I can apply the patch from my mutt inbox
> without a problem.

thanks for confirming, I will download it manually from lore and
review it, then.

Thanks,
Andi
