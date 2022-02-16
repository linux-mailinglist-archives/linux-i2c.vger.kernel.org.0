Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB6494B9252
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Feb 2022 21:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbiBPUdn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Feb 2022 15:33:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231354AbiBPUdn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Feb 2022 15:33:43 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 640E127018A;
        Wed, 16 Feb 2022 12:33:30 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id p22so6066602lfu.5;
        Wed, 16 Feb 2022 12:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=NxGb0gbH9H2D9ZSQG3YZmRCR8LnjoKRdk0keYL9QTKo=;
        b=a3/6KweZEvNgM+Mak9Jq8lmNtt+AmHnjH7EyadGOwpmThKVNQEQN+n92+FGA9vkofI
         BFtfXH1fevyKIkxga6upTPc1rPtijOk1SHKbkZyD2eh/qgp6nFS2Los5mjtYecPVPh1+
         zQ2JyGE4dgWN0gEVsoKlmXAFilfrDrO2NEc2wvrUHP8Zj680jsq3htl/Z8nkPE6qOFq7
         jBHvCVwD1rjjcIuqoynFE1OibBiUSmfznnzL571+qFzskuskpJMByn5OgmXyEftl0Kpq
         g0GzTB2Bphuf1IbA8BRdqRdszrbQxWYAO3lfcDVywbpKkXGE5PqlVMADo5Tu3u53bANx
         HY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NxGb0gbH9H2D9ZSQG3YZmRCR8LnjoKRdk0keYL9QTKo=;
        b=6fNIfzKKJgIWLhSbMu5SYCXNCJRXglZv8XKMPXLzMvzlSo5BNeVspzhSawgcJo7lgf
         bHY3p+QUUsjYYb0tRtZGtmqlsxVRz+S2qn/9FmxeQLUPi/77rjsPL82PZqq0yR/vtFZD
         c1nK3kjJK3aVH0F7L1YVjSWuy1vKSsfgsM7o0PJDdCcVAO4yJgGcir2IBjLkuArGW8ke
         cSFCMc3pu4ZkASOOkw9LgeNXO5+NndMy6pLQ2wVlC+3Q7QAqr4K+2RBAFsZVDAL8Mvgb
         bWvu0cvrh7VR/o9ROCWhuUQvWwY93caodCRDCXBEO70QtNJ7mHslyi/Y/DDPfQgkNqN/
         XHXg==
X-Gm-Message-State: AOAM532ruEecDIP1C3niGolRujAYxmNmNeYhuFEzZJRq06JWptYi+YXE
        9Zf3OTyCL/Tqaf2gdLZJBcQ=
X-Google-Smtp-Source: ABdhPJyJEJt+PKJQLoGP3tTl88vSogQnupHC10z0lGsbyTv/p+ktbFXUvofSa7jog4V5BQ+d6KTt/w==
X-Received: by 2002:a05:6512:1050:b0:438:2e9:2160 with SMTP id c16-20020a056512105000b0043802e92160mr3394585lfb.682.1645043608664;
        Wed, 16 Feb 2022 12:33:28 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.googlemail.com with ESMTPSA id h2sm4888538ljk.41.2022.02.16.12.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 12:33:03 -0800 (PST)
Message-ID: <0497d0a9-c512-5472-c705-756c62ccccb3@gmail.com>
Date:   Wed, 16 Feb 2022 23:32:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RESEND] i2c: tegra: Add SMBus block read function
Content-Language: en-US
To:     Akhil R <akhilrajeev@nvidia.com>, christian.koenig@amd.com,
        jonathanh@nvidia.com, ldewangan@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, mperttunen@nvidia.com,
        p.zabel@pengutronix.de, sumit.semwal@linaro.org,
        thierry.reding@gmail.com
References: <20220210153603.61894-1-akhilrajeev@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220210153603.61894-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

10.02.2022 18:36, Akhil R пишет:
> Emulate SMBus block read using ContinueXfer to read the length byte
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
