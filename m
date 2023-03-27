Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 251A56C9DE4
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 10:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233398AbjC0I2G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 04:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233382AbjC0I1j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 04:27:39 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE626EA8;
        Mon, 27 Mar 2023 01:25:29 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E40CB6602087;
        Mon, 27 Mar 2023 09:25:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679905502;
        bh=/9QZ2Jz7ZuJXIYiAQSp0kMC91j8S/hZsSZYz2NRG6JI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=OwoJesY8b989WtHjNl9UQ75G3lC4dZjgAMMO/0R9Y8KpWgV1gqq9J6DV1hvJw7TEh
         0QCIbJ1XhSgM+SC1DHAF3RxYTKhYOs8z1W6PFgo5VPEfXJr4s6uIpGeRigQLhADsPV
         ZoKrMJz1TuAfa1Y2LQeMOAU6hXnY4hey7+c/MAdDKHyaGEdEvkVifC4rbkPHS4OH9M
         OL5UJU/7UfWZrluC5uC2kjwoXkZ3DNjTjmY777MyiX8JA38B68kqYxFU1ndKJYO0uV
         nVHU1zDApj7cFlvd+OcA3Xhs6Og1/FNHDn/oAKFShM968ClqSE2098/svUN+yZiElR
         ss02NvPMr+bNg==
Message-ID: <85b215e9-e8e9-054d-455b-699a92c8553b@collabora.com>
Date:   Mon, 27 Mar 2023 10:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 08/18] dt-bindings: gce: Add header for MT6795's GCE
 mailbox
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        matthias.bgg@gmail.com
Cc:     qii.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
 <20230324175456.219954-9-angelogioacchino.delregno@collabora.com>
 <488a6684-50aa-e78d-d704-7f59ed3f2c13@linaro.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <488a6684-50aa-e78d-d704-7f59ed3f2c13@linaro.org>
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

Il 25/03/23 12:12, Krzysztof Kozlowski ha scritto:
> On 24/03/2023 18:54, AngeloGioacchino Del Regno wrote:
>> Add the GCE header file to define the GCE subsystem IDs, hardware
>> event IDs and thread priority IDs for the MT6795 Helio X10 SoC.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   include/dt-bindings/gce/mediatek,mt6795-gce.h | 123 ++++++++++++++++++
>>   1 file changed, 123 insertions(+)
>>   create mode 100644 include/dt-bindings/gce/mediatek,mt6795-gce.h
>>
>> diff --git a/include/dt-bindings/gce/mediatek,mt6795-gce.h b/include/dt-bindings/gce/mediatek,mt6795-gce.h
>> new file mode 100644
>> index 000000000000..97d5ba2d2b44
>> --- /dev/null
>> +++ b/include/dt-bindings/gce/mediatek,mt6795-gce.h
>> @@ -0,0 +1,123 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> 
> This should be squashed with previous commit adding this compatible. It
> is one logical change - bindings for mt6795 mailbox. There is no point
> in splitting one change into two.
> 
> Best regards,
> Krzysztof
> 
> 

Sure, will do!

Thanks,
Angelo
