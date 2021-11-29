Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82243462491
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 23:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhK2WVS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 17:21:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233936AbhK2WTy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 17:19:54 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D55C07CA11
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 11:54:39 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id c4so39275303wrd.9
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 11:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=g+aAH//M0o7Plustrq+6CZikNZt0dAj6p4nubcfBmOw=;
        b=MZLXrRImO44i9EF0n728gmARmN0PNd8Cim6JrA+F3woFFt6Mmk1+EG7W4Y+DuaEUL9
         1Tse4ZWZv2FbbBdM0WsqnvOb/l7DdQWgslXdpgHgnyvO469O82hmy4Snl5UdRwM5LuEw
         5lNuh+SeSgg5YutvM5LAJ+rh/AI1bJrsLtzZ5/VhZx0saYTYvyG/wWEQBu1qv/0Xt/Oe
         yYIQ/cFntUHOK/Hkxp/9qV88zYupzd7MQVcjDGxkX0HUivf4QdkDmvsloZQAIkeVW7DW
         6uf1rn9nDr9kdPCBosFjzBuLbAckqLeYrxm8Uzfm71FS2gUbLlSk1NgbO7IJEwI/hqNk
         oSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=g+aAH//M0o7Plustrq+6CZikNZt0dAj6p4nubcfBmOw=;
        b=xuJsLvivGmj0JDWWfm8t2Xz45WRU3RiGPZh8861vK5ngdHEexy+NHuC4ziWdao0beb
         Dp5nvRQdL0v/8Jl1O3G14dL5QyFtq+KB/GjDQmqz4ja0fizayZ7fw/YmxLamAqn9roNo
         F5/FXpS69GS3cIFIwdRmKZxRxo3GM2dw0jG3wXKFE+bzTaQRaatbTzpPU8kHexFJpYnr
         b3wRKc85H0aNkkJCYOpdSwtfFnX6AqpCw6ReyUYY5pY0PFx/zNxN48WqXVRJQelIPvFA
         gLvt8n2QjXIs+H7ecyFOKlh4PmnC1nkHlI+ZXRnhFOqyEObNixTvqjUNyJrXSCOrPVdp
         TDvA==
X-Gm-Message-State: AOAM530wH1erqX0nIpvolDP70IMCmwLM9IK4Hq3C8POCSYwPrYQohsfR
        BcF1EYLjB+66FUaKWQ9Y4Qw=
X-Google-Smtp-Source: ABdhPJykFeOM4gJb949Se3YN4s56Tzu7q9RrGjHvi/u/E00IRbEzuEyebMJU+dc/orcfe+nTc9zQHg==
X-Received: by 2002:a5d:65c7:: with SMTP id e7mr35521630wrw.319.1638215678326;
        Mon, 29 Nov 2021 11:54:38 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:8596:696b:f4cd:9c8e? (p200300ea8f1a0f008596696bf4cd9c8e.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:8596:696b:f4cd:9c8e])
        by smtp.googlemail.com with ESMTPSA id c6sm291795wmq.46.2021.11.29.11.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 11:54:37 -0800 (PST)
Message-ID: <10f29c6b-b832-37a5-9f81-e99a8df516e3@gmail.com>
Date:   Mon, 29 Nov 2021 20:54:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 9/9] i2c: i801: Improve handling platform data for tco
 device
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <0e8188d1-e35c-162b-6657-b22e8034483c@gmail.com> <YVgN9xLPSJAOqkz+@kunai>
 <YaSWRBJEgq9ZGhjE@kunai>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <YaSWRBJEgq9ZGhjE@kunai>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 29.11.2021 09:58, Wolfram Sang wrote:
> On Sat, Oct 02, 2021 at 09:44:55AM +0200, Wolfram Sang wrote:
>> On Fri, Aug 06, 2021 at 11:18:40PM +0200, Heiner Kallweit wrote:
>>> The platform data structures are used in the respective i801_add_tco
>>> functions only. Therefore we can make the definitions local to these
>>> functions.
>>>
>>> Reviewed-by: Jean Delvare <jdelvare@suse.de>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>
>> Hmm, this doesn't apply on i2c/for-mergewindow. Did I miss a patch?
> 
> Since a lot of other i801 patches have been merged meanwhile, I'd need
> this patch rebased if you still want it to be applied. Thanks for all
> your i801 work!
> 
I just sent a rebased version.
