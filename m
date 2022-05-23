Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA05B530B98
	for <lists+linux-i2c@lfdr.de>; Mon, 23 May 2022 11:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbiEWIlq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 May 2022 04:41:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232005AbiEWIlp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 May 2022 04:41:45 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9960F18E0D;
        Mon, 23 May 2022 01:41:41 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id D76C31F42CC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1653295300;
        bh=0P46duBDuz2b5CE/o2n56812oMHke0Ez/vRylcz7E8w=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=DnbM3Sz+hSQk0SLXivU4I4uVTqNsW6Afi3aXHedtSkumaqlwPyJt63SeARySgkWhU
         V0bX58p4FClZRwXaMagpvPdcnexlvyUQzwHcdoyDM9FP3wzGJy8BSKlBOBnLr5j+Gc
         vynWi3U5cSwtRMtT621qLvUSJIvzp0Mz+HUtOvZzxCokHVmSohEjaK84FkDEZNZA+L
         Is5i9p8pDEBkr+jWHCQO4ezFkWE+OohHFCF/KWproX8j2MYcLIlDABfAc+FcE1acjB
         c+W92jSNmEJ59Rgudk99ODg8/JxxqS0oiXqcyNjkj99WoSvmpvE5iTbFtg9zvrO4KW
         xnPVw4t4ABqUA==
Message-ID: <e6d5bf20-4ed2-2d98-438e-315a9ed6b71a@collabora.com>
Date:   Mon, 23 May 2022 10:41:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] i2c: mediatek: Fix an error handling path in
 mtk_i2c_probe()
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        dan.carpenter@oracle.com, Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <8001bcdbee9f8afc85118c99b8166eb6473dcba5.1653222111.git.christophe.jaillet@wanadoo.fr>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <8001bcdbee9f8afc85118c99b8166eb6473dcba5.1653222111.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Il 22/05/22 14:22, Christophe JAILLET ha scritto:
> The clsk are prepared, enabled, then disabled. So if an error occurs after
> the disable step, they are still prepared.
> 
> Add an error handling path to unprepare the clks in such a case, as already
> done in the .remove function.
> 
> Fixes: 8b4fc246c3ff ("i2c: mediatek: Optimize master_xfer() and avoid circular locking")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

