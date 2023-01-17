Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2629966DE21
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 13:51:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237004AbjAQMvb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 07:51:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236892AbjAQMui (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 07:50:38 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A556F2E0C7;
        Tue, 17 Jan 2023 04:50:16 -0800 (PST)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id D89626602D6D;
        Tue, 17 Jan 2023 12:50:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1673959815;
        bh=tqjJws5ust3XqNEcU7FBxE5hH4j5VsdQx8UtpembBUI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=OuDJeg88WYJZm2Vn4xvz5dUVqrn5fZOjudzbtOAK9eZ4GhZHa1hkh7wclz/9V0lYu
         LONPDG7QIVMKTUMdaLeTudmewzDdOCf8oKT05xKRSMwnhusaA3EWZ+eKWyl7mjgZ9C
         9GBoXsA3pfp+zax7Fiq5B9b07Mi5LHZuq1Sjmhb1rewYE94byzdkPs0J4zBpAkexgP
         Z0Ih0I1mn6zI3h1tdiB0T+DHJsm579AsBVkjTNXo1MspOJR9vUVVKrB4Xx3RgcdBhu
         eH4YIdxQEDPCkzETO2WmWTkOVi6nIGSJq5dMkvtgZRzyBBgDBMpZwm6pn29jXXbqsL
         xE9BOs53u01lg==
Message-ID: <f4a65f57-6ddc-d9f1-9f41-c1c2f8c62e28@collabora.com>
Date:   Tue, 17 Jan 2023 13:50:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/4] dt-bindings: i2c: i2c-mt65xx: add binding for MT8365
 SoC
Content-Language: en-US
To:     Alexandre Mergnat <amergnat@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Qii Wang <qii.wang@mediatek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Fabien Parent <fparent@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
 <20221122-mt8365-i2c-support-v1-1-4aeb7c54c67b@baylibre.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221122-mt8365-i2c-support-v1-1-4aeb7c54c67b@baylibre.com>
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

Il 17/01/23 09:49, Alexandre Mergnat ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add binding documentation for the MT8365 I2C controllers.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



