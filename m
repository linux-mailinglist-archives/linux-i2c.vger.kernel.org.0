Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 010F9469185
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Dec 2021 09:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239379AbhLFIeT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Dec 2021 03:34:19 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:40348
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239343AbhLFIeS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Dec 2021 03:34:18 -0500
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 30F7C3F1F7
        for <linux-i2c@vger.kernel.org>; Mon,  6 Dec 2021 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638779449;
        bh=Tml629Uq95zSJI5V07nE+j3CNsdC1fLdTAkBUTpIiTI=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=r4G3bayU0h2ctLOth5lPk/hJ3MB43Uew1QPSiLgsPQ0iDVWeTfKj9a1fnfwibc/KQ
         xQN2rSd2cq+aenMx6YJqXBGTQJpgZ8t/aHcUVPKqdOPask/FOg8nDYWc206EXq+jQl
         TAsJMuYxGsDwQ9d4WVabRuxny4BOiEOzuGFwSWuVukEo4Wjf1SdlZgJrOQC+97kCt4
         zsOCDmmap011Inh7oKHyNrYzqRWRbHBMBWnnaAOzHeuobaNHgH110miZF0nKSEYEx4
         aqtKX1HGxy2L1I8UGztii3mPTq8nF6FS4vhFIwGkXgh12G1OorLOmzO2eV4cdfDijR
         J0JkbQzt12mfg==
Received: by mail-lj1-f198.google.com with SMTP id d20-20020a05651c111400b00218c6372b7eso3164782ljo.16
        for <linux-i2c@vger.kernel.org>; Mon, 06 Dec 2021 00:30:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tml629Uq95zSJI5V07nE+j3CNsdC1fLdTAkBUTpIiTI=;
        b=k7I2QzaLEjHoBLgGZNIUMp9HqXxAUh2zv/DqE77eQonBiBrtZvLhO4GVRfSzOsV+Oq
         7+wpjZIGhpwVq6gYpyeTdGIMevv6CSSgg4h67M8a2bZztmmYmCtD9eropFEBp3yyoZdr
         gsGuCe10h855jveI0DNkeFlr9/gyPAHCz7n6TxAbWI9fLIkuC38D+HbYRMGyYAbmqjQh
         w/0KWFHAtIiKo5mXKs9R9iaqnnoR75uI6fWFoPvKyIvnRly9qnCGzslMS7fO2e7GbVVk
         amVF2eSG42Lne9m6Ks6L6i1AXYCC9lPUmYQ4W3z/AtoXSh/oJ5A38ALRJystiYN785Tz
         /iNQ==
X-Gm-Message-State: AOAM5321il5v/+/z5mwoFksWRk7qeLQI1oWP/FsIW79v6LeQttxCnpye
        JiSjNSCQBLC/5By97exNx4dmkreevNiammJG9TAT9cwYdq6rXgSJhgkYAWbygfqu0YEVk/j52zf
        G8q7Q7Ss2quPQyjqYRuPuvgrkj6q/lqaLDjO+TA==
X-Received: by 2002:a2e:bb98:: with SMTP id y24mr33106628lje.315.1638779448592;
        Mon, 06 Dec 2021 00:30:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytdYeVEp8v2mHGvAwVxlTa1ujpCO/yCzbLFBVXrJkqZz7YKMn2qMy3HQWA7KgUSveKen3jGA==
X-Received: by 2002:a2e:bb98:: with SMTP id y24mr33106604lje.315.1638779448263;
        Mon, 06 Dec 2021 00:30:48 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id m15sm1296249lfp.9.2021.12.06.00.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 00:30:47 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Virag <virag.david003@gmail.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>
Subject: Re: (subset) [PATCH v2 RESEND 7/8] arm: dts: exynos: Rename hsi2c nodes to i2c for Exynos5260
Date:   Mon,  6 Dec 2021 09:30:44 +0100
Message-Id: <163877944232.78791.17720968863028259612.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211204215820.17378-8-semen.protsenko@linaro.org>
References: <20211204215820.17378-1-semen.protsenko@linaro.org> <20211204215820.17378-8-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 4 Dec 2021 23:58:19 +0200, Sam Protsenko wrote:
> In Device Tree specification it's recommended to use "i2c" name for I2C
> nodes. Now that i2c-exynos5 dt-schema binding was added, it shows some
> warnings like this when validating HS-I2C nodes:
> 
>     hsi2c@xxxxxxxxx: $nodename:0: 'hsi2c@xxxxxxxx' does not match
>                                   '^i2c(@.*)?'
>     From schema: Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> 
> [...]

Applied, thanks!

[7/8] arm: dts: exynos: Rename hsi2c nodes to i2c for Exynos5260
      commit: 29bf0ff5ae18ad1a6dd183569cc097e578052c57

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
