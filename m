Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8551A52FC5C
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 14:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239553AbiEUMa6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 08:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233731AbiEUMa5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 08:30:57 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE8F1276A;
        Sat, 21 May 2022 05:30:55 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id m2so10660092vsr.8;
        Sat, 21 May 2022 05:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=PLiUGsx86B2IgJe8KKAVS/qHitUeMZlk8GB1xxBGZXM=;
        b=K6lwCJy8pSzS5W0RmZDgVBc9ap8q6yLL+ZvdnP3IHErkTb2N+R1Co3xlAJguLh7WoQ
         S/T2DTU/OJ/Lpa69I/5ehApXAbjZKTwk4Y/3s1JRI2gImpuSTvXK2q/NrBpKfLeE4Yse
         JZ2O8RnIjJLPg7s2Ox0aQxdublM9mfNhkpuoXd2IfYHCRX1SX1Qw/kFv7vVg4GmHqAje
         YDosDgnPDRAmRrhe9ZS4jNTyg7sWS8EeWoYxxbdfcBQuw5onL0xSzDjTbpt6+r+NfVji
         rHKScJrEXiTx6gopnvCOrH3WIWknJSm2BwzlLWcKpoHetN3zArXODEx+qAt7xuiH+tWL
         7dXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=PLiUGsx86B2IgJe8KKAVS/qHitUeMZlk8GB1xxBGZXM=;
        b=YVGBRpl/5v6fJDeTV/M7vbj0sD6aCClJzJ/z6evp1usnzMBfEN/tJ9N+aInwYgGaZg
         nowaFHIs8hAl3adYiwd+I94KkDbHZmDXRFvI92DcVXf/DoS4prePhKT3QZJcYelh3LR1
         f2PRiqmpwcnLrRZTuiX7deGwU2KJF6UQlZfnTXIHVXgDB67lNDXxnm3XHnicmbzNxBO/
         1Nq2G8U9qE5xj0bMu/2gdo1naGjz/SpHSQG69pXjQebEGy7kIlvXNPU+uPmEKEre7JjX
         GxkhiTfClA/Or7QvVKgQeUT6S7kcMB75iN2PaYlb0uqJyfYgk6Fsi6Gr0UP56rDPSDeY
         ur8Q==
X-Gm-Message-State: AOAM5320Ruqp6lQBGKKdIkF5NjEnlXCeysFNdPAyA8+bTiQv/zBA/rBC
        iQyTAL0isV2JZTChO1xtdKqzoWzwakviBhlFLw==
X-Google-Smtp-Source: ABdhPJzgU6FZ4AbE/027a0BTPCNgs0tj4cM53LwYNT4x6xuAyl667ifMD7gq1uwVW49viywaTzGAZkwJH7o7fPxouVc=
X-Received: by 2002:a67:d88c:0:b0:337:9a25:36c3 with SMTP id
 f12-20020a67d88c000000b003379a2536c3mr795937vsj.84.1653136254639; Sat, 21 May
 2022 05:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com> <20220517101142.28421-2-warp5tw@gmail.com>
 <YoiAqhZBILoxFLih@shikoro>
In-Reply-To: <YoiAqhZBILoxFLih@shikoro>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Sat, 21 May 2022 20:30:42 +0800
Message-ID: <CACD3sJYnS3VV8yykmbsg+CjARrywJk2zYz9NkBnC7bT=5kAwuw@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] dt-bindings: i2c: npcm: support NPCM845
To:     Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
        avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
        jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com,
        arnd@arndb.de, olof@lixom.net, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram:

Thank you for your help.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8821=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=882:03=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 17, 2022 at 06:11:33PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Needs to wait until comments to patches 8+9 are addressed.
>

Best Regards,
Tyrone
