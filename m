Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42F6C7C9FE9
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Oct 2023 08:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231745AbjJPGuO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Oct 2023 02:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231738AbjJPGuK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Oct 2023 02:50:10 -0400
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D308FD9
        for <linux-i2c@vger.kernel.org>; Sun, 15 Oct 2023 23:50:08 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-49e15724283so1349267e0c.1
        for <linux-i2c@vger.kernel.org>; Sun, 15 Oct 2023 23:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697439008; x=1698043808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTyeNPacE6taal06U4rFKo97zbtlCxtcbVAGC5HRCCg=;
        b=OhcaVzVpkfPHyxCSdlGtObhkWWG0LMk2VKko0WyS0U1rYJRV2J/DszdHKOLoIfutXn
         JkGmw2tBYldGKc/+/gxQH86F5NTAuzfUhgnX+JleogCcUgSS2vgIVR7Sb45hywmU2aIm
         1gH4RqIHUTUNERSo4DnxF6wu+WktMvV2fHMvMzpuCw/GV12SQUl27upWqdX9ffgZv7ZM
         F9b9EO3lMcXEGHSbkuDNZvdgmigUmJiierUi0vRej3eGkJUPIyrccgK9/vFUBWWgDN/E
         RO47Hp0TB373xMZ6z6EeAOFmq45hT9adkGfSRyHJZ1ZecZNF8zgr2CKzzpE185ZcdCt2
         DW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697439008; x=1698043808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTyeNPacE6taal06U4rFKo97zbtlCxtcbVAGC5HRCCg=;
        b=X9oyV5SEAI+zoeNJXaLjBCajwGTPjCET/kICnngFowlWzg5btNlQt/7U+mjXLi8m9d
         MtzFCO00rG5ulhJkNCOfbPOKA3Ca4jnr61ZVIpUg8C9LbDJN1L+c+5p1wYni62sMQyP1
         UOmha4SjhfUgtGmCaglukl6V0E87/fEo6VZe4X2nSyAktDityhWpuAqbsfnAzPoClNlJ
         Zvd7XVA/992fTnGUBD4F2BFCCddSoRdlGRRccD7YCqq0RZMz4AgrygLmOM94mEyboccy
         gVsHGWprHcd9PVmhT9hCuFgAJtNBYe73CjqHLS5eGE066qR1Fo9wpWf11k9t3N4Z3fHk
         weBA==
X-Gm-Message-State: AOJu0YzIJv7SB8XqUYWOtUnPXrhHZw1iVeFA6xhScw0ShTqjkt03cYJE
        NyQ8B2KP1e11VYzHNhCx1HZD+iHT7VJcRSSPhUiimA==
X-Google-Smtp-Source: AGHT+IHlu77Jq/4EnzgWYqh7YnGd6GIrhJLqfbhpQKnfJadIJTwwVh9WLmRW/LNFGLdnBaen0mpiWfuuUnXNKBWHoAk=
X-Received: by 2002:a1f:ec43:0:b0:49d:fab:fa42 with SMTP id
 k64-20020a1fec43000000b0049d0fabfa42mr27078246vkh.1.1697439007850; Sun, 15
 Oct 2023 23:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231013063008.2879314-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20231013063008.2879314-1-alexander.stein@ew.tq-group.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 16 Oct 2023 08:49:56 +0200
Message-ID: <CAMRc=MdEtfpEULW190EVdmBYLYPSsAo8RWeHggAcCvJfSbzVFw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: at24: add ST M24C64-D Additional Write
 lockable page
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Oct 13, 2023 at 8:30=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> The ST M24C64-D behaves as a regular M24C64, except for the -D variant
> which uses up another I2C address for Additional Write lockable page.
> This page is 32 Bytes long and can contain additional data. Document
> compatible string for it, so users can describe that page in DT. Note
> that users still have to describe the main M24C64 area separately as
> that is on separate I2C address from this page.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> This is a copy & paste of [1] for ST M24C64-D. I reused the same pattern =
and
> also used Marek's commit message.
>
> [1] https://lore.kernel.org/all/20231010190926.57674-1-marex@denx.de/#t
>
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documen=
tation/devicetree/bindings/eeprom/at24.yaml
> index 7be127e9b2507..6385b05a1e62f 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -73,6 +73,8 @@ properties:
>                    pattern: cs32$
>                - items:
>                    pattern: c64$
> +              - items:
> +                  pattern: c64d-wl$
>                - items:
>                    pattern: cs64$
>                - items:
> --
> 2.34.1
>

Applied, thanks!

Bart
