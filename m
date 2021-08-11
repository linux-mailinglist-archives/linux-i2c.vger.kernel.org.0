Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E50413E9630
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 18:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbhHKQkS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 12:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbhHKQkS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Aug 2021 12:40:18 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90340C061765
        for <linux-i2c@vger.kernel.org>; Wed, 11 Aug 2021 09:39:54 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id o7-20020a05600c5107b0290257f956e02dso4894300wms.1
        for <linux-i2c@vger.kernel.org>; Wed, 11 Aug 2021 09:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=5NTJSky9UX3JbuB9riY3wCYfXDpCwy2c7hzO0kF4AHA=;
        b=Hrdg9pk9YUSSKTXmw0dOJ3gsthIl6w7YahTc2Ikiw3ws0xRvt/rKtMX/z0LeV/7zXu
         0ssgndyaLtj0pbH38qQWBaDymPHv57GlFKRiuWBYQvpZt4np0ZXt3E2o5CyWNwQn1K/5
         BradTii3wPOkLPJwAWN2ubnssdxEKDqBr0CMCLF9amzOZURGY4QYSLDg7aCk9T6JCO01
         +PnAGR4FjkoxmpPISPxN+ZAXCDoWY1rfWbT6danJY9bKf70nyCuF+swneNV82oI2cPf2
         UxjoK9c7mEbLc2p+4aX0D2gYUjuyRrl3mAEJnkuBYaMKH02N/+jIqpyHnLDpj0TvkBFj
         XeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=5NTJSky9UX3JbuB9riY3wCYfXDpCwy2c7hzO0kF4AHA=;
        b=Au1mCVLfpFLqmRVri7R9bfU/WvfFDJfHtgXi04dgCtjFVkmr+i4rBH9kkfj1N0Un3h
         k4I2TgeeiyAbm+Va4orwYbisoJE4P3YVsZVo+VPlEEJ4C9m1GEOBbjUkyZfo7rjYlT91
         n69F1COjsv3JdTXCxpCax5JfBxkkUdfKuzTRsWoeemnA36K3mllXjauK50notOzIh0yi
         4/5kJkXg1/cIcr6CjY9p+Y0i5TKBJKj2qZuaQv7o4B2klS5vibNKaOsl0cRx2hNX/rYa
         GLTr9jpsr+XxLgcPBcom+9xtzaUG5uGr4Xg/ZMrpTmipf2/e8/dtlh4IRSApjzj5oCjr
         cpbA==
X-Gm-Message-State: AOAM533fKLUCXXYCNT1VZXblI9O9yQE7Du0m7JX2k0ZnM8i/xM3YX71V
        /T0ndOVgg6q40YN/EIMT+ew=
X-Google-Smtp-Source: ABdhPJx3Sjnpd2vlZ9d8g+fLpCmyPXXJq41BNrOjJE/s4ruaLz4+ywuxMDhqtNicdyBPpEPAdPpTZQ==
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr19685428wmh.91.1628699993244;
        Wed, 11 Aug 2021 09:39:53 -0700 (PDT)
Received: from [192.168.1.70] ([102.64.209.185])
        by smtp.gmail.com with ESMTPSA id s1sm2699637wmh.46.2021.08.11.09.39.46
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Aug 2021 09:39:52 -0700 (PDT)
Message-ID: <6113fd58.1c69fb81.ff4c7.b751@mx.google.com>
From:   Vanina curth <curtisvani0040@gmail.com>
X-Google-Original-From: Vanina  curth
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Dear
To:     Recipients <Vanina@vger.kernel.org>
Date:   Wed, 11 Aug 2021 16:39:38 +0000
Reply-To: curtisvani9008@gmail.com
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

How are you? I'm Vanina. I'm interested to know you and I would like to kno=
w more about you and establish relationship with you. i will wait for your =
response. thank you.
