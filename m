Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F17624C77B6
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Feb 2022 19:27:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238532AbiB1S2G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Feb 2022 13:28:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240806AbiB1S1u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Feb 2022 13:27:50 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C3DB3E7D;
        Mon, 28 Feb 2022 10:10:27 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id p15so13982917oip.3;
        Mon, 28 Feb 2022 10:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7wQWrntmzj+Iyb2AkW1h0mbOWmxT1sYGcUG1qHtruzA=;
        b=hO9hm+T3VPBeUPH7RQD/Y0rI1IKC/jJ2dA97Y/k0Edaujb0hG+dz7Suf8AtSqBJdzN
         N0wpwz906k2hpLIL5b5sVa2R2MhQOh0tUIgjHy0JwiLPevs2xVo4LSbHZlnxVKeEqYGe
         DYKGhs05u+MNlJD+T9pLdl696AxwN9ArskJ/BOuw5GpObFdJaNd9ujzVRVvRu+KuOIwE
         WMk/0F+oZeBhyvAC/cgxTum/6Nu9+SMFHLfUxW/v5j8dDrIGrZfksvHdwp73OFlW917l
         59wqgfvaPTX79smzDIyXotarX6JpDcXANBPNxruKstDgzV8PcNW6EgU9A+T3PEuuB6lj
         W/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7wQWrntmzj+Iyb2AkW1h0mbOWmxT1sYGcUG1qHtruzA=;
        b=c/DFlWQnZp7gYjhaxquIg6NKSdfmm4oJMk9xzBeRMIif1ep+/7vRm4N8QfSfYy9BM2
         Q17vqeAe7CoUm5e1W6tMSASVzKeXvTWp3+c11oE6S2SGV8ERrM4QLj6vy+gnTolb4Bhg
         I9hifVBGxR9zv11O1IqNwtxLJnYZ/Mcaf1go8RHMwDgrInCPHIECYtXSGhA6XBZe4cV8
         GBwfLNJBmeUAF0eHTBJoqIIJE9iY2fCHIbIkWBSIaUnibHXHn3ixvE0jKPTUYN9rn8ws
         OppCH2LnjTOURqWbIOFVkNhmYQVuPGndl+11hnOq11pQvbrdq8kMaUKNvU5+v0ZHEeMH
         Z+MQ==
X-Gm-Message-State: AOAM531YDcwd+ootxVdIJ86iAuSiN+Kn5MO7xIymOV+PjpiCitEcgf+F
        BVxB8JjtFf6H8ghRZDC+Ycob/21rQLo=
X-Google-Smtp-Source: ABdhPJyiXkfCIS04W7ZFPsOkY+JzUPJmnYpp09LkpTS7tVVjk6qnJNOcCg/oLMt6gMfJG0uAnknBKA==
X-Received: by 2002:a54:4f1c:0:b0:2d0:6df2:808e with SMTP id e28-20020a544f1c000000b002d06df2808emr11795057oiy.67.1646071826308;
        Mon, 28 Feb 2022 10:10:26 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m17-20020a0568080f1100b002d71e151e51sm6553576oiw.0.2022.02.28.10.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 10:10:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9edce888-8e7c-9c97-dc70-17df7f348832@roeck-us.net>
Date:   Mon, 28 Feb 2022 10:10:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Content-Language: en-US
To:     Zev Weiss <zev@bewilderbeest.net>
Cc:     linux-i2c@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
References: <20220201001810.19516-1-zev@bewilderbeest.net>
 <YhyLIRFbs226KTwA@hatter.bewilderbeest.net>
 <fbb305e3-73b3-7a2d-99cf-a7205b7344ff@roeck-us.net>
 <Yh0CUzBzGJc4zyTR@hatter.bewilderbeest.net>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <Yh0CUzBzGJc4zyTR@hatter.bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/28/22 09:11, Zev Weiss wrote:
> On Mon, Feb 28, 2022 at 05:57:27AM PST, Guenter Roeck wrote:
>> On 2/28/22 00:43, Zev Weiss wrote:
>>> On Mon, Jan 31, 2022 at 04:18:08PM PST, Zev Weiss wrote:
>>>> Hello,
>>>>
>>>> This series adds support for a new pca9541 device-tree property
>>>> ("release-delay-us"), which delays releasing ownership of the bus
>>>> after a transaction for a configurable duration, anticipating that
>>>> another transaction may follow shortly.  By avoiding a
>>>> release/reacquisition between transactions, this can provide a
>>>> substantial performance improvement for back-to-back operations -- on
>>>> a Delta AHE-50DC (ASPEED AST1250) system running OpenBMC with dozens
>>>> of LM25066 PMICs on PCA9541-arbitrated busses, a setting of 10000 (10
>>>> ms) reduces the median latency the psusensor daemon's hwmon sysfs file
>>>> reads from 2.28 ms to 0.99 ms (a 57% improvement).
>>>>
>>>
>>> Ping...Guenter, any thoughts on this?
>>>
>>
>> It sounds reasonable to me, but I don't have access to hardware anymore
>> to test it, so I have no means to confirm that it actually works.
>>
> 
> Ack, thanks.  In that case, what's the path forward on getting changes to this driver merged?  I see sign-offs from Wolfram and Peter on the last few commits that touched it -- any input from the i2c/i2c-mux maintainers?
> 

The i2c/i2c-mux maintainers will need to accept it, and you'll need
approval for the DT changes from a DT maintainer (presumably Rob).

Guenter
