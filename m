Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06F374BD7EE
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Feb 2022 09:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245406AbiBUI3s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Feb 2022 03:29:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbiBUI3q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Feb 2022 03:29:46 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD0BBC;
        Mon, 21 Feb 2022 00:29:23 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id j3so2527675vsi.7;
        Mon, 21 Feb 2022 00:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=z7GbsHFki7BHmmijQLgu4jj0JzXWxy6jSKULjvaUMy8=;
        b=YAe/FOh3YSDtYtbR4PnOKeb4K5dDoW+FBsI8qeLiL3vGVsklbxiZNspPuYQ7qJDmrQ
         VMY/g5C96ioabxZxaqBJxV9ZwxOwHHk//+aLa4GlP1zEnq4ao/ojIBoqmpTINNqJyz63
         kxl1dPlUHvkcaxDaQt2g7NyFo/afKAAWQ4A7+h2WoU2SMyTTXhb9885eyU5v22W7+JiV
         6P32BHphxsl7ac4qJ2dXLKTu8EAnJc6K1qxfDr8MeAl2oPzF2Qi7i5PeZb39PbUuByTq
         PC8rPkA4b1xX+5G7RL4wxAxYfNB47mUHsNYZGvs4TNx2pdpEEHNHRcA4/8CbCHqTv6zq
         Lgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=z7GbsHFki7BHmmijQLgu4jj0JzXWxy6jSKULjvaUMy8=;
        b=DubekVlca61rsQZdWyYEDEExcAQAlDs6O7ZilkA8GCN6Z3oGFIcerE6TkYf20ex85u
         U5IwGi9ugHmu0TAtT3Iz7RfplHcMkOkycgiP3YASsGkgr7oJS/+35bsuBG6Zrc3caURe
         1448xq9vJjxq5MevZ9Qtiz/xP9I4UT9+sE350A3Fnyi+mX8WpGciW5gun/W0YsRnENkI
         lck3pB20GgOsiZJBsZt8N8uXndUOxgqxyVgftbnG81+9dhSg0q9nXcC4205Su9mZsfQ2
         prsZsY45wvKeAdbpCkhMuXzXLCqJ+G/XMMQm7kx82iKLL8QnIHEUQGmPfdvm1L8rrswu
         eUUQ==
X-Gm-Message-State: AOAM533JXMYflbWjgMnrdPcmn0SP+xjCIFsP2KzuRz9AZIAd5KqSaMDq
        EjPML5gEKVx6AgVAgJ67WumNk5XvgYzA3ENIDA==
X-Google-Smtp-Source: ABdhPJxrwy07YYidAlOGzW8ZJV9eYQ1bjoVO5usicU/jUamQDPj0Kh2S1a/A8IpLOP9uhc2ftnW2l1cER8DZgG31qNU=
X-Received: by 2002:a67:b807:0:b0:31b:b306:a5c with SMTP id
 i7-20020a67b807000000b0031bb3060a5cmr7001993vsf.50.1645432162605; Mon, 21 Feb
 2022 00:29:22 -0800 (PST)
MIME-Version: 1.0
References: <20220220035321.3870-1-warp5tw@gmail.com> <20220220035321.3870-5-warp5tw@gmail.com>
 <ae927203-794b-06c6-3bcc-d67f13ab841d@canonical.com>
In-Reply-To: <ae927203-794b-06c6-3bcc-d67f13ab841d@canonical.com>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Mon, 21 Feb 2022 16:29:10 +0800
Message-ID: <CACD3sJbn7EK71+3yjok8Qg3DRrRNgEVne0mNs8vRBiJu3mpxbQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] i2c: npcm: Update gcr property name
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, semen.protsenko@linaro.org,
        yangyicong@hisilicon.com, wsa@kernel.org, jie.deng@intel.com,
        sven@svenpeter.dev, bence98@sch.bme.hu,
        christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com,
        olof@lixom.net, arnd@arndb.de, digetx@gmail.com,
        andriy.shevchenko@linux.intel.com, tali.perry@nuvoton.com,
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

Hi Krzysztof:

Thank you for your comments and please find my reply next to your comments.

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=E5=
=B9=B42=E6=9C=8820=E6=97=A5
=E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=885:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 20/02/2022 04:53, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Use a generic name for NPCM system manager reigster.
>
> The subject is not accurate and you entirely skipped in commit msg the
> fact of an ABI break.
>
> You do not update a property name but you change the way of getting GCR
> regmap.
>

I'll change the subject since the patch is to change the way to getting GCR
regmap as you indicated.

About the ABI break, I responded in the discussion thread of
[PATCH v2 00/11] i2c: npcm: Bug fixes timeout, spurious interrupts.

> Best regards,
> Krzysztof

Best regards,
Tyrone
