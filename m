Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35A9B7A0045
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Sep 2023 11:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234427AbjINJiB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Sep 2023 05:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236956AbjINJh6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Sep 2023 05:37:58 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF3D0CCD;
        Thu, 14 Sep 2023 02:37:54 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 69FA066072FF;
        Thu, 14 Sep 2023 10:37:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1694684272;
        bh=CTv2KXJMAq+hbSXUQVfEZKQZVTB0BrNwUz1wHsn45uM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=i5jNrMk2hXUFgOvbLKzaN5pw6W65Po/mspdrZQ0IBjbf5qXShn9cutfLwPky61b7R
         rUCSlyyWVSEm5wbWEhUeRf1Iq0Hk70ApfNJKnj6hIrO2G4IlJMBgG4fcPd9ZwU1cPl
         QFy8hK8yUba6HkqrDMGmXbWNf+GBXy+J4Ge2Ti9SXEoF4xGYnTCfNgsf+LAh71fFre
         DfuH690DOsHuJIbp2fCxaIF7Urjx1ZD19FmVMy7mcrHHQLbl3WriragUaxMSOc1/Lq
         TNfILGtbITRHPllCUklEDVnZWZBDkNMllJNlAqGgu2fRhAfgLZbELPMOAS2q9YucAF
         oeZMDdfMt6Nbw==
Message-ID: <dc2cf86a-abf2-b372-29f9-3bfedeb24a97@collabora.com>
Date:   Thu, 14 Sep 2023 11:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] i2c: mt65xx: allow optional pmic clock
To:     Daniel Golle <daniel@makrotopia.org>
Cc:     Qii Wang <qii.wang@mediatek.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        =?UTF-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
References: <3bf827929a44c17bfb1bf1000b143c02ce26a929.1693102324.git.daniel@makrotopia.org>
 <0fd097fd-9fdb-9001-cddb-7a396fde28bb@collabora.com>
 <ZQLNWHKlIZNd7x4l@makrotopia.org>
Content-Language: en-US
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ZQLNWHKlIZNd7x4l@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Il 14/09/23 11:07, Daniel Golle ha scritto:
> On Wed, Sep 13, 2023 at 04:00:53PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 27/08/23 04:13, Daniel Golle ha scritto:
>>> Using the I2C host controller on the MT7981 SoC requires 4 clocks to
>>> be enabled. One of them, the pmic clk, is only enabled in case
>>> 'mediatek,have-pmic' is also set which has other consequences which
>>> are not desired in this case.
>>>
>>> Allow defining a pmic clk even in case the 'mediatek,have-pmic' propterty
>>> is not present and the bus is not used to connect to a pmic, but may
>>> still require to enable the pmic clock.
>>>
>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>> ---
>>>    drivers/i2c/busses/i2c-mt65xx.c | 12 ++++++++----
>>>    1 file changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
>>> index 1a9b5a068ef1b..a8b5719c33729 100644
>>> --- a/drivers/i2c/busses/i2c-mt65xx.c
>>> +++ b/drivers/i2c/busses/i2c-mt65xx.c
>>> @@ -1442,15 +1442,19 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>>>    	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk))
>>>    		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk);
>>> +	i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = devm_clk_get_optional(&pdev->dev, "pmic");
>>> +	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk)) {
>>> +		dev_err(&pdev->dev, "cannot get pmic clock\n");
>>> +		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk);
>>> +	}
>>> +
>>>    	if (i2c->have_pmic) {
>>
>> ...but you're not changing speed_clk if !i2c->have_pmic, I'm not sure that
>> this will work correctly. Perhaps you wanted to also set speed_clk if the
>> clock is present?
> 
> No, if I wanted that I could have used the existing 'mediatek,have-pmic'
> property -- however, all needed e.g. on MT7981 is to make sure the
> clock is enabled, but still use I2C_MT65XX_CLK_MAIN as speed_clk.
> 

Sorry, I've misunderstood the intention and yes, I understand now.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


