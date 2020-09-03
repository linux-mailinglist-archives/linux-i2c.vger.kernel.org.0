Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA6825C40A
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 17:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729100AbgICPCt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 11:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728927AbgICN66 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Sep 2020 09:58:58 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE529C061A17;
        Thu,  3 Sep 2020 06:44:42 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id k25so3729746ljg.9;
        Thu, 03 Sep 2020 06:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LLcfLa3jT9VCX7RwE0dDUcAeziaCYPyIo1qnxZ7SIOw=;
        b=GkmzOxWiAOcSoEKeOaq7PHvTvKu0i0MK1dDNNjyPgwybZgb2UXACJiPvcc2jz0oyzk
         0lcYO2+V2fy36TNsxrXdx/5px2LKO6+5q2+Rm8WVBpzfxw04qQJ+OCscZYg84bWU1fz7
         ldaYQ8xsy6RqXXHtvLyQG1Az2juEdwWD7D+neZp7oMkN4CJ1ADEpdwnlXLwRVD1JhIui
         Go4ZKcXXtPGvXRlvtmC1kOCSHiG3CU2UY00/6+Nnw1wWqOl5yH2vbNIPOSmKgkbdc2Nd
         mSDZj8hHj2AQOYiPRF9l8VL+kQGYx4QUt4kXmGAHhlIXoTcpiKXwezhKY0CVtHBFVrpW
         M82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LLcfLa3jT9VCX7RwE0dDUcAeziaCYPyIo1qnxZ7SIOw=;
        b=c5zi5/wquh/NjMKVUvIL6kOkNFtHpqXHx/ff1KoN/l4wdzH2dK2OURVp9UKu2OtsK1
         PHFToQOj20x87PZSinKU2MFyjj6phBPBlLGBhMt1sbhOMVIBXAD7QAjX+TFzgWI68zjP
         0I/5MT6jD5EvuiJbe3m/TtCP9JLMNMdySF+fm7ChYYDdSyWR2mOiX2bAXk2xL9SN/+rt
         d6PoV75YaDLV8M6I0HgbxoUiUmnd27JuaVN84XljusIgoELUieb94bOPuuJW1BFaJDOd
         fzILjKnd6GBSfx0LzL2CmI1CECR1j1ICPLGliWIyntycxQOu5vg8sAPFbEx5zeT4jnu1
         2ctw==
X-Gm-Message-State: AOAM533Kgc3tn0cSVU1ELyyVp+7U3DWdEJuhpPpGZY9EyVtq7QdCMxf2
        ZzB+loVxv0uACzqnFflNHjiU//TKWOA=
X-Google-Smtp-Source: ABdhPJxGmrB2gV5oToqqcL2Lc1GBuuGegYSbf4toI7NGmoFajWRCUk17/vK/Z5QBgbrJ2TEEcYanWw==
X-Received: by 2002:a2e:b81a:: with SMTP id u26mr1422295ljo.241.1599140680897;
        Thu, 03 Sep 2020 06:44:40 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id y17sm630318ljc.18.2020.09.03.06.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 06:44:40 -0700 (PDT)
Subject: Re: [PATCH v3 03/22] i2c: tegra: Clean up messages in the code
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200903005300.7894-1-digetx@gmail.com>
 <20200903005300.7894-4-digetx@gmail.com>
 <CAHp75VfFZ2bgEqS7cbTfYzxtXk3T5VaoJpum5aiNMpfvhfbuqw@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2b6d99a0-0913-6c55-7c13-8a2a1524488d@gmail.com>
Date:   Thu, 3 Sep 2020 16:44:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfFZ2bgEqS7cbTfYzxtXk3T5VaoJpum5aiNMpfvhfbuqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

03.09.2020 14:06, Andy Shevchenko пишет:
> On Thu, Sep 3, 2020 at 3:53 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> This patch unifies style of all messages in the driver by starting them
>> with a lowercase letter and using consistent capitalization and wording
>> for all messages.
> 
> I didn't look at the rest (yet) but this series has a patch ordering issue.
> Why do we first do some little, non-critical clean ups?
> 
> The preferred way is to arrange like:
>  - fixes that may be backported
>  - fixes that are likely not going to be backported
>  - features
>  - cleanups
> 
> In its turn cleanups go by severity:
>  - code affected ones (and maybe logical changers)
>  - ...
>  - commentary / indentation fixes
> 

That's a good suggestion! All patches in this version are ordered by the
time they were created ans since none of these patches should be
worthwhile to backport (IMO) and because majority of patches do minor
changes, it appeared to me that it should be okay as-is.

I agree that it should be worthwhile to reorder the patches now, after
the series grew up a tad in regards to amount of patches. I'll change
the order in the next version, thanks!
