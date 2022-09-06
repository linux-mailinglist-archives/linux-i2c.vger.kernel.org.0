Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66A365AF6A7
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Sep 2022 23:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiIFVLH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Sep 2022 17:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiIFVLG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Sep 2022 17:11:06 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 615AFB5E56;
        Tue,  6 Sep 2022 14:11:05 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id gh9so4160440ejc.8;
        Tue, 06 Sep 2022 14:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=mV26t0BGARVQ09o/2g9pvdhqThByL8uLrjECrlnebYg=;
        b=oaTIFoVT9YhvQDNTUPeXH5niGPPHyVy0Nfdk8BnqhdeOO+tmXPioDnG8ZjIMpKqFPR
         hA3LTReT9jaGa9mo+3NXXWDn+GMU9RqHCq4iZzRRS0Waln6uRDEZMXehJ+HaHpm/U+Ot
         8Eka4Ziqjbt+4+RLVH6UOP1FnoEbbMKIhOrBo/1FI6SOR0krU2AAP/uO01GzJxeM/V5/
         PzseVuJfuIKIYGmNt7dT2FfiifYUOjhpDV5pqaC1CQoyoRLW40m9lbnKv2ITbP8xSv6F
         B8s6AF0ZLl/8D3bBJ5f6SKlKW6BKfWmi3UWlhnAMphkFjp6Sef9o2ffjlh4aMbE3cfcG
         +f4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=mV26t0BGARVQ09o/2g9pvdhqThByL8uLrjECrlnebYg=;
        b=W5968iggOzTVedYvxYUuxslK8LpmBuxQuBol4NaE45rYtbbUpuH6/smUIfuPEQjUIn
         eOo/16mAujTbtr/U0f2iGjVBEbGqI6dxUpfxYc/Vzh4uQQcxSKPRaU66VMrx3ujYcHvh
         QMEO44UdKfBSB7PQZbf7rDLfYZ4xeHK3rWBXaADPFZPC7tc5EF1Eg2aI//kD7KqD4AOu
         wPrOOTUMHUCBIuqoTrpIgBkBiLNpXElluH6RYQsX1woxn+MnVvQ5p1FrErzGqxc9lXjH
         wy62pVtryRYm4OEtXPyviyXe7TOVRPo4BceodDurCNbLujMi3O4990NNCKlaaPUEvLgh
         R7EQ==
X-Gm-Message-State: ACgBeo15YPQCxepcMzWuSnKDAElOh4FXFKzuo3+VBP71fJZmI/sA0gGf
        Rhf6qQMwrVcm2UMO7g3p4x8=
X-Google-Smtp-Source: AA6agR45P1ep+mRBlWOWh6RkBeAfA/HTJsRbDZWPX+2VVKxBFzJardUIyVLow+LchK62UyY6y/PH/Q==
X-Received: by 2002:a17:907:a057:b0:730:a2d8:d5ac with SMTP id gz23-20020a170907a05700b00730a2d8d5acmr245371ejc.764.1662498663846;
        Tue, 06 Sep 2022 14:11:03 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id ev13-20020a056402540d00b0044ea683d04csm3509339edb.14.2022.09.06.14.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 14:11:03 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc:     Samuel Holland <samuel@sholland.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: a100: Add I2C DMA requests
Date:   Tue, 06 Sep 2022 23:11:02 +0200
Message-ID: <22775214.6Emhk5qWAg@kista>
In-Reply-To: <20220830020824.62288-4-samuel@sholland.org>
References: <20220830020824.62288-1-samuel@sholland.org> <20220830020824.62288-4-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dne torek, 30. avgust 2022 ob 04:08:24 CEST je Samuel Holland napisal(a):
> The I2C controllers in the A100 SoC are all connected to the DMA engine.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


