Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAD850E92B
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Apr 2022 21:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244749AbiDYTLu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Apr 2022 15:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235743AbiDYTLr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Apr 2022 15:11:47 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA3D4443D4
        for <linux-i2c@vger.kernel.org>; Mon, 25 Apr 2022 12:08:38 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id h1so15670703pfv.12
        for <linux-i2c@vger.kernel.org>; Mon, 25 Apr 2022 12:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=mmd4qjxvG29M6kC9w1keSuqoCPTvZCriqLVPrV/8mEU=;
        b=Mw+LboTJXGuoBHQGBKGTExYO4sTBX56pRtPORYFQO6rGGwdzNIAKQfi3EWSPmdLnAS
         JlDH+J/qQyZ9OdmANiFxLVqY/0QB49y2Eb+svi2XRoVCqxefrrL3crIE3sBnms3y4O09
         bUSKmSvMte79gGNK6V5dWSL7JJuPTENv07B8lW90gd+BWkpgo2PBcVEmThT/0dGG7okW
         5PKeYsX0xKw8bVykF8mFaBIxae8fORqwXuLQEQBaJF4ckDjoqGBOm+GL6R+pXWgM4VT0
         AKmrgNyYcsVwP7hxFQxVC5a7MbBbkswwPmJ0IyXdvefzGeaAgFAmpn9s4jjGwtqKlIYs
         IbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=mmd4qjxvG29M6kC9w1keSuqoCPTvZCriqLVPrV/8mEU=;
        b=7ntY3/p6KXXN5d8OO8DgLJC6STSHiohSgwBJzgH0hFigHovBSMffK1PJcGYSjscdwZ
         ekooHmJ2K+mMLPsHAG1n7cjpCnfUnis7doBlsA+bjlktbG7I6c5kY9YA1VarVdZ2WkNr
         c7AJisa3bU2k98Q13qeEJwpOatmrxsjd7jnzMcUB5zlBwZbk5Z3NRXuMZP2VwatkMXFa
         Y1Xs981LsrN1AmbTWTzlPw5ytVifRMMO3hwBuJYeZShlG8ZRDYwafp8QPzYYX91GeZi5
         KgpGNzG2hn9g13zPh6JoL+owBBkITTF5ru7apg48HPWK3IPx7IiBUi/ulu/Y9tzzdVOU
         luSQ==
X-Gm-Message-State: AOAM530Vy5CYP0eRUDagaX+JW84kHx4PyQBiQYq7Z2VN6AT1vN1icrI6
        pItHbGPHazfSWCfH1oupDaRFKLF+2gAffzygmdc=
X-Google-Smtp-Source: ABdhPJwyCFyq+7KF47+tV8lgMMCb1dQa5hTp/vrypWTJzXrtf5C4xvwMf+VHCKJzzz+UzGVMDQmeeNAsGrANyKul6V8=
X-Received: by 2002:a63:4c4b:0:b0:3aa:4af8:9ab8 with SMTP id
 m11-20020a634c4b000000b003aa4af89ab8mr16854843pgl.430.1650913718454; Mon, 25
 Apr 2022 12:08:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:2145:b0:5f:334f:9982 with HTTP; Mon, 25 Apr 2022
 12:08:37 -0700 (PDT)
Reply-To: gb528796@gmail.com
From:   george brown <ewill2845@gmail.com>
Date:   Mon, 25 Apr 2022 21:08:37 +0200
Message-ID: <CAAQya0aAtjvbZLuRv-9GCY+41c_rJixBBsWqc=_MVnB_0i9UZw@mail.gmail.com>
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
        *      [2607:f8b0:4864:20:0:0:0:431 listed in]
        [list.dnswl.org]
        * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        *  3.0 REPTO_419_FRAUD_GM Reply-To is known advance fee fraud
        *      collector mailbox
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ewill2845[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [gb528796[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ewill2845[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
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
