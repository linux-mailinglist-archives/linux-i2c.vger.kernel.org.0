Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E23E34A0082
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 19:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350732AbiA1SzY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 13:55:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350714AbiA1SzX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jan 2022 13:55:23 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051D8C061714
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jan 2022 10:55:23 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id a7so6724819qvl.1
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jan 2022 10:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=DkhOJxPGb96XhBNxvczEuJ4p+whH3mGtofLewGhWrCU=;
        b=nN1TFc2BIbi+Qkqm/pkhdKRTgACS+iVJJscvLZT6YT2rs9dPFrpJrlw8L1IQlHaYEU
         gB+NUKYlmTuyPaekxHgtjegAJQkz6ycdlcNSVfb2OSMEMwYXgKmPTP9Q9KTOaGjWgNEP
         Hgm0sNc1u5457K4JgsFyrFIWQuXoSi+0zktNG1PgTmwR5e0pUvqi5Jaa3cG/Wf8Rbc1U
         +2ekwUGX49Orv+dVO8srlmEWQ+ulOk/s8wPZ30sthAYV5UNqDPP/EtUw65niZJRM+Fuw
         FW11j4ASLPOEC8pbY2HrJ7dwv1oZr4aEW5EUrsDYjSfl/CK2YJIN5e9zT4RsbEmdt0F6
         zkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=DkhOJxPGb96XhBNxvczEuJ4p+whH3mGtofLewGhWrCU=;
        b=GpOIopPAf7BwDyvCl6cCN8+/sHB0EEu9g6S3IrmIrACOG4dT6wW3UmB1AfybnPgc//
         3iw3G9L6nN2l1ZmbqqJwb4Hgg2eEV8pn7tN5S/z0TK7ntGdTjVyemH2pBBXIfHnLC0hv
         klNZwT0iZZkNm6re3qSP0GynteCz7llIHn84hfs3u92xXj4VOfUCqLAVsx7HplPbiYtL
         6Hg2RuL5ibFalJC5mtgBHsr+r50X9lpKWqCCxGmPUr/j5VJXS87EpGVrsHX0DRvQasMv
         E74ZnbO5imMG54X2e+CiH90Ap8tN2JOFf544dqBwqWVX//m6yoPaPKmR/oEDDmxjfGLr
         8DWQ==
X-Gm-Message-State: AOAM530Hy++F1gwbMQ38XhJMIle+t6JlnOw2xBRf8hXnaGO4yWUI0s/u
        RDNdqpUEs1vrIf4BDcAQ35mHF3rQ2e8dqkjuJSU=
X-Google-Smtp-Source: ABdhPJwAnQx8Ez2ejHeq10OpiJGhPMk48dKszJD7u/uTYHKL4iFecnVDkJpAvoryPp/fxV1p1edHUD7GjnTeo7yj/GM=
X-Received: by 2002:ad4:5c64:: with SMTP id i4mr8941365qvh.62.1643396122248;
 Fri, 28 Jan 2022 10:55:22 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6214:2529:0:0:0:0 with HTTP; Fri, 28 Jan 2022 10:55:21
 -0800 (PST)
Reply-To: fionahill.usa@outlook.com
From:   Fiona Hill <ivanroberti284@gmail.com>
Date:   Fri, 28 Jan 2022 10:55:21 -0800
Message-ID: <CAKp8dfoU5_QOis_S=2C4aKWYjvfWPRtPYTZHfcQkERMdWxvo0A@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

-- 
did you receive my message i send to you?
