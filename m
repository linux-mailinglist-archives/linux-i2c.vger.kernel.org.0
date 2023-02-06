Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C14568C138
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Feb 2023 16:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjBFPUp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Feb 2023 10:20:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjBFPUp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Feb 2023 10:20:45 -0500
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F41162688;
        Mon,  6 Feb 2023 07:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=jDTlzOWtOMv/82+V+6OYKq6Ja3r8e9P3RDz9hYc8/YQ=; b=c/NWQERl/Bl2qniBFv21j2RezG
        5b6Ql63K/Fn1/S97xCHjeAv1KZ+U9y8HGxgkVkpotOSI/D6ll8c7/vciyCM5mgXlmiq+lNX56a78P
        r4Kf1/Jj/w6tZeJJA7J1ud2pEtsuY1MSGEUH79aoI6gn62MNHY2dgICwgcFk2SNeXpmmx+t129aXq
        EVzBHbfmfae75SOp5AjSEv7ZMt3PSN9w12uKXfpOahpOuOALXWEESKxmjVc0m5S2vhLLTz1yZQMK1
        3TWPVAl2gsTbfRcywcLEMOHQC4nmRFwEpyft6iFJTuZJroFrNn108pzmZV98yK47A6sx/vd+e/ipR
        TMHauPWw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pP3IQ-00008E-1W; Mon, 06 Feb 2023 16:20:42 +0100
Received: from [136.25.87.181] (helo=[192.168.86.26])
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pP3IP-000Esc-LT; Mon, 06 Feb 2023 16:20:41 +0100
Message-ID: <018dc6a2-0bde-b387-3dd2-e87ec302cfd1@metafoo.de>
Date:   Mon, 6 Feb 2023 07:20:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] dt-bindings: i2c: cadence: Document `cdns,fifo-depth`
 property
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20230205230208.58355-1-lars@metafoo.de>
 <20230205230208.58355-2-lars@metafoo.de>
 <06920579-74d2-8e35-a534-8a65dee322d1@linaro.org>
From:   Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <06920579-74d2-8e35-a534-8a65dee322d1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26804/Mon Feb  6 09:47:07 2023)
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks for the review.

On 2/5/23 23:41, Krzysztof Kozlowski wrote:
> On 06/02/2023 00:02, Lars-Peter Clausen wrote:
>> The depth of the FIFO of the Cadence I2C controller IP is a synthesis
>> configuration parameter. Different instances of the IP can have different
>> values. For correct operation software needs to be aware of the size of the
>> FIFO.
> Cannot this be inferred from compatible?

The compatible string currently encodes the version of the IP core. The 
FIFO depth is an orthogonal setting. You could of course encode both the 
version and FIFO depth as part of the compatible string. But you'd end 
up with a combinatorial explosion of compatible strings. Like

cdns,i2c-r1p10-fifo-depth-2, ... cdns,i2c-r1p10-fifo-depth-16, ..., 
cdns,i2c-r1p10-fifo-depth-256, cdns,i2c-r1p14-fifo-depth-2, ... 
cdns,i2c-r1p14-fifo-depth-16, ..., cdns,i2c-r1p14-fifo-depth-256,

>
>> Add the documentation for the devicetree property that describes the FIFO
>> depth of the IP core.
>>
>> The default value of 16 is for backwards compatibility reasons with
>> existing hardware descriptions where this property is not specified and
>> software has assumed that the FIFO depth is 16.
>>
>> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
>> ---
>>   Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
>> index 2e95cda7262a..3daa2fa73257 100644
>> --- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
>> @@ -38,6 +38,12 @@ properties:
>>       description: |
>>         Input clock name.
>>   
>> +  cdns,fifo-depth:
>> +    description:
>> +      Size of the data FIFO in words.
>> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> Drop quotes.
>
>> +    default: 16
> maximum
> minimum?

Will add a enum, since it has to be a power of two.



