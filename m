Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 529E83519BE
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Apr 2021 20:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236265AbhDAR4G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Apr 2021 13:56:06 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:46937 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234960AbhDARoH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Apr 2021 13:44:07 -0400
Received: by mail-wr1-f49.google.com with SMTP id v4so2603409wrp.13;
        Thu, 01 Apr 2021 10:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gjskHJdt/cBvV7iCEidveAPKT6ao1TW5TgwFfOyC23s=;
        b=iWPU5xg5RNm0WZUBMBKp1X9EdVsk5sKM6cOb4zbVI8vhG3VCBDpTbr9UDAFgXQNh9g
         qJcUjzuppWPvYrkeTfvyorkTRXrkCRQLEl04DKsmpaz9oN7fBebty6CCBhM2XoF5J1Hc
         +WfIoCBTVMDYVYoJQSOt/9351MUnt6NAGGbXTUd9Qy7advXmTB+nOZWiiVlAAIEPlK/o
         DkDEq2dTPtNJpQ/6WRZB4A/N/dvzQaQfEVgq6cCOh/Bwa1V6Lpl0esAkA6zQs48XDI+e
         2AhDFUZ/JPDbZ1QSlVse5lAjWA+fOWWk/FAaGoxIkseye5R1y70wriv57bq8TGj4CFU3
         dS9w==
X-Gm-Message-State: AOAM531m9QGJie0KCHkAZCfJ76MUnknlpaayScTREYLptNSm+IotxZcg
        dnTFr47HN3XG7pEUGMv0m0xfae8K59c=
X-Google-Smtp-Source: ABdhPJxBDpVKMVKmUq7c6tRyYr3sCvnVeMMT1xh1Xp6CB+1rM3nqkVl8ZC/kFNPbbls7b8LMKQadEQ==
X-Received: by 2002:adf:f150:: with SMTP id y16mr10994688wro.414.1617299043791;
        Thu, 01 Apr 2021 10:44:03 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.googlemail.com with ESMTPSA id u3sm10708145wrt.82.2021.04.01.10.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 10:44:02 -0700 (PDT)
Subject: Re: [PATCH 05/12] ARM: s3c: mini2440: Constify the software node
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
 <20210329105047.51033-6-heikki.krogerus@linux.intel.com>
 <709e434f-9e35-bdd1-7785-1938b2fb80ee@kernel.org>
 <YGHIyRu625C/kgRL@kuha.fi.intel.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <c326cef1-523a-0ce8-70a1-5cf89bde35f2@kernel.org>
Date:   Thu, 1 Apr 2021 19:44:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YGHIyRu625C/kgRL@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 29/03/2021 14:32, Heikki Krogerus wrote:
> On Mon, Mar 29, 2021 at 12:58:41PM +0200, Krzysztof Kozlowski wrote:
>> On 29/03/2021 12:50, Heikki Krogerus wrote:
>>> Additional device properties are always just a part of a
>>> software fwnode. If the device properties are constant, the
>>> software node can also be constant.
>>>
>> Hi,
>>
>> Thanks for your work.
>>
>> I did not get the cover letter nor other patches from this set and I
>> don't see how the i2c uses the swnode. This makes difficult to judge
>> whether this looks reasonable. At least without the context the title
>> looks misleading - you add software_node or change to use software_node
>> instead of constifying it.
> 
> OK, I'll try to open this up somehow...
> 
> Whenever additional device properties are added to devices by using
> the old device property API (device_add_properties()) that also i2c
> core code uses, in reality a software node is always created to hold
> those properties. It's just always dynamically allocated.
> 
> The goal of this series is to prepare the i2c subsystem and drivers
> for the removal of that old device property API, but I did not see
> that as relevant info for this patch, because even if we did not in
> the end remove that old API, this change is still useful.
> 
> The patch does exactly what the subject says. After this we supply the
> device a constant software node instead of a dynamically allocated one.

Thanks for explanation. The follow up question is - can I take it
independently via ARM Samsung/S3C tree?

Best regards,
Krzysztof
