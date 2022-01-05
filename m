Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B5348505C
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jan 2022 10:51:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234266AbiAEJvu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jan 2022 04:51:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239073AbiAEJvu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jan 2022 04:51:50 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C75C061761
        for <linux-i2c@vger.kernel.org>; Wed,  5 Jan 2022 01:51:50 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id u21so50459261oie.10
        for <linux-i2c@vger.kernel.org>; Wed, 05 Jan 2022 01:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=3WbF0KMT5RC+mPyKuvTuuJSXjuv9nmVaKatmxKGWltA=;
        b=P+Ag31cmNluox+9t2BUgew1ENe2MR45soX96Yhdq6I9Y/DrWptnqhVV3Cb3IMDei6u
         H3IjrW1tAYtdZ7mVJLbpL+FWCo/op0ZhXj70xaYrdZj/03hotdp3qJEQazpQs5i/Fc3/
         0FCvsMFmPeVVzbJx/6Ie4hVMko2hnPCWnH/Bl/nSE0oWBnLPAq4RJgCeYe4hCtPelGHf
         MAGQYnBLbSanwFnxV7iGNKl+SVXfX4NF8oBzlbSZ9oxU5r+t1GaEpyjWT9aZPVFWLQ0K
         tk+SkiBiY3c7KL2DtPWDpUsTXbOLKld/Z4lrJzY9E0ciogoKA5d/NNwTL/oNcghNwHRd
         juBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=3WbF0KMT5RC+mPyKuvTuuJSXjuv9nmVaKatmxKGWltA=;
        b=p1mEMTbzxo4x3jL6Gi/4dSBpvlRi3L7/uIX4ViNntMbnYKTDyLRJTE+jCtdFsPS1Y8
         qOE3yJEWNEKv1Iw4lVI22hOUfPMgWQI8Mu4S87UeuyxJncNl/9FGsEK8lzsvDvJDH3Vv
         BLjDUDruIFHLetUDB7MTwg1kqBo2rHn/ZfR0UZSbxZ5TrS7MCPpgRnUh3/3CClGrhDBa
         cWoyazVEtveZXsXuOvfX651gEFg4JCQfodNFESjHnbxnClMCr5HMytHhLGXe8d1dhiRS
         pEJSZjKitWgUvMH3WYz3qfzHahYOb3Zqn6jvOndbLTVpTj0Ysrb3ZvN822WBZ2+1DuU+
         ru7w==
X-Gm-Message-State: AOAM5331j+PXbG88PTzClhNcaGFaUPIOpiKT2dDw7KSV03Qq1MF/7GUb
        27bFjLObxhjtd+UGW8eH1uXBAx/QYXpny6q5thgOxFjYizk=
X-Google-Smtp-Source: ABdhPJwx2Q8ESvMA0ZtPkhSNRFspaXA1+HXb63zSiUuJxJWnkZ6Ubl9yhWXHDcleiO1yBudjHcBF3QkiAdY0MWbgJRY=
X-Received: by 2002:a05:6808:10d1:: with SMTP id s17mr1907964ois.26.1641376309510;
 Wed, 05 Jan 2022 01:51:49 -0800 (PST)
MIME-Version: 1.0
From:   Kristian Evensen <kristian.evensen@gmail.com>
Date:   Wed, 5 Jan 2022 10:51:38 +0100
Message-ID: <CAKfDRXgUvN19PUd_ebRJs-k_ytrGwgA=e6d3QJ9cwJogUGpoyw@mail.gmail.com>
Subject: mt7621 i2c fails with upstream driver
To:     linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

I am in the process of bringing kernel 5.10 up on an mt7621-based
board. The board is equipped with a temperature sensor that is
connected to the i2c bus. Reading the temperature worked fine with my
previous kernel (OpenWRT 4.14/downstream i2c driver), but fails when I
use the upstream driver.

With the 5.10 i2c-mt7621-driver, i2cdetect is no longer able to detect
the sensor and i2cget fails with "Error: Read failed". An strace of
i2cget reveals the cause to be the final ioctl call failing with
ETIMEDOUT.

Replacing the new with the old driver makes i2c work again, but I
would like to try to avoid that. My knowledge of i2c is very limited,
so I wondered if anyone knows what could be wrong or have any
suggestions on things I can try to for example change in the driver?

Thanks in advance for any help,
Kristian
