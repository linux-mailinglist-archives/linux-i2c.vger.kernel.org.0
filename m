Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85BD9569DBC
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jul 2022 10:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbiGGIoF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 04:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233783AbiGGIoE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 04:44:04 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AABA140F3;
        Thu,  7 Jul 2022 01:44:03 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id EA9AC6601978;
        Thu,  7 Jul 2022 09:44:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1657183441;
        bh=Iui62xJiXnekpXKddZNXoOu5K9qG6GiEA95Do2fh8bc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=VsUuU6eYEo4wfqH2UnLmR66l/fHF1wAEkqAzz2Hd4KGladtf0jPIwnxj1nXPqzzAR
         23SSiilIY3sWRMIfgu6QrUJdWXAiABcGuA6xcoFBzQ2bZ1dpevomG+KQ4CqagHhlho
         0Q8bqoWKaYi1PdxK/G4zB/6AD2f+NGzxPDc9cGbOcibYyk/3Dl5PI4vk6buLViqJDV
         2YG4DjgtRpxQqfQw47Ac+9z1x6weQZIjXpw5bbAEVWhQWn+IZcVtIScnb4vht4vtWB
         C5vqcvmVHULBIuS5wnsTn/xxmTjJG5IGL4OPp8h55htD50zaVAvdgNxO4YGPmJCjyw
         wiBUKGKBkdt9A==
Message-ID: <fae6c582-ec65-47d8-548f-934e8e829daf@collabora.com>
Date:   Thu, 7 Jul 2022 10:43:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] i2c: mediatek: Add i2c compatible for Mediatek MT8188
Content-Language: en-US
To:     Kewei Xu <kewei.xu@mediatek.com>, wsa@the-dreams.de
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        housong.zhang@mediatek.com, yuhan.wei@mediatek.com,
        david-yh.chiu@mediatek.com, liju-clr.chen@mediatek.com
References: <20220707054617.13583-1-kewei.xu@mediatek.com>
 <20220707054617.13583-3-kewei.xu@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220707054617.13583-3-kewei.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Il 07/07/22 07:46, Kewei Xu ha scritto:
> Add i2c compatible for MT8188. Compare to MT8192 i2c controller,
> The MT8188 i2c OFFSET_SLAVE_ADDR register changed from 0x04 to 0x94.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 41 +++++++++++++++++++++++++++++++--
>   1 file changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 8e6985354fd5..aa2e1cb87420 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -135,6 +135,7 @@ enum mtk_trans_op {
>   enum I2C_REGS_OFFSET {
>   	OFFSET_DATA_PORT,
>   	OFFSET_SLAVE_ADDR,
> +	OFFSET_SLAVE_ADDR1,
>   	OFFSET_INTR_MASK,
>   	OFFSET_INTR_STAT,
>   	OFFSET_CONTROL,
> @@ -203,6 +204,7 @@ static const u16 mt_i2c_regs_v1[] = {
>   static const u16 mt_i2c_regs_v2[] = {
>   	[OFFSET_DATA_PORT] = 0x0,
>   	[OFFSET_SLAVE_ADDR] = 0x4,
> +	[OFFSET_SLAVE_ADDR1] = 0x94,

Instead of adding a "slave addr version" entry... you can as well just define
a new array here with an appropriate name.

static const u16 mt_i2c_regs_v3[] = {

.......

}

This way, you don't have to change all of the platform data entries and you
also won't have to add checks in the do_transfer function, as that's one of
the actual points of having these arrays of register offsets in here.

Regards,
Angelo

