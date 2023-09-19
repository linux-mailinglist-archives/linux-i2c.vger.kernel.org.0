Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC397A5DF1
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 11:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjISJbU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 19 Sep 2023 05:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjISJbT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 05:31:19 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC05EC;
        Tue, 19 Sep 2023 02:31:09 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-59bdad64411so55282787b3.3;
        Tue, 19 Sep 2023 02:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695115868; x=1695720668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TuEfbjVa0p+kzq0kR+qyrC9KjiJDZRd2Ebzkpo8GT8=;
        b=J0oVR9LDmM4bve9UGyQtP13UjUgcJNZV2wQmpLNHq0fUjbv6uj0c83KYwFqk2Vwh9G
         ki3fFUMEtemGiJIYO16f+VrcLG+qBWDxeY28xP8djvqPCWVhRk71NH+/s1bpR0ZeemLu
         TB2EIdNrWHJ9G6/qdhLczYMYbYlcePrLjLrTu4DsNIGnY/yjwJcFd/qzbqKC7L6iKA6Q
         JSU6upYp3zbYhmgKeP+uM83zLigXsZR0xvOTFyUjHqWQ/EVMjx58w7kpnDdpoX48huLN
         iHz0WflTNpwx7a5WQxU2aiAnCE++NW069S8YxN7/U3g0XT9ROPEOaKByqTY7zUYSbJud
         D9rg==
X-Gm-Message-State: AOJu0YwzswqqS0JBJI5iAQAgoj+fvZiLTK9ODsqbVukcWIpxiq1RSx9g
        hm2GO0RNLZDOf9GVa/ks+EmCt5C/GrEj0Q==
X-Google-Smtp-Source: AGHT+IFFL/2OUKLgsn+orazpF35UlumDvCk48IwIeSiLHk0M0Z+BMhNVGIUEMmYZBXbaIgKwf7g3Mw==
X-Received: by 2002:a81:5c82:0:b0:59b:fcca:afc6 with SMTP id q124-20020a815c82000000b0059bfccaafc6mr11565547ywb.50.1695115868633;
        Tue, 19 Sep 2023 02:31:08 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id x142-20020a81a094000000b0057d24f8278bsm3042080ywg.104.2023.09.19.02.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 02:31:08 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-59bdad64411so55282707b3.3;
        Tue, 19 Sep 2023 02:31:08 -0700 (PDT)
X-Received: by 2002:a81:7189:0:b0:592:4f93:e831 with SMTP id
 m131-20020a817189000000b005924f93e831mr11986079ywc.48.1695115868190; Tue, 19
 Sep 2023 02:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230913062950.4968-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230913062950.4968-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Sep 2023 11:30:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXL1dc6RdFvaB1wLOZYsrjQH72PU47K2=nOcG96=bmbqA@mail.gmail.com>
Message-ID: <CAMuHMdXL1dc6RdFvaB1wLOZYsrjQH72PU47K2=nOcG96=bmbqA@mail.gmail.com>
Subject: Re: [PATCH RFT 0/2] i2c: rcar: improve Gen3 support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
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

Hi Wolfram,

On Wed, Sep 13, 2023 at 12:20 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Here is the second series paving the way for Gen4 support. This time we
> properly apply the Gen3 specific features. See the patch comments for
> further information. This has been tested on a Renesas Falcon board with
> a R-Car V3U SoC at various bus speeds. Because the calculation formulas
> are crucial, testing on board farms would be much appreciated!

Thanks for your series!

This (combined with the FM+ series) seems to work fine on all R-Car
boards I gave it a try on.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
