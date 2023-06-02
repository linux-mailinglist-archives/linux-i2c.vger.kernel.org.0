Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEC08720116
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jun 2023 14:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbjFBMFc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Jun 2023 08:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235542AbjFBMFb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Jun 2023 08:05:31 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7465A1A8
        for <linux-i2c@vger.kernel.org>; Fri,  2 Jun 2023 05:05:24 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f3b314b1d7so2551514e87.1
        for <linux-i2c@vger.kernel.org>; Fri, 02 Jun 2023 05:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685707523; x=1688299523;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tOHwh00RyzY+YQCxP1YgI0Dx+mmci22uDuQdYjU/xkE=;
        b=Pcg2Fkrcp2h2wYGO/h93EF5Ev5h56p6EzMunEUjuJVKtL01rzfZMu97Y2qD6tberRo
         nFWa0keUML9JJ9rZJV9tYXYQt1P1Ld9v5Eu1qJwBswRtteeKh6UlkB64W+6boQ44MBn5
         NqXwTBXMolzpqkbx6mH1evQJGPvRdeIiyVNjHZ5cu1/HEgBAL3G3vc45NpRIqeSMQc8w
         a+HIiLLlgCxxAnJw/ezqaS7UtWQvZ2ECpcSjZQiY2baQiigUUWK+LbzwxSb246fMz5W6
         0GzY0ChQoC7NKannd5aC3yZCB1RBcQEl8WB35L5RdSuYSNnITT1tRSz30+TKNgoSjwdu
         TT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685707523; x=1688299523;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tOHwh00RyzY+YQCxP1YgI0Dx+mmci22uDuQdYjU/xkE=;
        b=ZEM0Yt/ne+D3QdlrGSYFAXdxzdtDmiLgRDWa6LuCxV8F0tLIelBTeJNqv/gN59VLXT
         BqPB8A/VVcszAgZzUrL9jTsHRhmcNjhQ2ojfXvq3vTxQk0J7XBcNxYrJuKj5ijrlmGRH
         G8iX4P7bL4UNBWu7rq8cALgaFrkIP9khUWNmTYsT7ZVmfrKreQEEHqoOhD5s/z+vf1ux
         OjHRa8KBkTjcJJIttHHAV39lV1ZoIJga858jdqEjFutSWxDwdMTpm0U0gtVVwipDlwZt
         ZwZk5UF9LWc68sQKlizXZ8va0QE34V8KpQKK4wW1mHi7dbXnJi1pxoCCo1jrWPRXPEKw
         VIjw==
X-Gm-Message-State: AC+VfDwtT14LjN1xxR86LIFHFbKALe9DBkfEMtzVQ0Zbq1ZdbQ+7bdGl
        Oim1rSvJE3S51k2Bz6svzkYwcysrCMIEYhSFWj4=
X-Google-Smtp-Source: ACHHUZ44MnSujDdi3oL1fCYRhRe9kanAXk+EqBncLOEy23EfBhAl26+z/PB6yAEaAxDy8EhZkYD+g2yCBQHVMx6QlNA=
X-Received: by 2002:ac2:598c:0:b0:4cb:280b:33c9 with SMTP id
 w12-20020ac2598c000000b004cb280b33c9mr1608422lfn.24.1685707522570; Fri, 02
 Jun 2023 05:05:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:750e:0:b0:203:43b6:2612 with HTTP; Fri, 2 Jun 2023
 05:05:21 -0700 (PDT)
Reply-To: georgebrownhoward02@gmail.com
From:   georgebrownhoward <georgebrown00005@gmail.com>
Date:   Fri, 2 Jun 2023 14:05:21 +0200
Message-ID: <CA+CaFy3HcxifsHOaC+z_TCpsorJkXT=3hXDDme6ZnaPvqn5zig@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
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
Pros=C3=ADm, kontaktujte m=C3=B4j s=C3=BAkromn=C3=BD e-mail tu pre viac
podrobnost=C3=AD:georgebrownhoward02@gmail.com

Mnohokr=C3=A1t =C4=8Fakujem vopred,
p=C3=A1n George Howard,
