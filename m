Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D17BA7AAA5E
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 09:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbjIVHfu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 22 Sep 2023 03:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbjIVHfj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 03:35:39 -0400
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71201198;
        Fri, 22 Sep 2023 00:35:33 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50307acd445so3016195e87.0;
        Fri, 22 Sep 2023 00:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695368130; x=1695972930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLHYXrLa/FmWiFWyuQTiayhZbeHUHrhVPeBHQrlOJiM=;
        b=l8HRikm7tUbO7tKbbB2x9ylvD7M8konYv1aXi8PrzsjwsETkwLhIfgV8HCpb5w0zoc
         aElEe52KktzoTdoiEo5kyx2GkWn40kg4RIXbym3oOOb9MSwoQknqxxGpoVnlb1Njuc/h
         l7Jv1JGZG5ivNZ/oYByNYkPPSvjCw0h36LR3XZTfeMZXv7QoTX/5YD1wO3pewqzI9Umb
         3DDFnTuWeTzP2K1QWmgiTUkoo3vL3zp+za9UD/+n0kV5iNH7E3jMcmRHKtdbNx2t8JU1
         eyhyEk5PA3a5DioMEqV5LVfG25nxAy8SadIjTgbSIPz3Fd/b0Ysyyjs1LznCOCfDXZbc
         rLDA==
X-Gm-Message-State: AOJu0Yw2rgFZHymBfD1wWhwV5ffU11+cHrNdsGON+xKg+XWKir2GIrrl
        gPuEe/yC70da06WEb8LAPwCzOfLSF/g3QcQ7
X-Google-Smtp-Source: AGHT+IGLWIg4pCPs+MHInRUzNy2zyNrBsAsK8g/l40YdIxiH4JWWinBIcN4qcFiYZHpfcvbpJrYH8A==
X-Received: by 2002:a19:e047:0:b0:503:17d6:7dac with SMTP id g7-20020a19e047000000b0050317d67dacmr6784963lfj.42.1695368129953;
        Fri, 22 Sep 2023 00:35:29 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id y18-20020ac255b2000000b00500a44e158csm614341lfg.235.2023.09.22.00.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 00:35:29 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-503397ee920so2988312e87.1;
        Fri, 22 Sep 2023 00:35:29 -0700 (PDT)
X-Received: by 2002:a19:e012:0:b0:503:60e:91f5 with SMTP id
 x18-20020a19e012000000b00503060e91f5mr6541297lfg.36.1695368128839; Fri, 22
 Sep 2023 00:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230921084016.3434-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230921084016.3434-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Sep 2023 09:35:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxJPCzv+7-H6YjqtEzr7KUFzfV4CmSeX_Vd0ZDfzb0Pw@mail.gmail.com>
Message-ID: <CAMuHMdUxJPCzv+7-H6YjqtEzr7KUFzfV4CmSeX_Vd0ZDfzb0Pw@mail.gmail.com>
Subject: Re: [PATCH] i2c: gpio: remove error checks with debugfs
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org, Minjie Du <duminjie@vivo.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 21, 2023 at 11:23 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> debugfs can handle error pointers in subsequent calls. So, remove the
> error checks as suggested by kerneldoc of this function.
>
> Reported-by: Minjie Du <duminjie@vivo.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
