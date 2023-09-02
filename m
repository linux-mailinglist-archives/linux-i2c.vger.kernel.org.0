Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC9A579063A
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Sep 2023 10:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349076AbjIBIc5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 04:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239611AbjIBIc5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 04:32:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA51110F3
        for <linux-i2c@vger.kernel.org>; Sat,  2 Sep 2023 01:32:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6D4C660B3D
        for <linux-i2c@vger.kernel.org>; Sat,  2 Sep 2023 08:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F08C433C8;
        Sat,  2 Sep 2023 08:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693643573;
        bh=LqEad6h8QaENhV1+rl8GkzjFnkEwjxzzCIQdKupou4s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ThRc5f9gcXYnv2TFPju/OuOX4gO2qh+L9iM/FrGbBSMN393JNJkhoPkbTt/rUA+Hu
         sAf47gsIbegF1Z+xBTBS5VyiJW2suiuC750cYYXc+YaJ1DgTapxiQn2wWu6lUYgMVD
         Sw89rV6EkORMifrGD6xPY7pvV4HNNTIlifaERTFOgwzj793yHSCmtfeMB8IrM48Qjc
         8vcqBZVdkiHcT/PR8c45nT1QearX4rDUjGh5Oes6+C25/M4/k8FNFyZ+Y39s2uaMvt
         s4wIeeaBuOrH945H6oOHKgXwE1q2Vs13SyhkGuq48ilL747fxTlGH9nRYQ1iBo/0Io
         yhLKyOEXWhZqQ==
Date:   Sat, 2 Sep 2023 10:32:50 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Jinjie Ruan <ruanjinjie@huawei.com>
Cc:     linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] i2c: gpio: Fix the NULL vs IS_ERR() bug for
 debugfs_create_dir()
Message-ID: <20230902083138.qxsjulphw7lmf4e6@zenone.zhora.eu>
References: <20230831140334.3165918-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831140334.3165918-1-ruanjinjie@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jinjie,

On Thu, Aug 31, 2023 at 10:03:34PM +0800, Jinjie Ruan wrote:
> Since debugfs_create_dir() returns ERR_PTR and never return NULL, So use
> IS_ERR() to check it instead of checking NULL.
> 
> Fixes: 14911c6f48ec ("i2c: gpio: add fault injector")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
