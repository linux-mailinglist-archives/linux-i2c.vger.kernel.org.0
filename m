Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B14514B4F7D
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Feb 2022 12:59:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244701AbiBNL64 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Feb 2022 06:58:56 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234179AbiBNL6z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Feb 2022 06:58:55 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B7ACEE;
        Mon, 14 Feb 2022 03:58:48 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 5E6861F438DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1644839927;
        bh=8cN9fggBLeZHIC7ObN4/himXYzclTb/eCG6XMz5tAxs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=oRgCnVqyp6odre1PtPBARC3do0X2Fjwi21iInARGcHlyCHIgLYYd44J375n6IkgxK
         4PixSUoSSuqqiaYI0Ph8Z53c07l3BUhsCvmYBo9PQYxLWShwzavYse184v8G/i2sjh
         /mOEnf9K0QKqVzgtLHlF7jF9IokVlmXQSOMUJfUeZel976Hhpvu7UGZHiupKshK7d5
         29Ui7JFNi21MU4ziijeGLqNKQJ/3w06tbFf1Z5Kd0HaWnbIW2u5IF43zRm/3ToCaoz
         o/4IWQO9bgOZ6BdESjR/OJCD2qa91mXZ6IwBO8f1ANMzO0HoWlcuvNGJRJZAoegzKb
         CgLntompS2AHQ==
Message-ID: <b22540e3-e8da-6878-64e3-04767c5327c2@collabora.com>
Date:   Mon, 14 Feb 2022 12:58:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v9 1/1] i2c: mediatek: modify bus speed calculation
 formula
Content-Language: en-US
To:     Kewei Xu <kewei.xu@mediatek.com>, wsa@the-dreams.de
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        housong.zhang@mediatek.com, yuhan.wei@mediatek.com,
        ryan-jh.yu@mediatek.com, david-yh.chiu@mediatek.com
References: <1644400447-6215-1-git-send-email-kewei.xu@mediatek.com>
 <1644400447-6215-2-git-send-email-kewei.xu@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1644400447-6215-2-git-send-email-kewei.xu@mediatek.com>
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

Il 09/02/22 10:54, Kewei Xu ha scritto:
> When clock-div is 0 or greater than 1, the bus speed
> calculated by the old speed calculation formula will be
> larger than the target speed. So we update the formula.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Change-Id: Ic0d9b8ab036bcf215d3a5066f2b91c7b8b128ba6

Please remove Change-Id tag, this is inappropriate and it's also irrelevant here.

After removing that tag:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 51 +++++++++++++++++++++++++++++++++--------
>   1 file changed, 41 insertions(+), 10 deletions(-)
> 
