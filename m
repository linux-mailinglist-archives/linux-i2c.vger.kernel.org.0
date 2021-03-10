Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1243333D7
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 04:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbhCJD3z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Mar 2021 22:29:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbhCJD31 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Mar 2021 22:29:27 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F25C06174A;
        Tue,  9 Mar 2021 19:29:27 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id f3so17512796oiw.13;
        Tue, 09 Mar 2021 19:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GWoXqYUv2WBQDrWT7/Ky5xxfDWEreVWPuNrxHsNCjjo=;
        b=q2S62wwqj2NQVhp+b3jiA2qL9H+TCTbDqi2sV3TZHSS3EIy+lx9HsD/saL2Gao4AXI
         su2rSgEse8chsj78Bcs9mI9U4g0bfGSauZv0Xy1zM9Mq1XeE7sWItyLY2Y1TPCxdeltI
         IUoPgsf4Mc3ZQ2JRUB5uEx5WYsb8FXYTtCbawY3wMVMtI3nRWzhxPLsgO/c3O73t0PQ3
         9fKrxrYd3b7sJRj42sos5ltnmTXUsV/HZGMjQ9E+vP8wcSmZXgbLlTFgglG2VuM4QvLS
         3cL564AwGxBHrFJB6J2swY0uQGb8jzysytPgSI2zQzLqf2nRS22lCh5KcnUpOsk7bpOu
         Tolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=GWoXqYUv2WBQDrWT7/Ky5xxfDWEreVWPuNrxHsNCjjo=;
        b=NFXxqeWHmjcm8rSYJmue1Nf5nVgFwM+L5ItZRBLQnaWtmWAJl46y6cS+2JHQLSSbmB
         M0V136Gw2GiEi1E6Eb4M2gm343slogP+PRr+GZHaw0Jm0vRPaDJ9nTlnHdcknqwxvuX0
         aAsstNTAKYXsjCO4DsfaCt0ntGmZaRWA8CtysYlNuwvOWSpimqK9klR/2gfQtbk20nZL
         GsoOfk7iI2i5P8TiwKMZzmceKPRw9B+NNRb03b00Bbvw2TTgtroNIyHYLBICuXORGGXr
         FCnVRguzwcAT3N0p0KUxFaraScCMf9Z65qSp0QziaqUgSb8156POEcY4mYR7LOpHbPTU
         viKg==
X-Gm-Message-State: AOAM533m/WTNeLjl/EsSvq6Exx4xITNZMpE2X7M1Qvrc/dB3VpHkHs/d
        8MR8ceMUtN8QIUYKc5QGyNfnEvhIAa0=
X-Google-Smtp-Source: ABdhPJw+CQO9zMWsyNllts2ptpm3W2v/A4mCWEeiGCKVaM67W+ux6BVaAWz9Z01PUiu1nQ2Epuq8wA==
X-Received: by 2002:a05:6808:7ca:: with SMTP id f10mr998856oij.139.1615346966672;
        Tue, 09 Mar 2021 19:29:26 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c7sm1314285oot.42.2021.03.09.19.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 19:29:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: Errant readings on LM81 with T2080 SoC
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        "jdelvare@suse.com" <jdelvare@suse.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <8e0a88ba-01e9-9bc1-c78b-20f26ce27d12@alliedtelesis.co.nz>
 <96d660bc-17ab-4e0e-9a94-bce1737a8da1@roeck-us.net>
 <b1ba3f34-cbcc-4bbd-ea84-aad21f513682@alliedtelesis.co.nz>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <c009a2b7-b15c-b9e6-a7d6-98d6b1039512@roeck-us.net>
Date:   Tue, 9 Mar 2021 19:29:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b1ba3f34-cbcc-4bbd-ea84-aad21f513682@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/9/21 3:35 PM, Chris Packham wrote:
> 
> On 8/03/21 1:31 pm, Guenter Roeck wrote:
>> On 3/7/21 2:52 PM, Chris Packham wrote:
>>> Fundamentally I think this is a problem with the fact that the LM81 is
>>> an SMBus device but the T2080 (and other Freescale SoCs) uses i2c and we
>>> emulate SMBus. I suspect the errant readings are when we don't get round
>>> to completing the read within the timeout specified by the SMBus
>>> specification. Depending on when that happens we either fail the
>>> transfer or interpret the result as all-1s.
>> That is quite unlikely. Many sensor chips are SMBus chips connected to
>> i2c busses. It is much more likely that there is a bug in the T2080 i2c driver,
>> that the chip doesn't like the bulk read command issued through regmap, that
>> the chip has problems with the i2c bus speed, or that the i2c bus is noisy.
> I have noticed that with the switch to regmap we end up using plain i2c 
> instead of SMBUS. There appears to be no way of saying use SMBUS 
> semantics if the i2c adapter reports I2C_FUNC_I2C.
> 

The driver only really supports I2C; SMBUS functions are emulated.
I don't think that makes a real difference.

Guenter
