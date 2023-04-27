Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D48B6F08FA
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Apr 2023 18:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242835AbjD0QCq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Apr 2023 12:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239857AbjD0QCq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Apr 2023 12:02:46 -0400
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E121726;
        Thu, 27 Apr 2023 09:02:45 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-38e27409542so5950067b6e.0;
        Thu, 27 Apr 2023 09:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682611364; x=1685203364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkWQr/2+asNAFXhl3cNlpNxsmcASlMZiMoQ8I5Rj1p0=;
        b=UdIFvdhsJliwnvXQWqNNfQrKZpJhIdk+VUvHqTjq3WMIFOk6/Qo3pWYGf5CG/CpWVZ
         pmy7ntQHgTPG88+079rrgQmtjQ7kEHKEnaAqGZ3iIwQ9W2Wk9Dms7m7Qr/QEkULV6+Pf
         bIvdg26ygKtLOGdFX5w1p8ncgXcQ5PERBF5oDMwvgJ/oG+JWWa/PtFQG1Mta6ic+ye5O
         +MS5fzqEDDzpbGZSk85SWgkJ5rkPR8FSMliVKwX/GEgXlAoWmCG6qot1i6qqVgDvEiN0
         AF5OtQeRWt1istpXmV2W4lw4pzS98CVWYEM4kgJX/M7cx5n4dg5VtSzQUtW/EjgKfWWH
         vssg==
X-Gm-Message-State: AC+VfDxf300s2ZwEQr5uQGF9t2kMWnaCUntvuh3QSvrTUP0SxYmzaiSM
        MjAa6mgpOynPUSZkEd2pug==
X-Google-Smtp-Source: ACHHUZ704LvMZVjNdqcUq3tYsktnPGhx0nCI+NnC67pBCBEPDhfh3FkNTlOx3V1izFDtNEsrbSOy7w==
X-Received: by 2002:a05:6808:2110:b0:390:9226:2c75 with SMTP id r16-20020a056808211000b0039092262c75mr780933oiw.55.1682611364450;
        Thu, 27 Apr 2023 09:02:44 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o41-20020a4a95ac000000b0054248efdd67sm8517013ooi.29.2023.04.27.09.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 09:02:43 -0700 (PDT)
Received: (nullmailer pid 3100666 invoked by uid 1000);
        Thu, 27 Apr 2023 16:02:43 -0000
Date:   Thu, 27 Apr 2023 11:02:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chris Paterson <chris.paterson2@renesas.com>
Cc:     linux-kernel@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: renesas,rzv2m: Change maintainer to
 Fabrizio Castro
Message-ID: <168261135959.3100575.3262873187837162793.robh@kernel.org>
References: <20230426100736.11808-1-chris.paterson2@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426100736.11808-1-chris.paterson2@renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Wed, 26 Apr 2023 11:07:36 +0100, Chris Paterson wrote:
> Phil no longer works for Renesas.
> 
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> ---
>  Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

