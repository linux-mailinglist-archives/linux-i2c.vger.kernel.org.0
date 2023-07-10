Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCB0374D505
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jul 2023 14:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjGJMNy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 10 Jul 2023 08:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbjGJMNx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jul 2023 08:13:53 -0400
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83490F4;
        Mon, 10 Jul 2023 05:13:52 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-c7a5600d04dso2472999276.3;
        Mon, 10 Jul 2023 05:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688991231; x=1691583231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oW3Yv1COYJ7dhjbm4aaIDwp8Cshq4Y+LsVT2kg49G+0=;
        b=KmCb9Phl5IUyTgwxf9poE6z0SEumcF0CQxQ/xcpx+CMJheQxQWQtDTEMAOkZWaJA83
         y1KojSpK5xqugrSu+CxfAl1Cua3bPP8+N18XswRLgJFXKiKZcvEbQSlvVIVzQqqoUiJW
         Z7B86LMZpMcV4E0iuthg3bqOFEHMehMNUXHurI2D3uNwuF/XpRUpe2y5lXt5O+V+HsXt
         rtkj2kbuSUIC97WwVIxp3fv8AFEY1Hep/nkt4kNPh2L6fddqLbATyj15PdDYiYeobgtg
         cS0dDrXAFQJKM4w/x9EZ1nGF6wQ3veFdKnqapbUj6huKQh2k9YvFGw5YGxIrItA4UZeK
         u3nA==
X-Gm-Message-State: ABy/qLY6nYgAUXJ9noa3/Js7/0Z+5RRSJgWfQELRDXhgm3FQ317DsGsT
        yajlEAIJjy39aIPLxDqetnZTCE4oz7CKNA==
X-Google-Smtp-Source: APBJJlHI70eiVlahi2VYYdWt2neLmQwNfqddUgAfbcaSUhewyBRJtjRcu7pnmixj5LUP2PmjKR7sfg==
X-Received: by 2002:a25:2d1f:0:b0:c7b:f6cd:c3fe with SMTP id t31-20020a252d1f000000b00c7bf6cdc3femr3892616ybt.27.1688991231423;
        Mon, 10 Jul 2023 05:13:51 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id b67-20020a253446000000b00c6e5a474c00sm1916018yba.29.2023.07.10.05.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 05:13:51 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-c2cf29195f8so5769741276.1;
        Mon, 10 Jul 2023 05:13:51 -0700 (PDT)
X-Received: by 2002:a25:b307:0:b0:bd5:ddcd:bc9e with SMTP id
 l7-20020a25b307000000b00bd5ddcdbc9emr10638267ybj.17.1688991230829; Mon, 10
 Jul 2023 05:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230710063351.17490-1-frank.li@vivo.com> <20230710063351.17490-8-frank.li@vivo.com>
In-Reply-To: <20230710063351.17490-8-frank.li@vivo.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Jul 2023 14:13:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXuEfPP61ucMzq8DDvhtCr1DA5NMh56=POMZGuRbewGZA@mail.gmail.com>
Message-ID: <CAMuHMdXuEfPP61ucMzq8DDvhtCr1DA5NMh56=POMZGuRbewGZA@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] i2c: sh_mobile: Use devm_platform_get_and_ioremap_resource()
To:     Yangtao Li <frank.li@vivo.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 10, 2023 at 8:41 AM Yangtao Li <frank.li@vivo.com> wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v2:
> -s/devm_platform_get_and_ioremap_resource(pdev/devm_platform_get_and_ioremap_resource(dev

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
