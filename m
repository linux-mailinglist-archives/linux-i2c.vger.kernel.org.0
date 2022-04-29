Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D501251525B
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Apr 2022 19:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378719AbiD2Rih (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Apr 2022 13:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234026AbiD2Rif (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Apr 2022 13:38:35 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0595F887A6
        for <linux-i2c@vger.kernel.org>; Fri, 29 Apr 2022 10:35:16 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id k12so15254632lfr.9
        for <linux-i2c@vger.kernel.org>; Fri, 29 Apr 2022 10:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=mmd4qjxvG29M6kC9w1keSuqoCPTvZCriqLVPrV/8mEU=;
        b=lpvnSm6HJaOTMHdhJpmslFXNaI15pNo49KLKF8jtQWJdy69XKklAPpe5ftWRIPhpmC
         UDgkKWI+ukxDC5QecJ70IVSscuM4ojwfNg8E2XX4NXHRc7rZtI6iDP0tmVlW7hXMmZYS
         AujRmKa2BUCO5tzuOAC7u58LIwhAlu+LsBS9q1ZbSY4NTYSGzKgwWCw9pRyiDx2htQI2
         9ETOBOHLYaHIAjoA/SxWA1xYLQT7tSevUbQWSqBESrOXh6hUc0j3fLLMDuEfxJKdq8tr
         QOHYKg/Obml4UHPTAcPa5Ovx3v5pCJjidNzXrgW2AEGYmB/r+5Qm0PiEahoAAZH5aGB9
         5FGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=mmd4qjxvG29M6kC9w1keSuqoCPTvZCriqLVPrV/8mEU=;
        b=AvJCHV/FStGySwb0h8hzZe4g4o0B/CBA83Xao3R5kAqVqOOs3cb1TlQlC5K9uUjO+2
         Z7AdaAIyOrx6DmM1zNDeruEvSkMx7GEQwLOFwJYz6tIfPp9fEueOiGKtnR9yPMmB8A/g
         pDmclgmWB/FGqA+g0xHTAH8rqoJwtfLVOZgApMC7euQ2SJHckTaSmenhgd7+mfQY68iy
         oGK1xhLRqyapIjfQQ0bqWn9Psw2T0jLBfqMSLkJEjvpS4eRcC7uDOjyDuTWlCv+IPPEo
         k55PYYQWu71HTAMhIDNYXE6XxyRnnsZJHdK0Ry934rUAK+EGMXt7S2tjrZUSM2wSvAN1
         S8ug==
X-Gm-Message-State: AOAM532ZPySnh2dNHYcpjdZn3PH0HqgxmxYfkXsSxvqo3YfgONo0BzJs
        VThKINbl9JbQnqJd2AvSh2bwCZsUqen4pxGNbag=
X-Google-Smtp-Source: ABdhPJyatEghYa5uTTPKAPdbD9/6cdWzw5gW1UUseXiuPw2ztfc+ghVLVcbwZHn1BA96VW9twKPRD0HjryZvwtPTNFk=
X-Received: by 2002:a19:ca43:0:b0:471:ec15:f38c with SMTP id
 h3-20020a19ca43000000b00471ec15f38cmr200951lfj.319.1651253714433; Fri, 29 Apr
 2022 10:35:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa6:c113:0:b0:1b9:b4ce:3858 with HTTP; Fri, 29 Apr 2022
 10:35:13 -0700 (PDT)
Reply-To: gb528796@gmail.com
From:   george brown <moordavis0003@gmail.com>
Date:   Fri, 29 Apr 2022 19:35:13 +0200
Message-ID: <CAH26tOFc4mEWji8=HMbovkRVSq+_2kxNfMenPY-HBQL1TxvGYQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,REPTO_419_FRAUD_GM,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:135 listed in]
        [list.dnswl.org]
        * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        *  3.0 REPTO_419_FRAUD_GM Reply-To is known advance fee fraud
        *      collector mailbox
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [moordavis0003[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [moordavis0003[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [gb528796[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Ahoj

Jmenuji se George Brown, povol=C3=A1n=C3=ADm jsem pr=C3=A1vn=C3=ADk. Chci v=
=C3=A1m nab=C3=ADdnout
nejbli=C5=BE=C5=A1=C3=AD p=C5=99=C3=ADbuzn=C3=BD m=C3=A9ho klienta. Zd=C4=
=9Bd=C3=ADte =C4=8D=C3=A1stku (8,5 milionu $)
dolar=C5=AF, kter=C3=A9 m=C5=AFj klient nechal v bance p=C5=99ed svou smrt=
=C3=AD.

M=C5=AFj klient je ob=C4=8Dan va=C5=A1=C3=AD zem=C4=9B, kter=C3=BD zem=C5=
=99el p=C5=99i autonehod=C4=9B se svou =C5=BEenou
a jedin=C3=BD syn. Budu m=C3=ADt n=C3=A1rok na 50 % z celkov=C3=A9ho fondu,=
 zat=C3=ADmco 50 % ano
b=C3=BDt pro tebe.
Pro v=C3=ADce informac=C3=AD pros=C3=ADm kontaktujte m=C5=AFj soukrom=C3=BD=
 e-mail zde:gb528796@gmail.com

P=C5=99edem d=C4=9Bkuji,
pane George Brown,
