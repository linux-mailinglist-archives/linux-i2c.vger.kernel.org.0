Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C240C4CA547
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Mar 2022 13:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234357AbiCBMy0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Mar 2022 07:54:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234165AbiCBMy0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Mar 2022 07:54:26 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38C590CC4;
        Wed,  2 Mar 2022 04:53:42 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id e5so1701455vsg.12;
        Wed, 02 Mar 2022 04:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=+Ikj6nSRW/83wAf8afXGAgsjyXlLyHwdFoow7ohi4CA=;
        b=UeBgR12APOHtLPpa0zXQWvvdUaqMRKijI8g5p/mpjKyeBdqZhOu1GBuyNOXylcM96T
         oLFjeniEtxytH8/srESWhLAZ6OXjOezrU9mERuY/yg4Dtebs19wic9MKE0+Gw5d6uuOG
         MssH5VSOIoTqvuJt4WbIxARibIBRaD2HK+r7IfFmjgKTvnrTdvNrqDMFn6n5Rnvb+dEL
         NmIS3UXbjaIyNXsQgJ54FsGwPR4qyzezC/y+L7LKyPXCfYwrYVdZAl15nvOqPldnkotx
         5GebsW5IVElNnfHg2jvccyAYg5YsDdy8wnEcTJWfdeWUODcuGRI1tCBHruxCwAmpRZrO
         faww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=+Ikj6nSRW/83wAf8afXGAgsjyXlLyHwdFoow7ohi4CA=;
        b=qquHognyG7ZLtsNd774MEq7ng2KrsC2rrkk6I2jC/oMizNGUsLILCXocb1I6/6B8Er
         pwENKQ7I38a5gkzezLczYdauO0ZsNwpMziyuwKZyKI8kmxqA9iSyitjwG1cgJYoeshKO
         /rd/X6B9F3taGSi1/kp97ljC4B2td0ynkjTyouWBFSQepD0X4LNIUJsHHrOkSwAXtTy5
         I/O3cXQJ41dr9gAKoel3W6Ge03mlzqnrGYz22dn9KxJ9RhY6pNzLe2+NLGvxy3za+Ge0
         ac1rTIJtkSF9eAUN1jGvmk0BjFh8cswNd3TuxQYXOXBQTdo0sKzX3dUpipg2IBwzj1Mt
         E9kg==
X-Gm-Message-State: AOAM533vMALZvTbgF/jKfHeoL06RDLcv1Xn20McuzR74zk/TqwNk+SuM
        OAGXY0/9LchtN1/lEzcMhXK0dfN+/iP8j2yBLg==
X-Google-Smtp-Source: ABdhPJwTl6o4n3ZiUFNOKRW+dr9GCbZ5z70Ms3ll+1CcGAyZvwH9YO0ObjYUMZbhQ1TBIqRqsT6qzfnRwllIuoAuHMc=
X-Received: by 2002:a67:d319:0:b0:31e:98fd:31b0 with SMTP id
 a25-20020a67d319000000b0031e98fd31b0mr6452889vsj.47.1646225621566; Wed, 02
 Mar 2022 04:53:41 -0800 (PST)
MIME-Version: 1.0
References: <20220220035321.3870-1-warp5tw@gmail.com> <5d507fda-525e-4064-3add-0bb0cc23d016@canonical.com>
 <CACD3sJaXeWLu6=oLgxJcU9R+A1J+jB7xKaGcDFwYxof33yj17Q@mail.gmail.com>
 <5ce0f6a6-4a5f-4f25-3cc6-ab0f24bf15cf@canonical.com> <CACD3sJaWJMFgwzQgrHFV0KkkbJXzhgFx=umywxSrLszwP+hO2w@mail.gmail.com>
 <Yh536s/7bm6Xt6o3@ninjato>
In-Reply-To: <Yh536s/7bm6Xt6o3@ninjato>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Wed, 2 Mar 2022 20:53:29 +0800
Message-ID: <CACD3sJboyA_wV_eiivfbHR527Y3E6z3NRmhiDzegk=fcw+nZ9w@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] i2c: npcm: Bug fixes timeout, spurious interrupts
To:     Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, semen.protsenko@linaro.org,
        yangyicong@hisilicon.com, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, christophe.leroy@csgroup.eu,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        digetx@gmail.com, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

Thank you for your comment and it'll be addressed.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B43=E6=9C=882=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=883:45=E5=AF=AB=E9=81=93=EF=BC=9A
>
>
> > I'll keep old code as fallback, if getting nuvoton,sys-mgr fails as
> > you point out.
>
> Yeah, fallback is much needed. And if you implement it, then you can
> also split the series into two. One for the DTS changes and one for the
> I2C changes. That would make upstreaming a lot easier.
>

Regards,
Tyrone
