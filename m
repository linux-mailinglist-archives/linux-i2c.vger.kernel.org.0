Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3FDB1B27C0
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Apr 2020 15:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728956AbgDUNZ1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Apr 2020 09:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728645AbgDUNZ0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Apr 2020 09:25:26 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06FC1C061A10;
        Tue, 21 Apr 2020 06:25:26 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id z26so13943486ljz.11;
        Tue, 21 Apr 2020 06:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zNLfcextec8+a0Z1+E3Iliuz3OGd0yXcMUIIhnR/K+I=;
        b=CsPEQFhnc7ES5ou+9OngIcjPZy9tAZECifEnJLBI4gJKLLQ7yySAxB065JIR1bdGqv
         2Hp8tjTiC4kYHzx/13PP0O2ZvHIyLTNLC2y4eVfx17hwYBFBPBppesaWOv0PCU3wE908
         W09nq3AU4ByvxqdAA3WgfDwp70MzT/hlEEbYRZFS7mkAzcSO6iYsrwWlPIdDYproHN28
         TmEMlqAjICMwEN7vZiz5IQjzgLawNUb6Xcx87iaCnFHite6j2mCdoMA0moFllWbM49XW
         aDk/buYTdCy2cL92u7H/00sDr6Fa75vPTrTaaTKjw8fkZlW4CUww3WqBOvV2DS/y/Awb
         FJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zNLfcextec8+a0Z1+E3Iliuz3OGd0yXcMUIIhnR/K+I=;
        b=YGBuieJySWME4gypuQZC1VLgwzM6ocoRkHv/Jy3z7seVTO9M1SI+kqJSxvcU0t/jPX
         dt7R9m71BzcTL4o/cdmlRnQ7iPxSrTPMOIAvWk9o7RIW/y/GIcgikmQcC1BRbjlMTVJY
         SbN/i+z5wYhd123+MtTuPuQA/coBfOa56EEnjfUM0qqLmTaoUgmNDFk0DU7ac4e45Ets
         6+Cxa3fKSniCNeRc5ST4R7ymzz3x85I+wBFGpaSiPG7T/8ldgLjFd7bV0qinuc9/7TIY
         8usNxaAI7j6ljv49oqLBAMrZb/veKJZa7ovPf0y09q1aewHPiJokiNhnmCxIwS8lW++4
         KzXw==
X-Gm-Message-State: AGi0PuZzNTts4O4TaxKl7Fqdvp405k+TUuidoh/4J3UlDe4rVlOzzsyQ
        vNHfOdf3mP+qClwsTDaA57Uh7uTf
X-Google-Smtp-Source: APiQypL+HPGjefPtpy/Xsn0VxuLp1+WcCkAhlvtQpboWQsXE8nuxRhOK2Ri7zdaxzB2st6owdRQGSw==
X-Received: by 2002:a2e:7a0a:: with SMTP id v10mr8482272ljc.86.1587475524095;
        Tue, 21 Apr 2020 06:25:24 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id f22sm1888770lja.39.2020.04.21.06.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 06:25:23 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
 <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
 <f59ba318-8e99-c486-fa4d-1ee28a7b203d@gmail.com>
 <b01cec76-bb39-9fb5-8f6e-4023c075e6b3@gmail.com>
 <8cd085e1-f9fd-6ec0-9f7a-d5463f176a63@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <db1132ce-53a8-371c-98e0-cb7cd91d5c7d@gmail.com>
Date:   Tue, 21 Apr 2020 16:25:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8cd085e1-f9fd-6ec0-9f7a-d5463f176a63@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

21.04.2020 12:49, Jon Hunter пишет:
...
> I can try the above, but I agree it would be best to avoid messing with
> the suspend levels if possible.

Will be awesome if you could try it and report back the result.
