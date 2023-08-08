Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A33ED774282
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Aug 2023 19:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234827AbjHHRq0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Aug 2023 13:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234772AbjHHRpi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Aug 2023 13:45:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0331425EE7;
        Tue,  8 Aug 2023 09:20:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B3FA46234A;
        Tue,  8 Aug 2023 11:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFB1C433CC;
        Tue,  8 Aug 2023 11:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691494297;
        bh=kKuXJHPAD9Ev8XHLwqrYq1t1WLsTsWdLhW12VOgF2UM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EjF620EGQVlzXKABCDsv7H4j9w/Rg3YH1eJyW/bbyzgeFKcDcHaHRc5fLhGsV2wNP
         SSGMYrlEhevrhOZKkvAsNgqAaikwe32lYzXVbre9XmcYBUPYZPn+hRtk5f3fvvVzpX
         YEaMNsZQ8GAme+w0WqSGKSuCNl04wdAb2tFqLUtGdnk90gtC21CeHnl58yoCMPBshQ
         DMmtw7aKhoCxjClFnpmf+eDgugVcqOM9w+pnNFrGG763/a+WvwURltn1wTJvptwqML
         c9SfogwClugHddCZmRbifn4XnF7WPd0s2fSDj2ND1gRKLBDavpNUh/04+gvorattcN
         nkDBNK4hjwVmA==
Date:   Tue, 8 Aug 2023 13:31:34 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Liao Chang <liaochang1@huawei.com>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, kernel@pengutronix.de,
        linux-imx@nxp.com, Ard Biesheuvel <ardb@kernel.org>,
        Asmaa Mnebhi <asmaa@nvidia.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        George Cherian <gcherian@marvell.com>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Ray Jui <rjui@broadcom.com>, Robert Foss <rfoss@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Scott Branden <sbranden@broadcom.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Yicong Yang <yangyicong@hisilicon.com>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/9] i2c: bcm2835: Use dev_err_probe in probe function
Message-ID: <20230808113134.tu273e62466qrlob@intel.intel>
References: <20230808012954.1643834-2-liaochang1@huawei.com>
 <1f23c942-5a6a-4b23-9067-79f5db93021b@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f23c942-5a6a-4b23-9067-79f5db93021b@web.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Markus,

On Tue, Aug 08, 2023 at 11:37:33AM +0200, Markus Elfring wrote:
> …
> > so that the printed messge includes …
> 
> Please avoid a typo in such a wording.

yes, I noticed this... and thanks for pointing it out. If no
other version will be sent I can fix /messge/message/ while
applying this series.

Thank you,
Andi
