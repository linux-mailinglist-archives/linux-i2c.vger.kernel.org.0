Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57085673C0C
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jan 2023 15:33:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbjASOdN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Jan 2023 09:33:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbjASOcy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Jan 2023 09:32:54 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36AFC1BC7;
        Thu, 19 Jan 2023 06:32:00 -0800 (PST)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id A43816600874;
        Thu, 19 Jan 2023 14:31:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1674138719;
        bh=TfklRfGwn0ACn1i+EOgB79a5qIt+xJJJtBTtP7Db1bI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=l8o933EOqXAmmNoskLSnZiyHmWEVY+5UKYec7sdgWKpDUHV5pUKicYh9A/ugUU5wt
         8BPfxNEqizrPo0fn16g/e/FyAmYW2N7QvmLAqvXWkHhqpgZWbX0CmFWx8BbkBretQg
         f7UtSFUk7OZxwecLEfkwTblG94WquztSkPGH4kN757gXXEBkKDFVNmiQ8qj8NFu34b
         dOodNkr/pY7i3dGN1FzYzaeol19b9DDK1UsrUNYsujYvJ8T3utFPPShOxKeCBm53QG
         gQ7L55DnnFZimZFy92QLKA9Vml4mLDLhUlEv9EbbaJS4lJViLcI9HeYJsNFHiaMbS9
         sDXAz3el1pEsA==
Message-ID: <8100b3a3-60f3-3b39-1f25-2b6baba8310b@collabora.com>
Date:   Thu, 19 Jan 2023 15:31:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] i2c: i2c-mt65xx: Use
 devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To:     ye.xingchen@zte.com.cn, qii.wang@mediatek.com
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <202301191719589508843@zte.com.cn>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <202301191719589508843@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Il 19/01/23 10:19, ye.xingchen@zte.com.cn ha scritto:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Thanks for the cleanup!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


