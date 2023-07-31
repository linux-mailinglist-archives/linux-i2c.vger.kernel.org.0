Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0544E769AC6
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jul 2023 17:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbjGaP3H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jul 2023 11:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbjGaP3G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jul 2023 11:29:06 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE119D8
        for <linux-i2c@vger.kernel.org>; Mon, 31 Jul 2023 08:29:04 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6bcaa6d5e2cso441974a34.3
        for <linux-i2c@vger.kernel.org>; Mon, 31 Jul 2023 08:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1690817344; x=1691422144;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BCRwNRJ8ALXYzDjLSXyUvn0AG6JBCqWnkgFUrA+N5Y0=;
        b=NqGA3p7HyI7sNItshe7KnzE2AJCv0MNPi70W7PsOswQzT1tTWWAlO62VXs2kNxqFtn
         DslQQU/doWcW0NlF0bW4qZ7mD5PoJX6SboFX5C6oNAl29ZwKFGDvh3wWlC0RsObeeSFj
         /TyCm5gtmBODiQXwb0YeiErrPKEj4fKxF4AVOF8IdBu7fS+1c/AxPEL9D7xJzX5Fgu8f
         9g2rHtpryEPUpvCIsQrmHe/K5yRP/EHpZo0ntzVANQmm0IbqQUcppPLbCWTpZVosiKHD
         bx4+S0NsOwLjZ1QMGFlDCsSibcI3Z16MlK0W8cYTZJG+WCD65ZSwD+vlq+vvYiZE3s0D
         9F1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690817344; x=1691422144;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BCRwNRJ8ALXYzDjLSXyUvn0AG6JBCqWnkgFUrA+N5Y0=;
        b=LCswl7QA7S/2agEm+70ZZV0l3JUHTK9PP8b7ueiZmI9XrPnfjxjDM12fsAJmHupq3T
         P8a3xrPWbFbKchm4VNV+O5788Gzij1Ce0mA9fOSCx+HpLD3ZBh0wDZXYIdPkHOr3q16t
         ZgBc2FaQsH556hzqObnJmE/wUTyEP6S5OmmHYI3b3LNtTI0Hf6g+Fs288dc9vCONanV2
         8+Er1kVHiCNCcqO6ayKdrB9wA9oM44WUYcP6CLHydRQX7sRA/CtFgUYi5sAysjde7pMf
         EPb6Ri06cajs+HBjg6mBhZXaXDvoWBsfDYUVnGqgbPjjFbssIXbUz/lxilcFXJCwkMMJ
         8XPg==
X-Gm-Message-State: ABy/qLaB4oUjpttnGGB6oIKP9Sv+p7FH0WQYN9aH8HxlAXJOdYrrQrKb
        Jox8gEvIs6dCLfJDo5eLIs9Gg0ZItcNaH/usnwOM4u/R
X-Google-Smtp-Source: APBJJlE1eyFcDH4XASVP03sTRW0OrIqg00vcjFUxeCj/e0BycQmPkp2YlRBwaF1b4KGb3/jdZ7uqBA==
X-Received: by 2002:a9d:7b48:0:b0:6b9:4e85:de95 with SMTP id f8-20020a9d7b48000000b006b94e85de95mr9257878oto.34.1690817344287;
        Mon, 31 Jul 2023 08:29:04 -0700 (PDT)
Received: from ?IPV6:2405:201:d02f:d855:213e:dcc8:df5f:960a? ([2405:201:d02f:d855:213e:dcc8:df5f:960a])
        by smtp.gmail.com with ESMTPSA id y15-20020a637d0f000000b00563b36264besm8247703pgc.85.2023.07.31.08.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 08:29:03 -0700 (PDT)
Message-ID: <7dd0607c-cbe4-e763-03a0-5f9a5db9d6db@9elements.com>
Date:   Mon, 31 Jul 2023 20:59:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/4] dt-bindings: i2c: Add Maxim MAX735x/MAX736x
 variants
Content-Language: en-US
To:     Peter Rosin <peda@axentia.se>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230501091552.847240-1-patrick.rudolph@9elements.com>
 <20230501091552.847240-3-patrick.rudolph@9elements.com>
 <fd20cad6-34f9-5f3c-abe7-cdf3a93d712c@axentia.se>
 <CALNFmy1gxUD-C62SH5GxA=fq8eKYxiOHe8wqXGsVdzsyiJc6Xg@mail.gmail.com>
 <cfb17cbc-b8cf-c3ce-cf77-7e13e12c42eb@linaro.org>
 <cbaf1816-ffd1-686d-9651-605da29d76c6@axentia.se>
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <cbaf1816-ffd1-686d-9651-605da29d76c6@axentia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter,

On 02-05-2023 16:06, Peter Rosin wrote:
> Hi!
>
> 2023-05-02 at 10:46, Krzysztof Kozlowski wrote:
>> On 02/05/2023 08:52, Patrick Rudolph wrote:
>>> Hi Peter,
>>> it could indeed cause problems when VDD1 != VDD2 and at both needs to
>>> be enabled.
>>> The pca9846 datasheet seems to refer to VDD1 as VDD. Thus I could add
>>> an optional "vdd2" regulator to the binding and driver.
>>>
>>> Please let me know if that's what you had in mind.
>> Don't top post.
>>
>> In such case vdd-supply should not be used for VDD2.
> When reading the data sheet [1], I get the feeling that the instances
> of VDD are either copy-paste errors from data sheets from chip with a
> single VDD, or a reference to either of VDD1 or VDD2. It is thus not
> super clear to me that VDD should be the same thing as VDD1.
>
> Sure, there is section 6.5 "Power-on reset", which mentions VDD and
> VDD2 (but not VDD1), but that seems like a simply typo and that it
> should really have been VDD1 instead of an unqualified VDD.
>
> There are also various timings "glitch supply voltage difference"
> (delta VDD(gl)) and "supply voltage glitch pulse width" (t w(gl)VDD)
> with notes that refer to VDD2, which *could* indicate that the
> glitch in VDD is about a glitch VDD1. But it could also mean glitches
> on any of VDD1 and VDD2?
>
> The general description of the chip indicates that VDD1 is there
> mainly to allow different bus voltages on each of the channels.
> Which is not at all the function of VDD on the other chips. Meanwhile
> VDD2 "is the core logic supply from which most of the PCA9846
> circuitry runs", and seems like it is a better match for plain VDD?
Yes, based on Figure 14 in datasheet, VDD2 seems to be better match
for plain VDD.
Also VDD1 is I2C bus voltage on micro-controller side so the best
match I can think of is VBUS.
>
> Maybe one can find out more by reading the spec more carefully, but
> as I said, it is not clear to me that either of VDD1 or VDD2 can be
> matched to VDD.
>
> Perhaps it is best to not mix things at all?
Yes. For designs with same voltage rails, "VDD" can serve the purpose.
For designs with different voltage rail, VBUS would be needed to
identify micro-controller side bus supply.
Let me know your thoughts.

Regards,
Naresh
>
> [1] https://www.nxp.com/docs/en/data-sheet/PCA9846.pdf
>
