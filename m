Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBFB7139CF4
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2020 23:53:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbgAMWxQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jan 2020 17:53:16 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44224 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728994AbgAMWxQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jan 2020 17:53:16 -0500
Received: by mail-lf1-f68.google.com with SMTP id v201so8189140lfa.11;
        Mon, 13 Jan 2020 14:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KHnvnN3lDGWBZcYdcw5+iDp4bDu9HTX8MqfJ39n2Djc=;
        b=E/RnX/WwjoDdRucl6paIhf7V9plcSdleOLDtSCkrLO/sG+CWbZ2rRcd8NuNHB89Gl2
         8BNfTk0sg1Z7EjdSGM1bIozklLZ1+275JkAuY23pweKGUDEP/mmQnYMtZLa33WuJ8l5W
         LwjXkhl7bYwuPBfKE/zara6FU1ywyhWNca3MsnfbRnSyXJ1JeMwbFV2CVXyd15i/UM9u
         8nyMLhpIijjdQKw2I3TMLeUrqph7jMOnKsnw8IBB04A4ww1ADFt2U0+2ZA6s6XP3vieq
         swmWUH9kKogMqMb14mKpRy+LQMlCxgZCxN6i58PcCYxoJHYFIwr29mevkUB+0N27O3CO
         FAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KHnvnN3lDGWBZcYdcw5+iDp4bDu9HTX8MqfJ39n2Djc=;
        b=rbJW0yQ5p++cEHiwRzStwW4zhSKtyYSw49rX0wYm1JBPui3iilAvMM69EqSl2XuFk/
         Jz8fa7cn7M854lkiDKmSyZyXO2KTQ08yrG2fGk2yu1kAcPSMJThmX9E3UPGVK4W4IvPB
         Rxams2mYNyYqZc+m4+HK0yhwq7CO2t63rC3traGbfpLVl+Rbc6Ppl0CV5J8OxfjTo14/
         y/6MZJ8G7LWydLhAeXXt1DRlUMMfGgT8O7Yxe2PtFiHZOebXYlEE/uUXY806jnlkAf0c
         6j7iqfeuPJ+kOOtoRfjATHzECazU8Qm6bv0yY5xl/LvNzYRsAUgTMYwyPvWw3hl7MVk/
         Q9fQ==
X-Gm-Message-State: APjAAAWcvA7ojMkXFaaZX8iIfj3UmdJDQsR/m/dWKavML7KeRKiECJO9
        RsyRvSKeBWrVerEv8o2wX7uDitO9
X-Google-Smtp-Source: APXvYqy4Do5VeXsler/DZNP25OPRLnqyCIEysnUx0sbRh/uorSV5SSKA83a/95ykKdoNelYIBLUkOw==
X-Received: by 2002:ac2:5605:: with SMTP id v5mr10926099lfd.136.1578955993516;
        Mon, 13 Jan 2020 14:53:13 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id q186sm6602481ljq.14.2020.01.13.14.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2020 14:53:12 -0800 (PST)
Subject: Re: [PATCH v4 4/8] i2c: tegra: Support atomic transfers
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200112171430.27219-1-digetx@gmail.com>
 <20200112171430.27219-5-digetx@gmail.com> <20200113220315.GB2689@ninjato>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <86f71bfe-7d17-0bf4-edda-13c84301a598@gmail.com>
Date:   Tue, 14 Jan 2020 01:52:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200113220315.GB2689@ninjato>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

14.01.2020 01:03, Wolfram Sang пишет:
> On Sun, Jan 12, 2020 at 08:14:26PM +0300, Dmitry Osipenko wrote:
>> System shutdown may happen with interrupts being disabled and in this case
>> I2C core rejects transfers if atomic transfer isn't supported by driver.
> 
> Well, not quite. The core complains about it nowadays, but does not
> reject messages. It will try the same behaviour as before. It will just
> inform the user that somethings is tried which may not work. I probably
> should update the error message printed saying that the transfer is
> still tried.

Indeed, now I'm recalling noticing that the transfer actually should
happen despite of the error message, but then completely forgot to
update the commit's message. I can update the message and send out v5,
if you're thinking that it's worthwhile to do.

>> There were several occurrences where I found my Nexus 7 completely
>> discharged despite of being turned off and then one day I spotted this in
>> the log:
> 
> Given my reasoning above, that should have happened before the warning
> was printed as well? Because same behaviour. I'd be surprised if there
> was a change...

Pretty sure that it was happening before, but I wasn't paying much
attention back then.
