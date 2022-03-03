Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87D3F4CBA25
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 10:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbiCCJ0U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 04:26:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbiCCJ0T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 04:26:19 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C181768CD;
        Thu,  3 Mar 2022 01:25:33 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 1B2951F44E0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1646299532;
        bh=+Mrp1q4a/4BNfYYhdIb5MbTqKcT8UTUqCYjArHMClZk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=lk7d/REbiCi2XieKxcRzFkarxry/9DW1yqhe5M33Rr6+nzLX/Qc8R1oRAM7M99/9R
         uLJqhRSCtr/FqawbRf8MlFaWjqVTXnjEv7WNKAkQ0B0+Xg0uCiB2wqxxy0kmlk8wwY
         OboYNYpmxyCH4Qq3F627Pye7uLJR7NVnLi6pHdlm+ha6zINU3mO21dTGI5dbQU6J3p
         bOSkFqAUamKjRiCdvWOH86QGH0VZ8mftITwc3nN+vt68yJhmTopFBo1hIjJfq7LJs7
         l9yQL/d4EziDzS5VNlpqyvzV9PYibWYPJ8URGa0KmhVFicsZ5vD6qQ9iqguhs6f8ss
         vdS3eRnJaEsrA==
Message-ID: <22eccb9e-45fa-683e-640d-6f34fa63ca52@collabora.com>
Date:   Thu, 3 Mar 2022 10:25:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2] i2c: busses: i2c-mt65xx: Simplify with clk-bulk
Content-Language: en-US
To:     qii.wang@mediatek.com
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, wsa@kernel.org,
        Qii Wang <wii.wang@mediatek.com>
References: <20220303091547.17522-1-angelogioacchino.delregno@collabora.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220303091547.17522-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Il 03/03/22 10:15, AngeloGioacchino Del Regno ha scritto:
> Since depending on the SoC or specific bus functionality some clocks
> may be optional, we cannot get the benefit of using devm_clk_bulk_get()
> but, by migrating to clk-bulk, we are able to remove the custom functions
> mtk_i2c_clock_enable() and mtk_i2c_clock_disable(), increasing common
> APIs usage, hence (lightly) decreasing kernel footprint.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Qii Wang <wii.wang@mediatek.com>
> ---
> 
> v2: Rebased on top of wsa/linux.git branch i2c/for-mergewindow
> 
>   drivers/i2c/busses/i2c-mt65xx.c | 124 +++++++++++++-------------------
>   1 file changed, 51 insertions(+), 73 deletions(-)
> 
Hello Wolfram,

I'm sorry but in this v2 I have typoed Qii Wang's email
(qii.wang <at> mediatek.com).

Please, can you fix that while applying, or should I send a v3?

Sorry again and thank you,
Angelo

