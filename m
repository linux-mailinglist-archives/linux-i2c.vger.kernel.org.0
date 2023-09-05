Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 008BA79282F
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 18:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236220AbjIEQT5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 12:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353857AbjIEIVR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 04:21:17 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA6EACDC
        for <linux-i2c@vger.kernel.org>; Tue,  5 Sep 2023 01:21:13 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-529fb2c6583so3025437a12.1
        for <linux-i2c@vger.kernel.org>; Tue, 05 Sep 2023 01:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693902072; x=1694506872; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CvUmRYKO5rN5JiKdYLn9/Xxm/soJiVGtQm650JnL3Yc=;
        b=hKg/wKarovX26YUXVpPfd3d8RRHvoxQ8NX1nEbifyl9aJjk48GOyDLeHq2veP6BWfD
         4bepDcnp/Fy3dOtp4VF+/+SsHFWX3plD3x1VcHQaXoKYjCefhumcLekNwUS2Ha9yWjRm
         VGVjvYcPLOVmoXjn6NTyNb4qyMDBgmllE01UCrJ9gCEbEiSbMR3gvuObJdsP56YqGsmC
         ivkU2MyL7SHN7fpS93dPdLj3enCoWlXUOkqsMzL+z7L8Cu8pGdFzvZZyT08gPd9Lpn5m
         cir50KaQTFaDHYOgAD7shaCUD+T+28c+360dC0eakAtB5wLcIwnV1/tTRbbKL9652Az9
         NUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693902072; x=1694506872;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvUmRYKO5rN5JiKdYLn9/Xxm/soJiVGtQm650JnL3Yc=;
        b=WIW+uCGNp8f529NyyjwcFMYjKKXD0TyATq9PLv0LE/FF/ylKABD5hj6qmpI0OWEx9F
         U5+k3uphukOf4bHiQ5TtJm81Mb4z01lojXXfXvbUwEmSf8Qr3KE4Lk9KafkYdgbp5KgG
         XBYfVCE+xxdiG+h4XjV0kHUiMqImjGpZQjpMlyJ49zog6a9w0y3qZ4ra6QFrWKmq73Fc
         AZxQTbT4yZ5gMZGLi1lodrBfiltgFa9SwYwSCOWtwTtDT8pE2yFJ3bKhw2FrDfGLjNQn
         Gzio1zmS4Dbxlc/do/r5k2bfl1+AfTtKeufF9RJpkG565zcNJvSpQltZaQdYWoT8rj7S
         zkGg==
X-Gm-Message-State: AOJu0YwNjxy4q2TkcpM13l2JFxN5bHEd7zIPOSuZlC2pUMyhpCHiE1yU
        cNGuZeT6y40Yhav+pEEoOvzFjSHplQyRxmyW5VDRFwEnYJQr9aXZ
X-Google-Smtp-Source: AGHT+IHc9ajH3Rii9UZwOOqLrsXanmcTWvKjiURPKmJK5D52sTkbD7l1BRzq/bCfrfUZjlWt/04s1jIBCk3z7CpHIFE=
X-Received: by 2002:a19:6755:0:b0:501:bf37:1fc0 with SMTP id
 e21-20020a196755000000b00501bf371fc0mr624754lfj.33.1693902050884; Tue, 05 Sep
 2023 01:20:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a54:3ac4:0:b0:22f:40f:e031 with HTTP; Tue, 5 Sep 2023
 01:20:50 -0700 (PDT)
Reply-To: wuwumoneytransfer5000@hotmail.com
From:   "(IMF) SCAM VICTIMS" <mimichi4500@gmail.com>
Date:   Tue, 5 Sep 2023 01:20:50 -0700
Message-ID: <CAGhkD8USA9d9+1HDw3AKO0o45v_Z8cjdpcgnjTbVjdDUbiyg2w@mail.gmail.com>
Subject: Betrugsopfer
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sehr geehrter E-Mail-Besitzer,



Der Internationale W=C3=A4hrungsfonds (IWF) entsch=C3=A4digt alle Betrugsop=
fer
und Ihre E-Mail-Adresse wurde auf der Liste der Betrugsopfer gefunden.

Dieses Western Union-B=C3=BCro wurde vom IWF beauftragt Ihnen Ihre
Verg=C3=BCtung per Western Union Money Transfer zu =C3=BCberweisen.

Wir haben uns jedoch entschieden Ihre eigene Zahlung =C3=BCber Geldtransfer
der Westunion in H=C3=B6he von =E2=82=AC5,000, pro Tag vorzunehmen bis die
Gesamtsumme von =E2=82=AC1,500.000.00, vollst=C3=A4ndig an Sie =C3=BCberwie=
sen wurde.

Wir k=C3=B6nnen die Zahlung m=C3=B6glicherweise nicht nur mit Ihrer
E-Mail-Adresse senden daher ben=C3=B6tigen wir Ihre Informationen dar=C3=BC=
ber
wohin wir das Geld an Sie senden wie z. B.:


Name des Adressaten ________________

Adresse________________

Land__________________

Telefonnummer________________

Angeh=C3=A4ngte Kopie Ihres Ausweises______________

Das Alter ________________________


Wir beginnen mit der =C3=9Cbertragung sobald wir Ihre Informationen
erhalten haben: Kontakt E-Mail: ( wuwumoneytransfer5000@hotmail.com)


Getreu,


Herr Anthony Duru,

Direktor von Geldtransfer der Westunion
