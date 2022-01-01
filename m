Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8DC4482787
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jan 2022 13:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbiAAMOu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Jan 2022 07:14:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiAAMOu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Jan 2022 07:14:50 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 572D1C061574
        for <linux-i2c@vger.kernel.org>; Sat,  1 Jan 2022 04:14:50 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id c9-20020a17090a1d0900b001b2b54bd6c5so11294523pjd.1
        for <linux-i2c@vger.kernel.org>; Sat, 01 Jan 2022 04:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=br3iMhnxMUWKfV+fufH3o0T13yCnTVLJi1Ld3MjyOF/OeoUJ09TV7XTwM+s1GyoqHu
         uG40cJKnYDx2NO+aRVwkTfPSXaCdCe91/y2j3llyOCHop3RYFK4G7d/H8wB+fDTMVnke
         jxArEMjREryGrbbA5D1/YziCF5+x/guTeapYvxeMOecIlYDB75BNZnnj6O2LCppAxJAV
         FluUfpw/4+dfbWZfI/5B/ityr/uBG9z/kYd0yWGpuHBueNM0UHu/WoU0j371eJA5zwtL
         8Sq7y/RXIbwLvHpK26EMjo92xzoEhfERAZGzVLm6KEfjAnymGus+LaoOdqemFmBuPlW1
         LXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=c7iFVDJ0KoT/Y0IwJiUTlnnBHi3gl4TNZ1gr+JgblnosHAEmELNY+nWzHSMjJv+p9Y
         +uv+xNgOc63WIytVgAikYyPbPeV8hkGNs4HY9Y7LFmJ7BYlSjRyW4rtJpClH/yKwf138
         6J//ibRPnluIEzResMg4B5wAl+m7ljCQQBKI8rBWD1mSq8vTmVcz3UBs1CsPuyewlwJK
         kRbLyHnX2W6bsymMVnYrfCJvBxYxMFP4Otb0mrBDm/QscLaDiLII0vyK1jMX0ixIYLoM
         hvdoSRy9/sfytvzQ5fch7RX1u8PXR3qErCpQxbijLluIXjS+ih8R4vVtXcH1eVsY7iAv
         VSVQ==
X-Gm-Message-State: AOAM531Yi4ZiBWKa1dcFPKSP15qH4fKUQvRs6zMPwo+NSeQq7ODkZjE4
        juxKlpeJgmr6XODdodvonlc=
X-Google-Smtp-Source: ABdhPJx55bT9ZYGTqC3n9yZQnbHnKaBe2dJQk6vC5IU8Z9ged6O8JpQyWIyI2TXR+f6nC02aUN5t7Q==
X-Received: by 2002:a17:90a:1919:: with SMTP id 25mr35311538pjg.181.1641039289974;
        Sat, 01 Jan 2022 04:14:49 -0800 (PST)
Received: from [192.168.0.153] ([143.244.48.136])
        by smtp.gmail.com with ESMTPSA id x31sm34736025pfh.116.2022.01.01.04.14.42
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Jan 2022 04:14:49 -0800 (PST)
Message-ID: <61d045b9.1c69fb81.8bda6.d9db@mx.google.com>
From:   yalaiibrahim818@gmail.com
X-Google-Original-From: suport.prilend@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: RE:
To:     Recipients <suport.prilend@gmail.com>
Date:   Sat, 01 Jan 2022 14:14:33 +0200
Reply-To: andres.stemmet1@gmail.com
X-Mailer: TurboMailer 2
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I want to confide in you to finalize this transaction of mutual benefits. I=
t may seem strange to you, but it is real. This is a transaction that has n=
o risk at all, due process shall be followed and it shall be carried out un=
der the ambit of the financial laws. Being the Chief Financial Officer, BP =
Plc. I want to trust and put in your care Eighteen Million British Pounds S=
terling, The funds were acquired from an over-invoiced payment from a past =
contract executed in one of my departments. I can't successfully achieve th=
is transaction without presenting you as foreign contractor who will provid=
e a bank account to receive the funds.

Documentation for the claim of the funds will be legally processed and docu=
mented, so I will need your full cooperation on this matter for our mutual =
benefits. We will discuss details if you are interested to work with me to =
secure this funds. I will appreciate your prompt response in every bit of o=
ur communication. Stay Blessed and Stay Safe.

Best Regards


Tel: +44 7537 185910
Andres  Stemmet
Email: andres.stemmet1@gmail.com  =

Chief financial officer
BP Petroleum p.l.c.

                                                                           =
                        Copyright =A9 1996-2021

