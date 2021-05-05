Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9AF7373BA3
	for <lists+linux-i2c@lfdr.de>; Wed,  5 May 2021 14:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhEEMor (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 May 2021 08:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232503AbhEEMoU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 May 2021 08:44:20 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1103CC061574
        for <linux-i2c@vger.kernel.org>; Wed,  5 May 2021 05:43:23 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id l4so2581010ejc.10
        for <linux-i2c@vger.kernel.org>; Wed, 05 May 2021 05:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=1kk2RB1dnhjkEapRULI8O9YYzpV07dBfo5vy8Z/B2lI=;
        b=hVpqdPipjK7Ns5TO7yJseLdD2iv4hAtxgGuYrpcJjA9fkimTWCeKVV5vMQB4HxMznv
         d6EUonhGgIuplRhBkidMHN3bTwKfPOw04dN57tg1fj0wcE/DOcXrvGaVYbvcB1r3Kb8y
         t1ZSz93+nBNLt6r/88xusDAYVvysqT+9vQxwqOs741U+9PwZpVZk+ogb9nL0PDv878Gb
         ZnkipqrMGkH5CgOaPuhK+drQDFtulcwRLY0t1H/VSXN1p2ZdqL+XBJzaq346PtchJNhN
         w/11+rJLBHz1ALKP9Nfg9Ir0dFhdIwCfODPc62iP21kVmwzROCPXmG9KnaXYHz2lov4W
         6IIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=1kk2RB1dnhjkEapRULI8O9YYzpV07dBfo5vy8Z/B2lI=;
        b=RZrFmRUmfci74cGn+fMT10c+b3m2mxNvYFeXCXtqCstM0X8k7TjVs8avvYF7TUG2rC
         I+qLbOvbzR53N9GwhEqMsr5QDf0tUITIGgqvmLzv0+eeYOpw16cOieMRJM1+Q6a4dOuC
         1+tKELesJobARlhl+/iQPNzdkN8x2g61lMZvYQS4YgnNB+aiqIKuXFX4+5gzSTFvZ4KJ
         In6AZe37cAE6GCc3JsFOopYPP937G8GqbKqaFvDXyMpFFn6MlhohUcXQ4bYSRK2LH9lr
         Sxs7DK7eWbQGJCOPZD7dAwqNqujtjrUHTr+cCz+yrmix46ldE4xXzq/7SkX36A1VI2k0
         YCfg==
X-Gm-Message-State: AOAM531C+cw7cZ6ETI2LOQuF9AY+SZUl1PYn0mOsQWCdbG3Uq2OeoSzr
        qyggz3YsEKW9qfXnzhcPBnkY5APOVhV0ADGY11w=
X-Google-Smtp-Source: ABdhPJyUZSInWxD8qLNPz5ZxtXRQaFBYgbuTry3fudL8/HxVNLIMo+bBghuP6q5cQXwM+fNlzAVapRT7g4FdVZHEbdI=
X-Received: by 2002:a17:907:397:: with SMTP id ss23mr26107297ejb.298.1620218601811;
 Wed, 05 May 2021 05:43:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a55:8753:0:b029:dc:32a9:7a2 with HTTP; Wed, 5 May 2021
 05:43:21 -0700 (PDT)
Reply-To: grayanna718@gmail.com
From:   gray anna <labijeremie5@gmail.com>
Date:   Wed, 5 May 2021 05:43:21 -0700
Message-ID: <CAFUy-BADKeuhTTD_9-Hbz4CuqaZ4Jq8gbBC6tpigxZdHrFwKsw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--=20
V=C3=A1=C5=BEen=C3=BD cenn=C3=BD v=C3=ADt=C4=9Bzi

V=C3=A1=C5=BEen=C3=BD v=C3=BDherce, p=C3=AD=C5=A1u v=C3=A1m, abych v=C3=A1s=
 informoval o va=C5=A1em ned=C3=A1vn=C3=A9m fondu,
kter=C3=BD vyhr=C3=A1la va=C5=A1e e-mailov=C3=A1 adresa. Jsme tu, abychom v=
=C3=A1s informovali,
=C5=BEe va=C5=A1e e-mailov=C3=A1 adresa byla vybr=C3=A1na jako jeden z v=C3=
=ADt=C4=9Bz=C5=AF tohoto
roku(Molottery 2021). jste z=C3=ADskali (1 800 000 000)
milion osm set tis=C3=ADc dolar=C5=AF spojen=C3=BDch st=C3=A1t=C5=AF v leto=
=C5=A1n=C3=ADm roce. mus=C3=ADte
kontaktovat pan=C3=AD Annu Grayovou, pr=C3=A1voplatnou mana=C5=BEerku spole=
=C4=8Dnosti
molottery na jej=C3=AD e-mailov=C3=A9 adrese at(grayanna718@gmail.com), aby=
 v=C3=A1s
nasm=C4=9Brovala a poskytla v=C3=A1m pokyny a postupy, jak z=C3=ADskat v=C3=
=ADt=C4=9Bzn=C3=BD fond.
my
pora=C4=8Fte, abyste znovu potvrdili sv=C3=A9 =C3=BAdaje n=C3=AD=C5=BEe.

1) Va=C5=A1e cel=C3=A9 jm=C3=A9no:
2) Va=C5=A1e =C3=BApln=C3=A1 adresa:
3) Kontaktn=C3=AD telefon a fax =C4=8D.:
3) Va=C5=A1e profese, v=C4=9Bk a rodinn=C3=BD stav:
4) Jak=C3=A1koli platn=C3=A1 forma va=C5=A1eho pr=C5=AFkazu toto=C5=BEnosti=
/=C5=99idi=C4=8Dsk=C3=A9ho pr=C5=AFkazu:
5 Va=C5=A1e zem=C4=9B
6) Va=C5=A1e m=C4=9Bsto:
7) V=C3=A1=C5=A1 st=C3=A1t:
8) Telefonn=C3=AD =C4=8D=C3=ADslo:
9) Va=C5=A1e =C4=8D=C3=ADslo Whatsapp:

Je dobr=C3=A9 kontaktovat pan=C3=AD Annu Grayovou (vedouc=C3=AD zpracov=C3=
=A1n=C3=AD)
Jej=C3=AD e-mailov=C3=A1 adresa (grayanna718@gmail.com)
pro dal=C5=A1=C3=AD zpracov=C3=A1n=C3=AD a odesl=C3=A1n=C3=AD va=C5=A1=C3=
=AD karty na va=C5=A1i nominovanou adresu.

Jm=C3=A9nem fondu spole=C4=8Dnosti Molottery, Sv=C4=9Btov=C3=A9 banky a
Centr=C3=A1ln=C3=AD banka Evropy pod touto sou=C4=8Dasnou spr=C3=A1vou,
omlouv=C3=A1me se za nep=C5=99=C3=ADjemnosti a zpo=C5=BEd=C4=9Bn=C3=AD plat=
by.

D=C4=9Bkuji za pochopen=C3=AD.

S pozdravem, pane ALMERICHU ADALHARDE.
