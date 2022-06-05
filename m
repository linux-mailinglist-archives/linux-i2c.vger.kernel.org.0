Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCA7053D91D
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Jun 2022 03:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243275AbiFEB7C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Jun 2022 21:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243048AbiFEB7A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Jun 2022 21:59:00 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 751AC2CCBA
        for <linux-i2c@vger.kernel.org>; Sat,  4 Jun 2022 18:58:57 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id f34so20029322ybj.6
        for <linux-i2c@vger.kernel.org>; Sat, 04 Jun 2022 18:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sLlIiVjOIj+IrlayL6I/MZBzwRGIE1mUMEt33xJvxRY=;
        b=VrXTauZcG2ZxwBFo5wG3mGng0I+REWSJoYjeIjBMVS1zD1AKTagmktMv3g8f3jRjEJ
         SZ00RFrhWLA4EAVOgU6zWCp0qxRkf7uoxhtbWj3N/rehz8LJiJlzB4Az6dOuTXZPs1Bn
         DiHQOuagF540epTqYE6F/JpNBfCyvMbV8Ke3xaHjRaEB3qnevkXVU9hsU2XWfuiBGDr/
         e3RCUg3bkcep3KXpAvQitLwWz1f1eSdrnqCc96xfbp7+hBd33uSbEs47twmyKV4epfnp
         33tb2a8aS8naNSqztxvTXCRZNVDehTpvJRf3c17tRgxwu0YXRhrzQAuKSVWcXKS3icwN
         PUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=sLlIiVjOIj+IrlayL6I/MZBzwRGIE1mUMEt33xJvxRY=;
        b=3LzD2yENsD+QH+cC7BXqSE0AycZxYtn7Cd66ihuzLCJwE7l0W5pfzz/gjV1dVrwOa3
         aM/VHLScP6GywgZxoi8YW9LwcFNAez55I10YtmsY/+wOvZUm0aTzOSfKmQV+dTqd/4NT
         5U6qRgj3yGGp47s482Pj3lBtMyz1Hf9q2OIu6HXqEggTmquppdgObIVOjx3tsJlB0BpH
         ppn/JBm2w5xLZ2Mm1TVo8enoDkemDQdfhR652Ifb8q4dJVuRLWj8FIkX9Wny9yq3qHWM
         VW/B3C1jRsBXyasWKQ2A0BiBjkS+t21yr6+PETJ5guhoO1tYfIrEy72aPVbsoUWdOhKU
         xZ3Q==
X-Gm-Message-State: AOAM531fZWf1jBXmAzGWCXBxUo4yXL1YYulxwUTIR+z3vvwAFao2cjra
        TP0aHQo1nkTn7WlIZ5822xAggzrwcwi7WMbHIvk=
X-Google-Smtp-Source: ABdhPJxrggaEFhLzcFaHvKCF+5+Dc20iDCUL0rcMV2WFM2tYeUAy4E4UqEC7ZXjqjSFaeZhA1Ma0KV8Venc2A4H5qbU=
X-Received: by 2002:a25:dc92:0:b0:659:fcb9:4ab4 with SMTP id
 y140-20020a25dc92000000b00659fcb94ab4mr18391285ybe.320.1654394336514; Sat, 04
 Jun 2022 18:58:56 -0700 (PDT)
MIME-Version: 1.0
Sender: drfranksaxxxx2@gmail.com
Received: by 2002:a05:7108:298d:0:0:0:0 with HTTP; Sat, 4 Jun 2022 18:58:56
 -0700 (PDT)
From:   MRS HANNAH VANDRAD <h.vandrad@gmail.com>
Date:   Sat, 4 Jun 2022 18:58:56 -0700
X-Google-Sender-Auth: P9upt7AOMkTpweaHFS0KZC55RlQ
Message-ID: <CAGnkwZ5CF++sK1Ti8bzvUe1JP0LS0yksfbJ0=U2xPj5MFO6qxw@mail.gmail.com>
Subject: Greetings dear
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.9 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        LOTS_OF_MONEY,MONEY_FRAUD_8,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Greetings dear


   This letter might be a surprise to you, But I believe that you will
be honest to fulfill my final wish. I bring peace and love to you. It
is by the grace of god, I had no choice than to do what is lawful and
right in the sight of God for eternal life and in the sight of man for
witness of god=E2=80=99s mercy and glory upon my life. My dear, I sent this
mail praying it will find you in a good condition, since I myself am
in a very critical health condition in which I sleep every night
without knowing if I may be alive to see the next day. I am Mrs.Hannah
Vandrad, a widow suffering from a long time illness. I have some
funds I inherited from my late husband, the sum of ($11,000,000.00,)
my Doctor told me recently that I have serious
sickness which is a cancer problem. What disturbs me most is my stroke
sickness. Having known my condition, I decided to donate this fund to
a good person that will utilize it the way I am going to instruct
herein. I need a very honest and God fearing person who can claim this
money and use it for Charity works, for orphanages and gives justice
and help to the poor, needy and widows says The Lord." Jeremiah
22:15-16.=E2=80=9C and also build schools for less privilege that will be
named after my late husband if possible and to promote the word of god
and the effort that the house of god is maintained.

 I do not want a situation where this money will be used in an ungodly
manner. That's why I'm taking this decision. I'm not afraid of death,
so I know where I'm going. I accept this decision because I do not
have any child who will inherit this money after I die. Please I want
your sincere and urgent answer to know if you will be able to execute
this project, and I will give you more information on how the fund
will be transferred to your bank account. May the grace, peace, love
and the truth in the Word of god be with you and all those that you
love and  care for.

I am waiting for your reply.

May God Bless you,

 Mrs. Hannah Vandrad
