Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9DD45B74E2
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 17:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236247AbiIMP1U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 11:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236242AbiIMPZd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 11:25:33 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D4BF7C1AB;
        Tue, 13 Sep 2022 07:38:29 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id d189so18019684ybh.12;
        Tue, 13 Sep 2022 07:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=4gw0CfqCHcXqAoTLFj5CKupMrM0B3+NLn0hUfShCnJs=;
        b=LXRZQqJvWtf444RNQViTqZZpUnJE35jc5FEy7+FY04exv9iSQYYyCZhIETfddk2kSG
         neTQ0A2t/NBa6Q/hdWG/gXjxTnnaVyo8BkwxoUltzxzx4GamUydXWPaYmGnjuipuR11Z
         UJLdMGB7TD88WvOaYxHrc4huQ/p7HNyd5aMd68K2Q1zbU8Pa0WALKzSTv6A+UE1gqbLU
         KTSDJx4z2TtF27N3KN/LKkq8QLfhdK//6GNlUIaHW7O15DaBvb384kOMdEFIM93XRRjG
         3BZR7/Qzg5KooM4AT++RR+R1BlCmg7PdJTBqQvuSdWXAvRGWy98K+/7WNUfvqRh80aiW
         QLJw==
X-Gm-Message-State: ACgBeo0/4zoKPlhbFIkTzjKBExCd38eiUIfgNQiUwJNgHQRcbBrXlxR7
        HZbN+tmF8VBIry2fd9VIg1CUvRF8Rw==
X-Google-Smtp-Source: AA6agR4n0Ns56EN8nmYZqaKfPiqFjPvLKM2zBkaiEJuhTpw5P4+YOL15TzmiGoYt1IKTERcqsRj7vA==
X-Received: by 2002:a05:6830:9c8:b0:654:d91:222 with SMTP id y8-20020a05683009c800b006540d910222mr9721862ott.67.1663079183487;
        Tue, 13 Sep 2022 07:26:23 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r6-20020a056830418600b00618fa37308csm5999103otu.35.2022.09.13.07.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:26:23 -0700 (PDT)
Received: (nullmailer pid 3620466 invoked by uid 1000);
        Tue, 13 Sep 2022 14:26:21 -0000
Date:   Tue, 13 Sep 2022 09:26:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     kever.yang@rock-chips.com, jamie@jamieiles.com,
        philipp.tomsich@vrull.eu, u.kleine-koenig@pengutronix.de,
        linux-spi@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        zhangqing@rock-chips.com, linux-i2c@vger.kernel.org,
        linux-phy@lists.infradead.org, linux@roeck-us.net,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, kishon@ti.com,
        linux-pwm@vger.kernel.org, linux-mmc@vger.kernel.org,
        sjg@chromium.org, gregkh@linuxfoundation.org,
        ulf.hansson@linaro.org, linux-rockchip@lists.infradead.org,
        miquel.raynal@bootlin.com, vigneshr@ti.com,
        thierry.reding@gmail.com, broonie@kernel.org, heiko@sntech.de,
        linux-mtd@lists.infradead.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, vkoul@kernel.org,
        wim@linux-watchdog.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, richard@nod.at
Subject: Re: [PATCH v1 02/11] dt-bindings: i2c: rockchip: add
 rockchip,rk3128-i2c
Message-ID: <20220913142621.GA3620421-robh@kernel.org>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <405db21d-154e-fed0-7524-ace1cef0203c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <405db21d-154e-fed0-7524-ace1cef0203c@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 10 Sep 2022 00:02:30 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-i2c compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
