Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AAB96DD4F9
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Apr 2023 10:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbjDKIRT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Apr 2023 04:17:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbjDKIQz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Apr 2023 04:16:55 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A24873C23;
        Tue, 11 Apr 2023 01:16:21 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id F1B8566031E3;
        Tue, 11 Apr 2023 09:16:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1681200980;
        bh=GrCHapiNl4l3fizzmjPO1MazlZDHXxK0RUGAvEI7QMQ=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=fMxnWqyudsFS08J1c5V9HkDeqBwajRKtokinSGtvUa3THNfsy3yg7Z9mznN031lVc
         31FaDYC4JOOD/fQpgh9OlTDGnDPw8rz2hINN9xYG3lr3HYDeiGLGYRcEv5mbYMe9Ma
         ipx4hBu65tfNr5JEeOG8tc7gYYpfLGTnLkenqsBPfdxmhu1xBSNGbJNCjiwO/arTqj
         eZVz2I+3bqu2ASjtZd5f8PIxSEgtpbVM2zqsw2QkDa6tlIAHO3/5qZbZUYHf42UqW1
         K7vK8pc5RMOxODIUNETHea5yJBCWiGrWKrwO8shlLTji8YCpP6i+e++Uzu1dhRPm88
         BaomvjIzzMdZw==
Message-ID: <a903d765-d7b7-ea90-65fa-56c5b69295b3@collabora.com>
Date:   Tue, 11 Apr 2023 10:16:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: i2c-mt65xx: add MediaTek MT7981
 SoC
Content-Language: en-US
To:     Daniel Golle <daniel@makrotopia.org>, linux-i2c@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sam Shih <sam.shih@mediatek.com>
References: <cover.1680857025.git.daniel@makrotopia.org>
 <4ad55cb4248db60111c20d833631a65854fa1d02.1680857025.git.daniel@makrotopia.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <4ad55cb4248db60111c20d833631a65854fa1d02.1680857025.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Il 10/04/23 18:19, Daniel Golle ha scritto:
> Add compatible string for the I2C controllers found in the MediaTek
> MT7981 SoC.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


