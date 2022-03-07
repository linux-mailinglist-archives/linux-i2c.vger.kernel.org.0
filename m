Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89D0A4CFC97
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Mar 2022 12:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237675AbiCGLWl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Mar 2022 06:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238642AbiCGLWY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Mar 2022 06:22:24 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565EE2E0A3;
        Mon,  7 Mar 2022 02:48:03 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 4D0E31F439A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1646650082;
        bh=49t+Gh0dKiobgSrRoBPHYN0oflRxS0fy5vammERcD9Y=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ckDLd4+mGZqYjg43wSSNh8ENXccLafofoibRdJ6DUWeBrF/ziCo5rmFWPsOqABo1S
         c+ctH56yYj8HD6VhDuQKodPGFgvkWBdSOAG/SbAoyunw/6uSj9jJC0N11hHOxuS9xd
         3CqwPUqZE9DBWz/jFgevf+jJLGWbvcu6Fzomcs2TYrvSorDdHNtmjlHn3NE7s/gZ1Y
         L40vsM6GEjXt5F+VINR/3kgQfXSdnCtLTJjys/aMxmrlLTJTvpEhnddTecG2n7V1Du
         qM0kkxmk7zZ0NPoyFiO2549Z4+lU+erGrVaz2smG+y4ldIIeJSpoGFACWBMuboIypM
         lg7f2zof2HD2Q==
Message-ID: <f7f49cb7-54c1-895d-320c-1836cb2ff29a@collabora.com>
Date:   Mon, 7 Mar 2022 11:47:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v1 2/2] i2c: mediatek: Add i2c compatible for Mediatek
 MT8168
Content-Language: en-US
To:     Kewei Xu <kewei.xu@mediatek.com>, wsa@the-dreams.de
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        housong.zhang@mediatek.com, yuhan.wei@mediatek.com
References: <20220307033649.11564-1-kewei.xu@mediatek.com>
 <20220307033649.11564-3-kewei.xu@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220307033649.11564-3-kewei.xu@mediatek.com>
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

Il 07/03/22 04:36, Kewei Xu ha scritto:
> Add i2c compatible for MT8168. Compare to MT2712 i2c controller,
> MT8168 need to synchronize signal with dma.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


