Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4F0455F2E
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Nov 2021 16:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbhKRPTt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 10:19:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbhKRPTr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Nov 2021 10:19:47 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E76BAC061574
        for <linux-i2c@vger.kernel.org>; Thu, 18 Nov 2021 07:16:46 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so18788wmj.5
        for <linux-i2c@vger.kernel.org>; Thu, 18 Nov 2021 07:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3FFylHc9/91j8cHrIDfuHAGMLwGN1XQoCljWfdGEPLg=;
        b=NJ7Wzn1wS4KBsQJdL7ZRdyqV1MNdky4S/nmlDXMIEf8Mmwz7bYwUIbo9P7LMukGnAa
         S3dvjoE9NLwKagbgfK7LGllX0OyylbvJx28ULzS1+FP4JBjNqhPpc0bVvcCjylbzBb8M
         sAui5FMHSDgzQ0Ovs407PdAnQWDGUb29y+V11THtcFuPbhc9R4W+4vKXvMV2ZOjrtFHy
         kGfYnpVZw/ksQtBD6Csbi8027agni6JE0QmldognZ126u6LilaBVku33CqcOLopS0Xmi
         quwX0xgdUm8+0BfxBv/PkC4tD37ADd/k6K7H9JeWfgUtrJbykzoRCjV55gUvDVW/mgTu
         C3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3FFylHc9/91j8cHrIDfuHAGMLwGN1XQoCljWfdGEPLg=;
        b=fx83eGK5v0KfXR/+IplwrLsJdWVwZS94+cEGzhoxjspcjmHV1YuqDnAVloi15zG+Ri
         zBF/D5mZZeYaQzphAAN2ROQa92I6W/27umay5NIfLD//VzqqmUn6IWAedPcC04BRkzok
         ucfa3vFSp/MFffnmiZ4h3gUOHZ+QC1asHxtcCkrgARTO9dwZix8yDGEQhsE6HhBiNkoD
         d+o3yB07Qy8+CNOfKSwYOVF7QTcEevQQPZ+xyXsrIYMf+O9Io+tu420jTxCZNPoAQo14
         dglALRnKDN96n8J4zlEAXEbAHm80rAKYXgOhs4Opnc1ltA/hW4evEUbFNPMVLb24Czy0
         q/1g==
X-Gm-Message-State: AOAM531xm1XmNWRXwXdM13m7BjtN2/BGnl0bH8AbVAtBIZam49Zh6JA7
        a0jaWB5MNthWU4MrDi6xHcksRArxekg=
X-Google-Smtp-Source: ABdhPJx7JeQgiohrQDwDeewOzkmpQaAGs+rqezZufWGbyN+l9cXqPgiBS3FG50Kc5cI3B1m4UkVL0Q==
X-Received: by 2002:a05:600c:4fcc:: with SMTP id o12mr11352658wmq.110.1637248605539;
        Thu, 18 Nov 2021 07:16:45 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:3072:70cf:357c:96b2? (p200300ea8f1a0f00307270cf357c96b2.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:3072:70cf:357c:96b2])
        by smtp.googlemail.com with ESMTPSA id 9sm240756wry.0.2021.11.18.07.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 07:16:45 -0800 (PST)
Message-ID: <25799346-50bf-3c13-94b7-04b32be1727e@gmail.com>
Date:   Thu, 18 Nov 2021 16:16:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] 2c: i801: Improve handling of chip-specific feature
 definitions
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org
References: <89eb31f3-8544-35c6-7b15-920831746563@gmail.com>
 <20211118110912.76b74cd3@endymion>
 <56d37e6a-a0c0-861b-dfd7-e50b95cd5377@linux.intel.com>
 <20211118161430.7896a618@endymion>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20211118161430.7896a618@endymion>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18.11.2021 16:14, Jean Delvare wrote:
> On Thu, 18 Nov 2021 16:03:39 +0200, Jarkko Nikula wrote:
>> On 11/18/21 12:09 PM, Jean Delvare wrote:
>>> On Mon, 08 Nov 2021 21:10:12 +0100, Heiner Kallweit wrote:  
>>>> +#define DEF_FEATURES	(FEATURE_BLOCK_PROC | FEATURE_I2C_BLOCK_READ	| \  
>>>
>>> Not a good name ("default" isn't descriptive) and not consistent
>>> either. I suggest "FEATURES_82801EB" instead, as this is the first
>>> chipset which supported all these features. And you can make the
>>> definitions of FEATURES_82801DB and FEATURES_82801EB consistent
>>> (spacing/alignment).
>>>   
>> How about calling default as FEATURES_ICH5 and 82801DB as FEATURES_ICH4? 
>> That makes easier to follow comments like "/* ICH4 and later */" in the 
>> code.
> 
> Good idea :-)
> 
Thanks for the reviews. Then I'll incorporate the remarks and send a v2.
