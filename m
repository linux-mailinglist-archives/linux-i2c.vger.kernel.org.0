Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B21E75F9AF5
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Oct 2022 10:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbiJJI1Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Oct 2022 04:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbiJJI1N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Oct 2022 04:27:13 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA4FCD4D;
        Mon, 10 Oct 2022 01:27:12 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 3802666022A5;
        Mon, 10 Oct 2022 09:27:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1665390431;
        bh=wMMy9Yav9HmoUJlZAx9akLCFU2KdLfeAUhpMVrwFH/Y=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Sxad4tuFxuVIkgMVt9CqTFE5vIsTRHqvVSPAJBslqu7/AoAHGHkxRq8h6eoxqYc8N
         qZ6d8zH4qUz8pzwZaC9Z0J/kIc1va0s34qbRuB5eYiV0+EEKFFMDA8RE+Tc1ussHsN
         llBJhUyyU/wsoskWMlh+myWiI3gO9UJDM3MF/lbsi00RQl7tNtRLpVYx5u8LUYrTdr
         E6aDmvrB7CgFC4d3qRlv/heGf9pCEHC7NsVXVPnvPAuI+iiT0AVEiyuSx+8SVQTfKl
         6+Nhu/JoRLR6B1ZjK/6a3fuf7Oeo4Oww0P3sPfRL1Jga5UKLlWN9h0oLKV6kcolu66
         XUi5q2Tw/mXrw==
Message-ID: <20a33876-e7eb-d6aa-748e-2b0e9938506b@collabora.com>
Date:   Mon, 10 Oct 2022 10:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/2] i2c: mediatek: add mt7986 support
Content-Language: en-US
To:     Frank Wunderlich <linux@fw-web.de>,
        linux-mediatek@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Qii Wang <qii.wang@mediatek.com>
References: <20221009101631.82380-1-linux@fw-web.de>
 <20221009101631.82380-3-linux@fw-web.de>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221009101631.82380-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Il 09/10/22 12:16, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add i2c support for MT7986 SoC.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Verified against u-boot sources for MT7986 located at BPI GIT

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

