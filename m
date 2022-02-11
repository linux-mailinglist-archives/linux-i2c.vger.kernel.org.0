Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63BD34B2B71
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 18:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242837AbiBKRMt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 12:12:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346457AbiBKRMs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 12:12:48 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2481FC
        for <linux-i2c@vger.kernel.org>; Fri, 11 Feb 2022 09:12:47 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id t36so6550318pfg.0
        for <linux-i2c@vger.kernel.org>; Fri, 11 Feb 2022 09:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x9O9aMBuy1OSI7DiOidYZzRd+4n+3OCc7iq8c0ShpxE=;
        b=ljf4XH+fqGe7lr70fAvAQNeulSXicxvT6ZTMWzFhhWxXj9cNqNoj9nBpg6A/aItQsD
         AW0EXy8mzeVmAum70eyYoMrAePohVam9dj3vAnZvWTYB61wEHr1aGbxgm02OsTz0SG2W
         CmAv3QPBLF0aKhuLEbybHV9MxUeTB7tcwUNC0HwXIYgei4Hkne3aKkQXo9LUztr6qLuu
         GXbKZYQALxRQY18WMWL2PMQGJW7DOrjhk70kKXPQHETzNsa7HqoMJ7M/joeloXr0TSSb
         v6PrbzIiDCS9IheW8we0It1SuRjIXHc6EiIaExrRQ3MZwmpOmeftmbAIDKxAwp+P/Uo8
         qwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x9O9aMBuy1OSI7DiOidYZzRd+4n+3OCc7iq8c0ShpxE=;
        b=JfZj556ExFvIyEm7HZadiQs3Ab48NkyZX/T8f6SHQ71kU4TlI5vWldEw9UinRVxZ31
         HuhqVezn6ezViwFv6JP0TRRkPe17/dGXX5rkIL3OB9kgMeye36Jem6pKQxNpBNN4ciD0
         Z8yMHAkOttN9cj9BideOKuekAlIm98D6Hw3wqfFCOtq1hzEkK2PzspNdKdB+e16Rn/iZ
         fKbj56ZLmThUZT1pRfXT/sKNGvigAuWUrfZpscoILGCaCDXLPil8DwZL6eXO377Bro7Q
         YiAHPUJPX4Otl9TIX6nQNIgDRgPftLMSpgnlVsLQOPsft3ojRtNctDDkHAixEwa48vz/
         Ez2A==
X-Gm-Message-State: AOAM532P4KqSB6+0ZMahXt/drHexas/dcAeIL/qAgjLCdROcwHyM40WV
        28SFXCHgQQl7zaMujucNgg8=
X-Google-Smtp-Source: ABdhPJwgMIDshbOqPrpFu6r01KOJGqs8W2hsV+Izn2d1RckGHpqs+6OFX0f9O6LqfjRAwewjH1RfFQ==
X-Received: by 2002:a05:6a00:1805:: with SMTP id y5mr2710543pfa.6.1644599567128;
        Fri, 11 Feb 2022 09:12:47 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id s37sm30385753pfg.144.2022.02.11.09.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 09:12:46 -0800 (PST)
Subject: Re: [PATCH] i2c: brcmstb: allow compiling on BCM4908
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh@kernel.org>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Dabros <jsd@semihalf.com>, Sven Peter <sven@svenpeter.dev>,
        Jie Deng <jie.deng@intel.com>,
        =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20220211105806.14341-1-zajec5@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b71ac09b-0dbd-981d-9f30-6cf5b86cbe9c@gmail.com>
Date:   Fri, 11 Feb 2022 09:12:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220211105806.14341-1-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/11/22 2:58 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> BCM4908 SoCs use the same I2C hardware block as STB and BCM63xx devices.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
