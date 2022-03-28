Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F58E4EA2E7
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Mar 2022 00:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbiC1WdD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Mar 2022 18:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbiC1WdD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Mar 2022 18:33:03 -0400
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D8247049;
        Mon, 28 Mar 2022 15:31:21 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id m42so6942911uae.0;
        Mon, 28 Mar 2022 15:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=CmZ698zi6YOmaGXJq+4D519v38GWNIw39PDssju4nkQ=;
        b=1roScc6jAZ+y9U38kH2Vqxgbdd6LUeSQlwalwv0l2uhDUBkTa6e4B3XtPkh2nvpCtV
         y9wxyYeb/rUm83+00UElyerh2AMSdUy7e+9VmoqHQQYKCmm97kVXGB6v6arvXmnjdjJD
         ecG4/eW19kJEWgbRsOt/I1zEpsJbX2XVjr/b+p/6BmyzKx/pQ+3iM3i9AW6AagggUdG/
         mYOuBkGMtGvGS3zOIis/vfp7w67L5Y19v19MucNcoE7OoUjDNA7Wtw47kiGgHq3XXXG/
         fUpvH9skUPVqQZqLP1Rd/Jb6Ao5wYqQmIQ1ZKssQyStAqfjFAG7tQhPdBNqaMFDDPxbr
         1Taw==
X-Gm-Message-State: AOAM532wPPiRTEu+ON6lbZR5Hrg4QZWqLnKV+x2V+YnbQnsASQ/PwnJO
        kAD6Na4WsO+hXL01r+y/SpoinMgbhWyOMg==
X-Google-Smtp-Source: ABdhPJzWE5xRPjrLSBB9GUTXgKNAIRwOyZjbdunHFJRs04gSwP/p9orLNULbwcDVvPX7z49qml2/Lg==
X-Received: by 2002:ab0:7411:0:b0:359:6321:5805 with SMTP id r17-20020ab07411000000b0035963215805mr14124678uap.6.1648506680691;
        Mon, 28 Mar 2022 15:31:20 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id s68-20020a1fdb47000000b0033f4b515116sm1766124vkg.55.2022.03.28.15.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 15:31:20 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id w189so8804597vke.10;
        Mon, 28 Mar 2022 15:31:20 -0700 (PDT)
X-Received: by 2002:a05:6122:1310:b0:343:2ca9:2e11 with SMTP id
 e16-20020a056122131000b003432ca92e11mr6469975vkp.5.1648506679815; Mon, 28 Mar
 2022 15:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220326102229.421718-1-tanure@linux.com> <7hee2lu82n.fsf@baylibre.com>
In-Reply-To: <7hee2lu82n.fsf@baylibre.com>
Reply-To: tanure@linux.com
From:   Lucas Tanure <tanure@linux.com>
Date:   Mon, 28 Mar 2022 18:31:24 -0400
X-Gmail-Original-Message-ID: <CAJX_Q+1tz7BYL+CvXnc=zAamPiZDEFAASv9a7YoWGmzqYL+cUg@mail.gmail.com>
Message-ID: <CAJX_Q+1tz7BYL+CvXnc=zAamPiZDEFAASv9a7YoWGmzqYL+cUg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Ensure Low period of SCL is correct
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 28 Mar 2022, 21:37 Kevin Hilman, <khilman@baylibre.com> wrote:
>
> Hi Lucas,
>
> Lucas Tanure <tanure@linux.com> writes:
>
> > The default duty cycle of 33% is less than the required
> > by the I2C specs for the LOW period of the SCL clock.
> >
> > So, for 100Khz or less, use 50%H/50%L duty cycle, and
> > for the clock above 100Khz, use 40%H/60%L duty cycle.
> > That ensures the low period of SCL is always more than
> > the minimum required by the specs at any given frequency.
>
> Thanks for the fixes!
>
> This is going to affect all SoCs, so ould you please summarize how your
> changes were tested, and on which SoCs & boards?
>
> Thanks,
>
> Kevin

Hi,

I only tested against the vim3 board, measured the bus with a Saleae
logic pro 16.
The measurements were with 100k, 400k, and a few in-between frequencies.

Is that enough?

Thanks
Lucas
