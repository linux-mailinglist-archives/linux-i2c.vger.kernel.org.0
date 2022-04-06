Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 461CC4F69FC
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 21:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231852AbiDFTdI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Apr 2022 15:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231997AbiDFTct (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Apr 2022 15:32:49 -0400
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC4C7938A;
        Wed,  6 Apr 2022 10:32:52 -0700 (PDT)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 715FA3C0579;
        Wed,  6 Apr 2022 19:32:51 +0200 (CEST)
Received: from lxhi-065 (10.72.94.4) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Wed, 6 Apr
 2022 19:32:50 +0200
Date:   Wed, 6 Apr 2022 19:32:45 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        <linux-renesas-soc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2] i2c: rcar: add SMBus block read support
Message-ID: <20220406173245.GA14970@lxhi-065>
References: <000001d7badd$a8512d30$f8f38790$@mentor.com>
 <20211006182314.10585-1-andrew_gabbasov@mentor.com>
 <Yg6ls0zyTDe7LQbK@kunai>
 <20220323215229.GA9403@lxhi-065>
 <YkQ31VMqj1MXqBd3@shikoro>
 <YkQ6XRITOFZ7hLXV@shikoro>
 <20220331160207.GA27757@lxhi-065>
 <YkcqoIMF2uw4FSZh@ninjato>
 <20220405093048.GA7151@lxhi-065>
 <YkwPQSPed18iyHox@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YkwPQSPed18iyHox@ninjato>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.94.4]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Tue, Apr 05, 2022 at 11:43:29AM +0200, Wolfram Sang wrote:
> > In general, the Renesas kernel always carries a set of patches with
> > non-mainlined changes, Fortunately, for i2c specifically (as opposed
> > to other subsystems), it is narrow enough to not raise major concerns:
> 
> Well, yes, that shows that I am mostly successful with reporting back to
> the BSP team :D

100%! I remember the early days of Renesas R-Car Gen3 kernels, with
literally thousands of patches on top of v4.2/v4.4/v4.6 vanilla tags.

It felt like mission impossible to upstream those. But here we are. Kudos!

Best regards,
Eugeniu
