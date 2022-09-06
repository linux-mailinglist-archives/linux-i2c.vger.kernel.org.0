Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 519C15AF6A3
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Sep 2022 23:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbiIFVJp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Sep 2022 17:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbiIFVJo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Sep 2022 17:09:44 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 961A512AB6;
        Tue,  6 Sep 2022 14:09:41 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id cu2so26193797ejb.0;
        Tue, 06 Sep 2022 14:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZBP4bmIFnYpngNMLg2L1ipMV8YyqMIleAqmu8eQYWw4=;
        b=DzgzH2va0cK2otK4WNYDZVFLwHqrp+PZ1r2ObWBSJTr7jeqsr1PtI3DwxXjtyuyR2f
         N4/eOo5eXahYwb7srnc5uKO/uSFmo0mQ9QD6acjeJxYfLDvGshmgXMCM0cN4oWq4Z3ab
         W5PofaekUp60p8SFTMRDzjzI4Wv6cqS8CWwnwwap7f0Q1GZ0y0mMIRnLhjZvkTmXuRRh
         1bJASPVrnlGqBCvub48s1LB8nqGNJ3BwUoVEcBUJQ+sdJqLyoaGUWtjK3xg87pjxHi7y
         2ZNlGlF9UgCkAv18M1te4ZeJhP+qv3MBuEXdh5EMMZT8klkEACx/n1G68T7eULfdaIba
         40RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZBP4bmIFnYpngNMLg2L1ipMV8YyqMIleAqmu8eQYWw4=;
        b=pzZ7my4Q6HFtDh6c0XxntoUu5W/4yqQehA4bmVKXcgephQY5xoYXV2Udn03LDS+fZN
         Cg/TwXgmlWnRoK68L6FndTcOhU5ABo/H24RZkwBZDCafgYNKsH/SOQoqU+odW+7c6vGG
         EWsI3cTJXbfhTww6g15nhQn0DNLrCqrXk0aBt9poM49ubUXBJfJnLmAnffux2T9qpRvX
         TuJMSVQc5tLzpPl04KXaF2BCrCmcsYY43cl9udzifMQR01ip3RDUjeSh/meVZw/4Ga+z
         HQGk8G3laAVWUP7vurkeU6/MwL7R10OVezPmJhxe7DAod9D8xvK4Assu4nzdQAJFBG9Y
         7ZHw==
X-Gm-Message-State: ACgBeo1vpP944SciQhRkWexhG3uM9Va33NQUBAGvCLOLcbf9iulIzIAl
        oxjpJvjkYollfWki2Z8Rc+g=
X-Google-Smtp-Source: AA6agR75SfCyueGmatO84arDycsqszdMuCI+XT0KLj8q/qJ+0J8DenlxZPwwowLCMloRJu2+1Ppwyw==
X-Received: by 2002:a17:907:3e85:b0:73d:60cc:5d06 with SMTP id hs5-20020a1709073e8500b0073d60cc5d06mr260697ejc.722.1662498580422;
        Tue, 06 Sep 2022 14:09:40 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id d2-20020a056402000200b0044e9601e53fsm4047743edu.19.2022.09.06.14.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 14:09:40 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc:     Samuel Holland <samuel@sholland.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Yangtao Li <frank@allwinnertech.com>
Subject: Re: [PATCH 2/3] arm64: dts: allwinner: a100: Add device node for DMA controller
Date:   Tue, 06 Sep 2022 23:09:38 +0200
Message-ID: <3373468.QJadu78ljV@kista>
In-Reply-To: <20220830020824.62288-3-samuel@sholland.org>
References: <20220830020824.62288-1-samuel@sholland.org> <20220830020824.62288-3-samuel@sholland.org>
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

Dne torek, 30. avgust 2022 ob 04:08:23 CEST je Samuel Holland napisal(a):
> From: Yangtao Li <frank@allwinnertech.com>
> 
> The A100 SoC has a DMA controller that supports 8 DMA channels
> to and from various peripherals.
> 
> Add a device node for it.
> 
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


