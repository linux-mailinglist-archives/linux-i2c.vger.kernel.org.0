Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A80BD4E6552
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Mar 2022 15:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349889AbiCXOgG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Mar 2022 10:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347505AbiCXOgF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Mar 2022 10:36:05 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE85EB18
        for <linux-i2c@vger.kernel.org>; Thu, 24 Mar 2022 07:34:33 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id b19so6884202wrh.11
        for <linux-i2c@vger.kernel.org>; Thu, 24 Mar 2022 07:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=sfxo1dqqTrr7e28OuTBjrwUEPnrevaNVUdgTMF56Ktk=;
        b=SkBbnwT3e/4rHO2NIXkN5athHEnnNtHCg0rXPzui8YqAu1XLwJvZCsV/JtHc8Nu6fI
         xmK+ZtQZ9+h9RXE/fy9ZJojrsuLyRaSqkHwFLvL/fEMzuxwta+TiPf58pZ8pRmrB3v8x
         JudIeXaHe2wqtEa4OzOcjSuc7ol7lqsKdKDVh0L3qlEfXp4qlXRGGaqPbpZ5uHFL9R6r
         KCseiuFaKH7vsV2YH95ZE2uBIR4S+/dMBWPlqJdeLgxTpHyh48DAXK65ffMKm3s2mdzA
         s1AfjA1Ps86xlzNhyL95FFtSsCgqLXfkNfzuvdEX4ynpK3bXKwikI3HPLaS5Hd36nTQ3
         CFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=sfxo1dqqTrr7e28OuTBjrwUEPnrevaNVUdgTMF56Ktk=;
        b=XUOhr+nPciMjgf9WAwgYbQfMF28emx1kMdVMUYvU6GIFjQ1Nf1m1zBmlJeIGvGmyKU
         vj24Gqd+1LrmiTyY4pq0cj03V83mVNnBK2bPckZoxm2xxbVp++sEObMe+P+rGD6IEyDk
         GxyysQ/sYfHg+jt/fb9l5C1S3V7WcGwkepWUzgoPiTxTqYCNQOJBDDVySqBzECjLzK3m
         zfJhnzoBPmPW0PqMCrInCm1QjppivED6N65ZLk/TmdiWcPO2c5AzcLXbocsWTu6cziSX
         5oMO1Jx0+vd3T9a7Cy/nxGnP2NP6R6JItkFZ58uUlSFRmV5DfuzK4EUZQ/tpnRod0FIV
         ul/g==
X-Gm-Message-State: AOAM531+2D45RmSlg2hNvCgls3YyUHmBF6MMJ6W8cPvD8bm5FvwFL0kS
        tGbIQg1ROHTIrn00ZASgrgw=
X-Google-Smtp-Source: ABdhPJyGw72Z4Z/1zODzYdi1oGmHjIrkZ3EBogZHO82+Qxvq90U4ToBt6+00llIz3qwtdiVrRo/gMA==
X-Received: by 2002:a5d:518e:0:b0:204:5a3:763d with SMTP id k14-20020a5d518e000000b0020405a3763dmr4709113wrv.360.1648132472364;
        Thu, 24 Mar 2022 07:34:32 -0700 (PDT)
Received: from [192.168.0.102] ([105.112.209.229])
        by smtp.gmail.com with ESMTPSA id l12-20020a056000022c00b00203ee262d12sm2568134wrz.116.2022.03.24.07.34.20
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Mar 2022 07:34:32 -0700 (PDT)
Message-ID: <623c8178.1c69fb81.e98d8.a6fd@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: meine Spende
To:     spenserw08@gmail.com
From:   spenserw08@gmail.com
Date:   Thu, 24 Mar 2022 07:34:13 -0700
Reply-To: mariaelisabethschaeffler70@gmail.com
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

 Hallo,

 =


Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Gesch=E4ftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen, den Rest von 25% in diesem J=
ahr 2021 an Einzelpersonen zu verschenken. Ich habe beschlossen, Ihnen 1.50=
0.000,00 Euro zu spenden. Wenn Sie an meiner Spende interessiert sind, kont=
aktieren Sie mich f=FCr weitere Informationen.


Sie k=F6nnen auch mehr =FCber mich =FCber den unten stehenden Link lesen

https://en.wikipedia.org/wiki/Maria-Elisabeth_Schaeffler

Sch=F6ne Gr=FC=DFe

Gesch=E4ftsf=FChrer Wipro Limited

Maria Elisabeth Schaeffler

E-Mail: mariaelisabethschaeffler70@gmail.com
