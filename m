Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A972B5FC3DB
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Oct 2022 12:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiJLKlD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Oct 2022 06:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbiJLKlC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Oct 2022 06:41:02 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 995ECB03E6
        for <linux-i2c@vger.kernel.org>; Wed, 12 Oct 2022 03:41:01 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id v130-20020a1cac88000000b003bcde03bd44so938140wme.5
        for <linux-i2c@vger.kernel.org>; Wed, 12 Oct 2022 03:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GMGavsqDTieUDukmhS6rMKpH7uIs7gMeBzhurlP6vGo=;
        b=LCRgCgsmBRWk7zDar1RUdQGzXh/0NARYNfWGZnVulHf7hhOctbGlU+E3dKTGZuL5ct
         iERHVv6Dxkb+jA9ncp0dLzbjNR39AfRU3Ldj8gm1bvnsZaH2lneNjbe2Ae2GpXuhDL9b
         ggZVr0uiPC2sICHKTX3jwbI7LrnO7jQ8TnbZyr8bi93XejBMEqH1c0pwvWSHF2J+mX8n
         V3BEmi77ciFpx7RQr0l9ZaZ+t7PFB2C8GeckMz9MvnSf9r/miT+pcn+DczJdjuaIKZxH
         mhqCEAu/TIAn4VDH1PPVxm4BvXzCfxbITsFAsjVgp6AutoZSdhQgkYdQpjH8qdy17Gzo
         q/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GMGavsqDTieUDukmhS6rMKpH7uIs7gMeBzhurlP6vGo=;
        b=N1I+9MYHx97RAQ5NkQnd3ZMS84/xgU1wWyBFTJmFOkC2BCBpWjfLZUqyAQMARIZXwU
         54VKV6xQd8IH9kDD92iI48Auk1Cl939qCcMHTDIFX1Blrx16GDAE85KBPqLrNKwGtktP
         lebv43EypJ1Uv4ZgnIi23xVMs2Nk0A3etZsB9mvnVzQbk/eWkeoaZWi3lgd/lUeHx6nB
         oCa+KAtTot9AXw8BQhEaw/AXpAfToy5MF8tn5JRQeSpfmVCuAHrXj7pF0ewO0qRYMU96
         rjxoQUAuIiu8q9V+GiNHM5WHmbULRZLkxImCZ2p+lteBxa2/HouU5jgjmB0rMjX9criM
         m1nQ==
X-Gm-Message-State: ACrzQf2BhiicxGnRXEWAmS6qkeNkpR8riUxLxeSg5kfQyfMUYxy/XnUQ
        m74tHcRlBB1uAxV+PDmIshpQgWBY08bhwDQTS6M=
X-Google-Smtp-Source: AMsMyM5vJ5paGyD9riCNq08IcUDAkfZx7cUo6W9ypfsDmTFLA1t2V2xP7825oshhGA2anyrHK92gYvrZwmdSrAqn8Fs=
X-Received: by 2002:a05:600c:a4c:b0:3b4:fc1b:81 with SMTP id
 c12-20020a05600c0a4c00b003b4fc1b0081mr2216888wmq.125.1665571260138; Wed, 12
 Oct 2022 03:41:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:4151:0:0:0:0:0 with HTTP; Wed, 12 Oct 2022 03:40:59
 -0700 (PDT)
Reply-To: vgcx888@yahoo.com
From:   Frank Hughes <vgcxdd7@gmail.com>
Date:   Wed, 12 Oct 2022 03:40:59 -0700
Message-ID: <CAKDB8=vv4NpdDHTj-rD=TuRAYdhvJPpmK-J1T4Ka-56qoqS8Yw@mail.gmail.com>
Subject: =?UTF-8?B?SGVhZCBww6RldmEs?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        HK_RANDOM_ENVFROM,HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:336 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4755]
        *  1.0 HK_RANDOM_FROM From username looks random
        *  1.0 HK_RANDOM_ENVFROM Envelope sender username looks random
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [vgcxdd7[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [vgcx888[at]yahoo.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [vgcxdd7[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Head p=C3=A4eva,

Mina olen Frank Hughes. aastal USA s=C3=B5jalise missiooni ajal endine koma=
nd=C3=B6r
Iraak. N=C3=BC=C3=BCd, kui USA on oma missiooni l=C3=B5petanud
Iraak, olen praegu S=C3=BC=C3=BCrias, et saada rohkem =C3=BClesandeid, kuid=
 teen
m=C3=A4=C3=A4ratakse peagi =C3=9Chisesse Rahvusvahelisse Valmisolekukeskuse=
sse (JMRC),

Iraagi missiooni ajal suutsin teha kokkuv=C3=B5tte
25 000 000,00 miljonit dollarit. See raha tuli naftatehingust, ma olen
mundrikandja ja ma pean kedagi oma v=C3=A4lismaalasena esitlema
partner. Olen ameeriklane ja luureohvitser. mul on 100%
autentsed vahendid raha saatmiseks diplomaatilise saatmise kaudu
ettev=C3=B5te. Vajan vaid teie n=C3=B5usolekut ja k=C3=B5ik on valmis.
