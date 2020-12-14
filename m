Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 836392D9A8C
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Dec 2020 16:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731616AbgLNPFJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Dec 2020 10:05:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731084AbgLNPFJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Dec 2020 10:05:09 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E9A6C0613D3
        for <linux-i2c@vger.kernel.org>; Mon, 14 Dec 2020 07:04:29 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id m6so2476572pfm.6
        for <linux-i2c@vger.kernel.org>; Mon, 14 Dec 2020 07:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=b+RWJ4+h9CcyV9dNvpGbR+OOmowaJ15vnZpnVFgZJzk=;
        b=G/QZcNZE+R8z2RGyo9jTtp0w0EUMhpIR2DR2RD4IKif/RDeGA/bdAt6uY01xpWdBFc
         lub2x65r2JrlqeQi3S4O19LeU7k99ELDUp5APDrvrucVIDEFC+oPy8bdpa/+dU0z7mTQ
         vKRyCYp8OWJSXzyCyzzdXIYrbwzlbwyR9SYwt89qfHE7hz7tmH/SxV2YhuM4VdH1LVvC
         lEwmTS2EiRR2XsDUmhXCLLobdkjHGo2BAuTE4F/BvHXKOV3RyWLmZ4QbeEdDjL2yATHx
         0owWioap5jPJ3+gAA6QixPFFyiEZryu+521JxbCRbP6/2ihpgpRMxukY4F8XAfWalIuP
         vtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=b+RWJ4+h9CcyV9dNvpGbR+OOmowaJ15vnZpnVFgZJzk=;
        b=sYBGV+RbayKerU92LfPy94tuHJIqAAeMdyRZ2Y0Ynvh4JFs2NBKMOUPPp3WTHqFWVe
         iOY7A2VwOGHtMSYO56Y8KgAFsfZM9RAoe12VRcmEhZzhmdOND0pzfeREToksyEeZVXIq
         O4QO181OXrltnAb7Td+/00KgYE9orTpFhpjLAgoMq9qk3ew1lg159w4M5ubzyrP9JVrh
         14irJPaUwQMWKvmuzYQlpHGtMxIic6sZIY1n4xiFIezBcxCCjesdaTemOFqEzYRqYsGb
         NP68xNlmC/Jdp1N1uIy4HzEHkUKBRTO7vyI52dMtspQb/JXvQ4GDaTEEweViCFnrMRi5
         784g==
X-Gm-Message-State: AOAM532fapekTwXmW4YY2Ab5AC5ZnRI/FL6r2i+HbQAxpBR2YknNe+PJ
        3nQmFzs8xwlyegcnDbmshCOOlI+V4gfW941k8LtU6xBCPWzrIg==
X-Google-Smtp-Source: ABdhPJz3MSY5rGx/gBTKYIrts9X+PRA0wNwenAGJ22pNLmgBJV596DOwGIn7VFDx9CSD74txPYvnpmxqrVwR3W/Ym04=
X-Received: by 2002:a63:c04b:: with SMTP id z11mr23805762pgi.74.1607958268700;
 Mon, 14 Dec 2020 07:04:28 -0800 (PST)
MIME-Version: 1.0
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 14 Dec 2020 17:05:17 +0200
Message-ID: <CAHp75VeTO1RR-tGhz-uN+bOMRphAcHpe95GrRrQTtrEs+itK=A@mail.gmail.com>
Subject: repo update
To:     Peter Rosin <peda@axentia.se>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi, Peter.

For a few releases I have been observing the mux patch ("mux:
adgs1408: Add mod_devicetable.h...") dangling in Linux Next. It seems
that one of your repositories hasn't been updated to one of the
vanilla rc:s or releases. Can you align it so it will not linger in
Linux Next anymore?

-- 
With Best Regards,
Andy Shevchenko
