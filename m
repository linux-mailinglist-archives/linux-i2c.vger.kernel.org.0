Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88C7657E33A
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jul 2022 16:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbiGVOsi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Jul 2022 10:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiGVOsh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Jul 2022 10:48:37 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD89E3CBE7
        for <linux-i2c@vger.kernel.org>; Fri, 22 Jul 2022 07:48:32 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 75so8395802ybf.4
        for <linux-i2c@vger.kernel.org>; Fri, 22 Jul 2022 07:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=dN4DaXINwUuu8qgKP9HnTLibNL5Ov83yt7X47s4+YRc=;
        b=CpMAeqX4sD+w5j2s3phaapf38AXWiSjUok4+aHsLsaIVT7OyE20WctckBUacOv8xSk
         q/1zF6ep/8cHkqN2He+PhliV9dIqKynZ879pTuFlNuwaoxJmvdpreCY5RXic4Y2q/Vs6
         OdPP7UXn6WQYpLUvYG5xMQIQUjQZFj16mgQNr+OfQR0Z9Dqke6VrM83r4xpQweW002/t
         sBBsjPSSrGviMadmZ2iR6gDMa7kNcjeKCHjFtpJTmrJSnR9++j6aS4pqDwiPjcPDUL6u
         CFb0+ojOwJSqtb6Fwh6bsLfnQYvbnErD71bxP9o5kh1gRXU6LIBWiyTmiBIHk/tHttod
         du3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=dN4DaXINwUuu8qgKP9HnTLibNL5Ov83yt7X47s4+YRc=;
        b=fBfAmx8jnIwoIxdOsungR18zsiKVJaf39AVRV4zz1TGmDY/CyV68E+8PYyvZo5d7SR
         /FKlr7n0+nmHLDL2edUS/bKIdGFcqs2oh5+Ae2TGE64h64hhx9+qabEUZFQ0N7bzNfyd
         yD3xsaKJxB/m2RqfHcIYbIJtLJ055Mz0WzydH9HuztbzTnIZ13xhMhHD2ongmLubUCqU
         65+hmDeyLKpSZZUEyybVTBX82gZRzIzHaZByv6ZmQNtOR0JVOQ/Mnmbjix1mbAZa3Kzz
         +cJ50SVDE+LE2DOoQY7WHMQo2Kbj/cDPh9TuDSQIa6vxM/d1oaBgyqLo5Z29ruVKuTe1
         FOzQ==
X-Gm-Message-State: AJIora+qR17zSl/c3DCNWCvteF7IjnDDbafyzBlDak+qofy9l535E1xN
        gm9hNpFHA5AOWk13dZDuf1gnpc2dQXqdrLwGsoo=
X-Google-Smtp-Source: AGRyM1tLyTTzuKlv0TnpZz010oay0C8/41dsI+rrSHZFpHhYj3TqAVTt3CHlitAksLgLZ7VCpEKPjU7ldu2Yp+w2msU=
X-Received: by 2002:a25:d614:0:b0:670:9ea2:e6c1 with SMTP id
 n20-20020a25d614000000b006709ea2e6c1mr297861ybg.379.1658501311681; Fri, 22
 Jul 2022 07:48:31 -0700 (PDT)
MIME-Version: 1.0
Sender: klin.mlin122@gmail.com
Received: by 2002:a05:7000:ba9f:0:0:0:0 with HTTP; Fri, 22 Jul 2022 07:48:31
 -0700 (PDT)
From:   Sophia Erick <sdltdkggl3455@gmail.com>
Date:   Fri, 22 Jul 2022 16:48:31 +0200
X-Google-Sender-Auth: ZGe8jcs6EEgLS5HKaTLu4aimx_g
Message-ID: <CAMwUt-p_zinFVjOSyF2brGUa=kwYXz+zOUJGLP5FfQohv3+9_A@mail.gmail.com>
Subject: HELLO
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.9 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_NOVOWEL,
        HK_RANDOM_FROM,LOTS_OF_MONEY,MONEY_FRAUD_8,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_MONEY_PERCENT,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b2a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5004]
        *  1.0 HK_RANDOM_FROM From username looks random
        *  0.5 FROM_LOCAL_NOVOWEL From: localpart has series of non-vowel
        *      letters
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [sdltdkggl3455[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [klin.mlin122[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  2.5 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Dear

I am glad to know you, but God knows you better and he knows why he
has directed me to you at this point in time so do not be surprised at
all. My name is Mrs.Sophia Erick, a widow, i have been suffering from
ovarian cancer disease. At this moment i am about to end the race like
this because the illness has gotten to a very bad stage, without any
family members and no child. I hope that you will not expose or betray
this trust and confidence that I am about to entrust to you for the
mutual benefit of the orphans and the less privileged ones. I have
some funds I inherited from my late husband,the sum of ($11.000.000 )
deposited in the Bank. Having known my present health status, I
decided to entrust this fund to you believing that you will utilize it
the way i am going to instruct herein.Therefore I need you to assist
me and reclaim this money and use it for Charity works, for orphanages
and giving justice and help to the poor, needy and to promote the
words of God and the effort that the house of God will be maintained
says The Lord." Jeremiah 22:15-16.=E2=80=9C

It will be my great pleasure to compensate you with 35 % percent of
the total money for your personal use, 5 % percent for any expenses
that may occur during the international transfer process while 60% of
the money will go to the charity project. All I require from you is
sincerity and the ability to complete God's task without any failure.
It will be my pleasure to see that the bank has finally released and
transferred the fund into your bank account therein your country even
before I die here in the hospital, because of my present health status
everything needs to be processed rapidly as soon as possible. Please
kindly respond quickly. Thanks and God bless you,

Yours sincerely sister Mrs. Sophia Erick.
