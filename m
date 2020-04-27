Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C43F81BA06F
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 11:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgD0JwO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 05:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726589AbgD0JwO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 05:52:14 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11EB5C0610D5;
        Mon, 27 Apr 2020 02:52:14 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id m2so13255498lfo.6;
        Mon, 27 Apr 2020 02:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/1SDtO4Ad7MyXOywoaq5DD1Ze7Y/wDVd4q/zz16aaT4=;
        b=s1Zx9bZGzXF8XJY7Nn2UJcY/TsTM7XJe2efANkLHLqxaIPK2Ska0PJTbWs4J3EVtol
         cdoj2ZH940ZohXKwRpNz1ZmZ4MiLyzV8r/LuM5NfphG/6gm+0DovqqnxGZKqCdzx0RkT
         HzNZwHw4qz8gO70cUOodxIY3Zl+thFFcS8807UFd/ArIZPh6T2SEU9qxVT+UyQqWb+zV
         MAe8vJCoYNMXpOvP6uthVAYvuBGPodcN7K9JLS1qot4wT0yPiswagnVbZqNBWfjHF8jk
         GWkoOWr9bl1Xv6faS68mSLABOAFlTJ5hXNdPmDbkFYCt6Wyhok8zP/BsDk1/gjyJZWH9
         +8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/1SDtO4Ad7MyXOywoaq5DD1Ze7Y/wDVd4q/zz16aaT4=;
        b=eazoQOFAf7WtwO2/Hpt0B7HshAi+GNrP1UCCYGsbl4TpAuL1o94V5IY8GAVsv8Lx6z
         oki4AAelbICKOkIU3yMdxlD8bkUvVOXXzEnt2SCXu7qi8GD3fM/b1NIt05hnmCOiki2r
         RH44DCswPJckt0DGQBBiJFz7yERYoZqr+gBxnWwYszYZBkVOIBRMXTLcJsLCnVlw/Dl2
         TH65x/SiFPeKSO5UQsowWkMlo+jeBqMwdNMhGde/ISGM++8zYYgSB1Hj/qLi5Ly7cLtV
         sbUXctkmfOhlx9AETAauGBGlXpG5e4sBskawG46rgRmXYdW9FbKrnCl2ipbpvQJUxzh0
         qXtg==
X-Gm-Message-State: AGi0PuYKnj06UNYLgPMJQpxsZyzkpC9WF3jmuuxGcNAngs3ES6McLheX
        AXGQkuk4kL7DiqT49pzDpgoLJFQl
X-Google-Smtp-Source: APiQypIrZKBB3s8eVZpVqi1XMC/roIR+Qb4Ack7/dTw+w7yQiAvQ0moOUKIy1RICEh0aIpzKAnwt1A==
X-Received: by 2002:ac2:4c34:: with SMTP id u20mr15166804lfq.40.1587981132001;
        Mon, 27 Apr 2020 02:52:12 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id c10sm2737181lfc.7.2020.04.27.02.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 02:52:11 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <bba0a93a-8ec4-eda6-97f3-fb2ab0b9b503@gmail.com>
 <6f07e5c8-7916-7ea2-2fe7-d05f8f011471@nvidia.com>
 <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
 <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
Date:   Mon, 27 Apr 2020 12:52:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427074837.GC3451400@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

27.04.2020 10:48, Thierry Reding пишет:
...
>> Maybe but all these other problems appear to have existed for sometime
>> now. We need to fix all, but for the moment we need to figure out what's
>> best for v5.7.
> 
> To me it doesn't sound like we have a good handle on what exactly is
> going on here and we're mostly just poking around.
> 
> And even if things weren't working quite properly before, it sounds to
> me like this patch actually made things worse.

There is a plenty of time to work on the proper fix now. To me it sounds
like you're giving up on fixing the root of the problem, sorry.
