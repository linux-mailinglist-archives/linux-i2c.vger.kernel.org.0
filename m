Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E31F63E9A2D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 23:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231927AbhHKVFk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 17:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbhHKVFj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Aug 2021 17:05:39 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D699C061765
        for <linux-i2c@vger.kernel.org>; Wed, 11 Aug 2021 14:05:15 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id x12so4909435wrr.11
        for <linux-i2c@vger.kernel.org>; Wed, 11 Aug 2021 14:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ouGt/9O7zCwkqsd+XI3jlrIi47Q+9Wmfqujy0Iy9BkY=;
        b=TFHV85vyl5NNfVlhI43yxXYsFeFh9wWv1ozmNfJQ3Wqs1J/L4IUedNzg2A86sRvYPv
         aBgzKbdJ3ZmoOvm8rKZ9FajZkW6bOw7UJm8g0smnvikhT4EE/qAMb5de8FLw3vyXXBgJ
         OBde5l5EVUXWqD832IEuhocPrPzxUp7QB54LotUhAOUFjrqtEq9SvlxmOyfufG7S6Sl5
         +2o+Zs7LAoqkiG2HxRYcTuDiI3RwizrXV8o/APQUT0dEtOvx0mDYy7s7I9WV5wksrUps
         MM4OFT1WlqIl1cZjvWDtGo/T1rwNml9v4nsY0BEvX+ILiE0NliIRLarkqpVFcClp0UlU
         YyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ouGt/9O7zCwkqsd+XI3jlrIi47Q+9Wmfqujy0Iy9BkY=;
        b=VCPsNibt2ohCzh9atYMnpoAl7C8wob/++hCZBI9c1KTVslSObEdbTViciE4vFG88th
         WKqySoidZSFl5uQNZCAC/Odft200C5lPAGo4uN+WW9SkS/+Q+aF+M7nJgMQx+PU4/aww
         OgWboqpnvwmeseXBEwF9bI6s/14T4Mzhj9MYwBGEu5s/eKNgzftYkqlrJQjlGTloMIhd
         cZZ8rmczdUGzhPLOCy1IbTJMTIAuo1OXv5gy9JNaaXjZhArwIMwGGaRnq874Hhw0t7Si
         2eorRfy5CZeEjjNFxu8N9aitKPysy5oFQmgaZLxf5qY/ml84J02eUpOaQg65OH+fFRzk
         yGJQ==
X-Gm-Message-State: AOAM533Kp7i6ryAJIkUWCb25zOyf8Zz+ZHbRah4R49w9jUDdsqDvUi0s
        Aelyeta+TvKnETPLtjSQ5L0qCK8JZ0vHBw==
X-Google-Smtp-Source: ABdhPJxqTuSWRjxkQ2ldYk7AaqS8spAgGoyqDJVXBJFvkF2NZgJBsMJIlugyGXsj5YW3J5hco+oTTg==
X-Received: by 2002:adf:e101:: with SMTP id t1mr358102wrz.215.1628715913796;
        Wed, 11 Aug 2021 14:05:13 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:988:dfda:c500:b22? (p200300ea8f10c2000988dfdac5000b22.dip0.t-ipconnect.de. [2003:ea:8f10:c200:988:dfda:c500:b22])
        by smtp.googlemail.com with ESMTPSA id d9sm479148wrw.26.2021.08.11.14.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Aug 2021 14:05:13 -0700 (PDT)
Subject: Re: [PATCH v2 1/9] i2c: i801: Improve disabling runtime pm
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <10690555-2317-4916-70b8-870708858f9b@gmail.com>
 <YRPvtPid3EeMylSr@smile.fi.intel.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <3f225422-b343-eaef-0a95-9d15a5a378f2@gmail.com>
Date:   Wed, 11 Aug 2021 22:03:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YRPvtPid3EeMylSr@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11.08.2021 17:41, Andy Shevchenko wrote:
> On Fri, Aug 06, 2021 at 11:12:18PM +0200, Heiner Kallweit wrote:
>> Setting the autosuspend delay to a negative value disables runtime pm in
>> a little bit smarter way, because we need no cleanup when removing the
>> driver. Note that this is safe when reloading the driver, because the
>> call to pm_runtime_set_autosuspend_delay() in probe() will reverse the
>> effect. See update_autosuspend() for details.
> 
> ...
> 
>>  		 * BIOS is accessing the host controller so prevent it from
>>  		 * suspending automatically from now on.
>>  		 */
>> -		pm_runtime_get_sync(&pdev->dev);
>> +		pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
> 
> I dunno if it's being discussed, but with this you effectively allow user to
> override the setting. It may screw things up AFAIU the comment above.
> 
No, this hasn't been discussed. At least not now. Thanks for the hint.
This attribute is writable for the root user, so we could argue that
the root user has several options to break the system anyway.

