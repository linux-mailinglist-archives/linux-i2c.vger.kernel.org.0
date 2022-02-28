Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 309374C6EB7
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Feb 2022 14:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236865AbiB1N6X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Feb 2022 08:58:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236937AbiB1N6T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Feb 2022 08:58:19 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A6A92AC58;
        Mon, 28 Feb 2022 05:57:30 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id i6-20020a4ac506000000b0031c5ac6c078so18823825ooq.6;
        Mon, 28 Feb 2022 05:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OQXq8SH7J2jGjbN+Ln0Krx+hZyTKyM2L283Eje0Rl+s=;
        b=o+Icet+A3e3amogcnwE0LZFgYCS1c3zcxIEg9oYMUgh7aJx9LZ5aWKNkJfS4Pq2x/O
         MWldII8xSmeLGFITWzgOlLaNe8pAwkXHMPhjG08dSq4Qof0rtBefeQY3NqtkewnvZMA0
         ly1la7NZVfTV2bIEh+o7w0J3UHB+cEe+7QcaLSRtioFrERv4DNrTuvLL2fAB7q/j/UMZ
         uTTMgZHed4j/jTiMkAOSwrNuvtN5lYtQCTOU0Kf48CjeEPLWR/sr+oSmD5DAwUbIpeAT
         4ruElN01gl/Y+L85OTriEsX7fXZKPo0h+k+FfkXBEdVSfZCAqOtlRlBsyX3qV2eee/p7
         G1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OQXq8SH7J2jGjbN+Ln0Krx+hZyTKyM2L283Eje0Rl+s=;
        b=FHyUQZPDzddeXIxn2zWOrckhYWIGX4idEMRGcXXluIHRnm6BNYZ2w9dSEZPdveQpz+
         Dh5HFquRUozEZICgOcN+cX/tMF4cjb0XVfcqfDeVoguTYayt+WrUGdLfEET65NqvnC38
         p0KTw+WKRcxoagukkBDhd4Sr26U8Xw8yE24Jsoe9Ff4ZBO8c33ar0mPt/I/V9ESr0X65
         ptjJF7xy6KDlerJMEJTTYpnqxqhz11cJs4msaf7TSGVGbMqtMOmev8nD2LwJKuc8da9v
         jNLR/WzzMPYFE2TjN+S+vlcNCaEQQV56NWS/o5HOGJyLRbMVpKblXn827jjOMJTgGDP/
         TAhw==
X-Gm-Message-State: AOAM533AR7GjRvFWThOVT3dpmD7yWE7mM33uqsL5PJMdscGcGbUqXPEs
        wJRJBD5188bpLROJhfFw3pgwlvsRY0A=
X-Google-Smtp-Source: ABdhPJzpjJxKssZapkzltQ3XzA7dQSO9RfA/0OKeQZG1pM0V87IaqJKFXghJvuuE6QdlpO/bQjqaLA==
X-Received: by 2002:a05:6870:7c07:b0:d7:e5c:62ac with SMTP id je7-20020a0568707c0700b000d70e5c62acmr4494840oab.54.1646056649864;
        Mon, 28 Feb 2022 05:57:29 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z26-20020a0568301dba00b005ad0fc5abe4sm5050787oti.16.2022.02.28.05.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 05:57:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fbb305e3-73b3-7a2d-99cf-a7205b7344ff@roeck-us.net>
Date:   Mon, 28 Feb 2022 05:57:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Content-Language: en-US
To:     Zev Weiss <zev@bewilderbeest.net>, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>
Cc:     openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220201001810.19516-1-zev@bewilderbeest.net>
 <YhyLIRFbs226KTwA@hatter.bewilderbeest.net>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <YhyLIRFbs226KTwA@hatter.bewilderbeest.net>
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

On 2/28/22 00:43, Zev Weiss wrote:
> On Mon, Jan 31, 2022 at 04:18:08PM PST, Zev Weiss wrote:
>> Hello,
>>
>> This series adds support for a new pca9541 device-tree property
>> ("release-delay-us"), which delays releasing ownership of the bus
>> after a transaction for a configurable duration, anticipating that
>> another transaction may follow shortly.  By avoiding a
>> release/reacquisition between transactions, this can provide a
>> substantial performance improvement for back-to-back operations -- on
>> a Delta AHE-50DC (ASPEED AST1250) system running OpenBMC with dozens
>> of LM25066 PMICs on PCA9541-arbitrated busses, a setting of 10000 (10
>> ms) reduces the median latency the psusensor daemon's hwmon sysfs file
>> reads from 2.28 ms to 0.99 ms (a 57% improvement).
>>
> 
> Ping...Guenter, any thoughts on this?
> 

It sounds reasonable to me, but I don't have access to hardware anymore
to test it, so I have no means to confirm that it actually works.

Guenter

