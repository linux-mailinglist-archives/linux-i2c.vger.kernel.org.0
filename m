Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 076667E5356
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 11:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344241AbjKHK3B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 05:29:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344212AbjKHK2t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 05:28:49 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B67541BD5
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 02:28:46 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5446c9f3a77so6616857a12.0
        for <linux-i2c@vger.kernel.org>; Wed, 08 Nov 2023 02:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699439325; x=1700044125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AlsWUUlVCdEprUc1iUCsrxOEN25VX8L+2fA7mb/xotg=;
        b=b8E6DOLoQa3vePNUgh22/lBFJ9kfXrAhT2fyLlrwsmOojYy92RnPz3CYSlxsS8Qrh9
         +x3wTnQcOiGXAhhaRKlMof7isMS9wYmU+LFZLXdhkqn93KbXj6Weo1rv68ncE6obCuUn
         a4upk0T6OMsyOlsgoW2OB6Ymbz08y17wh4GB34L6fpPXxkwLaE5PyNGV6pRtfcDtFJB6
         ao4mSPDmKp2aBV64d9Azmp9vEHVjwInhBYlz/M1hS4wC/EWxxkXjetpGs1D9SBuqsIl8
         vLDeKZYFPJvEVDAd9M5DKJRRCByQzrjcEWWorT7O0/4Fj+RaxNzT+cBtoMsbGA6R596q
         6EQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699439325; x=1700044125;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AlsWUUlVCdEprUc1iUCsrxOEN25VX8L+2fA7mb/xotg=;
        b=u7Y4NwYZuWkmX1Qe3wP2NlZlbwlPXRZtvdmplSV9+LYA5djxRFiEAGWHaMTP8NKalh
         G/pYC5LqGbgN2GypFW7ox8/8tjePemOkBcIPdixVO0HkJUWfzyKddbbJX4XhHre/L4+l
         DwSySN75JAmTqB9Q8ea7oQ2X55fb/Q40uPmEMSi0+3IcRjqAwIrxG0CqW7AHNLi3UR04
         49aPb/YiWUkSpBobWxpu0tB5m23Q9cCEVb317B8zWGeuDuzmpWBSzYNyHDmo7kO/lsMk
         OZKFMg3NbPMLayRr8faimUA63MVs7HiIXTXkA6W23fA+Qephz3lkp0fNDzxTeLJQ7YCl
         iPMQ==
X-Gm-Message-State: AOJu0YyKrwBZYcKV0W62kDIC8f7emrsBfs9C7UMD7AQKQeVIjYKLKnxT
        J77UlR+l5TNS0upG5OnP/ANrsrF7OZs=
X-Google-Smtp-Source: AGHT+IFAMVzbZbNTuZdhdLNjn9EICn7ccdUL+FpAKEChTctEj7SKX2LSa1iXK/59QV/A7kRR5ON0Pg==
X-Received: by 2002:a50:d494:0:b0:543:7c4f:7ed0 with SMTP id s20-20020a50d494000000b005437c4f7ed0mr1034880edi.18.1699439324681;
        Wed, 08 Nov 2023 02:28:44 -0800 (PST)
Received: from ?IPV6:2a01:c23:c56e:b200:31ea:a56d:588c:3ca1? (dynamic-2a01-0c23-c56e-b200-31ea-a56d-588c-3ca1.c23.pool.telefonica.de. [2a01:c23:c56e:b200:31ea:a56d:588c:3ca1])
        by smtp.googlemail.com with ESMTPSA id s3-20020a50d483000000b00537963f692esm6733527edi.0.2023.11.08.02.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 02:28:44 -0800 (PST)
Message-ID: <b9a832d6-f7a8-4a9d-b639-181e074b4e9a@gmail.com>
Date:   Wed, 8 Nov 2023 11:28:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] i2c: i801: Add i801_register_jc42, similar to
 i2c_register_spd
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <79977020-69c3-4f87-b861-b043c7fb9077@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <79977020-69c3-4f87-b861-b043c7fb9077@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08.11.2023 08:27, Heiner Kallweit wrote:
> As discussed, this is a RFC version of changing jc42 auto-detection
> with the goal to get rid of I2C_CLASS_SPD completely mid-term.
> 
> Code of i801_jc42_probe() was copied from jc42 driver, just w/o
> the device id check. I think it's safe enough w/o this check.
> 
> I don't have hw to test this, therefore it's compile-tested only.
> 
> Link: https://lore.kernel.org/linux-i2c/a22978a4-88e4-46f4-b71c-032b22321599@gmail.com/
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 48 ++++++++++++++++++++++++++++++++---
>  1 file changed, 44 insertions(+), 4 deletions(-)
> 

That's quite some code for more or less nothing. I2C_CLASS_SPD is
relevant only for users:
- having one of the specific old ASUS machines with i2c-muxing
- having RAM with a jc42-compatible temperature sensor
- manually loading module jc42 to expose the temp sensor

From a maintenance point of view the easiest solution would be:
- set flag I2C_CLASS_DEPRECATED in addition to I2C_CLASS_SPD
  to encourage potential users to switch to explicit instantiating
- wait few kernel versions and remove class-based instantiation

What do you think?
