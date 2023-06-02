Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB1471FA4B
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jun 2023 08:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234035AbjFBGqP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 2 Jun 2023 02:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234041AbjFBGqL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Jun 2023 02:46:11 -0400
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AFF91B8;
        Thu,  1 Jun 2023 23:46:08 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-bacf9edc87bso1765092276.1;
        Thu, 01 Jun 2023 23:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685688367; x=1688280367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBvNnozAj/TxuO9hzx+eUqb+0I9jnSWpjdQGiWjymEA=;
        b=dML0uqQSRBuuJBWn3zi7AwF2o6OBGB0RzJK2/bWwK6sKxDR4gSoR5Bj0/B8Lc0M7g5
         rDzv4lKjMMRBF5ZLBdqc4ShHtiQHNpXpU5N9i+WoFQUvYm9yeeP14COOYG95zyLu1FpU
         FqAGdWRoj0Mx4V8LsnmLcKqN3ppwPbKuQ8cG9uBC/Q0jv0Qq/pSrECvKnd0INzsYbLKh
         nvdwOdK/0Y/ybVxrAWZxHE4nR1h/xGgxCOK9iIai/6O/7hlsm8j9U0qzWQxqaTiRIUS/
         9Mm/hdnnG+VpsVRvN+6fY1hINOX7fQk3DAtw1osrKAybNMGMIR9y4d6zEkDz3ATWcdkY
         mjZQ==
X-Gm-Message-State: AC+VfDwluXj/p52f3JtBfp6156CVcZBd5JlGNqp+vfiEQJ2MRWmd7lB7
        xsaAjpBUcJP8Sb8muxAW0Tq6Kq4oTH6ETg==
X-Google-Smtp-Source: ACHHUZ6iuKFf4ntn34Podde34WH9HJTehkrQTHhPUbvrldP/KUEZYKG1uQOZHiT6iOdihMucRzXYsA==
X-Received: by 2002:a25:26d2:0:b0:bac:5d73:7f0a with SMTP id m201-20020a2526d2000000b00bac5d737f0amr2111822ybm.17.1685688366967;
        Thu, 01 Jun 2023 23:46:06 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id r5-20020a5b06c5000000b00bb1d8f2a593sm128214ybq.45.2023.06.01.23.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 23:46:05 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5659d85876dso15643097b3.2;
        Thu, 01 Jun 2023 23:46:04 -0700 (PDT)
X-Received: by 2002:a81:7105:0:b0:568:fe3a:46a2 with SMTP id
 m5-20020a817105000000b00568fe3a46a2mr6129479ywc.18.1685688364384; Thu, 01 Jun
 2023 23:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230601171711.221430-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230601171711.221430-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Jun 2023 08:45:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU9gT97SUusrteKnGuHh-fhyq9V_DwzUQXDLyc_pvfgLw@mail.gmail.com>
Message-ID: <CAMuHMdU9gT97SUusrteKnGuHh-fhyq9V_DwzUQXDLyc_pvfgLw@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: Add i2c_get_match_data()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 1, 2023 at 7:17 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add i2c_get_match_data() similar to of_device_get_match_data(),
> so that we can optimize the driver code that uses both I2C and
> DT-based matching.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped parameter const struct i2c_device_id *id and the helper function.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
