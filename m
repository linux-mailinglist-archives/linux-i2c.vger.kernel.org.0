Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB6711D9512
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 13:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728686AbgESLRv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 07:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728573AbgESLRv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 May 2020 07:17:51 -0400
Received: from omr1.cc.vt.edu (omr1.cc.ipv6.vt.edu [IPv6:2607:b400:92:8300:0:c6:2117:b0e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1659CC05BD09
        for <linux-i2c@vger.kernel.org>; Tue, 19 May 2020 04:17:51 -0700 (PDT)
Received: from mr6.cc.vt.edu (mr6.cc.vt.edu [IPv6:2607:b400:92:8500:0:af:2d00:4488])
        by omr1.cc.vt.edu (8.14.4/8.14.4) with ESMTP id 04JBHnXp031223
        for <linux-i2c@vger.kernel.org>; Tue, 19 May 2020 07:17:49 -0400
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
        by mr6.cc.vt.edu (8.14.7/8.14.7) with ESMTP id 04JBHiwg021978
        for <linux-i2c@vger.kernel.org>; Tue, 19 May 2020 07:17:49 -0400
Received: by mail-qt1-f200.google.com with SMTP id n33so16315322qtd.10
        for <linux-i2c@vger.kernel.org>; Tue, 19 May 2020 04:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :mime-version:content-transfer-encoding:date:message-id;
        bh=XdezUHtnjEPl34SNV/OG/wiZxI5dHtj/gxxjDGommaM=;
        b=BGHqIySBQWJkRoZ5RVOp+Ab2FtVmQe5OJ+gM5QLWeRvMwna/V7nwD2ivCsaBjLnYmw
         9vvc1fRLhI5m5ZmE8zLa3LsY3xq1fpeVqAeDd47MqVoRyQnD/AdN6YdH0iPjBReDMugx
         SAM6YqOmvC9MHDHn6Jh4QFlHrKN4ldVxdzOFh0OF7BigsuTO9dfhw5S8aUnObsZrAUcB
         6zd3w5KgMEYgX/WxC1iBFB1tUFzUFGn+EBxpAiVzxkDY5E/+tSBs7MCLu1fw63iI0k3s
         Tp6AS5pmlZqUClk0yatPeB3MeVk5KR+TNutW6+PPStZIywIYogGphdH87q+720rXiSmc
         nPeQ==
X-Gm-Message-State: AOAM532OzbbC2tEhbgc5Zdl11ddhaimzs+LPTrpWmNIXMhKqPeJo+eOH
        aj7ZcSB9jfWynW9JOiyf2DuzqNPhUa6MLrbb+gY3RUGufOYsCJmzrogByGvE5rrpMzpj9x6pAkU
        9Zf5Ix1R0/wOvRwTBw1IZkuwTYlv8v2w=
X-Received: by 2002:a0c:aec5:: with SMTP id n5mr20903692qvd.0.1589887064023;
        Tue, 19 May 2020 04:17:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYm/oMeyoCURXB8A/ux+JFjkbZhUA+4db9QUZHAWEUR8WA0qRoukom4Qn9ITWbQR/8QthsHQ==
X-Received: by 2002:a0c:aec5:: with SMTP id n5mr20903663qvd.0.1589887063744;
        Tue, 19 May 2020 04:17:43 -0700 (PDT)
Received: from turing-police ([2601:5c0:c001:c9e1::359])
        by smtp.gmail.com with ESMTPSA id z65sm10191073qkc.91.2020.05.19.04.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 04:17:42 -0700 (PDT)
From:   "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     Joe Perches <joe@perches.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] i2c: mediatek: Add i2c ac-timing adjust support
In-Reply-To: <1589857073.25512.34.camel@mhfsdcap03>
References: <1589461844-15614-1-git-send-email-qii.wang@mediatek.com> <1589461844-15614-3-git-send-email-qii.wang@mediatek.com> <CAMuHMdXjLakWDDEy=02prC7XjAs_xBnt2mArPFNwyHgUoWw6-g@mail.gmail.com>
 <1589857073.25512.34.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1589887060_31675P";
         micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date:   Tue, 19 May 2020 07:17:41 -0400
Message-ID: <116825.1589887061@turing-police>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--==_Exmh_1589887060_31675P
Content-Type: text/plain; charset=us-ascii

On Tue, 19 May 2020 10:57:53 +0800, Qii Wang said:

> (1000000000 * (sample_cnt + 1)) / clk_src value is a 32-bit, (1000000000
> * (sample_cnt + 1)) will over 32-bit if sample_cnt is 7.
>
> I think 1000000000 and clk_src is too big, maybe I can reduce then with
> be divided all by 1000.

Yes, it's definitely too big, the 3 DIV_ROUND_UP calls in  mtk_i2c_check_ac_timing()
end up causing a build issue during modpost on a 32-bit RPi4:

ERROR: modpost: "__aeabi_uldivmod" [drivers/i2c/busses/i2c-mt65xx.ko] undefined!
ERROR: modpost: "__aeabi_ldivmod" [drivers/i2c/busses/i2c-mt65xx.ko] undefined!


--==_Exmh_1589887060_31675P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBXsPAVAdmEQWDXROgAQLPGg/9GGQpzw7XKYxr/tvBAg5sc8H1rTqhNMQF
FGBWDl46QaKwfWatNNq0L6HGC2X9FDlG7hdzIi0HJFJjTDVGlN9C/QNH5zeCmMCF
zDcbsj8tnLoNMW4v2Dl3Q2ZxFWihnepXqfzg8KG5fDDiEHSaP38hDe8GK/MXb5X/
KjGRXMF1qQnbDh2q1trjaJExQqbJ2D2wyngaUS0vDqJOaXm3TaY91NbNUQUVlOmd
wQl05fDL7ziCbcrxn5HdNSxaBiSTNtQwcBrsV8JF7YImeyDx+/I974qRSxZB8zKF
+RPabakMPOZFBgHrikYKplTogjXN5fCCF8F/muITK1/EPpI9PgeMDZNCGU07xRux
v8/UkqwLqAuAnqG3vm5F9I1q+0qbEyyCaU4Mm2DWMGyYzCHXAkfQAJQF/MkQhE54
JxyZKSv7Y4x+nMgL4tlD37DFGCVTXlk9nUyKcNqr08nlu2nDiszlTScHtuHnSqEo
uk3mbh7mKYwpbMJIa/j0n5zLVabSB09IDZ5Jk/+ZlTPh143zTqqFXKfB5akC6Ve5
6pGPcsXJl6ubOdaLT8LcxRVkyaKa/3tYXLBFjxsu6NkfNhytddnVzPAw6/5qRcos
M4R7h0mvQLLRPDLrTkNq1ur6V/3xgup/M8qAunQyKWPNZXYPvNc93Vgh1b6274o0
aL8PqtTCnss=
=SvGK
-----END PGP SIGNATURE-----

--==_Exmh_1589887060_31675P--
