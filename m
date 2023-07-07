Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD1474AD62
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jul 2023 10:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232546AbjGGIxK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jul 2023 04:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232055AbjGGIxH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jul 2023 04:53:07 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58A9129;
        Fri,  7 Jul 2023 01:53:06 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b702319893so24263881fa.3;
        Fri, 07 Jul 2023 01:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688719985; x=1691311985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3ARDBx8Do6VITLjBGfEM7gIFDZ105JnCSKf7rcTVQhU=;
        b=AsjA80zwQxhH5Cm6VOMnarO581GbG9IVrHVQjmlBpSU5vtHviJTK/lzDrhIQVBeStF
         +NQb6TeLK/F+g1FKrTrqGGF/BhtSkTL4feBpwrhyxmFh5hYhz7U3w7SW6hfw1kIjDUFy
         +aLijr/FA+ALl5RfurAIgr0z7v1roFqaDPo5MYHOF7dj+hVDiHDTo2jjFZ1i9tjqApjh
         KzQWfmfiwEiFVQGTmW+7RYAtrjIXhcBdkel0A6Dhc9ieyFhcd4wE0glAliYEsJwyej/U
         ug3pPRAYGyDFiCXHKov+vvDPw7+NYTUl3yXSogG+7qp0jmGY6uiczhqWkDlesw9xHKj1
         j+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688719985; x=1691311985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ARDBx8Do6VITLjBGfEM7gIFDZ105JnCSKf7rcTVQhU=;
        b=V9gS6UFPR1Ca00e2dRA/zbaXFq46DrLzXV/KqRmxNhaMqdMoRWiLeGpqWAmcYxSnxf
         U88OLnqywaXmDcNAEShGAbYw4yxNzaGrXpEKS69NrGBe2nqoxXpr0sZ7QRwpg0wUOMSX
         o6MOifMVma873NfPdxfmMOFqHt1C8mePQzp9uVrc+h69l3+c/NuSlrgH3owyB1u7OMAx
         RuwYm29KzZTgZ3Qc4mk5gZCn2fXK3YbyUy+we4FKsHnoMYUGbQxQfZZwn/DPWaQou0+Z
         VVxgzwXsWOlxZMA/WMaNeZXtCjyMFsoxMjWkrR/E3Vak3w3cfbOYbQkXk9kiXuGw/stz
         V6vg==
X-Gm-Message-State: ABy/qLZ0KeeNDHEcqCDDCzrRTOEraR+oS3n9p56w95P0UrRZw+y1Y+4Q
        uyHJ2b+GcZbQbAT/HK2m1+jE2SmEG6AzHbEX1KlIFpvc4q/5TA==
X-Google-Smtp-Source: APBJJlEpjRoXAxGlk7Z0r1gw56+UaxicidiHVZATdtDcAXcZ64oBsT0FrornrsfNxg7HVjJMBJu7Gkuh62bwSFrwH7U=
X-Received: by 2002:ac2:4bd4:0:b0:4fb:99f7:da35 with SMTP id
 o20-20020ac24bd4000000b004fb99f7da35mr3871299lfq.15.1688719984744; Fri, 07
 Jul 2023 01:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211414.10660-1-dg573847474@gmail.com> <CAAo+4rW1kmiVGbGxMUBsggQiY7dpOTUq+t6B=QTrikwBp72Kkw@mail.gmail.com>
 <499444bd-3699-edbc-d6c6-748d24a2387a@broadcom.com>
In-Reply-To: <499444bd-3699-edbc-d6c6-748d24a2387a@broadcom.com>
From:   Chengfeng Ye <dg573847474@gmail.com>
Date:   Fri, 7 Jul 2023 16:52:53 +0800
Message-ID: <CAAo+4rUnENH-a2CpyXO_rgFXYdwkqTUUrtmYt9g2oj-ST1eTjA@mail.gmail.com>
Subject: Re: [PATCH RESEND] i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
To:     Ray Jui <ray.jui@broadcom.com>, andi.shyti@kernel.org,
        rjui@broadcom.com, sbranden@broadcom.com, wsa@kernel.org
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Also, can you please add the fix tag I identified to your commit
> message. That will save Wolfram some
> manual work.

> Add newline after variable declarations.

Thanks for the reply.
Fixed these problems in v2 patch.

Best Regards,
Chengfeng
