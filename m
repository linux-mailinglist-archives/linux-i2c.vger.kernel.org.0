Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC7456C344
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jul 2022 01:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240151AbiGHVJs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jul 2022 17:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240062AbiGHVJr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jul 2022 17:09:47 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 568B019C39;
        Fri,  8 Jul 2022 14:09:46 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id z12-20020a17090a7b8c00b001ef84000b8bso3124815pjc.1;
        Fri, 08 Jul 2022 14:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5p+PR5ptOVcK72SzQs+cEHkIkQJ2Wi18+TxTVP867P0=;
        b=Ciy82PPD5pO7IB93XpAY0+w/SZ6155loOCl+FBCBlfF/G7PepX1j0A+xPLdF6ZGX7u
         zzUaCvn5NsP1xyHvefzvwcO9nUkyErnsnsh2PMJUITTRLANHwe+sBc1K2AjLrvI+I4FA
         mJtDO24h3N6eYk+A/nLyyHPA+hJ5eANWBQM3kLMtsKguKIR5OQSSvyXFi11ZQaCJMlyy
         iIpvu8AIERAdTe7vEtAbpxbvkdT8eP4xNnOctuum2rZdZH3o65+PodN94bBm+hiZQ3E4
         SdIVuZUbCWUzW3//azmW3wL7cL5FmmXRNIQAbx73lNh1gieCci3TbH/hoDPBYXvdrj23
         mWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5p+PR5ptOVcK72SzQs+cEHkIkQJ2Wi18+TxTVP867P0=;
        b=mH1Sps45GV8K+yxW3FejVUcFaAJCtRPxRCWwtjupll71yI13srXuOjwWYvsC3WIiWI
         qZ05Z+cExV+01lp+5eVlcOgMsDvJ7fkB7kmQH8GP3i2uyXgHbcko/DbRfuDTJ2tNQFKQ
         Wq+mq6oLPCLCNylgSpZ13wcxhjN705AyTvX9NGneskdIBI++5uUeyyNu7kJJFDu4OXAL
         R9d/fkfYhihoP9obcguqNmPc9PVha+wz9wsvUb8RIbPTqhnBDm/NhtLYNKBia/59RMBq
         5UEiHHramGlPCSg6I2s3z5EuZMiq2uRFjsfZbBebt9JFWez6ZaKxUiSg4b2nk/kDpgRZ
         ncgw==
X-Gm-Message-State: AJIora/INhsWnxZXNI4oM2q2rErpawOr+G/ERBUvDAhHOekZiwe/+sMl
        j4DCuSlL/ki25ahymQZ+ATA=
X-Google-Smtp-Source: AGRyM1t+7r6V/rHlf4Jgeo5aDKtFc+InAKxp4/GZS52cmp0hOAcY7ZN91tQLhT5vfYhpZvYZjHGOiQ==
X-Received: by 2002:a17:903:2447:b0:16a:3b58:48c1 with SMTP id l7-20020a170903244700b0016a3b5848c1mr5938675pls.44.1657314585831;
        Fri, 08 Jul 2022 14:09:45 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id r3-20020a170903020300b0016a11b7472csm30251495plh.166.2022.07.08.14.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 14:09:45 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     bcm-kernel-feedback-list@broadcom.com,
        William Zhang <william.zhang@broadcom.com>,
        Linux ARM List <linux-arm-kernel@lists.infradead.org>
Cc:     anand.gore@broadcom.com, dan.beygelman@broadcom.com,
        kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jie Deng <jie.deng@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sven Peter <sven@svenpeter.dev>,
        Tyrone Ting <kfting@nuvoton.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 5/8] i2c: brcmstb: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA
Date:   Fri,  8 Jul 2022 14:09:43 -0700
Message-Id: <20220708210943.2660952-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707065800.261269-5-william.zhang@broadcom.com>
References: <20220707065800.261269-1-william.zhang@broadcom.com> <20220707065800.261269-5-william.zhang@broadcom.com>
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

On Wed,  6 Jul 2022 23:57:56 -0700, William Zhang <william.zhang@broadcom.com> wrote:
> Prepare for the BCM63138 ARCH_BCM_63XX migration to ARCH_BCMBCA. Make
> I2C_BRCMSTB depending on ARCH_BCMBCA.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Acked-by: Wolfram Sang <wsa@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
