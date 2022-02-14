Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 963934B4ED2
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Feb 2022 12:39:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234225AbiBNLgq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Feb 2022 06:36:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352861AbiBNLge (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Feb 2022 06:36:34 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEA27A1AF;
        Mon, 14 Feb 2022 03:26:34 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 0278C1F437D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1644837993;
        bh=t/N665+WR5R/ceAfV5H1Q99rJzuoHYq//Yss6JdQBYw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=U+Hv/s7dC/VlWPmUuJ6aTeD8OzAff/2f2nhgBbLNqCclgaaxF0wYJTNwYb9BUOrST
         39XzbaDCutqyM6AimY+ADpVo8KI1scrwB1DWPqoOJLEd02JwXuLMeOtQTd0hPqJ1FR
         5wIp1TzMBFdJsIbiPwFDOeSc2oPLJ7sYatJkX7/OOmD1y+O9VX+mP22rs4hEcK37p8
         pDiy5LO8tagy68r8x9gIci65rdFqf6byt59VEPZwR03CygyKe85lwJ7eI6k3tnngnr
         ip1WilSJaxsSqZe0E6TVtx7EMj5/CUHn600JfoYYYr4CEgmWldO0ONC5aEjdJS5odG
         gIb2a20EpHA8g==
Message-ID: <8725a111-0ee2-8935-86b5-01c61774a628@collabora.com>
Date:   Mon, 14 Feb 2022 12:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] i2c: busses: i2c-mt65xx: Simplify with clk-bulk
Content-Language: en-US
To:     qii.wang@mediatek.com
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20220118133358.111886-1-angelogioacchino.delregno@collabora.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220118133358.111886-1-angelogioacchino.delregno@collabora.com>
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

Il 18/01/22 14:33, AngeloGioacchino Del Regno ha scritto:
> Since depending on the SoC or specific bus functionality some clocks
> may be optional, we cannot get the benefit of using devm_clk_bulk_get()
> but, by migrating to clk-bulk, we are able to remove the custom functions
> mtk_i2c_clock_enable() and mtk_i2c_clock_disable(), increasing common
> APIs usage, hence (lightly) decreasing kernel footprint.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 127 +++++++++++++-------------------
>   1 file changed, 51 insertions(+), 76 deletions(-)
> 

Hello,
this is a friendly ping to request review on this patch as to avoid forgetting it.

Adding context, I have tested this patch on multiple (older/newer) MediaTek
platforms.

Thanks,
Angelo
