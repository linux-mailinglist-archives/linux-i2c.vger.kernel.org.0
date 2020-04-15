Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C01021AA997
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 16:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636512AbgDOOOu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 10:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2636501AbgDOOOq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 10:14:46 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66526C061A0E;
        Wed, 15 Apr 2020 07:14:46 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q22so3891583ljg.0;
        Wed, 15 Apr 2020 07:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QzeHwFEGJr/8bxH2v0CKWpMLToIaeBe6lea2lI4zgDM=;
        b=A2lIE3kghVFiVELn6oIETNImTUq9oxgX6Z8wrQBo+dD793MmcVhfd8oX/2fuN5v2Xm
         P/dgCGGxEzswK4sqGdGiAVgO1Zm/kIyMZYaAJmRO+oHFNyQMwhdq9kbZ93nN/uO4puTv
         emU/DCjJF7eB9CYdHPsQhsfZRizM6jAU3nL1Twr1/O2GNCT49/0w/OpkAOAeGSG3bLYa
         4dycP0xDJE3CHmNS5F9Z+TEsIi8oo68yZsSXPYpF65CvhY1EteCLgPDu0xyqCK6DpVPu
         DyPTPTvqrY7z5odWPDzcCoYBW25tSTodKLXbQ3vTSnHUkdfKK0/a5TfjSvkgwVN+hZZ1
         eH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QzeHwFEGJr/8bxH2v0CKWpMLToIaeBe6lea2lI4zgDM=;
        b=RQAjNhTdh/I8N79Ez/f4CwDFP9hk2po19shv2BpuwCITpJFBDHZ9lzhcL5VnMVvaAl
         FG7egINqKp0sopclNRQJOq+fG38mTdvcSosu/cKMR7s6UBqzNb2xwjXUQxuNoqJidtP8
         BjjzuJI0Wx/q7VdVa+q7YEBnLRdwYLX/n3E80YDu0IfiSDT6yduoZGJ/9wXuouHQqwQd
         0Qp+KNvccejZU/fyVNeQXvLmtVL+obBg1IIfRQPZo7OAZJMHQnyp4xMGehc+N1yZ4H7E
         HpsVJBOsvBldPl1HARz6KzoQaA5SoLTkvUpf6zrlrGPQZOpw0AOVG+kWVsEjLpzJ/VIu
         Dy+w==
X-Gm-Message-State: AGi0PuY2JiEWc5Ti8WMl8lmOWU5syU7L8ES9w1jVMNy3CYKsOjmc32Og
        Gqj6UDFKcXB8JoiTfwbypwRUOPE6
X-Google-Smtp-Source: APiQypJu5jBUvBYy6D4/PMMoKIxi/FfAKbsFdPDm9YWKPHV3ho24uGk4mkxIr9iyr7sJKDautLwTYQ==
X-Received: by 2002:a2e:85c4:: with SMTP id h4mr3553226ljj.112.1586960083875;
        Wed, 15 Apr 2020 07:14:43 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id v17sm12851270lfe.34.2020.04.15.07.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 07:14:41 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] NVIDIA Tegra I2C synchronization correction
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200415114536.GB910@ninjato>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <87f18a67-5aec-b5df-9d8f-341f03ff3a72@gmail.com>
Date:   Wed, 15 Apr 2020 17:14:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415114536.GB910@ninjato>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

15.04.2020 14:45, Wolfram Sang пишет:
> On Tue, Mar 24, 2020 at 10:12:15PM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> Recently I found a way to reliably reproduce I2C timeouts that happen due
>> to improper synchronizations made by the I2C driver. It's quite easy to
>> reproduce the problem when memory is running on a lower freq + there is
>> some memory activity + CPU could get busy for a significant time. This
>> is the case when KASAN is enabled and CPU is busy while accessing FS via
>> NFS. This small series addresses the found problems.
>>
>> Changelog:
>>
>> v2: - The "Better handle case where CPU0 is busy for a long time" patch
>>       now preserves the old behavior where completion is checked after
>>       disabling the interrupt, preventing potential race-condition of
>>       the completion awaiting vs interrupt syncing.
>>
>> Dmitry Osipenko (2):
>>   i2c: tegra: Better handle case where CPU0 is busy for a long time
>>   i2c: tegra: Synchronize DMA before termination
> 
> Patches look good to me. I tend to apply them to for-current instead of
> for-next because they are fixing issues. Even a stable tag?
> 

Thank you, yes it should be good to apply this series to 5.7 because the
Tegra APBDMA driver dependency-patches are already in 5.7.

The stable tag shouldn't be needed since this is not a critical bug fix
and the DMA driver patches are not going into stable. This series should
be more actual for the upcoming devices, which should be upstreamed in 5.8+.
