Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38AD67D6EF2
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Oct 2023 16:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235076AbjJYOFi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Oct 2023 10:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235081AbjJYOFh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Oct 2023 10:05:37 -0400
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CCB9189;
        Wed, 25 Oct 2023 07:05:35 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6c7c2c428c1so446847a34.0;
        Wed, 25 Oct 2023 07:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698242734; x=1698847534;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XpP/KVLPfr1JGBWdnnD2sOwbC3Inv/m/J6ZxAGnmBtg=;
        b=rgA6WuGej6vx+EPVoVriAKjkKglV8urfKSE44hzuyyXDsygPBIfdnVmDJzJRAQ4tns
         4aKPB0UhcQVLwuq/ft8KmTZ2wOkD3LIC8X3AkycFryuc0claCBbyZrZb/ZJvzdhbiaFS
         eehjMdfxZoKjCHOpcoSs5MsIH5c0fw2V4NsmRgqsbQtt1LnXMsq9sjgxW1XOCdS2VFN6
         JqO/DI7I0JI7wUK9CUWGlgcpDFFZFXPcFoxzXKu5hTJWJTS6AFb/AATg7pjSJDFy1Hce
         7T74rtyW6hmMGg/vRKCeaI2eqqavJ8BWeW/x86CHUdoOR87SWocTOO3Xl1fOercoAGct
         ISjQ==
X-Gm-Message-State: AOJu0YzjgizJv8U/bo5wV8D6s5I08x7PQ90HE7Y5LwigWmnfmk5buqJF
        nJvkZdD5GYR/KAKWxvBT2g==
X-Google-Smtp-Source: AGHT+IH+6a7epqZvUDTN+14J0hAc961jG6m79dcx8YdfxnNVsEinj19hfONazliwyUi5O5zv8dDu9A==
X-Received: by 2002:a05:6870:45a1:b0:1e9:ac0e:21a5 with SMTP id y33-20020a05687045a100b001e9ac0e21a5mr9331126oao.14.1698242734284;
        Wed, 25 Oct 2023 07:05:34 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id le25-20020a05687c341900b001eae28db525sm2594797oac.23.2023.10.25.07.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 07:05:33 -0700 (PDT)
Received: (nullmailer pid 4149680 invoked by uid 1000);
        Wed, 25 Oct 2023 14:05:32 -0000
Date:   Wed, 25 Oct 2023 09:05:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 6.7 fix 2/2] dt-bindings: eeprom: at24: allow NVMEM cells
 based on old syntax
Message-ID: <20231025140532.GB4143384-robh@kernel.org>
References: <20231024171253.19976-1-zajec5@gmail.com>
 <20231024171253.19976-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231024171253.19976-2-zajec5@gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 24, 2023 at 07:12:53PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This binding supported NVMEM cells as subnodes and that syntax is used
> by few in-kenel DTS files. Modify binding to allow it.
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Fixes: c5330723d5a0 ("dt-bindings: nvmem: move deprecated cells binding to its own file")
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
