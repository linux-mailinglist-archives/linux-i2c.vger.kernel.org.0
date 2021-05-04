Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9779E372C48
	for <lists+linux-i2c@lfdr.de>; Tue,  4 May 2021 16:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhEDOnR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 May 2021 10:43:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:36792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230086AbhEDOnR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 May 2021 10:43:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 59B5B613B3;
        Tue,  4 May 2021 14:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620139342;
        bh=PYPsVpOMTvNJwbf8RMnEK/FX8y+faIhHsQH0q972Hpo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JxYzEEDwLUP8zOrBerahSq6vHZSWM67cK8aNf0h3rNy9+WAzOkIYkU2IMAGCLwswu
         8Aqy/7MyTMeLZzU9uhUoXsFY2cc83va0xSto8NQXrYNpv2cqpmIXn4FtJYOnw1qu1A
         z10/etRdjB1rSG+65ZYv1fFcxP72CdpuVVZXtqP04t6W9rT70gWtcXsVBuI75PhTYP
         P15zhg+pF24h2FR55fx3ciOsDzPFwrff5O69htjBcbPyU7Q6+3cqNMGZtEkdiktl3s
         /lOQ/cYJ9U5GZw60jG4I35wYG8aJtcVWQKnaeAkJI3T52M1eRA+ZXmynKDWS8AsSTe
         H2fPJa0ryIVyw==
Received: by mail-qk1-f178.google.com with SMTP id i67so5602351qkc.4;
        Tue, 04 May 2021 07:42:22 -0700 (PDT)
X-Gm-Message-State: AOAM532SHoUQotPrwtBZntnzwVa2Gbc2Svm4jA+95/TdEj8T/hVKLLPM
        dV2SZMBbbNp6+P8KqeECQJCESMxMEbB4aNC9MA==
X-Google-Smtp-Source: ABdhPJxB4e7Sk9Wq5fxRct/7J6Zd7HsiLal+5KjbDTA1U1QuVbHi86pOHClFGrQblIfiKf5y8tKrEDoLRlmbHZ77xRc=
X-Received: by 2002:a05:620a:1409:: with SMTP id d9mr25280915qkj.464.1620139341502;
 Tue, 04 May 2021 07:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620138454.git.geert+renesas@glider.be>
In-Reply-To: <cover.1620138454.git.geert+renesas@glider.be>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 4 May 2021 09:42:08 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKTYq0T6RP6oR928HmADSeoJREoF+RMAHNm+YGigiS4AQ@mail.gmail.com>
Message-ID: <CAL_JsqKTYq0T6RP6oR928HmADSeoJREoF+RMAHNm+YGigiS4AQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] dt-bindings: i2c: renesas: Convert to json-schema
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 4, 2021 at 9:36 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi all,
>
> This patch series converts the DT bindings for the various I2C
> controllers found in Renesas SoCs to json-schema, after a small cleanup
> to ease the conversion.

You missed the DT list. Can you resend please.

Rob
