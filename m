Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9AF6D2677
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Mar 2023 19:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbjCaRLt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Mar 2023 13:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjCaRLt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Mar 2023 13:11:49 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B80E18831;
        Fri, 31 Mar 2023 10:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=BewKgH0lhl5ITDFQCz5IQ2OB5+ZlHOMt8jydO+KrdZI=; b=amhJfElQ1lROVDhTrG12MMXKX2
        PNq9+LeJuh4cDPbmTIZ5tEDQ9fEy38GczjGFkIcXTrsSwDR1HA3Jk/pbCx/+gmhWxg/AbpJPytHNF
        0t05dACFVlZxRq9vsVn1CS84gb8mQeN6JPt2HkwAJD869fwkVnw/vfPtztNuau85f6pykdpEOLzUj
        dlvRqhBDia6VCe05hQySe0r1AgDgmeYtUMTdzXcdDQOhKNKtXEJo1GVXUPx+pjY9vsZBSUDFm8S9i
        9cxvlewsDTXBFfTHUnmLJmeTde/SfYRO5dSDE1KWJ7SVdh5IpfTClhVFIFAdZfaV2cC74OH6L7gkp
        mOKlbuiA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1piIHy-000KFW-HF; Fri, 31 Mar 2023 19:11:46 +0200
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b]
        by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1piIHy-00049F-5J; Fri, 31 Mar 2023 19:11:46 +0200
Message-ID: <292e5efd-1a10-d1e6-0185-1ce113eee233@metafoo.de>
Date:   Fri, 31 Mar 2023 10:11:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: i2c: cadence: Document reset property
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20230330180448.269635-1-lars@metafoo.de>
 <6b997dfa-1377-8d2e-ce4f-3f8f7407e6b4@linaro.org>
From:   Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <6b997dfa-1377-8d2e-ce4f-3f8f7407e6b4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26861/Fri Mar 31 09:24:12 2023)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/31/23 02:42, Krzysztof Kozlowski wrote:
> On 30/03/2023 20:04, Lars-Peter Clausen wrote:
>> The Cadence I2C controller has an external reset that needs to be
>> de-asserted before the I2C controller can be accessed.
>>
>> Document the `resets` devicetree property that can be used to describe how
>> the reset signal is connected.
> You could add it also to the example to have complete picture (and
> validate your change).
>
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
When I resend with it added to the example, do you want me to keep or 
drop the acked-by?
