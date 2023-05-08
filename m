Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6AC16FB67D
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 20:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjEHSyL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 14:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjEHSyK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 14:54:10 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6E25FE8;
        Mon,  8 May 2023 11:54:09 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-643465067d1so3664866b3a.0;
        Mon, 08 May 2023 11:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683572049; x=1686164049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JB4/cM8wctRX4JBzn3xFEBRRTxVKKD7sX/LFKhnjc5A=;
        b=jS1F//qR37GdGIu/uwduy4jLEe4igueofer7yYAtGL5amQqqEegFqFoZki5KFdqt/K
         lVSira9U37PkVlWIbVkO6MmddQ0+L5SADFdxwqBOyxKb409V+NlZSUWMSQ7CQtHytl1k
         Pf78kdVIEQP1EWLoX9kh7EQ9r0mDTrQGyFOgsO8w65oeWCvBXUqKSFqYh46QNZHZkqqf
         Y/vfrz6+vRinPkePvl68TqJE7Q6p/G7YiKxNAhGybWHMQBilZdRw+k9ZF4khMqogzAf1
         pPiXu4DNv2P61xPdKGGbIuVAE8020r5ToBMqbSWNZRl45u0x8l29nLuudWVPBm3hrF9V
         uvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683572049; x=1686164049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JB4/cM8wctRX4JBzn3xFEBRRTxVKKD7sX/LFKhnjc5A=;
        b=ETndiTDjfAmQe7YdhWr3lv27owjcylyuiJDs0oS9Kqovkq3C3O5noOelWIM5hPof3q
         AsaM6TgROAaCXUHl+iuj3wK/y1BaAGrY15FgxzsgxfgOf6v3vuqaPnMvEuzCPJ3XIF9r
         ZeyQPct5zmA0BsUtkdVKu97df1EkfeXMVT8zzS4xHg2HDyvSb5gfOukzbBZUfF6rsroy
         Y036THbG04I4kj+CG0wTuDkn66ouM0xrpFSeEXBN4eSD7DjkM9mgSXu8wBOmzkeEAYjI
         /8/Mn3s5GS/3DwvjiskO8lkS2TtXZacN7OiZxvm1YnxLbzTlk9j71gUNvR0XES+tZYtO
         VdNA==
X-Gm-Message-State: AC+VfDwtHGawgidJCEQs5jKoN16laD9eQVLZpkYGJBm6ow9Oe2D+M7Sr
        fsy8G5vJ88LU1Zr+H8EWXnw=
X-Google-Smtp-Source: ACHHUZ5MjAVBufTEIWp//rkT1lh59X9n0OwnyCpH/xNkSpDx1DXOcgpibn2OkgbPtEWiOh2YDBZZNQ==
X-Received: by 2002:a05:6a20:1445:b0:100:a4b2:d5e9 with SMTP id a5-20020a056a20144500b00100a4b2d5e9mr4107904pzi.18.1683572049168;
        Mon, 08 May 2023 11:54:09 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id u24-20020a62ed18000000b0063b6fb4522esm327825pfh.20.2023.05.08.11.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 11:54:08 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     bcm-kernel-feedback-list@broadcom.com,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ARM: dts: bcm23550: Add SoC-specific I2C compatible
Date:   Mon,  8 May 2023 11:54:06 -0700
Message-Id: <20230508185406.1639539-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <9875ec0211187e4f5e2a4379c63eacdb69b31d7a.1682252615.git.stano.jakubek@gmail.com>
References: <9875ec0211187e4f5e2a4379c63eacdb69b31d7a.1682252615.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 23 Apr 2023 14:39:12 +0200, Stanislav Jakubek <stano.jakubek@gmail.com> wrote:
> Add BCM23550-specific compatible for brcm,kona-i2c nodes. While not
> currently used by the i2c-bcm-kona driver, they can serve for further
> customization, if required.
> Done in preparation for dt-binding coversion to DT schema.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
