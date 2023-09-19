Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E97F57A5E07
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 11:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbjISJeE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 19 Sep 2023 05:34:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbjISJeC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 05:34:02 -0400
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D9C12C;
        Tue, 19 Sep 2023 02:33:55 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d84d883c1b6so2701922276.0;
        Tue, 19 Sep 2023 02:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695116035; x=1695720835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goCeoZSnQjuEEwzTDVynejxARSwnpWTAIEHlkcGBBfU=;
        b=Wmoean27PPOV1jOkLQSI7++8aY28sawOwN70RZi6XZzEkA5N1+KRjA3Ovg/QeLwjEW
         YIwLgTf765FrY3FFex8tFW8DnkhqAnhfwsTLl+nortepXZU4Fgl1xVuxarq97gNiUhQq
         MZpyWfSqyvn6nAU/G+StqMIQaMeaECJ+KrmOhp+ryGmuJMaCjyf4n3dDT5z4PeTgFpno
         Z/jh+1l4MjT+hHEKUhOhPrUnS9wfqZZBUpdyhWO4lz7ilpKFV0SnFhYhX5/QQAde0qJl
         tNIxQSSlN3tjPeUpwmlJ9spvRQ793TPXAlZ15PVXqW3xP0cMWObwhhb7j3HtVxUJvdMT
         moFw==
X-Gm-Message-State: AOJu0YxilGmK+lYS2rJhZy4NscUyEZIKosWe2EULUZ+I6fhKDgddyYXl
        ZR79M1FHy/HyQDLRRxsTaYLYLq4SAQlzTA==
X-Google-Smtp-Source: AGHT+IGh5GTfekzEe6GFTp/uestB6WsGVjI1D5I99yRbITPy0P48vhKfoQQa+5dQclZPcZ00A2GW3w==
X-Received: by 2002:a05:6902:389:b0:d78:6ef:9178 with SMTP id f9-20020a056902038900b00d7806ef9178mr2116380ybs.17.1695116034799;
        Tue, 19 Sep 2023 02:33:54 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id k19-20020a252413000000b00d74b144004bsm2794727ybk.12.2023.09.19.02.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 02:33:54 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-59e88a28b98so33848207b3.1;
        Tue, 19 Sep 2023 02:33:54 -0700 (PDT)
X-Received: by 2002:a81:8301:0:b0:59b:d5eb:3a83 with SMTP id
 t1-20020a818301000000b0059bd5eb3a83mr2020920ywf.16.1695116034166; Tue, 19 Sep
 2023 02:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230913203242.31505-1-wsa+renesas@sang-engineering.com> <20230913203242.31505-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230913203242.31505-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Sep 2023 11:33:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWZLk2YFKMSQ_ZZ+XaAgQL0ySsyMLumxbyoW7uys13MSA@mail.gmail.com>
Message-ID: <CAMuHMdWZLk2YFKMSQ_ZZ+XaAgQL0ySsyMLumxbyoW7uys13MSA@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: rcar: introduce Gen4 devices
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Wed, Sep 13, 2023 at 10:32 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> So far, we treated Gen4 as Gen3. But we are soon adding FM+ as a Gen4
> specific feature, so prepare the code for the new devtype.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -1070,10 +1071,12 @@ static const struct of_device_id rcar_i2c_dt_ids[] = {
>         { .compatible = "renesas,i2c-r8a7794", .data = (void *)I2C_RCAR_GEN2 },
>         { .compatible = "renesas,i2c-r8a7795", .data = (void *)I2C_RCAR_GEN3 },
>         { .compatible = "renesas,i2c-r8a7796", .data = (void *)I2C_RCAR_GEN3 },
> +       /* S4 has no FM+ bit */
> +       { .compatible = "renesas,i2c-r8a779f0", .data = (void *)I2C_RCAR_GEN3 },

I think the S4 exception belongs in the next patch, adding FM+ support.

>         { .compatible = "renesas,rcar-gen1-i2c", .data = (void *)I2C_RCAR_GEN1 },
>         { .compatible = "renesas,rcar-gen2-i2c", .data = (void *)I2C_RCAR_GEN2 },
>         { .compatible = "renesas,rcar-gen3-i2c", .data = (void *)I2C_RCAR_GEN3 },
> -       { .compatible = "renesas,rcar-gen4-i2c", .data = (void *)I2C_RCAR_GEN3 },
> +       { .compatible = "renesas,rcar-gen4-i2c", .data = (void *)I2C_RCAR_GEN4 },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, rcar_i2c_dt_ids);

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
