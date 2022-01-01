Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 272EA48274C
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jan 2022 11:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbiAAKkW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Jan 2022 05:40:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiAAKkW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Jan 2022 05:40:22 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2AD2C061574
        for <linux-i2c@vger.kernel.org>; Sat,  1 Jan 2022 02:40:21 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id f18-20020a17090aa79200b001ad9cb23022so27634439pjq.4
        for <linux-i2c@vger.kernel.org>; Sat, 01 Jan 2022 02:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=G1lTh7BNdW6FJjul5VLXgnd8aB3AAW63rPyUZLTbYnymD22XViGdpsUIJrYZDaJdh+
         RC8871p2mwIibv5Rj8Mj508/WKQ2Y2aLGlRzT4NOVHyetwxXf9o5/PKxqSXURRaqdC7Z
         oaglJYIcAaZzg180zqq/D77OZPsOG2rtZzK5cYKGTQ8yN/64OqoPxtzD2/zMpEiBiRHH
         cJqDXbOr7kAVrKBMzVjrbLl9GRWUMbb4uGtKiHHd/kJwP7KgwQmPLdBuqoKGQkqjvmpB
         YWLnHHQZm8El6FmWqlsBxFHFZMSjraMdNAM9kxI6uNWrz0hqKW0h9FIs/jOuYzL5WDFQ
         fJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=UP7PGB2Y8fuyou0vkrn4Rk4Lnr+MkgOVYWb31+SmV8fB4ryqzlJfttClndVegUc9Ov
         f6KN6lxVkPUQMvH23+jMQCLpS03b3jn9RKKG/2F7c/AdxdWUj6dF334dd7lZ70KZRv0z
         0GcUNZYfoCFKhU3wjXdgdn7telpqJw7czHqFBW2vJluZlHe9bfrOnlQYKLCKV4WM2zBT
         1lXm8P24HWpGuzVLoJZ9frRVpNh/vs2bjHzAVjvgAaMuvLJ5lx9wNGN1jpMzEG4ybJMS
         qO0XtSqD+q5wCYHG4uWAA1omCkFHted0d0TFPDL3oOl3IMVmqfZ13Jysa3uDzYQWVkd1
         TyLw==
X-Gm-Message-State: AOAM5322BUgTyjQcmxUe9+XcRWmkFX1iJ2+7HU9QW4FFB8OEofCju8LC
        +80lBqYF8AMVfoD5pcHZDYc=
X-Google-Smtp-Source: ABdhPJw8wiU+NvePP+QurEy4xaRg0Yh+ZsgzEVYwfmMBPvVYT/LYQFXyljf96k4WDYWewC6G+QLp7Q==
X-Received: by 2002:a17:90b:19c7:: with SMTP id nm7mr47041100pjb.107.1641033621541;
        Sat, 01 Jan 2022 02:40:21 -0800 (PST)
Received: from [192.168.0.153] ([143.244.48.136])
        by smtp.gmail.com with ESMTPSA id k2sm34112589pfc.53.2022.01.01.02.40.14
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Jan 2022 02:40:21 -0800 (PST)
Message-ID: <61d02f95.1c69fb81.24ab1.c6f5@mx.google.com>
From:   hyaibe56@gmail.com
X-Google-Original-From: suport.prilend@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: RE:
To:     Recipients <suport.prilend@gmail.com>
Date:   Sat, 01 Jan 2022 12:40:06 +0200
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

