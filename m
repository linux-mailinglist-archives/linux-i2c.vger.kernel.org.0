Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4631509E12
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Apr 2022 12:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1388586AbiDUK4Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Apr 2022 06:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388575AbiDUK4V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Apr 2022 06:56:21 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 553351408C;
        Thu, 21 Apr 2022 03:53:32 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id B36F81F4558D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1650538411;
        bh=FBd9UQCF3y8blk7MUJd+m6iRG4OWorxrv+jpCV+U8Mk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KJkRBia6J5KzqsVbeppoDnuwy8hU/Tsp6FPN0BXe16JtWyGSs8OQBa2kd5BjM13fb
         mrub0DRmAYR4+hivTepMnAe/gbKHKzGqFBKZv+QKMmYU3A7c1QgZ25ozb9hMpfI6Qn
         zPEy9gcFNCXhnPZsyG+/+7NS1YyN/a9kjRy3I4oH7ygusMuDcCwgjSK0VCdPdNfhuE
         56Pa1SruogNTZyC2oLrLXvCjcWFar5aC5gbqXfF6cMEON+rxEicQoRPpcN36KMVlum
         khBUmygJ0uZ/8UuDh1hVyJbL+B80kmBM0sEaKzRk2OFZgxyS+Y8IxdEioPNjRmBdT3
         o8RKuMUzQpiqA==
Message-ID: <4afda652-e360-cfd9-a0f5-07910b513621@collabora.com>
Date:   Thu, 21 Apr 2022 12:53:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] i2c: mediatek: Optimize master_xfer() and avoid
 circular locking
Content-Language: en-US
To:     qii.wang@mediatek.com
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        wsa@kernel.org, nfraprado@collabora.com, kernel@collabora.com
References: <20220411132107.136369-1-angelogioacchino.delregno@collabora.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220411132107.136369-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Il 11/04/22 15:21, AngeloGioacchino Del Regno ha scritto:
> Especially (but not only) during probe, it may happen that multiple
> devices are communicating via i2c (or multiple i2c busses) and
> sometimes while others are probing asynchronously.
> For example, a Cr50 TPM may be filling entropy (or userspace may be
> reading random data) while the rt5682 (i2c) codec driver reads/sets
> some registers, like while getting/setting a clock's rate, which
> happens both during probe and during system operation.
> 
> In this driver, the mtk_i2c_transfer() function (which is the i2c
> .master_xfer() callback) was granularly managing the clocks by
> performing a clk_bulk_prepare_enable() to start them and its inverse.
> This is not only creating possible circular locking dependencies in
> the some cases (like former explanation), but it's also suboptimal,
> as clk_core prepare/unprepare operations are using mutex locking,
> which creates a bit of unwanted overhead (for example, i2c trackpads
> will call master_xfer() every few milliseconds!).
> 
> With this commit, we avoid both the circular locking and additional
> overhead by changing how we handle the clocks in this driver:
> - Prepare the clocks during probe (and PM resume)
> - Enable/disable clocks in mtk_i2c_transfer()
> - Unprepare the clocks only for driver removal (and PM suspend)
> 
> For the sake of providing a full explanation: during probe, the
> clocks are not only prepared but also enabled, as this is needed
> for some hardware initialization but, after that, we are disabling
> but not unpreparing them, leaving an expected state for the
> aforementioned clock handling strategy.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Hello,
this is a friendly ping to not let this be forgotten.

Cheers,
Angelo

> ---
> 
> v2: Fixed typos in commit description
> 
>   drivers/i2c/busses/i2c-mt65xx.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
