Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 222A35F9F10
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Oct 2022 15:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbiJJNEz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Oct 2022 09:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiJJNEy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Oct 2022 09:04:54 -0400
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23EE112D35;
        Mon, 10 Oct 2022 06:04:52 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id n83so12594545oif.11;
        Mon, 10 Oct 2022 06:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lm2S6p7VPlLo+Kc/ZQ+8NqMDhlla7JGgp2wlIKkBks=;
        b=ltzx3ChxlhBKXI2o5f2P0yckhlG0QGOLi8l/fTg+571xEhFlGqZvnnKq4qQ4f1ADsU
         Dz2PAAN5HDtlkVD4KaCROliAkiGkWq93mJlh0uMl2o2Kx4jdiuDFpfKq7iluXc0lhm+A
         fnydMKjviW8lcQo6JQ53krtE81Xe8hFCOQItRmYs3Lg1NveVLW/CBbaCP6HQsP5LAw3M
         xqmORyp2NIo10Xme3nqdYu0HIxCo6XEgGbxw7HLDhTxNzt8SUMVTO58J9m8e59349Klg
         ajwEy3nPPGPkY39m1R0aeEwtmlAcKwyETcK/XN3AvVQQ+tlunGBvf/IOv+4GRy3fO0Vb
         Ky1Q==
X-Gm-Message-State: ACrzQf2Hkj0sohYKclMDDa0hyOBRuIgorC/UC8CNJ92LQjpWM18EfKdN
        Ep686l+Y5sVVtgHFVdO59A==
X-Google-Smtp-Source: AMsMyM5J/JuIjQl3C0ten6ocXj1sk6nbEOlYNykegpDE87fe//pDYjb5k9JFQmxrNWu/mJy0Q73TfQ==
X-Received: by 2002:a05:6808:1648:b0:347:b631:cc80 with SMTP id az8-20020a056808164800b00347b631cc80mr9059217oib.238.1665407092143;
        Mon, 10 Oct 2022 06:04:52 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r10-20020a056870e98a00b001327e6f230bsm4922004oao.27.2022.10.10.06.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 06:04:49 -0700 (PDT)
Received: (nullmailer pid 488759 invoked by uid 1000);
        Mon, 10 Oct 2022 13:04:49 -0000
Date:   Mon, 10 Oct 2022 08:04:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Frank Wunderlich <linux@fw-web.de>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org,
        Frank Wunderlich <frank-w@public-files.de>,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: update bindings for mt7986 soc
Message-ID: <166540708908.488703.4873523437218276438.robh@kernel.org>
References: <20221009101631.82380-1-linux@fw-web.de>
 <20221009101631.82380-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221009101631.82380-2-linux@fw-web.de>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 09 Oct 2022 12:16:30 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add i2c compatible for MT7986 SOC.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
