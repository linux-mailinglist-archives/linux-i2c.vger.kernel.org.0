Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF5849F30
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2019 13:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729612AbfFRL3k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jun 2019 07:29:40 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46863 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729605AbfFRL3j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jun 2019 07:29:39 -0400
Received: by mail-lf1-f68.google.com with SMTP id z15so8947353lfh.13;
        Tue, 18 Jun 2019 04:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wrEGOsVq0QU1LIKayJop8DhsfwbTjGNywhZ8KPlb/iQ=;
        b=kPpSj4/VIRjoH0OsJpiTf8y2vvjy4WqTB/QT4f67I4xJKVF+/9WJKwiyHxdukyFRLb
         J7uPtZb2XvbeLJH2U//p6ahDbPmCq7JjB5CuD+W8z+iL1Rp5C2KQd9b6Qjfrx52Ae1g7
         gL+UBdmLaz2cKMwqfbbS7ekw18aZHdHGGZ8io5QmCeC4kzbNkD4GDAYA6qK/jG1xwUM6
         vvnBuGTR25yhtZ7tPJPmP/6yRLoUTimC6+M4nARHJbsAT293kUIUmscOvUPJZm0H/q5I
         ciY+1/zNeyNsRXsya3RYlP9fxkOsVj5rof+i0bIMZ6mQUtJPBC4prgiPrDLj9S9kmYnC
         yk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wrEGOsVq0QU1LIKayJop8DhsfwbTjGNywhZ8KPlb/iQ=;
        b=mcjPolW2/7vYApJjjATzl+nt53xBdDC0sPZmA5vxbgBxFX1JTe45WLLt4QZgF6Twir
         uxZPygfDQ0wCIRLrSnUxPMNn2qyHmmrwBrhkSh4bFFRWSCAs1zX+i2byNLjCTvLG7V2V
         f9RnL10ne1z3NHzy7EFYg4+2Re3yGY1TOB76WGkOCn+Uv/1RzjbqK2ClBl5CVLnddUii
         FSDtXrfBryYwxCCr+kBwZ9lNV6ffnYfiOLOPveJ5AnxPk/cXPBeRvCZtECRRdHKnjTR+
         IWAtg14P3cZfhU9fgqC11FtTMoLEkIybAxXW06Z/Zw5h/uFxId1UO+LdjL4UHC0L5TBr
         nOIA==
X-Gm-Message-State: APjAAAU8+n63FIwz2iI6aGNwkaXHofpZDj0HfRkaXbgqKkgK5ZsODiGW
        zoNFtc9tQd0a5tV5tvcQpRY=
X-Google-Smtp-Source: APXvYqzG7PT5Lmpf+p5yw0ew9eWU/usDPYYl7hM4PQgFU6cHs9t18izXn8jKIKtC0pg4HSfI5ApJhw==
X-Received: by 2002:ac2:50cd:: with SMTP id h13mr21844167lfm.36.1560857377619;
        Tue, 18 Jun 2019 04:29:37 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id l15sm2848490ljh.0.2019.06.18.04.29.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 04:29:36 -0700 (PDT)
Subject: Re: [PATCH V9] i2c: tegra: remove BUG() macro
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1560856182-26072-1-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e1bf5aac-5528-3e54-0f41-5a1bbabce419@gmail.com>
Date:   Tue, 18 Jun 2019 14:29:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1560856182-26072-1-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

18.06.2019 14:09, Bitan Biswas пишет:
> The usage of BUG() macro is generally discouraged in kernel, unless
> it's a problem that results in a physical damage or loss of data.
> This patch removes unnecessary BUG() macros and replaces the rest
> with warning.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 47 +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 39 insertions(+), 8 deletions(-)

Thank you very much! Please keep applying all the advises that were given to you
during the reviews in the future patches.

I made a quick test and no problems spotted, all warning spots are silent.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
