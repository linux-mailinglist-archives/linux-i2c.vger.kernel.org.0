Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25CD16C9D32
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 10:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232937AbjC0IJl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 04:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbjC0IJk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 04:09:40 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93893191;
        Mon, 27 Mar 2023 01:09:39 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 97DDF6602087;
        Mon, 27 Mar 2023 09:09:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679904578;
        bh=WsJrZpm843H/Mqkak9eNmuxfS+fyJ9GgkzGPM1UBOFY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=MRMri0dpMSRlcR433ByuMgdZmR0JajiPP6xsngGy/nxPO5KOcUB0byRvbzhLRc99D
         hL41kgsF36sAAaLuskGkuY/mWTqL+4k1loJa50QP3npbNq0jz5511R7YZ9Rb7aFbXZ
         YDHQU1or1V1O1Q1DMy2kTyLxcMsZl7vxTO9pgU9M5bf7rNTqjmCIqtg+EhpWE2foSl
         3J+Ujz2CKp4vZBT8LOlLcj943u7W2t10QfP52tDmNx46C69Pq6WcfpdXTqaXFosJu5
         svMP6/z9mrvJ+E+izWpN5pIt92RpnRTEd1+Oat5V0P42zHO8Z5OpDw/gbTi+R8bM5p
         F3su3t1xiwMSg==
Message-ID: <8937b354-a808-5e4b-94c4-f2c8a63945e2@collabora.com>
Date:   Mon, 27 Mar 2023 10:09:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 03/18] arm64: dts: mediatek: mt6795: xperia-m5: Enable
 Frequency Hopping
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>
Cc:     matthias.bgg@gmail.com, qii.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
 <20230324175456.219954-4-angelogioacchino.delregno@collabora.com>
 <ZB9jlTsEb0Clf1zu@duo.ucw.cz>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ZB9jlTsEb0Clf1zu@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Il 25/03/23 22:11, Pavel Machek ha scritto:
> On Fri 2023-03-24 18:54:41, AngeloGioacchino Del Regno wrote:
>> Enable FHCTL with Spread Spectrum for MAINPLL, MPLL and MSDCPLL
>> as found on the downstream kernel for this smartphone.
>> Which one to enable, and at what SSC percentage, was found by
>> dumping the debugging data from a running downstream kernel and
>> checking the downstream code.
> 
> What advantages does this have? Lower EMI emissions?
> 

Hello Pavel,

this is done for multiple reasons, main one being lower EMI, but the effects
on functionality, depending on the actual board, may be quite dramatic and
ranging from lower WiFi and/or modem signal "sensitivity" (as in, for example,
having to automatically lower signal gain because of signal disturbance from
the conducted EMI ripple), to even a complete platform crash due to clocking
issues.

This is not about accounting for hardware quirks because having this situation
is totally normal and expected, especially on "particular" usecases such as
smartphones, where the actual board is typically much constrained in terms of
space, and where on the same board you have multiple components generating noise,
either wanted (a nfc/wifi/bt/2g/3g/4g/5g/something-else signal), or unwanted.

Cheers!
Angelo
