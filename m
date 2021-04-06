Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEA0F355CD9
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 22:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236165AbhDFU2b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 16:28:31 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54]:45907 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231650AbhDFU23 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Apr 2021 16:28:29 -0400
Received: by mail-wm1-f54.google.com with SMTP id o20-20020a05600c4fd4b0290114265518afso51191wmq.4;
        Tue, 06 Apr 2021 13:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hrYOdHV1N7sd29gTwxVKedrBhxXnAdYApAMdqUkuEFc=;
        b=SMRCy+gjowIQSbjqrbTG3p99b1G08EMsj/D9olNqWYYPFdDOkN1DINZpTzr+CIfEhO
         tYwFsCtmg/JARJu3QWRgx7rN/Q3ZtFBN2Qhs9M2W/PBz8hSHWgjxIeghda9riZix+uCs
         KzJ/fzPbxPIbTnow7qoBi/kW16KBOQkiLLq6kYRHLTrToulODHPW+yqCqOyWRhECOLPQ
         /p/ab6B+2W69WdkOGeJL/ET9POGcouCB0kq8xS23PLcAdiupudDGAS9QN+KAUqkvGQz5
         xi2wxGRtGg+UV76KitMYRHMoylvADAOt0IoZ4ut69a4S3EGa6YIOnemohC/obukttcxj
         W/Zw==
X-Gm-Message-State: AOAM531T9w8/AlVS42VursEdCdZoxzAfZ49HyFLdvqooVKjlQ8Dkbmz4
        6NSPrgH6b+tZynvn2vC8c75PTxZ2nU6EDg==
X-Google-Smtp-Source: ABdhPJzR+voEN9b+yT4iM9TsQyRWWYqRcHOjQadmyFyXtXboVOw+/pOeZYgiqp2rk4kbRMr/ZIlwtQ==
X-Received: by 2002:a1c:9853:: with SMTP id a80mr4485485wme.44.1617740898637;
        Tue, 06 Apr 2021 13:28:18 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.googlemail.com with ESMTPSA id 91sm37074489wrl.20.2021.04.06.13.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Apr 2021 13:28:17 -0700 (PDT)
Subject: Re: [PATCH 05/12] ARM: s3c: mini2440: Constify the software node
To:     Wolfram Sang <wsa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
 <20210329105047.51033-6-heikki.krogerus@linux.intel.com>
 <709e434f-9e35-bdd1-7785-1938b2fb80ee@kernel.org>
 <YGHIyRu625C/kgRL@kuha.fi.intel.com>
 <c326cef1-523a-0ce8-70a1-5cf89bde35f2@kernel.org>
 <20210406194030.GD3122@kunai>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <f9a95bcf-78ee-db22-3431-62d0702d1044@kernel.org>
Date:   Tue, 6 Apr 2021 22:28:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210406194030.GD3122@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 06/04/2021 21:40, Wolfram Sang wrote:
> 
>> Thanks for explanation. The follow up question is - can I take it
>> independently via ARM Samsung/S3C tree?
> 
> Is it possible to just ack it, so I can take this all via I2C? Or will
> there be merge conflicts. I can provide an immutable branch, of course.
> 

Sure, ack is possible (from my currently used email):
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
