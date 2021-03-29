Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD5F634D827
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 21:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbhC2T23 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 15:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbhC2T2Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Mar 2021 15:28:16 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888BBC061574;
        Mon, 29 Mar 2021 12:28:16 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id u4so17218159ljo.6;
        Mon, 29 Mar 2021 12:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=GQrZO+7mqiYzqAmSSzQn1gDRn2Mbnb/SUnnWgNTEkqI=;
        b=bhpsR/F29ROiyh6PG+lxUa+1SbMauPFwXd6L4MfGriKfW+iFzZrL6cCEV+JEPVAPhL
         FI93iR9dw5yH6DtdcqKRuwE2O7S+VtQDdJ09irdCEUYg0LN45Ch312oKEQMFnUEzfPmC
         7jggbtriBu65br6BAf0w/nyjamLV0KkAh2R7xGsPfhlrsdlEMACjG6Le72E7sEoyVf9G
         Ij9Z6sqTLwLXmfI+M34KqilMht+w3V5LKge7WFBwB+/aU07gShDJ/JKCjUTRfBUm05l/
         kKfwX0R6Nxi1kaUzzgRQTUczMYNjiZTPepfcN1qrCPv8XB0lKnNjTTrw5kfxACpbXxet
         Tx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GQrZO+7mqiYzqAmSSzQn1gDRn2Mbnb/SUnnWgNTEkqI=;
        b=ZfwkTk0+ieUd3gyv+5hSLAvzBcKNGt4mG22fbzDe2DBZzFfWVk/DAqjQzhxSDeWpS5
         0nSEw1uOEMY/CI6v1jiBC/D/cZR+96lAJwRv84jHMtnOVoWXvaNIaB3geduNSjcUGgna
         KsZY7eCRZbWTvV32BK6ZE6nnz0zp5zPmEE4xWcOmFXxhBh9ALa+C3vD9gbDXT61TYPLy
         RbFLLjIDpc17eeotILMJgRkUy6FNq96SkQrdw3VWoZaF/YmTClZNnPzumR8X+gDEedcy
         WLnwdb/o7+dkwLSS5etYMvREnP13TBbDwPNcKTp3L+a39nTBYc1DiNDsJw+Zkin9pP+k
         7MDQ==
X-Gm-Message-State: AOAM531R5uh6MNf15wiy32TkA9d7jdo11HatfoCUiyvVIxnkjPc01ZQI
        mJ+pz4uH/zoVcp6QmVhRtmiHjnCJU1E=
X-Google-Smtp-Source: ABdhPJyNHRDzvCjP4qOOKnZzqdYALof2GTGF9Gkmzwk/dS1OSaDbhKGf1V+NMI9KvKs0wcSYp9viCA==
X-Received: by 2002:a2e:a48f:: with SMTP id h15mr19093669lji.234.1617046094927;
        Mon, 29 Mar 2021 12:28:14 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:b259:a10:76ff:fe69:21b6? ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id i123sm2526715lji.108.2021.03.29.12.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Mar 2021 12:28:14 -0700 (PDT)
Subject: Re: [PATCH v1] i2c: tegra: Improve handling of i2c_recover_bus()
To:     Wolfram Sang <wsa@the-dreams.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210329190546.24869-1-digetx@gmail.com>
 <20210329191531.GA6654@kunai>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7b5e8060-abee-a9e1-1c88-78f0a20e2e96@gmail.com>
Date:   Mon, 29 Mar 2021 22:28:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210329191531.GA6654@kunai>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

29.03.2021 22:15, Wolfram Sang пишет:
> On Mon, Mar 29, 2021 at 10:05:46PM +0300, Dmitry Osipenko wrote:
>> The i2c_recover_bus() returns -EOPNOTSUPP if bus recovery isn't wired up,
>> which the case for older Tegra SoCs at the moment. This error code is then
>> propagated to I2C client and might be confusing, thus return -EIO instead.
> 
> Hmm, makes sense. Maybe we should change it in the core? But with EBUSY
> instead?
> 

This also should be a good variant. I'll update the patch, thanks.
