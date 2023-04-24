Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBCB6ECC91
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 15:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbjDXNGG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 09:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbjDXNGF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 09:06:05 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 574A53AA6
        for <linux-i2c@vger.kernel.org>; Mon, 24 Apr 2023 06:06:04 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso4592643a12.1
        for <linux-i2c@vger.kernel.org>; Mon, 24 Apr 2023 06:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682341564; x=1684933564;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=txP0S0HHwklInU5qOy6yuyRoSSntFs/HF3tPpTAhNxk=;
        b=ZiOlmi/JA9UkHLGg6oRpdcvKibZHJY9+7dPAVPkdTrIxkWZmHPFPhmUEtTOkwH69SO
         T4YsylJbzGWkGqRYXoCHccpwxTTv3j7uuLQPMxK2cE1zcs6+TA5tUu0zJmS6gBFM6BeA
         oZb8W0JFFOb/mv2/Wv7Bwfn7Tp9zfSxSQiv3NrQjB/x1RsyxHOx+UXbB0Sjma00i9yAb
         vjtpDAzPIJKPkd4zERhI4ftEFgRyowCXFHULNml5IFMlPOsRd5jByuvxa3zP3IZYQfMT
         0q3D7RZj3Mt3gCczn/+3osj/PTNhII8uGnV3S3UcMiUiX6kQbT3Jejl0SHKSX0CswV4C
         Kzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682341564; x=1684933564;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=txP0S0HHwklInU5qOy6yuyRoSSntFs/HF3tPpTAhNxk=;
        b=lavBIYxrgB0+y0qm2XaaR7RWJfOpuMbEGvz6VRfSodL1D3Oy1w1FlbC2lnEohVlNT1
         7DbLJoEorScXwrq69NL7VMk4zgIN+YftcvXnZZY4Glcu9OiXryqoIVWRjAMou8N4B4oS
         fgktVrpwIIQhdaAOewGvH/taeAMY1hmLCdGEpQRRz5ZHMu9E3SgR66kCgb+9vXk56b03
         vbQdesvgNpReehypA6jRo3m0F6QiV40AgYEUGaWeuEwiLP8lg3gMdwy6PtB+4hyYxHvk
         ub8HJlNV6Ycf1aPZ3/EvQr6j/m1UspPBtGwyy6otjS6Uctjw/IZ2LTylSr/GtNeKAhVm
         8/5A==
X-Gm-Message-State: AAQBX9dM4sAzDWvnLkVvHFPnyvitYXdEuBuy22e4MY3YAFpDn6tmVes+
        Rh9CiTyQezdxz1EuyRX4w7td6B2Swmrwzb1Sv88=
X-Google-Smtp-Source: AKy350aP+Ms7BwaXoIRSGlTQDWxdd077gbh7vXkCU8z2UCJEFSMKpEe4DAriCea6UnMburqG/aglBpKH/LWr9DtxyIE=
X-Received: by 2002:a17:90b:3cf:b0:237:c209:5b14 with SMTP id
 go15-20020a17090b03cf00b00237c2095b14mr13352870pjb.22.1682341563737; Mon, 24
 Apr 2023 06:06:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:2607:b0:62:57ce:f8bb with HTTP; Mon, 24 Apr 2023
 06:06:03 -0700 (PDT)
Reply-To: georgebrown0004@gmail.com
From:   george brown <ewill2845@gmail.com>
Date:   Mon, 24 Apr 2023 15:06:03 +0200
Message-ID: <CAAQya0YJWcbBqSEoWO0c0gjE8UFv5GRzfZeKaJnWnG6FiUWQYQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Ahoj

Vol=C3=A1m sa George Brown, povolan=C3=ADm som pr=C3=A1vnik. Chcem v=C3=A1m=
 pon=C3=BAknu=C5=A5
najbli=C5=BE=C5=A1=C3=AD pr=C3=ADbuzn=C3=BD m=C3=B4jho klienta. Zded=C3=ADt=
e sumu (8,5 mili=C3=B3na dol=C3=A1rov)
dol=C3=A1rov, ktor=C3=A9 m=C3=B4j klient nechal v banke pred svojou smr=C5=
=A5ou.

M=C3=B4j klient je ob=C4=8Dan va=C5=A1ej krajiny, ktor=C3=BD zomrel pri aut=
onehode so
svojou man=C5=BEelkou
a jedin=C3=BD syn. Budem ma=C5=A5 n=C3=A1rok na 50 % z celkov=C3=A9ho fondu=
, zatia=C4=BE =C4=8Do 50 % =C3=A1no
by=C5=A5 pre teba.
Pros=C3=ADm, kontaktujte m=C3=B4j s=C3=BAkromn=C3=BD e-mail tu pre viac pod=
robnost=C3=AD:
georgebrown0004@gmail.com

Mnohokr=C3=A1t =C4=8Fakujem vopred,
p=C3=A1n George Brown,
