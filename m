Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7438F45E3C6
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 01:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244671AbhKZAqW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Nov 2021 19:46:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357348AbhKZAoW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Nov 2021 19:44:22 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059D4C061756;
        Thu, 25 Nov 2021 16:37:39 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 207so15380536ljf.10;
        Thu, 25 Nov 2021 16:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nMCkcNkVJHrUMMEDkKpjCXIAHsxHK0m1G/QamSr9K6g=;
        b=UOqnunqsnMn5D9EP50S6+aOvQtPLUoltWmiTz6HxAhNzfbeySPSOPGeOl6o9gABXgU
         R4ubclYHdlRX/BhMdfS1jWkG+fx/GwEjHYhLmMyhYRbVU5p2soAScnBgla+f61DspLaW
         QvobT/wWL/czGrNtFt6a5rHvXebhv8swzGkNZJ6DFxe41OVxtfJs5md2N7rp0rN2Zdx8
         wMILAGpUX4RVGbQ+122bfZuPENrC4mmZq/HHdW7BujRF/sVVeOFFYgRyChokKnOP9JlX
         mBxaFOVisanu7dN4p6ozGotLMcmu+jTYYrUalnhR9hvpXuj3j0qijHE1mQwao6xSQv/B
         xJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nMCkcNkVJHrUMMEDkKpjCXIAHsxHK0m1G/QamSr9K6g=;
        b=BM0WUuARVXwSrkQv93RubEnTEtgS0Lcbedy3cjv/yggaFrvuTnzd7QfjX4033zMTzh
         MhLl9uaWN/vFfcfnjZuIg71ipvxwwWiIuG04/jwXqLHFcrCclxFtYTj/pHdCzQn2tM7k
         XJ5AQc2XjwNKUZ5vbIMalUPj08NB1BMO+biHZ0LSJ3Ro03rewyIPDAYmS5aF4VuOKETq
         TSzZMKjaVqKNRWNOhy2eKBziPV1tZoL8ylHxqVLx0WzjiOIaPCkDLy31tMy1j1iJnW6B
         uS+O0wCm+YkOdbdztuN1knpWpBISAPSDfEXHcehgEmDkvW2GZ+qByaVepkQ02wTamSju
         qu+A==
X-Gm-Message-State: AOAM533QLPi/DuCBGj+YumoAsIQYjcTjSELMX465E3kbSpuu228ucYS4
        0qfppWWnJhjApOeVIbVhJTo=
X-Google-Smtp-Source: ABdhPJyRX2L7hSbd3SNG4rggc/Cqlf6BaeolJPYAw1mQLBCAr4IT8k78ET/p4iE+e6YKJMpdWksvAg==
X-Received: by 2002:a2e:a4ba:: with SMTP id g26mr28851298ljm.152.1637887057377;
        Thu, 25 Nov 2021 16:37:37 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id e5sm377433lfs.51.2021.11.25.16.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 16:37:36 -0800 (PST)
Subject: Re: [PATCH v4] i2c: tegra: Add the ACPI support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Akhil R <akhilrajeev@nvidia.com>
Cc:     Christian Koenig <christian.koenig@amd.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linaro-mm-sig@lists.linaro.org,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
References: <1637859224-5179-1-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75VfPPpTNCaM+GhcqZS53ts-20GBzm+4OWLAjND=z79pgxg@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <aa63a45d-43a0-9aaf-cad3-2f4f66d707e7@gmail.com>
Date:   Fri, 26 Nov 2021 03:37:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfPPpTNCaM+GhcqZS53ts-20GBzm+4OWLAjND=z79pgxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

25.11.2021 22:28, Andy Shevchenko пишет:
>> -       err = reset_control_reset(i2c_dev->rst);
>> +       if (handle)
>> +               err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
> Does it compile for CONFIG_ACPI=n case?
> 

It compiles and works fine with CONFIG_ACPI=n.
