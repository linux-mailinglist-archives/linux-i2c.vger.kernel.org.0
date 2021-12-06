Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E58946ABA2
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Dec 2021 23:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357561AbhLFWb1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Dec 2021 17:31:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357412AbhLFWbV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Dec 2021 17:31:21 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB38C061746;
        Mon,  6 Dec 2021 14:27:52 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id g16so3407090pgi.1;
        Mon, 06 Dec 2021 14:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZJ9W19F9BVtFlFnJBI6M88XF4BCu/CVE632l0mNkIIQ=;
        b=Y3xPtXcFAlydwm4j3JE2Uyb0fc1dC6VOqUmI2NEQReFtcqSW7ySiMc5FhgoFJNTLHI
         jyKDd/kyvGUneg62yT4DIquASKBOthjxnu2R5G/52wqIfwv/K1dFwkS4Jad+RhYAZba/
         sPBTwZHz/yE0Dyr9D9tlB9qIXIYbWuuJLZY0hYihOtod9T1zptaCBw7nDDMK9kxRL9+C
         D15x9hro9t3EPMZC7FbSPWA7MnISH/m80E/xTWgcYNU5RbwpTuxct8y7pk5bXVogAJeg
         BsETK7ugE+iNwYnLxGKZGNIHDDX32m5tS4vZ08E0w3QJBpWHvxyrT2wxSurdjInGcsSH
         wOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZJ9W19F9BVtFlFnJBI6M88XF4BCu/CVE632l0mNkIIQ=;
        b=G399SJbkYdAUjZL0Pi4L6xrldSk2TRzoKHibYrpTFsrPy+BUMHXzjM8l8exz07lKSN
         5VVPLpGw6tW1JDLmLvY1KOQaWkZ//FhPKdnSavtlW8mXTDFnwDNJIGsMIMgHUTpAjVnx
         /AYnKIt0XeHmkjDX9papimyDP5xM9/KURm4mFaQT9wFjDvdKiteE8ndU5RwZrg1Jnkpm
         J8T0pQ71c+v6DzMdFBwcPXaket+QNGKj+fNKmUk9wBlQ4gI1C+9UO4j0yzGqDyFpWZRa
         GhBySkwCg23UIm7qM3E62jgTxs3gJHg6rCZbG0KytLyVTkqQoMXd8he36IBu52t+x6+U
         GaZw==
X-Gm-Message-State: AOAM531la9r4Rj3F0dY2r5pLC+n8Oe3efJCw+I8S9ycVDeMXFpO6aOWl
        BAlNt0Zps+rM1sSvvF4EW3vxcp7MTkY=
X-Google-Smtp-Source: ABdhPJwtp2Spm/FITxeUSHHC6FaMEGtczgkWuSeK7WtAXvD4RyiWpvbxMlNKdUu0lggbf4qXzG/EyA==
X-Received: by 2002:aa7:970e:0:b0:4a2:655f:7a12 with SMTP id a14-20020aa7970e000000b004a2655f7a12mr39360359pfg.65.1638829671878;
        Mon, 06 Dec 2021 14:27:51 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id oj11sm337484pjb.46.2021.12.06.14.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 14:27:51 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: i2c: brcm,bcm2835-i2c: convert to YAML
 schema
To:     David Heidelberg <david@ixit.cz>, Rob Herring <robh+dt@kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Stephen Warren <swarren@wwwdotorg.org>
Cc:     ~okias/devicetree@lists.sr.ht, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211206184613.100809-1-david@ixit.cz>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <d337e0e9-7013-b10f-f696-5133da3490e5@gmail.com>
Date:   Mon, 6 Dec 2021 14:27:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211206184613.100809-1-david@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/6/21 10:46 AM, David Heidelberg wrote:
> Switch the DT binding to a YAML schema to enable the DT validation.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Tested-by: Florian Fainelli <f.fainelli@gmail.com>

Let me know if you are planning on converting more of the bcm2835
binding so we don't overlap. Thanks!
-- 
Florian
