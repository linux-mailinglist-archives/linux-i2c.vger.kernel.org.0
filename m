Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FBF54EB5E7
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Mar 2022 00:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237220AbiC2WbQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Mar 2022 18:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237187AbiC2WbQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Mar 2022 18:31:16 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9466565D1C;
        Tue, 29 Mar 2022 15:29:32 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id w21so22224476wra.2;
        Tue, 29 Mar 2022 15:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=CofhH8nchDKrCLKpjJS6KYHEaLu5DrxrBUY1FuqNxffnpSGpilWdv6xrcAI8hh+i58
         CNvcYzKJilYjMvYMFRnvOzagq4dhnIWthXiP6Cm7zt7I8Y4OBlNhflihGI0OV8gXa64w
         EccC9HCkgXc7GjgL1G4XC+kfFKY0qF0JUYQ48Oc/0GoeXXBaEHZ4RMBEWb9DokdD5ZAS
         yMdNMO3Tgmq1iQMXboCw4wrF8kKfLjkAlJE8DyvFGWPgEE9H02UuS+KRocjbPkTrp3En
         xhlM+cH8KqBUeV0Afz//HPJ/Ib2yrJin0lS52PU6WCxHNFYcv0izr4KgMuDBRXqBle/M
         5uVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=HtIXSJLgGlURdnWtnErMCjOCLf4wOsDRiSkGYifXPLEzuwPMF0iOYOk4iQ4h2ehzML
         lOGwqwjtoAT/kyBM8Cyy+Sy9IxkprXY38aqA2JO4mm9KBgk6t6vble841OiCGWHzveyV
         84nYCVAnPHye92+fL2rjTmYLpkSQjNlMTY5+0wIpUDo7oxujhhPv0xpkGF/VIxXaRf19
         JPgWgxul5/CC9Fw4QT8E7zveuLiSBAWtLXM5ttL2tNDUnY96hBDlgqH+V0KoH62irlUt
         fKn2UMJB41n7OEHedNGGe2SXDrST5Qv5oAx6naTaccg4q9VIZhvad6+u5TJh9ndpX+Go
         Rexw==
X-Gm-Message-State: AOAM530qO6yO3ERe/RyAh8lQq/tIkTO4s7MyQawdlDxrBw7shfHT0JTR
        mV7KdE2ao9c97R0GzHwcC6M=
X-Google-Smtp-Source: ABdhPJyi1qE6effmjETV9+HIlPV8oeAtVSi3GgGVH/c7Ne8O1wB8Cb3Bd4sY91uX/AZo6cC2f/99hg==
X-Received: by 2002:a05:6000:239:b0:204:101:8fdd with SMTP id l25-20020a056000023900b0020401018fddmr34133764wrz.267.1648592971177;
        Tue, 29 Mar 2022 15:29:31 -0700 (PDT)
Received: from [172.20.10.4] ([102.91.4.187])
        by smtp.gmail.com with ESMTPSA id z5-20020a05600c0a0500b0037bb8df81a2sm4047096wmp.13.2022.03.29.15.29.20
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2022 15:29:27 -0700 (PDT)
Message-ID: <62438847.1c69fb81.ca756.0916@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Gefeliciteerd, er is geld aan je gedoneerd
To:     Recipients <adeboyejofolashade55@gmail.com>
From:   adeboyejofolashade55@gmail.com
Date:   Tue, 29 Mar 2022 23:29:09 +0100
Reply-To: mike.weirsky.foundation003@gmail.com
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,T_US_DOLLARS_3 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Beste begunstigde,

 Je hebt een liefdadigheidsdonatie van ($ 10.000.000,00) van Mr. Mike Weirs=
ky, een winnaar van een powerball-jackpotloterij van $ 273 miljoen.  Ik don=
eer aan 5 willekeurige personen als je deze e-mail ontvangt, dan is je e-ma=
il geselecteerd na een spin-ball. Ik heb vrijwillig besloten om het bedrag =
van $ 10 miljoen USD aan jou te doneren als een van de geselecteerde 5, om =
mijn winst te verifi=EBren
 =

  Vriendelijk antwoord op: mike.weirsky.foundation003@gmail.com
 Voor uw claim.
