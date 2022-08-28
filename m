Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0188E5A3E08
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Aug 2022 16:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiH1O3C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Aug 2022 10:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiH1O3B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Aug 2022 10:29:01 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309061D0F2
        for <linux-i2c@vger.kernel.org>; Sun, 28 Aug 2022 07:29:00 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id lx1so11096652ejb.12
        for <linux-i2c@vger.kernel.org>; Sun, 28 Aug 2022 07:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=n/VPFfoqttz49w6XODtsmo/P5oQuyZ5DtTx3dV0p84U=;
        b=ZAMrmF6RS8rcxnxMOU/zlxkTzG1O+jAjQwqr+UxAhKxi4uQMupQv2Et+h5NG+IsokC
         reOgldYVLIS89ojK2DdNDosWGKLU1F8fVDSOq06P5oEJxfTsBFZgvBS34oZJaLkf0DjI
         iEFGZ021tTWq+Jnn//sdrw0/9OgcT92q0nfCIUwuDoDZs6smvhL1fqtitrEgW5u6gNQC
         VVzrateC5VSBMtOkJOtTJii7AhmsBlVF43HMXDf4aaFw78eGjERtV/w2C26gjtth5a1S
         Owb7PKOYW47OiD2w0u3LhK9D3zc1Wplb0qK7i7AyeGAnRRFCyXkOMpUdhv0q+7erP61a
         6C5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=n/VPFfoqttz49w6XODtsmo/P5oQuyZ5DtTx3dV0p84U=;
        b=7SS5+ZBnmX5tvKZ3RDG3pfm6FnBsKNOkXC5OQbKAnGehVPYh6XFrGIc/sBktv+mOgB
         68Xa3nEfNcwQufkkpSCFrgWEIqwI5MAk6tl+bJMW069+0YCH2SBMBTXJyK7ARbjF2fGv
         raJW0m9vZVPmtpuz2uMMMiEc83ddE58Nt6oP1ML8TKbkVVN/IzJg7d81WujSRJ4SxJXx
         L8BrE0Cym3sJ3qFzLP7aJbmwAhfjm3I8UiWz9QWJMfNMc2PDRxWEMG4CJYdJxvmSHWVS
         8uBp8DfiXdINsdYJKB2cIDjuAJernno3hE1L96RkiC1iyvijTGxlKFANUyPa3pg0eqP9
         AyPQ==
X-Gm-Message-State: ACgBeo3NdPy4MAEQC9JOlPEQRjRRx7N8cadM+tQwmx63zl0CGcPoIJQh
        7tkIwyiyjodsXMmlkeJF5f3Zs1OujUihWn+z1sOsaA==
X-Google-Smtp-Source: AA6agR63cXI5s4mncfYPOxQ4r/z1qQeVThXt0jL9Ypc8fPEst6QlqFcAT5q5t+F8EF+RuaqTbaOOQUY0eOyVRK2soXI=
X-Received: by 2002:a17:906:9bf3:b0:741:6900:61a5 with SMTP id
 de51-20020a1709069bf300b00741690061a5mr2314807ejc.286.1661696938728; Sun, 28
 Aug 2022 07:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220822105830.22790-1-farbere@amazon.com> <20220822105830.22790-3-farbere@amazon.com>
In-Reply-To: <20220822105830.22790-3-farbere@amazon.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 28 Aug 2022 16:28:47 +0200
Message-ID: <CAMRc=Metu8+zdf101-NVRtbeu-tZiKhPJBiEjYLEsf51d4tj4Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] eeprom: at24: add support for power-supply control
To:     Eliav Farber <farbere@amazon.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        talel@amazon.com, hhhawa@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, ronenk@amazon.com, itamark@amazon.com,
        shellykz@amazon.com, shorer@amazon.com, amitlavi@amazon.com,
        almogbs@amazon.com, dkl@amazon.com, dwmw@amazon.co.uk
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 22, 2022 at 12:58 PM Eliav Farber <farbere@amazon.com> wrote:
>
> Add an optional gpio regulator to support a power-supply control.
> If a gpio power-supply regulator is supplied in the device tree, the
> gpio is enabled during probe, and disabled on remove.
>
> Signed-off-by: Eliav Farber <farbere@amazon.com>

This doesn't apply on top of v6.0-rc1.

Bart
