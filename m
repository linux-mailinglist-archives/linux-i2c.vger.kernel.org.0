Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A867F5A525D
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Aug 2022 18:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbiH2Q6I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Aug 2022 12:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbiH2Q6D (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Aug 2022 12:58:03 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE8B9A9B0
        for <linux-i2c@vger.kernel.org>; Mon, 29 Aug 2022 09:57:56 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id q3so5363256pjg.3
        for <linux-i2c@vger.kernel.org>; Mon, 29 Aug 2022 09:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc;
        bh=p8u3RdeTcTgb/i8K6suUhILsFawijgXd+/5fHGltzno=;
        b=YUAXlSFbQfJGBJ+k4pMIpC+Xe+BmCDr5QYPOMbazuIqlgTmJy8c/GEaExk3YQu8zSO
         8zlctXu9Uo+jEKVJrm5Xdtulz22kMeKJjM183lYqWPmkasdZKa2n4LKi/dLy+pg76cPi
         BzxxmBjYbJS/3SPgdmE1Yxrj1kD2uLdjyOSZy9WPyueX/ViYZIC9u0nZPbnnq0JDzfdg
         U77doxljZYb6EVWtjVoRDy01qYYFNQ1yzI7ScUIsj8acG8keLfYmxxFNivu5Z8AO054S
         H4BSccZglPfSYQYtFree3/lpIc4AYTMJdUc5JE8wOI2WA0lEK8e+l0PhkCh7t0twBpbN
         sPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=p8u3RdeTcTgb/i8K6suUhILsFawijgXd+/5fHGltzno=;
        b=q/Bv+MMECusdklXw7D0YLrS4Rm1N8zJ/V3PsSJ6ck51aIqpJAxNokX2o0pNuo1zOQI
         QKP0GLe61uj4yN4LaB4y4UERm9uhX6+9QrG6KHAeG4oDKbXAjR3hs8SWcNvauJEPDQwI
         m3Stfbfj3QYEhLVEPTdhxw5tqH1GFtZDSTdWwiO9v4NTbuamGHd84Kgwh3OHmfivTjL2
         qHOBVyqPqRbNCaCQ7q8rGNEZYb4jjoARaK57PEtCQdZhAXJRqvVisvMf+jVFFEcIZwHj
         /5dGcMvmPFVkp1B7A8HQloKQYuqWR6MM8WzN1dPix1kwVah2+znyPgtFvEhr66fsekKy
         dduA==
X-Gm-Message-State: ACgBeo1ZoZh8tpbXaB/UqhRlRlrqHi1tQkVqbeKUhcIO/b/ipZn+xxdS
        OcJFjC66rN/gfahcBYwgTelzsUXluvwYk9ilRlM=
X-Google-Smtp-Source: AA6agR4PRU0hHkw/MFpRQtrYpwcAyasPQqx6rHqvJIDObPiAtrVlEuRYD7sGaT0KUHMGfzyb0JetU7rGAsdv3dqjC88=
X-Received: by 2002:a17:90a:c789:b0:1fa:6bc0:77f6 with SMTP id
 gn9-20020a17090ac78900b001fa6bc077f6mr19916604pjb.1.1661792276061; Mon, 29
 Aug 2022 09:57:56 -0700 (PDT)
MIME-Version: 1.0
Reply-To: helenjethro1@gmail.com
Sender: gameliechossin@gmail.com
Received: by 2002:a05:6a11:c991:b0:2d7:23fa:a509 with HTTP; Mon, 29 Aug 2022
 09:57:55 -0700 (PDT)
From:   "Mrs. Helen Jethro" <helenjethro1@gmail.com>
Date:   Mon, 29 Aug 2022 17:57:55 +0100
X-Google-Sender-Auth: 7-GE2zomqVgn01GkYrUFiepOlQw
Message-ID: <CAKYC4QYNt-xdeRGCLq+YJe5iFHFrUPvuDBRp3q9ekrUKbju9nA@mail.gmail.com>
Subject: Dear Friend,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.4 required=5.0 tests=BAYES_50,DEAR_FRIEND,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Have you received my first mail?
If not please let me know for urgent matters. I am waiting to hear
from you soon.

Thanks very much,
Mrs Charity Powells.
